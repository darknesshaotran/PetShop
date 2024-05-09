'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Breed extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Breed.hasMany(models.Product, { foreignKey: 'id_breed' });
        }
    }
    Breed.init(
        {
            name: DataTypes.STRING,
            image: DataTypes.STRING,
            description: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'Breed',
        },
    );
    return Breed;
};
