const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const { createPayment, TransactionStatus, refundPayment } = require('../utils/Momo');

class BreedServices {
    async createPaymentLink(id_order) {
        let orderContent = '';
        let amount = 0;
        let items = [];
        let userInfo = {};

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
                // asign items here
                const product = {
                    id: order.Products[i].id,
                    name: order.Products[i].name,
                    imageUrl: order.Products[i].image,
                    quantity: order.Products[i].order_item_infor.quantity,
                    price: order.Products[i].price,
                    totalPrice: order.Products[i].order_item_infor.fixed_price,
                    currency: 'VND',
                };
                items.push(product);
            }
            userInfo = {
                name: Order.Account.inforUser.firstname + Order.Account.inforUser.lastname,
                phoneNumber: Order.Account.inforUser.phoneNumber,
                email: Order.Account.email,
            };
            orderContent = 'Thanh toán đơn hàng';
            amount = Number(order.totalPrice);
        } else {
            const appointment = await db.Appointment.findOne({
                where: { id_order: id_order },
                include: [
                    {
                        model: db.Order,
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
                    },
                    {
                        model: db.Service,
                        attributes: ['name', 'price', 'image', 'description'],
                    },
                ],
            });
            order = JSON.parse(JSON.stringify(appointment));
            orderContent = 'Thanh toán đặt lịch hẹn cho dịch vụ';
            amount = Number(order.Order.totalPrice);
            userInfo = {
                name: order.Order.Account.inforUser.firstname + order.Order.Account.inforUser.lastname,
                phoneNumber: order.Order.Account.inforUser.phoneNumber,
                email: order.Order.Account.email,
            };
            items.push({
                id: order.id_service,
                name: order.Service.name,
                imageUrl: order.Service.image,
                quantity: 1,
                price: order.Service.price,
                totalPrice: order.Service.price,
                currency: 'VND',
            });
        }
        const result = await createPayment({ orderContent, amount: amount.toString(), id_order, items, userInfo });
        return result;
    }
    async checkTransactionStatus(id_order) {
        const result = await TransactionStatus(id_order);
        return result;
    }
    async refundMoney(id_order_MoMo) {
        const { transId, amount } = await TransactionStatus(id_order_MoMo);
        const id_order = id_order_MoMo.split('PETSHOP')[0];
        const { orderId } = await this.createPaymentLink(id_order);
        const result = await refundPayment({ id_order: orderId, id_transaction: transId, amount: amount });
        return result;
    }
}
module.exports = new BreedServices();
