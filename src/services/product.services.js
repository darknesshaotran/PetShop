const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class ProductServices {
    async getListProduct(minPrice, maxPrice, limit, page, breed_id, search, isDesc) {
        var offset = 0;
        var optionMaxPrice = {};
        var optionMinPrice = {};
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 100;
        }
        if (minPrice) {
            optionMinPrice = { price: { [Op.gte]: minPrice } };
        }
        if (maxPrice) {
            optionMaxPrice = { price: { [Op.lte]: maxPrice } };
        }
        const breedCondition = breed_id ? { id_breed: breed_id } : {};
        const searchCondition = search ? { name: { [Op.like]: `%${search}%` } } : {};
        const options = {
            ...optionMinPrice,
            ...optionMaxPrice,
            ...breedCondition,
            ...searchCondition,
        };
        const order = [['price', isDesc ? 'DESC' : 'ASC']];
        const Count = await db.Product.count({
            where: {
                ...options,
            },
        });
        const products = await db.Product.findAll({
            where: {
                ...options,
            },
            offset: offset,
            limit: limit,
            order: order,
            attributes: {
                exclude: ['id_breed', 'createdAt', 'updatedAt', 'description'],
            },
            include: [{ model: db.Breed, as: 'Breed', attributes: ['id', 'name'] }],
        });
        const Products = JSON.parse(JSON.stringify(products));

        for (let i = 0; i < Products.length; i++) {
            const rating = await db.Rating.findAll({
                where: { id_product: Products[i].id },
            });
            const Rating = JSON.parse(JSON.stringify(rating));
            var totalStar = 0;
            for (let i = 0; i < Rating.length; i++) {
                totalStar += Number(Rating[i].star);
            }
            totalStar = Math.floor(totalStar / Rating.length);

            const image = await db.Image.findOne({
                where: { id_product: Products[i].id },
            });

            const Image = JSON.parse(JSON.stringify(image));
            Products[i].totalStar = totalStar ? totalStar : 0;
            Products[i].image = Image ? Image.image : '';
        }
        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: Products,
            totalPages: totalPages,
            page: page ? page : 1,
        };
    }
    async productDetails(id_product) {
        const product = await db.Product.findOne({
            where: {
                id: id_product,
            },
            attributes: {
                exclude: ['id_breed', 'createdAt', 'updatedAt'],
            },
            include: [{ model: db.Breed, as: 'Breed', attributes: ['id', 'name'] }],
        });
        const Product = JSON.parse(JSON.stringify(product));
        const image = await db.Image.findAll({
            where: { id_product: id_product },
            attributes: ['id', 'image'],
        });

        const Image = JSON.parse(JSON.stringify(image));
        const rating = await db.Rating.findAll({
            where: { id_product: id_product },
            attributes: { exclude: ['id_product'] },
            include: [
                {
                    model: db.Account,
                    as: 'Account',
                    attributes: { exclude: ['password', 'forgot_password_token', 'id_role', 'createdAt', 'updatedAt'] },
                    include: [
                        {
                            model: db.inforUser,
                            as: 'inforUser',
                            attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                        },
                    ],
                },
            ],
            order: [['id', 'DESC']],
        });
        const Rating = JSON.parse(JSON.stringify(rating));
        var totalStar = 0;
        for (let i = 0; i < Rating.length; i++) {
            totalStar += Number(Rating[i].star);
        }
        totalStar = Math.floor(totalStar / Rating.length);
        const productDetails = {
            ...Product,
            image: Image,
            rating: Rating,
            totalStar: totalStar ? totalStar : 0,
        };

        return { success: true, result: productDetails };
    }
    async addProduct(id_breed, name, price, import_price, description, amount, image) {
        const product = await db.Product.create({
            id_breed,
            name,
            price,
            import_price,
            description,
            amount,
        });
        for (let i = 0; i < image.length; i++) {
            await db.Image.create({
                image: image[i].url,
                id_product: product.id,
            });
        }
        return {
            success: true,
            message: 'add product successfully',
        };
    }
    async deleteProduct(id_product) {
        await db.Product.destroy({
            where: {
                id: id_product,
            },
        });
        return {
            success: true,
            message: 'delete product successfully',
        };
    }
    async updateProductInfor(id_product, data) {
        await db.Product.update(
            {
                ...data,
                updatedAt: new Date(),
            },
            {
                where: { id: id_product },
            },
        );
        return {
            success: true,
            message: 'update product successfully',
        };
    }
    async updateProductImages(id_product, image) {
        await db.Image.destroy({
            where: {
                id_product: id_product,
            },
        });
        for (let i = 0; i < image.length; i++) {
            await db.Image.create({
                image: image[i].url,
                id_product: id_product,
            });
        }
        return {
            success: true,
            message: 'update images successfully',
        };
    }
}
module.exports = new ProductServices();
