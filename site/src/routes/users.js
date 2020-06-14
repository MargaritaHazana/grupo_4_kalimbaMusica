var express = require('express');
var router = express.Router();

//Requiriendo el controller
var userController = require('../controllers/userController');


// GET login
router.get('/login',userController.login);

// GET register
router.get('/register', userController.register);

module.exports = router;
