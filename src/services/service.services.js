const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');

class ServiceServices {
    async getServiceList(search, limit = 100, page = 1, isDesc = 'DESC') {
        var offset = (Number(page) - 1) * Number(limit);
        const order = [['price', isDesc]];
        const searchCondition = search ? { name: { [Op.like]: `%${search}%` } } : {};
        const options = {
            ...searchCondition,
        };
        const Count = await db.Service.count({
            where: {
                ...options,
            },
        });
        const services = await db.Service.findAll({
            where: {
                ...options,
            },
            offset: offset,
            limit: Number(limit),
            order: order,
            attributes: {
                exclude: ['createdAt', 'updatedAt', 'description'],
            },
        });
        const totalPages = Math.ceil(Count / limit);
        return {
            success: true,
            result: services,
            totalPages: totalPages,
            page: page ? Number(page) : 1,
        };
    }
    async getServiceDetail(id_service) {
        const service = await db.Service.findOne({
            where: {
                id: id_service,
            },
        });
        const rating = await db.Rating.findAll({
            where: { id_service: id_service },
            attributes: { exclude: ['id_product', 'id_service'] },
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
        const Service = JSON.parse(JSON.stringify(service));
        var totalStar = 0;
        for (let i = 0; i < Rating.length; i++) {
            totalStar += Number(Rating[i].star);
        }
        totalStar = Math.floor(totalStar / Rating.length);
        const serviceDetail = {
            ...Service,
            rating: Rating,
            totalStar: totalStar ? totalStar : 0,
        };
        return {
            success: true,
            result: serviceDetail,
        };
    }
    async deleteService(id_service) {
        await db.Service.destroy({
            where: { id: id_service },
        });
        return {
            success: true,
            message: 'delete service successfully',
        };
    }
    async addService(image, name, description, price) {
        await db.Service.create({
            name: name,
            description: description,
            image: image.url,
            price: price,
        });
        return {
            success: true,
            message: 'add service successfully',
        };
    }
    async updateService(data, id_service) {
        await db.Service.update(
            {
                ...data,
            },
            {
                where: { id: id_service },
            },
        );
        return {
            success: true,
            message: 'update service successfully',
        };
    }
    async updateImageService(image, id_service) {
        await db.Service.update(
            {
                image: image.url,
            },
            {
                where: { id: id_service },
            },
        );
        return {
            success: true,
            message: "update service's image successfully",
        };
    }
}
module.exports = new ServiceServices();
