var express = require('express');
var router = express.Router();
var multer = require('multer');
var path = require('path');

//Requiriendo el controller
var navController = require('../controllers/navController');
// Requiriendo el middleware
const loginMiddleware = require('../middlewares/loginMiddleware');
const authAdmins = require('../middlewares/authAdmins');

var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'public/images')
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
  })
  var upload = multer({ storage: storage })
  

router.get('/ofertas', navController.ofertas);

router.get('/ayuda', navController.ayuda);

router.get('/admin',authAdmins, navController.admin);

router.get('/tutoriales', navController.tutoriales);

router.get('/guias', navController.guias);

// Eligiendo guia a editar
router.get('/elegirGuia', navController.elegirGuia)
// Vista para editar la guia
router.get('/guiasEdit/:id', navController.guiasEdit);
// Editando guia
router.put('/guiasEdit/:id',upload.any(), navController.guiasEdited);

// Creando guia
router.get('/guiasAdd', navController.guiasAdd);
router.post('/guiasAdd',upload.any(), navController.addingGuia);

// Eliminando guia
router.get('/guiaDelete', navController.deleteGuia);
router.delete('/guiaDelete/:id', navController.deletingGuia)

module.exports = router