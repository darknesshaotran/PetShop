const dotenv = require('dotenv');
const crypto = require('crypto');
const moment = require('moment');
const { default: axios } = require('axios');
dotenv.config();

const createPayment = async ({ orderContent, amount, id_order }) => {
    console.log('process ZaloPay');
    const embed_data = {
        redirecturl: process.env.CLIENT_URL,
    };
    const items = [{}];
    const transID = Math.floor(Math.random() * 100);
    const order = {
        app_id: process.env.ZALO_APP_ID,
        app_trans_id: `${moment().format('YYMMDD')}_${id_order}_${transID}`, // translation missing: vi.docs.shared.sample_code.comments.app_trans_id
        app_user: 'user123',
        app_time: Date.now(), // miliseconds
        item: JSON.stringify(items),
        embed_data: JSON.stringify(embed_data),
        amount: amount,
        description: orderContent,
        bank_code: '',
        callback_url: process.env.ZALO_CALLBACK_URL,
    };
    const data =
        order.app_id +
        '|' +
        order.app_trans_id +
        '|' +
        order.app_user +
        '|' +
        order.amount +
        '|' +
        order.app_time +
        '|' +
        order.embed_data +
        '|' +
        order.item;
    order.mac = crypto.createHmac('sha256', process.env.ZALO_KEY1).update(data).digest('hex');

    const result = await axios.post(process.env.ZALOPAY_ENDPOINT + `/create`, null, { params: order });
    return result;
};
createPayment({ orderContent: 'hehe', amount: 300000, id_order: 12312 }).then((res) => {
    console.log(r);
});

const refundPayment = async ({ id_transaction, amount }) => {
    const timestamp = Date.now();
    const uid = `${timestamp}${Math.floor(111 + Math.random() * 999)}`; // unique id

    let params = {
        app_id: Number(process.env.ZALO_APP_ID),
        m_refund_id: `${moment().format('YYMMDD')}_${process.env.ZALO_APP_ID}_${uid}`,
        timestamp, // miliseconds
        zp_trans_id: id_transaction,
        amount: Number(amount),
        description: 'ZaloPay Refund',
    };

    let data =
        params.app_id +
        '|' +
        params.zp_trans_id +
        '|' +
        params.amount +
        '|' +
        params.description +
        '|' +
        params.timestamp;
    params.mac = crypto.createHmac('sha256', process.env.ZALO_KEY1).update(data).digest('hex');

    const result = await axios.post(process.env.ZALOPAY_ENDPOINT + `/refund`, params, {
        headers: {
            'Content-Type': 'application/json',
        },
    });
    console.log(result.data);
    return result.data;
};

exports.createPayment = createPayment;
exports.refundPayment = refundPayment;
