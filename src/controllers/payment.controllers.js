const paymentServices = require('../services/payment.services');

class PaymentController {
    async createPaymentLink(req, res, next) {
        const { id_order } = req.body;
        const result = await paymentServices.createPaymentLink(id_order);
        res.json(result);
    }
    async checkTransactionStatus(req, res, next) {
        const { id_order } = req.body;
        const result = await paymentServices.checkTransactionStatus(id_order);
        return res.json(result);
    }
    async refundPayment(req, res, next) {
        const { id_order_MoMo } = req.body;
        const result = await paymentServices.refundMoney(id_order_MoMo);
        return res.json(result);
    }
}
module.exports = new PaymentController();
