const Router = require('express')
const router = new Router()
const userController = require('@@/controllers/userController')
const authMiddleware = require('@@/middleware/auth.middleware')

router.post('/', userController.login)
router.get('/', authMiddleware, userController.authCheck)
router.put('/', authMiddleware, userController.updateProfile)

module.exports = router