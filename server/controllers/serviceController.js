const { User, Additional, Tariff, Pay } = require('@@/models')
const ApiError = require('@@/error/api.error')

class ServiceController {
    async getAdditional(req, res, next) {
        try {
            const data = await Additional.findAll()
            return res.json(data)
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async addAdditional(req, res, next) {
        try {
            const userId = req.user.id
            const { id } = req.body
            const user = await User.findByPk(userId)
            await user.addAdditional(id)
            return res.json({ message: 'Услуга подключена' })
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async removeAdditional(req, res, next) {
        try {
            const userId = req.user.id
            const { id } = req.body
            const user = await User.findByPk(userId)
            await user.removeAdditional(id)
            return res.json({ message: 'Услуга отключена' })
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async getTariffs(req, res, next) {
        try {
            const data = await Tariff.findAll()
            return res.json(data)
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async updateTariff(req, res, next) {
        try {
            const userId = req.user.id
            const { id } = req.body
            const user = await User.findByPk(userId)
            await user.setTariff(id)
            return res.json({ message: 'Тариф изменён успешно' })
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async getPays(req, res, next) {
        try {
            const userId = req.user.id
            let { limit, page } = req.query
            page = page || 1
            limit = limit || 10
            let offset = page * limit - limit
            const data = await Pay.findAndCountAll({
                where: { userId }, limit, offset, order: [
                    ['createdAt', 'DESC']
                ],
            })
            return res.json(data)
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async addPay(req, res, next) {
        try {
            const userId = req.user.id
            const { value } = req.body
            const user = await User.findByPk(userId)
            await user.createUser_pay({ value })
            await user.update({ balance: +user.balance + +value })
            return res.json({ message: 'Платёж совершён успешно' })
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
}

module.exports = new ServiceController()