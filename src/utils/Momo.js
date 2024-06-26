const dotenv = require('dotenv');
const crypto = require('crypto');
const { default: axios } = require('axios');
dotenv.config();
const createPayment = async ({ orderContent, amount, id_order, items, userInfo }) => {
    var accessKey = process.env.MOMO_ACCESS_KEY;
    var secretKey = process.env.MOMO_SECRET_KEY;
    var partnerCode = process.env.MOMO_PARTNER_CODE;
    var requestType = process.env.MOMO_REQUEST_TYPE;
    var lang = 'vi';
    var orderInfo = orderContent;
    var redirectUrl = process.env.CLIENT_URL;
    var ipnUrl = process.env.IPN_URL;

    var orderId = id_order + 'PETSHOP' + new Date().getTime();
    var requestId = orderId;

    var extraData = '';
    var autoCapture = true;

    var rawSignature =
        'accessKey=' +
        accessKey +
        '&amount=' +
        amount +
        '&extraData=' +
        extraData +
        '&ipnUrl=' +
        ipnUrl +
        '&orderId=' +
        orderId +
        '&orderInfo=' +
        orderInfo +
        '&partnerCode=' +
        partnerCode +
        '&redirectUrl=' +
        redirectUrl +
        '&requestId=' +
        requestId +
        '&requestType=' +
        requestType;
    var signature = crypto.createHmac('sha256', secretKey).update(rawSignature).digest('hex');

    //json object send to MoMo endpoint
    const requestBody = JSON.stringify({
        partnerCode: partnerCode,
        requestId: requestId,
        amount: amount,
        orderId: orderId,
        orderInfo: orderInfo,
        items: items,
        userInfo: userInfo,
        redirectUrl: redirectUrl,
        ipnUrl: ipnUrl,
        lang: lang,
        requestType: requestType,
        autoCapture: autoCapture,
        extraData: extraData,
        signature: signature,
    });
    //Create the HTTPS objects
    const option = {
        method: 'POST',
        url: process.env.MOMO_ENDPOINT + '/gateway/api/create',
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': Buffer.byteLength(requestBody),
        },
        data: requestBody,
    };
    let result;
    try {
        result = await axios(option);
        return result.data;
    } catch (err) {
        throw err;
    }
};
const TransactionStatus = async (id_order) => {
    var accessKey = process.env.MOMO_ACCESS_KEY;
    var secretKey = process.env.MOMO_SECRET_KEY;
    var partnerCode = process.env.MOMO_PARTNER_CODE;
    const rawSignature = `accessKey=${accessKey}&orderId=${id_order}&partnerCode=${partnerCode}&requestId=${id_order}`;
    const signature = crypto.createHmac('sha256', secretKey).update(rawSignature).digest('hex');

    const requestBody = JSON.stringify({
        partnerCode: partnerCode,
        requestId: id_order,
        orderId: id_order,
        signature: signature,
        lang: 'vi',
    });

    const options = {
        method: 'POST',
        url: process.env.MOMO_ENDPOINT + '/gateway/api/query',
        headers: {
            'Content-Type': 'application/json',
        },
        data: requestBody,
    };

    const result = await axios(options);
    return result.data;
};
const refundPayment = async ({ id_order, id_transaction, amount }) => {
    var accessKey = process.env.MOMO_ACCESS_KEY;
    var secretKey = process.env.MOMO_SECRET_KEY;
    var partnerCode = process.env.MOMO_PARTNER_CODE;
    const rawSignature = `accessKey=${accessKey}&amount=${amount}&description=refund&orderId=${id_order}&partnerCode=${partnerCode}&requestId=${id_order}&transId=${id_transaction}`;
    const signature = crypto.createHmac('sha256', secretKey).update(rawSignature).digest('hex');
    const requestBody = JSON.stringify({
        partnerCode: partnerCode,
        orderId: id_order,
        requestId: id_order,
        amount: Number(amount),
        transId: Number(id_transaction),
        lang: 'vi',
        description: 'refund',
        signature: signature,
    });
    const option = {
        method: 'POST',
        url: process.env.MOMO_ENDPOINT + '/gateway/api/refund',
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': Buffer.byteLength(requestBody),
        },
        data: requestBody,
    };
    let result;
    try {
        result = await axios(option);
        return result.data;
    } catch (err) {
        throw err;
    }
};
exports.createPayment = createPayment;
exports.TransactionStatus = TransactionStatus;
exports.refundPayment = refundPayment;
