const paymentServices = require('../services/payment.services');
const dotenv = require('dotenv');
const crypto = require('crypto');
dotenv.config();
class PaymentController {
    async createPaymentLink(req, res, next) {
        const { id_order } = req.body;
        const result = await paymentServices.createPaymentLink(id_order);
        res.json(result);
    }
    async handlePaymentSuccess(req, res, next) {
        let result = {};

        try {
            let dataStr = req.body.data;
            let dataJson = JSON.parse(dataStr);
            let reqMac = req.body.mac;
            console.log(dataJson);
            const app_trans_id = dataJson.app_trans_id;
            const order_id = Number(app_trans_id.split('_')[1]);
            const zp_trans_id = dataJson.zp_trans_id;

            let mac = crypto.createHmac('sha256', process.env.ZALO_KEY2).update(dataStr).digest('hex');
            if (reqMac !== mac) {
                result.return_code = -1;
                result.return_message = 'mac not equal';
            } else {
                // thanh toán thành công
                const resultx = await paymentServices.handlePaymentSuccess(order_id, zp_trans_id);

                result.return_code = 1;
                result.return_message = 'success';
            }
        } catch (ex) {
            result.return_code = 0; // ZaloPay server sẽ callback lại (tối đa 3 lần)
            result.return_message = ex.message;
        }

        res.json(result);
    }
}
module.exports = new PaymentController();
