const ServiceServices = require('../services/service.services');
class ServiceController {
    async getServiceList(req, res, next) {
        const { limit, page, search, isDesc } = req.query;
        const result = await ServiceServices.getServiceList(search, limit, page, isDesc);
        res.json(result);
    }
    async getServiceDetail(req, res, next) {
        const { id_service } = req.params;
        const result = await ServiceServices.getServiceDetail(id_service);
        res.json(result);
    }
    async deleteService(req, res, next) {
        const { id_service } = req.params;
        const result = await ServiceServices.deleteService(id_service);
        res.json(result);
    }
    async addService(req, res, next) {
        const { urls, Fields } = req.formdata;
        const { name, description, price } = Fields;
        const result = await ServiceServices.addService(urls[0], name, description, price);
        res.json(result);
    }
    async updateService(req, res, next) {
        const { id_service } = req.params;
        const data = req.body;
        const result = await ServiceServices.updateService(data, id_service);
        res.json(result);
    }
    async updateServiceImage(req, res, next) {
        const { id_service } = req.params;
        const { urls, Fields } = req.formdata;
        const result = await ServiceServices.updateImageService(urls[0], id_service);
        res.json(result);
    }
}
module.exports = new ServiceController();
