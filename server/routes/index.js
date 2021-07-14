const Router = require('express')
const router = new Router()
const userRouter = require('./user.router')
const serviceRouter = require('./service.router')

router.use('/user', userRouter)
router.use('/service', serviceRouter)

module.exports = router