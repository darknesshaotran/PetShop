const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator, refreshTokenValidator, isAdminValidator } = require('../middlewares/user.middlewares.js');
const AppointmentController = require('../controllers/appointment.controllers.js');

const router = Router();

router.post('/create', accessTokenValidator, wrapController(AppointmentController.createAppointment));
router.put('/update', accessTokenValidator, wrapController(AppointmentController.updateAppointment));
router.get('/detail/:id_appointment', accessTokenValidator, wrapController(AppointmentController.detailAppointment));
router.put('/cancel/:id_appointment', accessTokenValidator, wrapController(AppointmentController.cancelAppointment));
router.put('/accept/:id_appointment', accessTokenValidator, wrapController(AppointmentController.acceptAppointment));

module.exports = router;
