var express = require('express');
var router = express.Router();
const {check, validationResult, body} = require('express-validator');
var multer = require('multer');
var path = require('path');

//Requiriendo el controller
var productController = require('../controllers/productController');
// Requiriendo el middleware
const loginMiddleware = require('../middlewares/loginMiddleware');
const authAdmins = require('../middlewares/authAdmins');


//Métodos para guardar imagenes
var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/images')
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
  }
})
var upload = multer({ storage: storage })


// GET home page / index
router.get('/', productController.index);

// GET product list
router.get('/products', productController.list)

// GET product detail
router.get('/productDetail/:id', productController.productDetail);

// GET product cart
router.get('/productCart', productController.productCart);
// POST agregar al carrito
router.post('/product/addToCart/:id', productController.addToCart);
// POST eliminar del carrito
router.post('/product/deleteCart/:id', productController.deleteCart);

//  GET product add
router.get('/product/create', authAdmins, productController.productAdd);
// POST product add
router.post('/product/add', upload.any(), productController.addingProduct);


// GET product edit
router.get('/product/:id/edit', authAdmins, productController.productEdit);
// PUT product edit
router.put('/product/:id', upload.any(), productController.editingProduct);

//DELETE
router.delete('/product/delete/:id', authAdmins, productController.delete);

// POST buscador
router.post('/product/search', productController.search);

router.get('/products/categorias/:id', productController.category);

router.get('/products/marcas/:id', productController.brands)

// Get vista de compra
router.get('/products/buy',loginMiddleware, productController.buyView);
router.post('/products/buy',[
  check('direccion').notEmpty().withMessage('El campo dirección no puede estar vacío'),
  check('provincia').notEmpty().withMessage('El campo provincia no puede estar vacío'),
  check('ciudad').notEmpty().withMessage('El campo ciudad no puede estar vacío').trim(),
  check('cp').notEmpty().withMessage('El campo CP no puede estar vacío').isNumeric().withMessage('El campo CP debe ser numérico'),
  check('nombre').notEmpty().withMessage('El campo nombre no puede estar vacío'),
], productController.buy);


module.exports = router;
