const accountRoute = require('./user.routes.js');
const productRoute = require('./product.routes.js');
const cartRoute = require('./cart.routes.js');
const orderRoute = require('./order.routes.js');
const breedRoute = require('./breed.routes.js');
const ratingRoute = require('./rating.routes.js');
const addressRoute = require('./address.routes.js');
const revenueRoute = require('./revenue.routes.js');
const messageRoute = require('./message.routes.js');
const paymentRoute = require('./payment.routes.js');
const serviceRoute = require('./service.routes.js');
const appointmentRoute = require('./appointment.routes.js');
const postRoute = require('./post.routes.js');
const route = (app) => {
    app.use('/api/payment', paymentRoute);
    app.use('/api/user', accountRoute);
    app.use('/api/product', productRoute);
    app.use('/api/cart', cartRoute);
    app.use('/api/order', orderRoute);
    app.use('/api/breed', breedRoute);
    app.use('/api/rating', ratingRoute);
    app.use('/api/service', serviceRoute);
    app.use('/api/address', addressRoute);
    app.use('/api/revenue', revenueRoute);
    app.use('/api/appointment', appointmentRoute);
    app.use('/api/message', messageRoute);
    app.use('/api/post', postRoute);
    ///////////////////////////////////////////////////////////////////////////////////////////////////////
    app.use('/', (req, res, next) => {
        return res.send('WELCOME TO SERVER');
    });
};

module.exports = route;
