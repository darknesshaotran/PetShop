const db = require('../models');
const { Op, where } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');
const PostType = require('../constants/PostType');
class PostServices {
    async addPost(title, thumbnail, content) {
        await db.Post.create({
            title: title,
            postType: PostType.BLOG,
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
    async getPosts(limit = 20) {
        const posts = await db.Post.findAll({
            where: {
                postType: PostType.BLOG,
            },
            limit: limit,
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
    async createForum(userID, title, content, thumbnail = '') {
        await db.Post.create({
            id_account: userID,
            title: title,
            postType: PostType.FORUM,
            thumbnail: thumbnail,
            content: content,
        });
        return {
            success: true,
            message: 'add forum successfully',
        };
    }
    async getForum(limit = 20) {
        const posts = await db.Post.findAll({
            where: {
                postType: PostType.FORUM,
            },
            include: [
                {
                    model: db.Account,
                    as: 'Account',
                    attributes: { exclude: ['password', 'forgot_password_token', 'id_role', 'createdAt', 'updatedAt'] },
                    include: [
                        {
                            model: db.inforUser,
                            as: 'inforUser',
                            attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                        },
                    ],
                },
            ],
            limit: limit,
            order: [['createdAt', 'DESC']],
        });
        const Posts = JSON.parse(JSON.stringify(posts));
        for (let i = 0; i < Posts.length; i++) {
            const replyNum = await db.Comment.count({
                where: {
                    id_post: Posts[i].id,
                },
            });
            Posts[i].replyNum = replyNum;
        }
        return {
            success: true,
            result: Posts,
        };
    }
    async getForumDetail(id_post) {
        const post = await db.Post.findOne({
            where: { id: id_post },
            include: [
                {
                    model: db.Account,
                    as: 'Account',
                    attributes: { exclude: ['password', 'forgot_password_token', 'id_role', 'createdAt', 'updatedAt'] },
                    include: [
                        {
                            model: db.inforUser,
                            as: 'inforUser',
                            attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                        },
                    ],
                },
            ],
        });
        const Post = JSON.parse(JSON.stringify(post));
        const comment = await db.Comment.findAll({
            where: { id_post: id_post },
            include: [
                {
                    model: db.Account,
                    as: 'Account',
                    attributes: { exclude: ['password', 'forgot_password_token', 'id_role', 'createdAt', 'updatedAt'] },
                    include: [
                        {
                            model: db.inforUser,
                            as: 'inforUser',
                            attributes: ['firstname', 'lastname', 'phoneNumber', 'avatar'],
                        },
                    ],
                },
            ],
            order: [['createdAt', 'DESC']],
        });
        Post.comments = JSON.parse(JSON.stringify(comment));
        return {
            success: true,
            result: Post,
        };
    }
    async comment(id_post, userID, content) {
        await db.Comment.create({
            id_post: id_post,
            id_account: userID,
            content: content,
        });
        return {
            success: true,
            message: 'comment successfully',
        };
    }
}
module.exports = new PostServices();
