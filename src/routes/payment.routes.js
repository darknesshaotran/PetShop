const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator } = require('../middlewares/user.middlewares');
const paymentControllers = require('../controllers/payment.controllers');
const { refundPayment } = require('../utils/Momo');

const router = Router();
router.post('/check-status-transaction', wrapController(paymentControllers.checkTransactionStatus));
router.post(
    '/refund',
    wrapController(async (req, res, next) => {
        const result = await refundPayment(req.body.id_order, req.body.id_transaction, req.body.amount);
        res.json(result);
    }),
);
router.post(
    '/callback',
    wrapController(async (req, res, next) => {
        console.log('callback', req.body);
        res.json(req.body);
    }),
);
router.post('/', accessTokenValidator, wrapController(paymentControllers.createPaymentLink));

module.exports = router;
