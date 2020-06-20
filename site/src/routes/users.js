var express = require('express');
var router = express.Router();

// Requiriendo el middleware
var authMiddleware = require('../middlewares/authMiddleware')

//Requiriendo el controller
var userController = require('../controllers/userController');


// GET login
router.get('/login',userController.login);

// GET register
router.get('/register', userController.register);

// GET profile
router.get('/profile/:id', authMiddleware, function(req,res){res.send("perfil?")})

module.exports = router;
