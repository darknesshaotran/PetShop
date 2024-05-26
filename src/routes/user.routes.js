const { Router } = require('express');
const { wrapController } = require('../utils/handle');
const passport = require('../utils/passport.js');
const {
    registerValidator,
    loginValidator,
    accessTokenValidator,
    refreshTokenValidator,
    forgotPasswordValidator,
    VerifyForgotPasswordTokenValidator,
    ResetPasswordValidator,
    UserExistValidator,
    ChangePasswordValidator,
    UpdateProfileValidator,
} = require('../middlewares/user.middlewares.js');
const { FormdataValidator } = require('../middlewares/Formdata.middlewares');
const router = Router();

const userControllers = require('../controllers/user.controllers');

router.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'], session: false }));
router.get(
    '/auth/google/callback',
    (req, res, next) => {
        passport.authenticate('google', (err, user) => {
            req.user = user;
            next();
        })(req, res, next);
    },
    wrapController((req, res, next) => {
        res.redirect(`${process.env.CLIENT_URL}/login-success/${req.user.id}`);
    }),
);
router.post(
    '/login-success/:userID',
    UserExistValidator,
    wrapController((req, res, next) => {
        req.user = { id: req.params, id_role: 2 };
        next();
    }),
    wrapController(userControllers.login),
);
router.post('/register', registerValidator, wrapController(userControllers.register));
router.post('/login', loginValidator, wrapController(userControllers.login));
router.post('/logout', accessTokenValidator, refreshTokenValidator, wrapController(userControllers.logout));
router.post('/refreshToken', refreshTokenValidator, wrapController(userControllers.refreshToken));
router.post('/forgot-password', forgotPasswordValidator, wrapController(userControllers.forgotPassword));
router.post(
    '/verify-forgot-password',
    VerifyForgotPasswordTokenValidator,
    wrapController(userControllers.verifyForgotPassword),
);
router.post('/reset-password', ResetPasswordValidator, wrapController(userControllers.resetPassword));
router.get('/profile/me', accessTokenValidator, wrapController(userControllers.getMyprofile));
router.get('/profile/:userID', UserExistValidator, wrapController(userControllers.getProfile));
router.post(
    '/change-password',
    accessTokenValidator,
    ChangePasswordValidator,
    wrapController(userControllers.changePassword),
);

router.put(
    '/updateProfile',
    accessTokenValidator,
    UpdateProfileValidator,
    wrapController(userControllers.updateProfile),
); // ko update avatar trong này
router.put('/update-avatar', accessTokenValidator, FormdataValidator, wrapController(userControllers.changeAvatar));
module.exports = router;
