'use strict';
const { Model } = require('sequelize');
module.exports = (sequelize, DataTypes) => {
    class Post extends Model {
        /**
         * Helper method for defining associations.
         * This method is not a part of Sequelize lifecycle.
         * The `models/index` file will call this method automatically.
         */
        static associate(models) {
            // define association here
            Post.belongsTo(models.Account, { foreignKey: 'id_account', targetKey: 'id' });
            Post.hasMany(models.Comment, { foreignKey: 'id_post' });
        }
    }
    Post.init(
        {
            id_account: DataTypes.INTEGER,
            postType: DataTypes.INTEGER,
            title: DataTypes.INTEGER,
            thumbnail: DataTypes.STRING,
            content: DataTypes.STRING,
            view: DataTypes.INTEGER,
        },
        {
            sequelize,
            modelName: 'Post',
        },
    );
    return Post;
};
