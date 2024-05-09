const { checkSchema } = require('express-validator');
const HTTP_STATUS = require('../constants/httpStatus');
const ErrorsWithStatus = require('../constants/Error');
const db = require('../models');
const { wrapController } = require('../utils/handle');
const validate = require('../utils/validation');

const checkAddToCartValidator = checkSchema(
    {
        id_product: {
            notEmpty: {
                errorMessage: 'id_size_item is required',
            },
            custom: {
                options: async (value) => {
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
                },
            },
        },

        quantity: {
            isNumeric: {
                errorMessage: 'quantity must be a number',
            },
            custom: {
                options: async (value, { req }) => {
                    const product = await db.Product.findOne({
                        where: {
                            id: req.body.id_product,
                        },
                        attributes: {
                            exclude: ['createdAt', 'updatedAt'],
                        },
                    });
                    if (Number(value) > product.amount) {
                        throw {
                            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                            message: "quantity must be a lower than product's amount",
                        };
                    }

                    return true;
                },
            },
        },
    },

    ['body'],
);
const checkUpdateCartItemQuantityValidator = checkSchema(
    {
        id_cartItem: {
            custom: {
                options: async (value) => {
                    const cart_item = await db.Cart_Item.findOne({
                        where: {
                            id: value,
                        },
                        attributes: {
                            exclude: ['createdAt', 'updatedAt'],
                        },
                    });
                    if (!cart_item) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: "cart's item not found" };
                    }
                    return true;
                },
            },
        },
        quantity: {
            isNumeric: {
                errorMessage: 'quantity must be a number',
            },
        },
    },

    ['params', 'body'],
);

const checkDeleteCartItemValidator = checkSchema(
    {
        id_cartItem: {
            custom: {
                options: async (value) => {
                    const cart_item = await db.Cart_Item.findOne({
                        where: {
                            id: value,
                        },
                        attributes: {
                            exclude: ['createdAt', 'updatedAt'],
                        },
                    });
                    if (!cart_item) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: "cart's item not found" };
                    }
                    return true;
                },
            },
        },
    },

    ['params'],
);

exports.AddToCartValidator = validate(checkAddToCartValidator);
exports.UpdateCartItemQuantityValidator = validate(checkUpdateCartItemQuantityValidator);
exports.DeleteCartItemValidator = validate(checkDeleteCartItemValidator);
