const { User, Additional, Tariff } = require('../models')

async function createTableRecords() {
    try {
        await Tariff.findOrCreate({ where: { title: 'M', speed: '50', price: '500' } })
        await Tariff.findOrCreate({ where: { title: 'L', speed: '100', price: '1000' } })
        await Tariff.findOrCreate({ where: { title: 'XL', speed: '500', price: '1500' } })

        await Additional.findOrCreate({
            where: {
                title: 'ТВ',
                description: 'IP телевидение. 200 каналов.',
                price: '200'
            }
        })
        await Additional.findOrCreate({
            where: {
                title: 'Аренда роутера',
                description: 'Аренда WiFi роутера с большой площадью покрытия.',
                price: '100'
            }
        })
        await Additional.findOrCreate({
            where: {
                title: 'Выделенный IP',
                description: 'Выделенный IP адресс для вашей сети.',
                price: '100'
            }
        })

        let user = await User.findOrCreate({
            where: {
                email: 'aa@aa.aa',
                password: '$2b$05$EjKH9/mDP5RojK34aAXrMus6CWU/.FLu92WuO4.Nn489R6Bspvy3S', //123456
                name: 'Админ',
                phone: '+7 (999) 999-99-99',
                balance: '700'
            }
        })
        await user[0].setTariff('1')
        await user[0].createUser_pay({ value: '-1000' })
        await user[0].createUser_pay({ value: '1000' })
        await user[0].createUser_pay({ value: '-1000' })
        await user[0].createUser_pay({ value: '800' })
        await user[0].createUser_pay({ value: '200' })
        await user[0].createUser_pay({ value: '1200' })
    } catch (e) {
        throw e
    }
}

module.exports = createTableRecords