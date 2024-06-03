const revenueServices = require('../services/revenue.services');

class RevenueController {
    async getRevenuesByTime(req, res, next) {
        const { startDate, endDate } = req.query;

        const result = await revenueServices.getRevenuesByTime(startDate, endDate);
        res.json(result);
    }
    async getRevenueOfCustommer(req, res, next) {
        const { page, limit } = req.query;

        const result = await revenueServices.getTopOfCustommer(Number(page), Number(limit));
        res.json(result);
    }
    async getRevenueOfProduction(req, res, next) {
        const { page, limit } = req.query;

        const result = await revenueServices.getTopOfProduction(Number(page), Number(limit));
        res.json(result);
    }
}
module.exports = new RevenueController();
