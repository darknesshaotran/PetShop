const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;
const userServices = require('../services/user.services');
const hashPassword = require('./crypto');
const dotenv = require('dotenv');
const sendEmail = require('./Email');
dotenv.config();
passport.use(
    new GoogleStrategy(
        {
            clientID: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET,
            callbackURL: 'https://2hm-store.click/api/user/auth/google/callback',
        },
        async function (accessToken, refreshToken, profile, cb) {
            const isExistEmail = await userServices.isEmailExist(profile.emails[0].value);
            if (!isExistEmail) {
                const originPass = Math.random().toString();
                const password = hashPassword(originPass);
                const result = await userServices.register({
                    email: profile.emails[0].value,
                    password: password,
                    lastname: profile.name.familyName,
                    firstname: profile.name.givenName,
                    phoneNumber: null,
                });
                await sendEmail(
                    `<h1 style="color:red">😍 login with google successfully, your password is ${originPass} 😍</h1>`,
                    'PBL6_message',
                    profile.emails[0].value,
                );
            }
            const user = await userServices.findUserLogin(profile.emails[0].value, '', true);

            return cb(null, user);
        },
    ),
);
module.exports = passport;
