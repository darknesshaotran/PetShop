const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class RatingServices {
    async addRating(star, comment, userID, id_product, id_service, id_order_item, id_apopintment) {
        const transaction = await db.sequelize.transaction();
        try {
            await db.Rating.create(
                {
                    star: Number(star),
                    comment: comment,
                    id_account: userID,
                    id_product: id_product,
                    id_service: id_service,
                },
                { transaction },
            );
            if (id_order_item && !id_apopintment) {
                await db.Order_Item.update(
                    {
                        isRate: 1,
                    },
                    {
                        where: { id: id_order_item },
                        transaction,
                    },
                );
            } else if (id_apopintment && !id_order_item) {
                await db.Appointment.update(
                    {
                        isRate: 1,
                    },
                    {
                        where: { id: id_apopintment },
                        transaction,
                    },
                );
            }

            await transaction.commit();
            return {
                success: true,
                message: 'Add rating successfully',
            };
        } catch (error) {
            await transaction.rollback();
            throw error;
        }
    }
    async deleteRating(id_rating) {
        await db.Rating.destroy({
            where: { id: id_rating },
        });
        return {
            success: true,
            message: 'Delete rating successfully',
        };
    }
    async updateRating(star, comment, id_rating) {
        await db.Rating.update(
            {
                star: star,
                comment: comment,
            },
            {
                where: { id: id_rating },
            },
        );
        return {
            success: true,
            message: 'Update rating successfully',
        };
    }
}
module.exports = new RatingServices();
