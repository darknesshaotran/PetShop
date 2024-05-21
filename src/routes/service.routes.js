const { Router } = require('express');
const { wrapController } = require('../utils/handle.js');
const { accessTokenValidator, refreshTokenValidator, isAdminValidator } = require('../middlewares/user.middlewares.js');
const ServiceController = require('../controllers/service.controllers.js');
const { FormdataValidator } = require('../middlewares/Formdata.middlewares.js');
const router = Router();
router.post(
    '/add',
    accessTokenValidator,
    isAdminValidator,
    FormdataValidator,
    wrapController(ServiceController.addService),
);
router.delete(
    '/delete/:id_service',
    accessTokenValidator,
    isAdminValidator,
    wrapController(ServiceController.deleteService),
);
router.put(
    '/updateInfor/:id_service',
    accessTokenValidator,
    isAdminValidator,
    wrapController(ServiceController.updateService),
);
router.put(
    '/updateImage/:id_service',
    accessTokenValidator,
    isAdminValidator,
    FormdataValidator,
    wrapController(ServiceController.updateServiceImage),
);
router.get('/:id_service', wrapController(ServiceController.getServiceDetail));
router.get('/', wrapController(ServiceController.getServiceList));

module.exports = router;
