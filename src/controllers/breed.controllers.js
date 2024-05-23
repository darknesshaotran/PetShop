const BreedServices = require('../services/breed.services');
class BreedController {
    async getBreedList(req, res, next) {
        const result = await BreedServices.getBreedList();
        res.json(result);
    }
    async getBreedDetail(req, res, next) {
        const { id_breed } = req.params;
        const result = await BreedServices.getBreedDetail(id_breed);
        res.json(result);
    }

    async deleteBreed(req, res, next) {
        const { id_breed } = req.params;
        const result = await BreedServices.deleteBreed(id_breed);
        res.json(result);
    }
    async addBreed(req, res, next) {
        const { urls, Fields } = req.formdata;
        const { name, description } = Fields;
        const result = await BreedServices.addBreed(urls, name, description);
        res.json(result);
    }
    async updateBreed(req, res, next) {
        const { id_breed } = req.params;
        const data = req.body;
        const result = await BreedServices.updateBreed(data, id_breed);
        res.json(result);
    }
    async updateBreedImage(req, res, next) {
        const { id_breed } = req.params;
        const { urls, Fields } = req.formdata;
        const result = await BreedServices.updateImageBreed(urls[0], id_breed);
        res.json(result);
    }
}
module.exports = new BreedController();
