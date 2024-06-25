const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator } = require('../middlewares/user.middlewares');
const paymentControllers = require('../controllers/payment.controllers');

const router = Router();
router.post('/callback', wrapController(paymentControllers.handlePaymentSuccess));
router.post('/', accessTokenValidator, wrapController(paymentControllers.createPaymentLink));

module.exports = router;
