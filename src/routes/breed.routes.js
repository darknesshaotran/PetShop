const { Router } = require('express');
const { wrapController } = require('../utils/handle.js');
const { accessTokenValidator, refreshTokenValidator, isAdminValidator } = require('../middlewares/user.middlewares.js');
const BreedController = require('../controllers/breed.controllers.js');
const { FormdataValidator } = require('../middlewares/Formdata.middlewares.js');
const router = Router();
router.post(
    '/add',
    accessTokenValidator,
    isAdminValidator,
    FormdataValidator,
    wrapController(BreedController.addBreed),
);
router.delete('/delete/:id_breed', accessTokenValidator, isAdminValidator, wrapController(BreedController.deleteBreed));
router.put(
    '/updateInfor/:id_breed',
    accessTokenValidator,
    isAdminValidator,
    wrapController(BreedController.updateBreed),
);
router.put(
    '/updateImage/:id_breed',
    accessTokenValidator,
    isAdminValidator,
    FormdataValidator,
    wrapController(BreedController.updateBreedImage),
);
router.get('/:id_breed', wrapController(BreedController.getBreedDetail));
router.get('/', wrapController(BreedController.getBreedList));

module.exports = router;
