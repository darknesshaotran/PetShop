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
router.get('/', wrapController(BreedController.getBreedList));

module.exports = router;
