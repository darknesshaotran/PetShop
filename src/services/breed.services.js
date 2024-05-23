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
    async getBreedDetail(id_breed) {
        const breeds = await db.Breed.findOne({
            where: { id: id_breed },
        });
        return {
            success: true,
            breedDetail: breeds,
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
    async updateBreed(data, id_breed) {
        console.log(data);
        await db.Breed.update(
            {
                ...data,
            },
            {
                where: { id: id_breed },
            },
        );
        return {
            success: true,
            message: 'update breed successfully',
        };
    }
    async updateImageBreed(image, id_breed) {
        await db.Breed.update(
            {
                image: image.url,
            },
            {
                where: { id: id_breed },
            },
        );
        return {
            success: true,
            message: "update breed's image successfully",
        };
    }
}
module.exports = new BreedServices();
