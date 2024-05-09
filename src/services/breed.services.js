const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');

class BreedServices {
    async getBreedList() {
        const breeds = await db.Breed.findAll({
            attribute: { exclude: ['createdAt', 'updatedAt'] },
        });
        return {
            success: true,
            breeds: breeds,
        };
    }
    async deleteBreed(id_breed) {
        await db.Breed.destroy({
            where: { id: id_breed },
        });
        return {
            success: true,
            message: 'delete breed successfully',
        };
    }
    async addBreed(images, name, description) {
        await db.Breed.create({
            name: name,
            description: description,
            image: images[0].url,
        });
        return {
            success: true,
            message: 'add breed successfully',
        };
    }
}
module.exports = new BreedServices();
