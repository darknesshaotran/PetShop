const db = require('../models');
const { Op } = require('sequelize');
const ErrorsWithStatus = require('../constants/Error');
const HTTP_STATUS = require('../constants/httpStatus');

class CartServices {
    async addToCart(userID, id_product, quantity) {
        const cart = await db.Cart.findOne({ where: { id_account: userID } });

        const cart_item = await db.Cart_Item.findOne({
            where: {
                id_product: id_product,
                id_cart: cart.id,
            },
        });
        if (cart_item) {
            await db.Cart_Item.update(
                { quantity: Number(cart_item.quantity) + Number(quantity) },
                {
                    where: {
                        id_cart: cart.id,
                        id_product: id_product,
                    },
                },
            );
            return {
                success: true,
                message: 'update quantity successfully',
            };
        }
        await db.Cart_Item.create({
            id_product: id_product,
            id_cart: cart.id,
            quantity: quantity,
        });
        return {
            success: true,
            message: 'added to cart successfully',
        };
    }
    async getCartDetails(userID) {
        const cart = await db.Cart.findOne({
            where: { id_account: userID },
            attributes: {
                exclude: ['id', 'createdAt', 'updatedAt'],
            },
            include: [
                {
                    model: db.Product,
                    through: {
                        attributes: ['quantity', 'id'],
                        as: 'cart_item_infor',
                    },
                    as: 'Cart_Items',
                    attributes: ['id', 'amount', 'name', 'price'],
                    include: [{ model: db.Breed, as: 'Breed', attributes: ['id', 'name'] }],
                },
            ],
        });
        const Cart = JSON.parse(JSON.stringify(cart));
        for (let i = 0; i < Cart.Cart_Items.length; i++) {
            const image = await db.Image.findOne({
                where: { id_product: Cart.Cart_Items[i].id },
                attributes: ['image'],
            });
            Cart.Cart_Items[i].Image = image.image ? image.image : '';
        }
        return {
            success: true,
            Cart: Cart,
        };
    }
    async updateQuantityItem(quantity, id_cartItem) {
        if (quantity === 0) {
            await db.Cart_Item.destroy({
                where: {
                    id: id_cartItem,
                },
            });
            return {
                success: true,
                message: 'delete item already',
            };
        }
        await db.Cart_Item.update(
            { quantity: quantity },
            {
                where: {
                    id: id_cartItem,
                },
            },
        );
        return {
            success: true,
            message: 'update quantity successfully',
        };
    }
    async deleteQuantityItem(id_cartItem) {
        await db.Cart_Item.destroy({
            where: { id: id_cartItem },
        });
        return {
            success: true,
            message: 'delete shoes successfully',
        };
    }
}
module.exports = new CartServices();
