const { Router } = require('express');
const { wrapController } = require('../utils/handle');

const router = Router();
const {
    AddProductValidator,
    ProductExistsValidator,
    UpdateProductInfor,
} = require('../middlewares/product.middlewares');
const { FormdataValidator } = require('../middlewares/Formdata.middlewares');
const productControllers = require('../controllers/product.controllers');
const { accessTokenValidator, isAdminValidator } = require('../middlewares/user.middlewares');

router.post(
    '/add',
    accessTokenValidator,
    isAdminValidator,
    FormdataValidator,
    AddProductValidator,
    wrapController(productControllers.addProduct),
);
router.put(
    '/updateInfor/:id_product',
    accessTokenValidator,
    isAdminValidator,
    ProductExistsValidator,
    UpdateProductInfor,
    wrapController(productControllers.updateProductInfor),
);
router.put(
    '/updateImages/:id_product',
    accessTokenValidator,
    isAdminValidator,
    ProductExistsValidator,
    FormdataValidator,
    wrapController(productControllers.updateProductImage),
);
router.delete(
    '/delete/:id_product',
    accessTokenValidator,
    isAdminValidator,
    ProductExistsValidator,
    wrapController(productControllers.deleteProduct),
);
router.get('/:id_product', ProductExistsValidator, wrapController(productControllers.productDetails));
router.get('/', wrapController(productControllers.getListProduct));

module.exports = router;
