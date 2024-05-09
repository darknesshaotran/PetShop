const productServices = require('../services/product.services');

class ShoesController {
    async getListProduct(req, res, next) {
        const { minPrice, maxPrice, limit, page, id_breed, search, isDesc } = req.query;
        const result = await productServices.getListProduct(
            Number(minPrice),
            Number(maxPrice),
            Number(limit),
            Number(page),
            id_breed,
            search,
            Number(isDesc),
        );
        res.json(result);
    }
    async productDetails(req, res, next) {
        const { id_product } = req.params;
        const result = await productServices.productDetails(id_product);
        res.json(result);
    }
    async addProduct(req, res, next) {
        const { urls, Fields } = req.formdata;
        const { id_breed, name, price, import_price, description, amount } = Fields;
        const result = await productServices.addProduct(id_breed, name, price, import_price, description, amount, urls);
        res.json(result);
    }
    async deleteProduct(req, res, next) {
        const { id_product } = req.params;
        const result = await productServices.deleteProduct(id_product);
        res.json(result);
    }
    async updateProductInfor(req, res, next) {
        const { id_product } = req.params;
        const result = await productServices.updateProductInfor(id_product, req.body);
        res.json(result);
    }
    async updateProductImage(req, res, next) {
        const { id_product } = req.params;
        const { urls, Fields } = req.formdata;
        const result = await productServices.updateProductImages(id_product, urls);
        res.json(result);
    }
}
module.exports = new ShoesController();
