const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class OrderServices {
    async createAppointment() {
        return;
    }
    async updateAppointment() {
        return;
    }
    async AppointmentDetail() {
        return;
    }
    async cancelAppointment(id_order) {
        return;
    }
    async acceptAppointment(id_order) {
        return;
    }
}
module.exports = new OrderServices();
