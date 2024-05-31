const { checkSchema } = require('express-validator');
const HTTP_STATUS = require('../constants/httpStatus');
const ErrorsWithStatus = require('../constants/Error');
const validate = require('../utils/validation');
const db = require('../models');
const USERS_MESSAGES = require('../constants/messages');
const checkCreateAppointmentValidator = checkSchema(
    {
        appointmentTime: {
            notEmpty: {
                errorMessage: 'appointment time is required',
            },
            custom: {
                options: (value, { req }) => {
                    const dateFormat =
                        /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/;
                    if (!dateFormat.test(value)) {
                        throw {
                            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                            message: 'Invalid date format. Use yyyy/mm/dd hh/mm/ss ( example: 2023-11-01 08:31:28 )',
                        };
                    }
                    return true;
                },
            },
        },
        endTime: {
            custom: {
                options: (value, { req }) => {
                    const dateFormat =
                        /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/;
                    if (!dateFormat.test(value)) {
                        throw {
                            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                            message: 'Invalid date format. Use yyyy/mm/dd hh/mm/ss ( example: 2023-11-01 08:31:28 )',
                        };
                    }
                    if (new Date(value) <= new Date(req.body.appointmentTime)) {
                        throw {
                            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                            message: 'endTime must be greater than appointmentTime',
                        };
                    }
                    return true;
                },
            },
        },
        order_phoneNumber: {
            notEmpty: {
                errorMessage: USERS_MESSAGES.PHONENUMBER_IS_REQUIRED,
            },
            isString: {
                errorMessage: USERS_MESSAGES.PHONENUMBER_MUST_BE_STRING,
            },
            isMobilePhone: {
                errorMessage: 'Phone number is invalid',
            },
        },
        id_service: {
            custom: {
                options: async (value) => {
                    const service = await db.Service.findOne({
                        where: {
                            id: value,
                        },
                    });
                    if (!service) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: 'service not found' };
                    }
                    return true;
                },
            },
        },
    },
    ['body'],
);
const checkAppointmentExistsValidator = checkSchema(
    {
        id_order: {
            custom: {
                options: async (value, { req }) => {
                    const appointment = await db.Appointment.findOne({
                        where: {
                            id_order: value,
                        },
                    });
                    if (!appointment) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: 'appointment not found' };
                    }
                    const order = await db.Order.findOne({
                        where: {
                            id: appointment.id_order,
                        },
                        attributes: {
                            exclude: ['createdAt', 'updatedAt'],
                        },
                    });

                    if (!order) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: 'order not found' };
                    }
                    const { decoded_authorization } = req;
                    const { role } = decoded_authorization;
                    if (role != 'admin') {
                        const customersID = order.id_account;
                        const { decoded_authorization } = req;
                        const userID = decoded_authorization.userID;
                        if (customersID != userID) {
                            throw { status: HTTP_STATUS.UNAUTHORIZED, message: "you are not appointment's owner" };
                        }
                    }

                    return true;
                },
            },
        },
    },
    ['params'],
);
exports.AppointmentExistsValidator = validate(checkAppointmentExistsValidator);
exports.CreateAppointmentValidator = validate(checkCreateAppointmentValidator);
