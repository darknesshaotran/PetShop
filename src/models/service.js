'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Service extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Service.hasMany(models.Appointment, { foreignKey: 'id_service' });
            Service.hasMany(models.Rating, { foreignKey: 'id_service' });
        }
    }
    Service.init(
        {
            name: DataTypes.STRING,
            image: DataTypes.STRING,
            description: DataTypes.STRING,
            price: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Service',
        },
    );
    return Service;
};
