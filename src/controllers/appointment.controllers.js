const orderServices = require('../services/order.services');

class AppointmentController {
    async createAppointment(req, res, next) {
        // Items: [ { id_product, quantity, id_cartItem, price }]
        const { Items, address, phoneNumber } = req.body;
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const result = await orderServices.createOrder(Items, userID, address, phoneNumber);
        res.json(result);
    }
    async updateAppointment(req, res, next) {
        const { id_order } = req.params;
        const result = await orderServices.OrderDetails(id_order);
        res.json(result);
    }
    async cancelAppointment(req, res, next) {
        const { id_order } = req.params;
        const result = await orderServices.CancelOrder(id_order);
        res.json(result);
    }

    // ADMIN
    async acceptAppointment(req, res, next) {
        const { id_order } = req.params;
        const result = await orderServices.UpdateStatusOrder(id_order);
        res.json(result);
    }
}
module.exports = new AppointmentController();
