const { checkSchema } = require('express-validator');
const HTTP_STATUS = require('../constants/httpStatus');
const ErrorsWithStatus = require('../constants/Error');
const validate = require('../utils/validation');
const db = require('../models');
const { wrapController } = require('../utils/handle');
const checkAddProductValidator = async (req, res, next) => {
    const { urls, Fields } = req.formdata;

    const { id_breed, id_brand, name, price, import_price, amount, description, color, size } = Fields;
    if (!id_breed) {
        throw {
            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
            message: 'category is required',
        };
    }
    const breed = await db.Breed.findOne({ where: { id: id_breed } });
    if (!breed) {
        throw {
            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
            message: 'breed not found',
        };
    }
    if (!name) {
        throw {
            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
            message: 'name is required',
        };
    }
    if (isNaN(price)) {
        throw {
            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
            message: 'price must be a number',
        };
    }
    if (isNaN(import_price)) {
        throw {
            status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
            message: 'import price must be a number',
        };
    }
    next();
};
const checkProductExistsValidator = checkSchema(
    {
        id_product: {
            custom: {
                options: async (value) => {
                    const product = await db.Product.findOne({
                        where: {
                            id: value,
                        },
                        attributes: {
                            exclude: ['id_breed', 'createdAt', 'updatedAt'],
                        },
                    });
                    if (!product) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: 'product not found' };
                    }
                    return true;
                },
            },
        },
    },
    ['params'],
);
const checkUpdateProductInfor = checkSchema(
    {
        id_breed: {
            optional: true,
            isNumeric: {
                errorMessage: "breed's id must be a number",
            },
            custom: {
                options: async (value) => {
                    const breed = await db.Breed.findOne({
                        where: {
                            id: value,
                        },
                        attributes: {
                            exclude: ['createdAt', 'updatedAt'],
                        },
                    });
                    if (!breed) {
                        throw { status: HTTP_STATUS.NOT_FOUND, message: 'breed not found' };
                    }
                    return true;
                },
            },
        },
        name: {
            optional: true,
            isString: {
                errorMessage: 'name must be a string',
            },
            isLength: {
                options: {
                    max: 50,
                    min: 1,
                },
                errorMessage: 'name must be between 1 and 50 chars long',
            },
            trim: true,
        },
        price: {
            optional: true,
            isNumeric: {
                errorMessage: 'price must be a number',
            },
        },
        import_price: {
            optional: true,
            isNumeric: {
                errorMessage: 'import price must be a number',
            },
        },
        amount: {
            optional: true,
            isNumeric: {
                errorMessage: 'amount must be a number',
            },
        },
    },
    ['body'],
);

exports.AddProductValidator = wrapController(checkAddProductValidator);
exports.ProductExistsValidator = validate(checkProductExistsValidator);
exports.UpdateProductInfor = validate(checkUpdateProductInfor);
