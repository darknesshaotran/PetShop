const cartServices = require('../services/cart.services');

class CartController {
    async addToCart(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { id_product, quantity } = req.body;
        const result = await cartServices.addToCart(userID, id_product, quantity);
        res.json(result);
    }
    async getCartDetails(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const result = await cartServices.getCartDetails(userID);
        res.json(result);
    }
    async updateQuantityItem(req, res, next) {
        const { id_cartItem } = req.params;
        const { quantity } = req.body;
        const result = await cartServices.updateQuantityItem(quantity, id_cartItem);
        res.json(result);
    }
    async deleteCartItem(req, res, next) {
        const { id_cartItem } = req.params;
        const result = await cartServices.deleteQuantityItem(id_cartItem);
        res.json(result);
    }
}
module.exports = new CartController();
