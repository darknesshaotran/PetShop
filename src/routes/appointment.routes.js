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
    '/update/:id_order',
    accessTokenValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.updateAppointment),
);
router.get(
    '/detail/:id_order',
    accessTokenValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.detailAppointment),
);

router.put(
    '/cancel/:id_order',
    accessTokenValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.cancelAppointment),
);

// ADMIN ONLY ROUTES
router.put(
    '/accept/:id_order',
    accessTokenValidator,
    isAdminValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.acceptAppointment),
);
router.put(
    '/complete/:id_order',
    accessTokenValidator,
    isAdminValidator,
    AppointmentExistsValidator,
    wrapController(AppointmentController.completeAppointment),
);
router.get('/:id_status', accessTokenValidator, wrapController(AppointmentController.getListAppointment));
module.exports = router;
