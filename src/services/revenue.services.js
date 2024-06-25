const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class RevenueServices {
    async getRevenuesByTime(startTime, endTime) {
        const OrdersInfor = await this.getListOrderByTime(startTime, endTime);

        const orders = OrdersInfor.result.orders;

        // Group orders by day
        const ordersByDay = {};
        orders.forEach((order) => {
            const day = order.createdAt.split('T')[0];
            if (!ordersByDay[day]) {
                ordersByDay[day] = [];
            }
            ordersByDay[day].push(order);
        });

        // Calculate profit and total price for each day
        const resultByDay = [];
        for (const day in ordersByDay) {
            const ordersForDay = ordersByDay[day];

            let totalRevenueForDay = 0;
            let profitForDay = 0;

            ordersForDay.forEach((order) => {
                totalRevenueForDay += order.totalPrice;
                profitForDay += order.profit;
            });

            resultByDay.push({
                date: day,
                totalRevenue: totalRevenueForDay,
                profit: profitForDay,
                orders: ordersForDay,
            });
        }
        resultByDay.sort((a, b) => new Date(a.date) - new Date(b.date));

        return {
            success: true,
            result: {
                totalRevenue: OrdersInfor.result.totalRevenue,
                profitRevenue: OrdersInfor.result.profitRevenue,
                resultByDay: resultByDay,
            },
        };
    }
    async getListOrderByTime(startTime, endTime) {
        const Orders = await db.Order.findAll({
            where: {
                id_status: 4,
                isService: 0,
                createdAt: {
                    [Op.between]: [startTime, endTime],
                },
            },
        });
        const orders = JSON.parse(JSON.stringify(Orders));
        for (let i = 0; i < orders.length; i++) {
            var originalPrice = 0;
            const Sub_order = await db.Order.findOne({
                where: { id: orders[i].id },
                attributes: {
                    exclude: ['createdAt', 'updatedAt'],
                },
                include: [
                    {
                        model: db.Product,
                        through: {
                            attributes: ['id', 'quantity', 'fixed_price', 'isRate'],
                            as: 'order_item_infor',
                        },
                        as: 'Products',
                        attributes: ['id', 'name', 'amount', 'price', 'import_price'],
                        include: [
                            {
                                model: db.Breed,
                                attributes: ['id', 'name'],
                            },
                        ],
                    },
                    { model: db.Status, as: 'Status', attributes: ['status'] },
                    {
                        model: db.Account,
                        attributes: {
                            exclude: ['password', 'forgot_password_token', 'id_role'],
                        },
                        include: [
                            {
                                model: db.inforUser,
                                as: 'inforUser',
                                attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                            },
                        ],
                    },
                ],
            });
            const sub_order = JSON.parse(JSON.stringify(Sub_order));
            const order_items = sub_order.Products;
            for (let j = 0; j < order_items.length; j++) {
                originalPrice += order_items[j].import_price * order_items[j].order_item_infor.quantity;
            }
            orders[i].profit = orders[i].totalPrice - originalPrice;
        }
        const totalRevenue = orders.reduce((acc, order) => acc + order.totalPrice, 0);
        const profitRevenue = orders.reduce((acc, order) => acc + order.profit, 0);
        return {
            success: true,
            result: {
                totalRevenue: totalRevenue,
                profitRevenue: profitRevenue,
                orders: orders,
            },
        };
    }

    async getTopOfCustommer(page, limit) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 20;
        }
        const order = [['point', 'DESC']];
        const Customers = await db.Account.findAll({
            where: {
                point: { [Op.gt]: 0 },
                id_role: 2,
            },
            offset: offset,
            limit: limit,
            order: order,
            attributes: {
                exclude: ['password', 'forgot_password_token', 'id_role'],
            },
            include: [
                {
                    model: db.inforUser,
                    as: 'inforUser',
                    attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                },
            ],
        });
        const totalRevenue = Customers.reduce((acc, customer) => acc + Number(customer.point) * 1000, 0);

        return {
            success: true,
            result: {
                customers: Customers,
                totalRevenue: totalRevenue,
            },
        };
    }

    async getTopOfProduction(page, limit) {
        var offset = 0;
        if (page && limit) {
            offset = (page - 1) * limit;
        }
        if (!limit) {
            limit = 20;
        }
        const order = [['soldProductNum', 'DESC']];
        const Products = await db.Product.findAll({
            where: {
                soldProductNum: { [Op.gt]: 0 },
            },
            offset: offset,
            limit: limit,
            order: order,
            attributes: {
                exclude: ['id_breed', 'createdAt', 'updatedAt', 'description'],
            },
            include: [{ model: db.Breed, as: 'Breed', attributes: ['id', 'name'] }],
        });
        const totalRevenue = Products.reduce((acc, product) => acc + Number(product.proceeds), 0);
        const products = JSON.parse(JSON.stringify(Products));

        for (let i = 0; i < products.length; i++) {
            const image = await db.Image.findOne({
                where: { id_product: products[i].id },
            });

            const Image = JSON.parse(JSON.stringify(image));
            products[i].image = Image ? Image.image : '';
        }
        return {
            success: true,
            result: {
                products: products,
                totalRevenue: totalRevenue,
            },
        };
    }

    async getTopOfService(revenueData) {
        // TODO: Implement code to create a new revenue
    }
}

module.exports = new RevenueServices();
