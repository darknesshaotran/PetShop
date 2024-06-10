const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator, refreshTokenValidator, isAdminValidator } = require('../middlewares/user.middlewares.js');
const router = Router();

const PostController = require('../controllers/post.controllers.js');

//FORUM
router.post('/forum/add', accessTokenValidator, wrapController(PostController.createForum));
router.post('/forum/comment', accessTokenValidator, wrapController(PostController.comment));
router.get('/forum/:id_post', wrapController(PostController.getForumDetail));
router.get('/forum', wrapController(PostController.getForum));
//BLOG
router.post('/add', accessTokenValidator, isAdminValidator, wrapController(PostController.addPost));
router.delete('/delete/:id_post', accessTokenValidator, isAdminValidator, wrapController(PostController.deletePost));
router.get('/:id_post', wrapController(PostController.getPostDetail));
router.get('/', wrapController(PostController.getPosts));

module.exports = router;
