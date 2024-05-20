'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Appointment extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Appointment.belongsTo(models.Service, { foreignKey: 'id_service', targetKey: 'id' });
            Appointment.hasOne(models.Order, { foreignKey: 'id_appointment' });
            Appointment.belongsTo(models.Account, { foreignKey: 'id_account', targetKey: 'id' });
            Appointment.belongsTo(models.Status, { foreignKey: 'id_status', targetKey: 'id' });
        }
    }
    Appointment.init(
        {
            name: DataTypes.STRING,
            image: DataTypes.STRING,
            description: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'Appointment',
        },
    );
    return Appointment;
};
