'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Payment extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Payment.belongsTo(models.Order, { foreignKey: 'id_order', targetKey: 'id' });
        }
    }
    Payment.init(
        {
            id_order: DataTypes.INTEGER,
            paymentDate: DataTypes.DATE,
            paymentMethod: DataTypes.STRING,
            isPaid: DataTypes.INTEGER,
            id_transaction: DataTypes.STRING,
            id_order_momo: DataTypes.STRING,
            money: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Payment',
        },
    );
    return Payment;
};
