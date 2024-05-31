const appointmentServices = require('../services/appointment.services');

class AppointmentController {
    async createAppointment(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { id_service, note, appointmentTime, endTime, order_phoneNumber } = req.body;
        const result = await appointmentServices.createAppointment(
            userID,
            id_service,
            note,
            appointmentTime,
            endTime,
            order_phoneNumber,
        );
        res.json(result);
    }
    async detailAppointment(req, res, next) {
        const { id_order } = req.params;
        const result = await appointmentServices.AppointmentDetail(id_order);
        res.json(result);
    }
    async updateAppointment(req, res, next) {
        const { id_order } = req.params;
        const { note, appointmentTime, endTime } = req.body;
        const result = await appointmentServices.updateAppointment(id_order, note, appointmentTime, endTime);
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
    async getListAppointment(req, res, next) {
        const { decoded_authorization } = req;
        const { userID, role } = decoded_authorization;
        const { id_status } = req.params;
        const result = await appointmentServices.getListAppointment(id_status, userID, role);
        res.json(result);
    }
}
module.exports = new AppointmentController();
