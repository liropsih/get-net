const { User, Additional, Tariff, Pay } = require('@@/models')
const ApiError = require('@@/error/api.error')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const generateJwt = (id, name, roles) => {
    return jwt.sign(
        { id, name, roles },
        process.env.SECRET_KEY,
        { expiresIn: '24h' }
    )
}

const changePassword = async (user, oldPassword, newPassword, next) => {
    try {
        const comparePassword = await bcrypt.compare(oldPassword, user.password)
        if (!comparePassword) {
            return next(ApiError.badRequest('Неверный пароль'))
        }
        const hashPassword = await bcrypt.hash(newPassword, 5)
        await user.update({ password: hashPassword })
        return
    } catch (e) {
        throw e
    }
}

class UserController {
    async login(req, res, next) {
        try {
            const { login, password } = req.body
            const user = await User.findOne({
                where: { login }
            })
            if (!user) {
                return next(ApiError.badRequest('Пользователя с таким логином не существует'))
            }
            const comparePassword = await bcrypt.compare(password, user.password)
            if (!comparePassword) {
                return next(ApiError.badRequest('Неверный пароль'))
            }
            const token = generateJwt(user.id)
            return res.json(token)
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async authCheck(req, res, next) {
        try {
            const { id } = req.user
            const user = await User.findByPk(id, {
                attributes: {
                    exclude: ['password']
                },
                include: [Additional, Tariff]
            })
            const token = generateJwt(user.id)
            return res.json({ token, user })
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
    async updateProfile(req, res, next) {
        try {
            const { id } = req.user
            const { name, email, phone, oldPassword, newPassword } = req.body
            const user = await User.findByPk(id)
            if (oldPassword && newPassword) {
                const comparePassword = await bcrypt.compare(oldPassword, user.password)
                if (!comparePassword) {
                    return next(ApiError.badRequest('Неверный пароль'))
                }
                const hashPassword = await bcrypt.hash(newPassword, 5)
                await user.update({ password: hashPassword })
            }
            await user.update({ name, email, phone },)
            return res.json({ message: 'Данные профиля обновлены' })
        } catch (e) {
            next(ApiError.internal(e.message))
        }
    }
}

module.exports = new UserController()