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
            Appointment.belongsTo(models.Order, { foreignKey: 'id_order', targetKey: 'id' });
        }
    }
    Appointment.init(
        {
            id_service: DataTypes.INTEGER,
            id_order: DataTypes.INTEGER,
            appointment_time: DataTypes.DATE,
            end_time: DataTypes.DATE,
            note: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'Appointment',
        },
    );
    return Appointment;
};
