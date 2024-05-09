'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Rating extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Rating.belongsTo(models.Account, { foreignKey: 'id_account', targetKey: 'id' });
            Rating.belongsTo(models.Product, { foreignKey: 'id_product', targetKey: 'id' });
        }
    }
    Rating.init(
        {
            id_product: DataTypes.INTEGER,
            id_service: DataTypes.INTEGER,
            id_account: DataTypes.INTEGER,
            star: DataTypes.INTEGER,
            comment: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'Rating',
        },
    );
    return Rating;
};
