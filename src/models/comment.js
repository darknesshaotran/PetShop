'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Comment extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Comment.belongsTo(models.Account, { foreignKey: 'id_account', targetKey: 'id' });
            Comment.belongsTo(models.Post, { foreignKey: 'id_post', targetKey: 'id' });
        }
    }
    Comment.init(
        {
            id_post: DataTypes.INTEGER,
            id_account: DataTypes.INTEGER,
            content: DataTypes.STRING,
        },
        {
            sequelize,
            modelName: 'Comment',
        },
    );
    return Comment;
};
