const express = require('express');
const router = express.Router();
const {check, validationResult, body} = require('express-validator');
var multer = require('multer');
var path = require('path')

//Requiriendo el controller
const userController = require('../controllers/userController');
// Requiriendo el middleware
const loginMiddleware = require('../middlewares/loginMiddleware');
const authAdmins = require('../middlewares/authAdmins');

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



// Rutas login
router.get('/login', userController.loginView);
router.post('/login',[
    check('email').notEmpty().withMessage('El campo email no puede estar vacío').trim(),
    check('password').notEmpty().withMessage('El campo constraseña no puede estar vacío').isLength({min:8}).withMessage('La contraseña debe tener al menos 8 caracteres')
], userController.login);

// Rutas register
router.get('/register', userController.registerView);
router.post('/register', upload.any(), [
    check('first_name').notEmpty().withMessage('El campo nombre no puede estar vacío'),
    check('last_name').notEmpty().withMessage('El campo apellido no puede estar vacío'),
    check('email').notEmpty().withMessage('El campo email no puede estar vacío').trim(),
    check('tel').notEmpty().withMessage('El campo telefono no puede estar vacío').isNumeric().withMessage('El campo telefono debe ser numérico'),
    check('birth_date').notEmpty().withMessage('El campo fecha de nacimiento no puede estar vacío'),
    check('username').notEmpty().withMessage('El campo nombre de usuario no puede estar vacío'),
    check('password').notEmpty().withMessage('El campo constraseña no puede estar vacío').isLength({min:8}).withMessage('La contraseña debe tener al menos 8 caracteres'),
   
], userController.register);

// Ruta profile
router.get('/profile/:id', loginMiddleware, userController.profile);

// Ruta editar perfil
router.get('/edit/:id', loginMiddleware, userController.editView);
router.put('/edit/:id', loginMiddleware, upload.any(), userController.edit)
router.get('/edit/:id/password', loginMiddleware, userController.passwordChangeView);
router.put('/edit/:id/password', loginMiddleware, userController.passwordChange);

// Rutas logout
router.get('/logout', userController.logoutView);
router.post('/logout', userController.logout);

// RUTA DE PRUEBA ADMINS
router.get('/userList', authAdmins, userController.userList)
module.exports = router;
