const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const { accessTokenValidator, refreshTokenValidator } = require('../middlewares/user.middlewares.js');
const router = Router();

const PostController = require('../controllers/post.controllers.js');

router.post('/add', accessTokenValidator, wrapController(PostController.addPost));
router.delete('/delete/:id_post', accessTokenValidator, wrapController(PostController.deletePost));
router.get('/:id_post', accessTokenValidator, wrapController(PostController.getPostDetail));
router.get('/', accessTokenValidator, wrapController(PostController.getPosts));
module.exports = router;
