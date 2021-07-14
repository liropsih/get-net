const Router = require('express')
const router = new Router()
const serviceController = require('@@/controllers/serviceController')
const authMiddleware = require('@@/middleware/auth.middleware')

router.get('/additional', serviceController.getAdditional)
router.post('/additional', authMiddleware, serviceController.addAdditional)
router.delete('/additional', authMiddleware, serviceController.removeAdditional)
router.get('/tariff', serviceController.getTariffs)
router.put('/tariff', authMiddleware, serviceController.updateTariff)
router.get('/pay', authMiddleware, serviceController.getPays)
router.post('/pay', authMiddleware, serviceController.addPay)

module.exports = router