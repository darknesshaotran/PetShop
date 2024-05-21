'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Order extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Order.belongsTo(models.Account, { foreignKey: 'id_account', targetKey: 'id' });
            Order.belongsTo(models.Status, { foreignKey: 'id_status', targetKey: 'id' });
            Order.belongsTo(models.Appointment, { foreignKey: 'id_appointment', targetKey: 'id' });
            Order.belongsToMany(models.Product, {
                through: models.Order_Item,
                as: 'Products',
                foreignKey: 'id_order',
                otherKey: 'id_product',
            });
        }
    }
    Order.init(
        {
            id_account: DataTypes.INTEGER,
            id_status: DataTypes.INTEGER,
            id_appointment: DataTypes.INTEGER,
            order_address: DataTypes.STRING,
            order_phoneNumber: DataTypes.STRING,
            totalPrice: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Order',
        },
    );
    return Order;
};
