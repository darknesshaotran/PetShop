'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Cart extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Cart.belongsTo(models.Account, { foreignKey: 'id_account', targetKey: 'id' });
            Cart.belongsToMany(models.Product, {
                through: models.Cart_Item,
                as: 'Cart_Items',
                foreignKey: 'id_cart',
                otherKey: 'id_product',
            });
        }
    }
    Cart.init(
        {
            id_account: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Cart',
        },
    );
    return Cart;
};
