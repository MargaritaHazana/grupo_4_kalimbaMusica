const express = require('express');
const router = express.Router();
const {check, validationResult, body} = require('express-validator');

//Requiriendo el controller
const userController = require('../controllers/userController');
// Requiriendo el middleware
const loginMiddleware = require('../middlewares/loginMiddleware');


// Rutas login
router.get('/login',userController.loginView);
router.post('/login',[
    check('email').notEmpty().withMessage('El campo email no puede estar vacío').trim(),
    check('password').notEmpty().withMessage('El campo constraseña no puede estar vacío').isLength({min:8}).withMessage('La contraseña debe tener al menos 8 caracteres')
], userController.login);

// Rutas register
router.get('/register', userController.register);

// Ruta profile
router.get('/profile/:id', loginMiddleware, userController.profile);

// Rutas logout
router.get('/logout', userController.logoutView);
router.post('/logout', userController.logout);


module.exports = router;
