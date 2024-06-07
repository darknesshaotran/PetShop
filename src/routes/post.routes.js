const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator, refreshTokenValidator, isAdminValidator } = require('../middlewares/user.middlewares.js');
const router = Router();

const PostController = require('../controllers/post.controllers.js');

router.post('/add', accessTokenValidator, isAdminValidator, wrapController(PostController.addPost));
router.delete('/delete/:id_post', accessTokenValidator, isAdminValidator, wrapController(PostController.deletePost));
router.get('/:id_post', wrapController(PostController.getPostDetail));
router.get('/', wrapController(PostController.getPosts));
module.exports = router;
