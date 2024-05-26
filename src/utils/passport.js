const passport = require('passport');
const GoogleStrategy = require('passport-google-oauth20').Strategy;
const dotenv = require('dotenv');
dotenv.config();
passport.use(
    new GoogleStrategy(
        {
            clientID: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET,
            callbackURL: '/api/user/auth/google/callback',
        },
        function (accessToken, refreshToken, profile, cb) {
            return cb(null, profile);
        },
    ),
);
module.exports = passport;
