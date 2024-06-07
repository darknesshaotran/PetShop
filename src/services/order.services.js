const db = require('../models');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const PAYMENT_METHOD = require('../constants/paymentMethod');
const paymentServices = require('./payment.services');
const notifyServices = require('./notify.services');
class OrderServices {
    async createOrderItem(Item, order, transaction) {
        await db.Order_Item.create(
            {
                id_product: Item.id_product,
                id_order: order.id,
                quantity: Item.quantity,
                fixed_price: Item.price * Item.quantity,
                isRate: 0,
            },
            { transaction },
        );
        const product = await db.Product.findOne({ where: { id: Item.id_product } });
        await db.Product.update(
            {
                amount: Number(product.amount) - Number(Item.quantity),
                soldProductNum: Number(product.soldProductNum) + Number(Item.quantity),
                proceeds: Number(product.proceeds) + Number(Item.price * Item.quantity),
            },
            {
                where: { id: product.id },
                transaction,
            },
        );
    }
    async createOrder(Items, userID, address, phoneNumber, paymentMethod) {
        const transaction = await db.sequelize.transaction();
        try {
            const order = await db.Order.create(
                {
                    id_account: userID,
                    id_status: 1,
                    isService: 0,
                    order_address: address,
                    order_phoneNumber: phoneNumber,
                },
                { transaction },
            );

            var totalPrice = 0;
            for (let i = 0; i < Items.length; i++) {
                await this.createOrderItem(Items[i], order, transaction);
                totalPrice += Items[i].price * Items[i].quantity;
                if (Items[i].id_cartItem) {
                    await db.Cart_Item.destroy({
                        where: { id: Items[i].id_cartItem },
                        transaction,
                    });
                }
            }

            await db.Order.update(
                {
                    totalPrice: totalPrice,
                },
                {
                    where: { id: order.id },
                    transaction,
                },
            );

            const account = await db.Account.findOne({
                where: { id: userID },
                transaction,
            });

            await db.Account.update(
                {
                    point: account.point + Math.ceil(totalPrice / 1000),
                },
                {
                    where: { id: userID },
                    transaction,
                },
            );

            await db.Payment.create(
                {
                    id_order: order.id,
                    paymentMethod: paymentMethod,
                    isPaid: 0,
                    money: totalPrice,
                },
                { transaction },
            );

            await transaction.commit();
            let payURL = '';
            if (paymentMethod === PAYMENT_METHOD.MOMO) {
                const { orderId, payUrl } = await paymentServices.createPaymentLink(order.id);

                payURL = payUrl;
                await db.Payment.update(
                    {
                        id_order_momo: orderId,
                    },
                    {
                        where: { id_order: order.id },
                    },
                );
            }

            return {
                success: true,
                message: 'create Order successfully',
                order: order,
                payURL: payURL,
            };
        } catch (error) {
            // await transaction.rollback();
            throw error;
        }
    }
    async OrderDetails(id_order) {
        var order = await db.Order.findOne({
            where: { id: id_order },
        });
        const Payment = await db.Payment.findOne({
            where: {
                id_order: id_order,
            },
            attributes: ['paymentDate', 'paymentMethod', 'isPaid', 'id_transaction', 'id_order_momo', 'money'],
        });
        const payment = JSON.parse(JSON.stringify(Payment));

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
            order.payment = payment;
            for (let i = 0; i < order.Products.length; i++) {
                const Image = await db.Image.findOne({
                    where: { id_product: order.Products[i].id },
                    attributes: ['image'],
                });
                const image = JSON.parse(JSON.stringify(Image));
                order.Products[i].image = image.image ? image.image : '';
            }
        }

        return {
            success: true,
            result: order,
        };
    }
    async HistoryOrder(userID) {
        const order = await db.Order.findAll({
            where: { id_account: userID, isService: 0 },
            order: [['createdAt', 'DESC']],
            include: [{ model: db.Status, as: 'Status', attributes: ['status'] }],
        });
        return {
            success: true,
            result: order,
        };
    }

    async CancelOrder(id_order) {
        const transaction = await db.sequelize.transaction();
        try {
            const order = await db.Order.findOne({
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
                        attributes: ['id', 'name', 'soldProductNum', 'proceeds', 'amount', 'price'],
                        include: [
                            {
                                model: db.Breed,
                                attributes: ['id', 'name'],
                            },
                        ],
                    },
                ],
                transaction,
            });
            if (order.id_status > 1)
                throw new ErrorsWithStatus({
                    status: HTTP_STATUS.UNPROCESSABLE_ENTITY,
                    message: 'Can not cancel order anymore',
                });

            for (let i = 0; i < order.Products.length; i++) {
                // khôi phục amount,soldProductNum,proceeds của product ở đây
                const product = await db.Product.findOne({ where: { id: order.Products[i].id }, transaction });
                await db.Product.update(
                    {
                        amount: Number(product.amount) + Number(order.Products[i].order_item_infor.quantity),
                        soldProductNum:
                            Number(product.soldProductNum) - Number(order.Products[i].order_item_infor.quantity),
                        proceeds: Number(product.proceeds) - Number(order.Products[i].order_item_infor.fixed_price),
                    },
                    {
                        where: { id: product.id },
                        transaction,
                    },
                );
            }
            const account = await db.Account.findOne({
                where: { id: order.id_account },
                transaction,
            });
            await db.Account.update(
                {
                    point: account.point - Math.ceil(order.totalPrice / 1000),
                },
                {
                    where: { id: order.id_account },
                    transaction,
                },
            );
            await db.Order.update(
                { id_status: 5 },
                {
                    where: { id: id_order },
                    transaction,
                },
            );

            const payment = await db.Payment.findOne({
                where: { id_order: id_order },
                transaction,
            });
            if (payment.isPaid && payment.paymentMethod === PAYMENT_METHOD.MOMO) {
                const { id_order_momo } = payment;
                const result = await paymentServices.refundMoney(id_order_momo);
                await db.Payment.update(
                    {
                        isPaid: 0,
                    },
                    {
                        where: { id_order: id_order },
                        transaction,
                    },
                );
                await notifyServices.sendNotify(
                    order.id_account,
                    `đã hoàn trả số tiền ${order.totalPrice} đồng về ví của bạn`,
                    transaction,
                );
            }
            await notifyServices.sendNotify(
                order.id_account,
                `đơn hàng ${order.totalPrice} đồng với mã số ${order.id} đã bị hủy`,
                transaction,
            );
            await transaction.commit();

            return {
                success: true,
                message: 'cancel order successfully',
            };
        } catch (error) {
            await transaction.rollback();
            throw error;
        }
    }
    async StatusOrder(userID, id_status) {
        const Order = await db.Order.findAll({
            where: { id_account: userID, id_status: id_status, isService: 0 },
            order: [['createdAt', 'DESC']],
            include: [{ model: db.Status, as: 'Status', attributes: ['status'] }],
        });
        const order = JSON.parse(JSON.stringify(Order));
        for (let i = 0; i < order.length; i++) {
            const Payment = await db.Payment.findOne({
                where: {
                    id_order: order[i].id,
                },
                attributes: ['paymentDate', 'paymentMethod', 'isPaid', 'id_transaction', 'id_order_momo', 'money'],
            });
            order[i].payment = JSON.parse(JSON.stringify(Payment));
        }
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
        if (order.id_status === 1) {
            await notifyServices.sendNotify(
                order.id_account,
                `đơn hàng ${order.totalPrice} đồng với mã số ${order.id} đang được chuẩn bị`,
            );
        } else if (order.id_status === 2) {
            await notifyServices.sendNotify(
                order.id_account,
                `đơn hàng ${order.totalPrice} đồng với mã số ${order.id} đang được giao`,
            );
        } else if (order.id_status === 3) {
            await notifyServices.sendNotify(
                order.id_account,
                `đơn hàng ${order.totalPrice} đồng với mã số ${order.id} đã được giao thành công`,
            );
            const payment = await db.Payment.findOne({
                where: { id_order: id_order },
            });
            if (payment.paymentMethod === PAYMENT_METHOD.COD) {
                await db.Payment.update({ paymentDate: new Date(), isPaid: 1 }, { where: { id_order: id_order } });
            }
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
        const Orders = await db.Order.findAll({
            where: { id_status: id_status, isService: 0 },
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
        const orders = JSON.parse(JSON.stringify(Orders));
        for (let i = 0; i < orders.length; i++) {
            const Payment = await db.Payment.findOne({
                where: {
                    id_order: orders[i].id,
                },
                attributes: ['paymentDate', 'paymentMethod', 'isPaid', 'id_transaction', 'id_order_momo', 'money'],
            });
            orders[i].payment = JSON.parse(JSON.stringify(Payment));
        }
        return {
            success: true,
            result: orders,
        };
    }
}
module.exports = new OrderServices();
