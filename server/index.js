require('dotenv').config()
require('module-alias/register')
const express = require('express')
const sequelize = require('./database')
const cors = require('cors')
const router = require('./routes')
const errorHandler = require('./middleware/error.middleware')
const path = require('path')

const PORT = process.env.SERVER_PORT || 3000

const app = express()
app.use(cors())
app.use(express.json())
app.use('/api', router)

if (process.env.NODE_ENV === 'production') {
    app.use('/', express.static(path.resolve(process.cwd(), 'dist')))
    app.get('*', (_req, res) => {
        res.sendFile(path.resolve(process.cwd(), 'dist', 'index.html'))
    })
}

app.use(errorHandler)

const start = async () => {
    try {
        await sequelize.authenticate()
        await sequelize.sync()
        app.listen(PORT, () => console.log('\x1b[32m', 'Express server listening on port ' + PORT))
    } catch (e) { console.log('\x1b[31m', e) }
}

start()