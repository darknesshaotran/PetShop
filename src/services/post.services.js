const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class PostServices {
    async addPost(title, thumbnail, content) {
        await db.Post.create({
            title: title,
            thumbnail: thumbnail,
            content: content,
        });

        return {
            success: true,
            message: 'add post successfully',
        };
    }
    async deletePost(id_post) {
        await db.Post.destroy({
            where: { id: id_post },
        });
        return {
            success: true,
            message: 'delete post successfully',
        };
    }
    async getPosts() {
        const posts = await db.Post.findAll({
            limit: 20,
            order: [['createdAt', 'DESC']],
        });
        return {
            success: true,
            result: posts,
        };
    }
    async getPostDetails(id_post) {
        const post = await db.Post.findOne({
            where: { id: id_post },
        });
        return {
            success: true,
            result: post,
        };
    }
}
module.exports = new PostServices();
