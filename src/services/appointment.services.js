const db = require('../models');
const { Op, where } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const PAYMENT_METHOD = require('../constants/paymentMethod');
const convertISOToDateTime = require('../utils/convertDate');
const notifyServices = require('./notify.services');
class AppointmentServices {
    async createAppointment(userID, id_service, note, appointmentTime, endTime, order_phoneNumber) {
        const transaction = await db.sequelize.transaction();
        try {
            const conflictAppointments = await db.Appointment.findAll({
                where: {
                    [Op.and]: [
                        {
                            [Op.or]: [
                                {
                                    appointment_time: {
                                        [Op.between]: [appointmentTime, endTime],
                                    },
                                },
                                {
                                    end_time: {
                                        [Op.between]: [appointmentTime, endTime],
                                    },
                                },
                                {
                                    [Op.and]: [
                                        {
                                            appointment_time: {
                                                [Op.lte]: appointmentTime,
                                            },
                                        },
                                        {
                                            end_time: {
                                                [Op.gte]: endTime,
                                            },
                                        },
                                    ],
                                },
                            ],
                        },
                        {
                            '$Order.id_status$': {
                                [Op.ne]: 5,
                            },
                        },
                        {
                            id_order: {
                                [Op.ne]: null,
                            },
                        },
                    ],
                },
                include: [
                    {
                        model: db.Order,
                    },
                ],
                transaction,
            });

            if (conflictAppointments.length > 0) {
                throw new ErrorsWithStatus({
                    status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                    message: 'Appointment time conflicts with existing appointments',
                });
            }
            const service = await db.Service.findOne({
                where: { id: id_service },
                transaction,
            });
            var totalPrice = Number(service.price);
            const order = await db.Order.create(
                {
                    id_account: userID,
                    id_status: 1,
                    isService: 1,
                    order_phoneNumber: order_phoneNumber,
                    totalPrice: totalPrice,
                },
                { transaction },
            );
            await db.Payment.create(
                {
                    id_order: order.id,
                    paymentMethod: PAYMENT_METHOD.COD,
                    isPaid: 0,
                    money: totalPrice,
                },
                { transaction },
            );

            if (!endTime) {
                let appointmentDate = new Date(appointmentTime);
                appointmentDate.setHours(appointmentDate.getHours() + 1);
                endTime = appointmentDate.toISOString();
            }
            const appointment = await db.Appointment.create(
                {
                    id_service: id_service,
                    id_order: order.id,
                    appointment_time: appointmentTime,
                    end_time: endTime,
                    note: note,
                    isRate: 0,
                },
                { transaction },
            );

            await transaction.commit();
            return {
                success: true,
                message: 'schedule appointment successfully',
                order: order,
                appointment: appointment,
            };
        } catch (error) {
            await transaction.rollback();
            throw error;
        }
    }
    async updateAppointment(id_order, note, appointmentTime, endTime) {
        var updatedData = {};
        const appointment = await db.Appointment.findOne({
            where: { id_order: id_order },
        });
        let appointment_time = convertISOToDateTime(appointment.appointment_time);
        let end_time = convertISOToDateTime(appointment.end_time);
        if (note) {
            updatedData.note = note;
        }
        if (appointmentTime) {
            appointment_time = appointmentTime;
            if (new Date(appointmentTime) >= appointment.end_time && !endTime) {
                throw new ErrorsWithStatus({
                    status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                    message: 'Appointment time must be before end time',
                });
            } else if (endTime) {
                end_time = endTime;
                if (new Date(appointmentTime) >= new Date(endTime)) {
                    throw new ErrorsWithStatus({
                        status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                        message: 'Appointment time must be before end time',
                    });
                }
                updatedData.appointment_time = appointmentTime;
                updatedData.end_time = endTime;
            } else {
                updatedData.appointment_time = appointmentTime;
            }
        } else {
            if (endTime && new Date(endTime) > appointment.appointment_time) {
                updatedData.end_time = endTime;
            } else if (endTime && new Date(endTime) <= appointment.appointment_time) {
                throw new ErrorsWithStatus({
                    status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                    message: 'End time must be after appointment time',
                });
            }
        }

        // check conflict time appointment
        const conflictAppointments = await db.Appointment.findAll({
            where: {
                id: {
                    [Op.ne]: appointment.id,
                },
                [Op.or]: [
                    {
                        appointment_time: {
                            [Op.between]: [appointment_time, end_time],
                        },
                    },
                    {
                        end_time: {
                            [Op.between]: [appointment_time, end_time],
                        },
                    },
                    {
                        [Op.and]: [
                            {
                                appointment_time: {
                                    [Op.lte]: appointment_time,
                                },
                            },
                            {
                                end_time: {
                                    [Op.gte]: end_time,
                                },
                            },
                        ],
                    },
                ],
            },
        });

        if (conflictAppointments.length > 0) {
            throw new ErrorsWithStatus({
                status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                message: 'Appointment time conflicts with existing appointments',
            });
        }
        await db.Appointment.update(
            {
                ...updatedData,
            },
            {
                where: { id_order: id_order },
            },
        );
        return {
            success: true,
            message: 'Appointment updated successfully',
        };
    }
    async AppointmentDetail(id_order) {
        const appointment = await db.Appointment.findOne({
            where: { id_order: id_order },
            include: [
                {
                    model: db.Order,
                    include: [
                        { model: db.Status, as: 'Status', attributes: ['status'] },
                        {
                            model: db.Account,
                            attributes: {
                                exclude: ['password', 'forgot_password_token', 'id_role'],
                            },
                            include: [
                                {
                                    model: db.inforUser,
                                    as: 'inforUser',
                                    attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                                },
                            ],
                        },
                    ],
                },
                {
                    model: db.Service,
                    attributes: ['name', 'price', 'description', 'image'],
                },
            ],
        });
        return {
            success: true,
            detailAppointment: appointment,
        };
    }
    async cancelAppointment(id_order) {
        const transaction = await db.sequelize.transaction();
        try {
            const order = await db.Order.findOne({
                where: { id: id_order },
                transaction,
            });
            if (order.id_status === 6) {
                throw new ErrorsWithStatus({
                    status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                    message: 'Can not cancel appointment that has been accepted',
                });
            }
            await db.Order.update(
                { id_status: 5 },
                {
                    where: { id: id_order },
                    transaction,
                },
            );
            await notifyServices.sendNotify(
                order.id_account,
                `lịch hẹn của bạn đã bị hủy`,
                process.env.CLIENT_URL + `/historyAppointmentCanceled`,
                transaction,
            );
            await transaction.commit();
            return {
                success: true,
                message: 'cancel appointment successfully',
            };
        } catch (error) {
            await transaction.rollback();
            throw error;
        }
    }
    async acceptAppointment(id_order) {
        const order = await db.Order.findOne({
            where: { id: id_order },
        });
        if (order.id_status === 5) {
            throw new ErrorsWithStatus({
                status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                message: 'Can not accept appointment that has been canceled',
            });
        }
        await db.Order.update(
            { id_status: 6 },
            {
                where: { id: id_order },
            },
        );
        await notifyServices.sendNotify(
            order.id_account,
            `lịch hẹn của bạn đã được chấp thuận, hãy chuẩn bị cho buổi hẹn của bạn!`,
            process.env.CLIENT_URL + `/historyAppointmentAccepted`,
        );
        return {
            success: true,
            message: 'accept appointment successfully',
        };
    }
    async completeAppointment(id_order) {
        const order = await db.Order.findOne({
            where: { id: id_order },
        });
        if (order.id_status !== 6) {
            throw new ErrorsWithStatus({
                status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                message: 'Can not complete appointment that has been canceled or has not been accepted',
            });
        }
        await db.Order.update(
            { id_status: 7 },
            {
                where: { id: id_order },
            },
        );
        await db.Payment.update(
            {
                isPaid: 1,
                paymentDate: new Date(),
            },
            {
                where: { id_order: id_order },
            },
        );
        await notifyServices.sendNotify(
            order.id_account,
            `lịch hẹn của bạn đã hoàn thành, cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!, hãy đánh giá dịch vụ để chúng tôi phục vụ bạn tốt hơn!`,
            process.env.CLIENT_URL + `/historyAppointmentFinished`,
        );
        return {
            success: true,
            message: 'complete appointment successfully',
        };
    }
    async getListAppointment(id_status, userID, role) {
        // TO DO GET LIST APPOINTMENT BY USER 'S NAME, ORDER PHONE NUM, APPOINTMENT TIME
        const option = role === 'admin' ? { id_status: id_status } : { id_status: id_status, id_account: userID };
        const appointment = await db.Appointment.findAll({
            include: [
                {
                    model: db.Order,
                    where: {
                        ...option,
                    },
                    order: [['createdAt', 'DESC']],
                    include: [
                        { model: db.Status, as: 'Status', attributes: ['status'] },
                        {
                            model: db.Account,
                            attributes: {
                                exclude: ['password', 'forgot_password_token', 'id_role'],
                            },
                            include: [
                                {
                                    model: db.inforUser,
                                    as: 'inforUser',
                                    attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                                },
                            ],
                        },
                    ],
                },
            ],
        });
        return {
            success: true,
            detailAppointment: appointment,
        };
    }
}
module.exports = new AppointmentServices();
