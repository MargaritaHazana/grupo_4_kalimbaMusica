var express = require('express');
var router = express.Router();
var multer = require('multer');
var path = require('path');

//Requiriendo el controller
var navController = require('../controllers/navController');
// Requiriendo el middleware
const loginMiddleware = require('../middlewares/loginMiddleware');
const authAdmins = require('../middlewares/authAdmins');

router.get('/ofertas', navController.ofertas);
router.get('/ayuda', navController.ayuda)

module.exports = router