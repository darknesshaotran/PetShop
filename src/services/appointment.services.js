const db = require('../models');
const { Op, Model } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class OrderServices {
    async createAppointment(userID, id_service, note, appointmentTime, endTime) {
        const service = await db.Service.findOne({
            where: { id: id_service },
        });
        var totalPrice = Number(service.price);
        const order = await db.Order.create({
            id_account: userID,
            id_status: 1,
            isService: 1,
            order_phoneNumber: '0909',
            totalPrice: totalPrice,
        });
        if (!endTime) {
            // TODO RESIGN ENDTIME TO APPOINTMENT TIME + 1 HOURS
        }
        const appointment = await db.Appointment.create({
            id_service: id_service,
            id_order: order.id,
            appointment_time: appointmentTime,
            end_time: endTime,
            note: note,
        });
        return {
            success: true,
            message: 'schedule appointment successfully',
            order: order,
            appointment: appointment,
        };
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
                    attributes: ['name', 'price', 'description'],
                },
            ],
        });
        return {
            success: true,
            detailAppointment: appointment,
        };
    }
    async cancelAppointment(id_appointment) {
        const appointment = await db.Appointment.findOne({
            where: { id: id_appointment },
        });
        await db.Order.update(
            { id_status: 5 },
            {
                where: { id: appointment.id_order },
            },
        );
        return {
            success: true,
            message: 'cancel appointment successfully',
        };
    }
    async acceptAppointment(id_appointment) {
        const appointment = await db.Appointment.findOne({
            where: { id: id_appointment },
        });
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
}
module.exports = new OrderServices();
