const postServices = require('../services/post.services');

class PostController {
    async addPost(req, res, next) {
        const { title, thumbnail, content } = req.body;
        const result = await postServices.addPost(title, thumbnail, content);
        res.json(result);
    }
    async deletePost(req, res, next) {
        const { id_post } = req.params;
        const result = await postServices.deletePost(id_post);
        res.json(result);
    }
    async getPostDetail(req, res, next) {
        const { id_post } = req.params;
        const result = await postServices.getPostDetails(id_post);
        res.json(result);
    }
    async getPosts(req, res, next) {
        const result = await postServices.getPosts();
        res.json(result);
    }
    // FORUM
    async createForum(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { title, content, thumbnail } = req.body;
        const result = await postServices.createForum(userID, title, content, thumbnail);
        res.json(result);
    }
    async getForum(req, res, next) {
        const result = await postServices.getForum();
        res.json(result);
    }
    async getForumDetail(req, res, next) {
        const { id_post } = req.params;
        const result = await postServices.getForumDetail(id_post);
        res.json(result);
    }
    async comment(req, res, next) {
        const { decoded_authorization } = req;
        const userID = decoded_authorization.userID;
        const { id_post, content } = req.body;
        const result = await postServices.comment(id_post, userID, content);
        res.json(result);
    }
}
module.exports = new PostController();
