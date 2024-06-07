const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class NotificationServices {
    async getListNotify(userID, limit) {
        const notifications = await db.Notification.findAll({
            where: {
                id_account: userID,
            },
            limit: limit,
            order: [['createdAt', 'DESC']],
        });
        return {
            success: true,
            result: notifications,
        };
    }
    async sendNotify(userID, message, transaction = null) {
        await db.Notification.create(
            {
                id_account: userID,
                notify: message,
                isRead: 0,
            },
            { transaction },
        );
        return {
            success: true,
            message: 'send message successfully',
        };
    }
}
module.exports = new NotificationServices();
