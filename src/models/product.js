'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Product extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Product.belongsTo(models.Breed, { foreignKey: 'id_breed', targetKey: 'id' });
            Product.hasMany(models.Rating, { foreignKey: 'id_product' });
            Product.hasMany(models.Image, { foreignKey: 'id_product' });
        }
    }
    Product.init(
        {
            id_breed: DataTypes.INTEGER,
            name: DataTypes.STRING,
            amount: DataTypes.INTEGER,
            price: DataTypes.INTEGER,
            import_price: DataTypes.INTEGER,
            description: DataTypes.TEXT,
        },
        {
            sequelize,
            modelName: 'Product',
        },
    );
    return Product;
};
