const postServices = require('../services/post.services');

class PostController {
    async addPost(req, res, next) {
        const result = await postServices.addPost();
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
}
module.exports = new PostController();
