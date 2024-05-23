const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class OrderServices {
    async createOrderItem(Item, order) {
        await db.Order_Item.create({
            id_product: Item.id_product,
            id_order: order.id,
            quantity: Item.quantity,
            fixed_price: Item.price * Item.quantity,
            isRate: 0,
        });
        const product = await db.Product.findOne({ where: { id: Item.id_product } });
        await db.Product.update(
            {
                amount: Number(product.amount) - Number(Item.quantity),
            },
            {
                where: { id: product.id },
            },
        );
    }
    async createOrder(Items, userID, address, phoneNumber) {
        const order = await db.Order.create({
            id_account: userID,
            id_status: 1,
            isService: 0,
            order_address: address,
            order_phoneNumber: phoneNumber,
        });
        var totalPrice = 0;
        for (let i = 0; i < Items.length; i++) {
            await this.createOrderItem(Items[i], order);
            totalPrice += Items[i].price * Items[i].quantity;
            if (Items[i].id_cartItem) {
                await db.Cart_Item.destroy({
                    where: { id: Items[i].id_cartItem },
                });
            }
        }
        await db.Order.update(
            {
                totalPrice: totalPrice,
            },
            {
                where: { id: order.id },
            },
        );
        return {
            success: true,
            message: 'create Order successfully',
            order: order,
        };
    }
    async OrderDetails(id_order) {
        var order = await db.Order.findOne({
            where: { id: id_order },
        });
        if (!order.isService) {
            const Order = await db.Order.findOne({
                where: { id: id_order },
                attributes: {
                    exclude: ['createdAt', 'updatedAt'],
                },
                include: [
                    {
                        model: db.Product,
                        through: {
                            attributes: ['id', 'quantity', 'fixed_price', 'isRate'],
                            as: 'order_item_infor',
                        },
                        as: 'Products',
                        attributes: ['id', 'name', 'amount', 'price'],
                        include: [
                            {
                                model: db.Breed,
                                attributes: ['id', 'name'],
                            },
                        ],
                    },
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
            });
            order = JSON.parse(JSON.stringify(Order));
            for (let i = 0; i < order.Products.length; i++) {
                const Image = await db.Image.findOne({
                    where: { id_product: order.Products[i].id },
                    attributes: ['image'],
                });
                const image = JSON.parse(JSON.stringify(Image));
                order.Products[i].image = image.image ? image.image : '';
            }
        } else {
            // TO DO SHOW APPOINTMENT DETAIL
        }

        return {
            success: true,
            result: order,
        };
    }
    async HistoryOrder(userID) {
        const order = await db.Order.findAll({
            where: { id_account: userID },
            order: [['createdAt', 'DESC']],
            include: [{ model: db.Status, as: 'Status', attributes: ['status'] }],
        });
        return {
            success: true,
            result: order,
        };
    }
    async CancelOrder(id_order) {
        const order = await db.Order.findOne({
            where: { id: id_order },
        });
        if (order.id_status > 1)
            throw new ErrorsWithStatus({
                status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                message: 'Can not cancel order anymore',
            });

        for (let i = 0; i < order.Products.length; i++) {
            // khôi phục amount của product ở đây
            const product = await db.Product.findOne({ where: { id: order.Products[i].id } });
            await db.Product.update(
                {
                    amount: product.amount + order.Products[i].order_item_infor.quantity,
                },
                {
                    where: { id: product.id },
                },
            );
        }
        await db.Order.update(
            { id_status: 5 },
            {
                where: { id: id_order },
            },
        );
        return {
            success: true,
            message: 'cancel order successfully',
        };
    }
    async StatusOrder(userID, id_status) {
        const order = await db.Order.findAll({
            where: { id_account: userID, id_status: id_status },
            order: [['createdAt', 'DESC']],
            include: [{ model: db.Status, as: 'Status', attributes: ['status'] }],
        });
        return {
            success: true,
            result: order,
        };
    }
    async UpdateStatusOrder(id_order) {
        const order = await db.Order.findOne({
            where: { id: id_order },
        });
        if (order.id_status >= 4) {
            throw new ErrorsWithStatus({
                status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                message: `can't change order's status anymore`,
            });
        }
        await db.Order.update(
            {
                id_status: order.id_status + 1,
            },
            {
                where: { id: id_order },
            },
        );
        return {
            success: true,
            message: "Updated order's status successfully",
        };
    }
    async getAllStatusOrderList(id_status) {
        const orders = await db.Order.findAll({
            where: { id_status: id_status },
            order: [['createdAt', 'DESC']],
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
        });
        return {
            success: true,
            result: orders,
        };
    }
    // ONLINE PAYMENT
    async deleteOrder(id_order) {
        await db.Order.destroy({
            where: { id: id_order },
        });
    }
}
module.exports = new OrderServices();
