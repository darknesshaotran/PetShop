const BreedServices = require('../services/breed.services');
class BreedController {
    async getBreedList(req, res, next) {
        const result = await BreedServices.getBreedList();
        res.json(result);
    }
    async deleteBreed(req, res, next) {
        const { id_category } = req.params;
        const result = await BreedServices.deleteBreed(id_category);
        res.json(result);
    }
    async addBreed(req, res, next) {
        const { urls, Fields } = req.formdata;
        const { name, description } = Fields;
        const result = await BreedServices.addBreed(urls, name, description);
        res.json(result);
    }
}
module.exports = new BreedController();
