const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class MessageServices {
    async addMessage(id_reciever, id_sender, content) {
        await db.Message.create({
            id_reciever: id_reciever,
            id_sender: id_sender,
            content: content,
        });
        return {
            success: true,
            message: 'send message successfully',
        };
    }
    // async getConversationList(userID, page, limit) {
    //     const conversations = await db.Message.findAll({
    //         where: db.sequelize.literal(
    //             `Message.id IN (SELECT MAX(Messages.id) FROM Messages WHERE (id_reciever = ${userID} OR id_sender = ${userID}))`,
    //         ),

    //         attributes: ['id', 'content', 'createdAt'],
    //         include: [
    //             {
    //                 model: db.Account,
    //                 as: 'sender',
    //                 attributes: {
    //                     exclude: ['password', 'forgot_password_token', 'id_role', 'createdAt', 'updatedAt'],
    //                 },
    //                 include: [
    //                     {
    //                         model: db.inforUser,
    //                         as: 'inforUser',
    //                         attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
    //                     },
    //                 ],
    //             },
    //             {
    //                 model: db.Account,
    //                 as: 'reciever',
    //                 attributes: {
    //                     exclude: ['password', 'forgot_password_token', 'id_role', 'createdAt', 'updatedAt'],
    //                 },
    //                 include: [
    //                     {
    //                         model: db.inforUser,
    //                         as: 'inforUser',
    //                         attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
    //                     },
    //                 ],
    //             },
    //         ],
    //         offset: (page - 1) * limit,
    //         limit: limit,
    //         group: ['id_reciever'],
    //         order: [[db.sequelize.literal('createdAt'), 'DESC']],
    //     });
    //     return {
    //         success: true,
    //         conversations: conversations,
    //     };
    // }
    async getConversationList(userID, page, limit) {
        const offset = (page - 1) * limit;

        const conversations = await db.sequelize.query(
            `WITH RankedMessages AS (
            SELECT 
                m.id,
                m.content,
                m.createdAt,
                m.id_sender,
                m.id_reciever,
                CASE 
                    WHEN m.id_sender = :userID THEN m.id_reciever 
                    ELSE m.id_sender 
                END AS involved,
                ROW_NUMBER() OVER (PARTITION BY 
                    CASE 
                        WHEN m.id_sender = :userID THEN m.id_reciever 
                        ELSE m.id_sender 
                    END 
                    ORDER BY m.createdAt DESC) AS rn
            FROM Messages m
            WHERE m.id_sender = :userID OR m.id_reciever = :userID
        )
        SELECT 
            rm.id,
            rm.content,
            rm.createdAt,
            rm.id_sender,
            rm.id_reciever,
            sender.id AS sender_id,
            sender.email AS sender_username,
            reciever.id AS reciever_id,
            reciever.email AS reciever_username,
            senderInfo.firstname AS sender_firstname,
            senderInfo.lastname AS sender_lastname,
            senderInfo.phoneNumber AS sender_phoneNumber,
            senderInfo.avatar AS sender_avatar,
            recieverInfo.firstname AS reciever_firstname,
            recieverInfo.lastname AS reciever_lastname,
            recieverInfo.phoneNumber AS reciever_phoneNumber,
            recieverInfo.avatar AS reciever_avatar
        FROM RankedMessages rm
        JOIN Accounts AS sender ON rm.id_sender = sender.id
        JOIN Accounts AS reciever ON rm.id_reciever = reciever.id
        LEFT JOIN inforUsers AS senderInfo ON sender.id = senderInfo.id_account
        LEFT JOIN inforUsers AS recieverInfo ON reciever.id = recieverInfo.id_account
        WHERE rm.rn = 1
        ORDER BY rm.createdAt DESC
        LIMIT :limit OFFSET :offset`,
            {
                replacements: { userID: userID, limit: limit, offset: offset },
                type: db.sequelize.QueryTypes.SELECT,
            },
        );

        return {
            success: true,
            conversations: conversations,
        };
    }

    async getConversationOfAnUser(userID, chat_user_ID, page, limit) {
        const messages = await db.Message.findAll({
            where: {
                [Op.or]: [
                    {
                        id_reciever: userID,
                        id_sender: chat_user_ID,
                    },
                    {
                        id_reciever: chat_user_ID,
                        id_sender: userID,
                    },
                ],
            },
            offset: (page - 1) * limit,
            limit: limit,
            order: [['createdAt', 'ASC']],
        });
        const conversation = JSON.parse(JSON.stringify(messages));
        for (let i = 0; i < conversation.length; i++) {
            if (conversation[i].id_reciever == userID && conversation[i].id_sender == chat_user_ID) {
                const User = await db.Account.findOne({
                    where: { id: chat_user_ID },
                    attributes: {
                        exclude: ['password', 'forgot_password_token', 'id_role', 'createdAt', 'updatedAt'],
                    },
                    include: [
                        { model: db.Role, as: 'Role', attributes: ['id', 'roleName'] },
                        {
                            model: db.inforUser,
                            as: 'inforUser',
                            attributes: ['firstname', 'lastname', 'avatar'],
                        },
                    ],
                });
                conversation[i].chatUser = User;
            }
        }
        return {
            success: true,
            messages: conversation,
        };
    }
}

module.exports = new MessageServices();
