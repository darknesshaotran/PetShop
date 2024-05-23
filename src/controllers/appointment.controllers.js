const appointmentServices = require('../services/appointment.services');

class AppointmentController {
    async createAppointment(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { id_service, note, appointmentTime, endTime } = req.body;
        const result = await appointmentServices.createAppointment(userID, id_service, note, appointmentTime, endTime);
        res.json(result);
    }
    async detailAppointment(req, res, next) {
        const { id_appointment } = req.params;
        const result = await appointmentServices.AppointmentDetail(id_appointment);
        res.json(result);
    }
    async updateAppointment(req, res, next) {
        const { id_appointment } = req.params;
        const { note, appointmentTime, endTime } = req.body;
        const result = await appointmentServices.updateAppointment(id_appointment, note, appointmentTime, endTime);
        res.json(result);
    }
    async cancelAppointment(req, res, next) {
        const { id_appointment } = req.params;
        const result = await appointmentServices.cancelAppointment(id_appointment);
        res.json(result);
    }

    // ADMIN
    async acceptAppointment(req, res, next) {
        const { id_appointment } = req.params;
        const result = await appointmentServices.acceptAppointment(id_appointment);
        res.json(result);
    }
}
module.exports = new AppointmentController();
