const appointmentServices = require('../services/appointment.services');

class AppointmentController {
    async createAppointment(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const result = await appointmentServices.createAppointment();
        res.json(result);
    }
    async detailAppointment(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const result = await appointmentServices.AppointmentDetail();
        res.json(result);
    }
    async updateAppointment(req, res, next) {
        const { id_order } = req.params;
        const result = await appointmentServices.updateAppointment();
        res.json(result);
    }
    async cancelAppointment(req, res, next) {
        const { id_order } = req.params;
        const result = await appointmentServices.cancelAppointment(id_order);
        res.json(result);
    }

    // ADMIN
    async acceptAppointment(req, res, next) {
        const { id_order } = req.params;
        const result = await appointmentServices.acceptAppointment(id_order);
        res.json(result);
    }
}
module.exports = new AppointmentController();
