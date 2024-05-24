const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator, refreshTokenValidator, isAdminValidator } = require('../middlewares/user.middlewares.js');
const { AppointmentExistsValidator, CreateAppointmentValidator } = require('../middlewares/appointment.middlewares.js');
const AppointmentController = require('../controllers/appointment.controllers.js');

const router = Router();

router.post(
    '/create',
    accessTokenValidator,
    CreateAppointmentValidator,
    wrapController(AppointmentController.createAppointment),
);
router.put(
    '/update/:id_appointment',
    accessTokenValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.updateAppointment),
);
router.get(
    '/detail/:id_appointment',
    accessTokenValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.detailAppointment),
);
router.put(
    '/cancel/:id_appointment',
    accessTokenValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.cancelAppointment),
);
router.put(
    '/accept/:id_appointment',
    accessTokenValidator,
    isAdminValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.acceptAppointment),
);

module.exports = router;
