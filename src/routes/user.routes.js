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
const userServices = require('../services/user.services.js');

router.get('/auth/google', passport.authenticate('google', { scope: ['profile', 'email'], session: false }));
router.get(
    '/auth/google/callback',
    (req, res, next) => {
        passport.authenticate('google', (err, profile) => {
            const Profile = JSON.parse(JSON.stringify(profile));
            req.user = Profile;
            if (!userServices.isEmailExist(Profile.emails[0].value)) {
                userServices.register({
                    email: Profile.emails[0].value,
                    password: hashPassword(Math.random().toString),
                    lastname: Profile.name.familyName,
                    firstname: Profile.name.givenName,
                    phoneNumber: null,
                });
            }

            // TO DO CREATE ACCOUNT AND ASSIGN REQ.USER HERE
            next();
        })(req, res, next);
    },
    (req, res) => {
        res.redirect('fb.com');
    },
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
