const sequelize = require('@@/database')
const { DataTypes } = require('sequelize')

const User = sequelize.define(
    'user', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    login: { type: DataTypes.STRING, unique: true, allowNull: false },
    password: { type: DataTypes.STRING, allowNull: false },
    name: { type: DataTypes.STRING, allowNull: false },
    email: { type: DataTypes.STRING, unique: true, allowNull: false },
    phone: { type: DataTypes.STRING },
    balance: { type: DataTypes.STRING }
})

const Additional = sequelize.define(
    'additional', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING, allowNull: false },
    description: { type: DataTypes.STRING, allowNull: false },
    price: { type: DataTypes.STRING, allowNull: false }
})

const Tariff = sequelize.define(
    'tariff', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    title: { type: DataTypes.STRING, allowNull: false },
    speed: { type: DataTypes.STRING, allowNull: false },
    price: { type: DataTypes.STRING, allowNull: false }
})

const Pay = sequelize.define(
    'pay', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
    value: { type: DataTypes.STRING }
})

const UserAdditional = sequelize.define(
    'user_additional', {
    id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true }
})

Tariff.hasMany(User)
User.belongsTo(Tariff)

User.belongsToMany(Additional, { through: UserAdditional })
Additional.belongsToMany(User, { through: UserAdditional })

User.hasMany(Pay, { as: 'user_pay' })
Pay.belongsTo(User)

module.exports = {
    User,
    Additional,
    Tariff,
    Pay,
    UserAdditional
}