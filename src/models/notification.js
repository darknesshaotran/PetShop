'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Notification extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Notification.belongsTo(models.Account, { foreignKey: 'id_account', targetKey: 'id' });
        }
    }
    Notification.init(
        {
            id_account: DataTypes.INTEGER,
            notify: DataTypes.STRING,
            isRead: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Notification',
        },
    );
    return Notification;
};
