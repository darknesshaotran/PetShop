const { checkSchema } = require('express-validator');
const HTTP_STATUS = require('../constants/httpStatus');
const ErrorsWithStatus = require('../constants/Error');
const validate = require('../utils/validation');
const db = require('../models');

const checkRatingExistsValidator = checkSchema(
    {
        id_rating: {
            custom: {
                options: async (value) => {
                    const rating = await db.Rating.findOne({
                        where: {
                            id: value,
                        },
                        attributes: {
                            exclude: ['createdAt', 'updatedAt'],
                        },
                    });
                    if (!rating) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: 'rating not found' };
                    }
                    return true;
                },
            },
        },
    },
    ['params'],
);
const checkAddRatingValidator = checkSchema(
    {
        id_product: {
            custom: {
                options: async (value) => {
                    if (value) {
                        const product = await db.Product.findOne({
                            where: {
                                id: value,
                            },
                            attributes: {
                                exclude: ['createdAt', 'updatedAt'],
                            },
                        });
                        if (!product) {
                            throw { status: HTTP_STATUS.NOT_FOUND, message: 'product not found' };
                        }
                        return true;
                    }
                },
            },
        },
        id_service: {
            custom: {
                options: async (value) => {
                    if (value) {
                        const service = await db.Service.findOne({
                            where: {
                                id: value,
                            },
                            attributes: {
                                exclude: ['createdAt', 'updatedAt'],
                            },
                        });
                        if (!service) {
                            throw { status: HTTP_STATUS.NOT_FOUND, message: 'service not found' };
                        }
                        return true;
                    }
                },
            },
        },
        star: {
            notEmpty: {
                errorMessage: 'star is required',
            },
            isNumeric: {
                errorMessage: 'star must be number',
            },
            custom: {
                options: async (value) => {
                    if (value < 1 || value > 5) {
                        throw {
                            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                            message: 'star must be from 1 to 5',
                        };
                    }
                    return true;
                },
            },
        },
    },
    ['body'],
);
const checkUpdateRatingValidator = checkSchema(
    {
        star: {
            notEmpty: {
                errorMessage: 'star is required',
            },
            isNumeric: {
                errorMessage: 'star must be number',
            },
            custom: {
                options: async (value) => {
                    if (value < 1 || value > 5) {
                        throw {
                            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                            message: 'star must be from 1 to 5',
                        };
                    }
                    return true;
                },
            },
        },
    },
    ['body'],
);

exports.RatingExistsValidator = validate(checkRatingExistsValidator);
exports.AddRatingValidator = validate(checkAddRatingValidator);
exports.UpdateRatingValidator = validate(checkUpdateRatingValidator);
