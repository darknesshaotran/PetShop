const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class RatingServices {
    async addPost(title, thumbnail, content) {
        return;
    }
    async deletePost(id_post) {
        return;
    }
    async getPosts(id_post) {
        return;
    }
    async getPostDetails() {
        return;
    }
}
module.exports = new RatingServices();
