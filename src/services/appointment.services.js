const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class OrderServices {
    async createAppointment(userID, id_service, note, appointmentTime, endTime, order_phoneNumber) {
        const transaction = await db.sequelize.transaction();
        try {
            const conflictAppointments = await db.Appointment.findAll({
                where: {
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
    async updateAppointment(id_appointment, note, appointmentTime, endTime) {
        var updatedData = {};
        const appointment = await db.Appointment.findOne({
            where: { id: id_appointment },
        });
        if (note) {
            updatedData.note = note;
        }
        if (appointmentTime) {
            if (appointmentTime > appointment.end_time && !endTime) {
                // TODO RESIGN ENDTIME TO APPOINTMENT TIME + 1 HOURS
                throw new ErrorsWithStatus({
                    status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                    message: 'Appointment time must be before end time',
                });
            } else if (endTime) {
                updatedData.appointment_time = appointmentTime;
                updatedData.end_time = endTime;
            } else {
                updatedData.appointment_time = appointmentTime;
            }
        }
        await db.Appointment.update(
            {
                ...updatedData,
            },
            {
                where: { id: id_appointment },
            },
        );
        return {
            success: true,
            message: 'Appointment updated successfully',
        };
    }
    async AppointmentDetail(id_appointment) {
        const appointment = await db.Appointment.findOne({
            where: { id: id_appointment },
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
    async cancelAppointment(id_appointment) {
        const transaction = await db.sequelize.transaction();
        try {
            const appointment = await db.Appointment.findOne({
                where: { id: id_appointment },
                transaction,
            });
            if (appointment.id_status === 6) {
                throw new ErrorsWithStatus({
                    status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                    message: 'Can not cancel appointment that has been accepted',
                });
            }
            await db.Order.update(
                { id_status: 5 },
                {
                    where: { id: appointment.id_order },
                    transaction,
                },
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
    async acceptAppointment(id_appointment) {
        const appointment = await db.Appointment.findOne({
            where: { id: id_appointment },
        });
        if (appointment.id_status === 5) {
            throw new ErrorsWithStatus({
                status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                message: 'Can not accept appointment that has been canceled',
            });
        }
        await db.Order.update(
            { id_status: 6 },
            {
                where: { id: appointment.id_order },
            },
        );
        return {
            success: true,
            message: 'accept appointment successfully',
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
module.exports = new OrderServices();
