const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const { createPayment, refundPayment } = require('../utils/ZaloPay');
const notifyServices = require('./notify.services');
class PaymentServices {
    async createPaymentLink(id_order) {
        var order = await db.Order.findOne({
            where: { id: id_order },
        });
        let amount = Number(order.totalPrice);
        let orderContent = order.isService ? 'Thanh toán đặt lịch hẹn cho dịch vụ' : 'Thanh toán đơn hàng';
        const result = await createPayment({ orderContent, amount: amount, id_order });
        return {
            ...result.data,
            payUrl: result.data.order_url,
        };
    }
    // async checkTransactionStatus(id_order) {
    //     const result = await TransactionStatus(id_order);
    //     return result;
    // }
    async refundMoney({ id_transaction, amount }) {
        const result = await refundPayment({ id_transaction: id_transaction, amount: amount });
        return result;
    }
    async handlePaymentSuccess(order_id, id_transaction) {
        await db.Payment.update(
            {
                isPaid: 1,
                paymentDate: new Date(),
                id_transaction: id_transaction,
            },
            {
                where: {
                    id_order: order_id,
                },
            },
        );
        await notifyServices.sendNotify(
            order.id_account,
            `đã thanh toán đơn hàng ${order.totalPrice} đồng với mã số ${order_id} thành công`,
            process.env.CLIENT_URL,
        );
        return {
            success: true,
            message: 'payment successfully',
        };
    }
}
module.exports = new PaymentServices();
