const { Sequelize } = require('sequelize');
const sequelize = new Sequelize('petShop', 'root', '', {
    host: '127.0.0.1',
    dialect: 'mysql',
    logging: false,
});
const conenctionDatabase = async () => {
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
};

module.exports = conenctionDatabase;
