const express = require('express');
const router = express.Router();
const {check, validationResult, body} = require('express-validator');
var multer = require('multer');
var path = require('path')

//Métodos para guardar imagenes
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'public/avatars')
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
  })
  var upload = multer({ storage: storage })

//Requiriendo el controller
const userController = require('../controllers/userController');
// Requiriendo el middleware
const loginMiddleware = require('../middlewares/loginMiddleware');


// Rutas login
router.get('/login', userController.loginView);
router.post('/login',[
    check('email').notEmpty().withMessage('El campo email no puede estar vacío').trim(),
    check('password').notEmpty().withMessage('El campo constraseña no puede estar vacío').isLength({min:8}).withMessage('La contraseña debe tener al menos 8 caracteres')
], userController.login);

// Rutas register
router.get('/register', userController.registerView);
router.post('/register', upload.any(), [
    check('name').notEmpty().withMessage('El campo nombre no puede estar vacío'),
    check('lastName').notEmpty().withMessage('El campo apellido no puede estar vacío'),
    check('email').notEmpty().withMessage('El campo email no puede estar vacío').trim(),
    check('phone').notEmpty().withMessage('El campo telefono no puede estar vacío').isNumeric().withMessage('El campo telefono debe ser numérico'),
    check('date').notEmpty().withMessage('El campo fecha de nacimiento no puede estar vacío'),
    check('username').notEmpty().withMessage('El campo nombre de usuario no puede estar vacío'),
    check('password').notEmpty().withMessage('El campo constraseña no puede estar vacío').isLength({min:8}).withMessage('La contraseña debe tener al menos 8 caracteres'),
   
], userController.register);

// Ruta profile
router.get('/profile/:id', loginMiddleware, userController.profile);

// Rutas logout
router.get('/logout', userController.logoutView);
router.post('/logout', userController.logout);


module.exports = router;
