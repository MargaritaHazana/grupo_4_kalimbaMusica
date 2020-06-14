var express = require('express');
var router = express.Router();
var alfaCont = require('../controllers/AlfaCont')
var multer = require('multer')
var path = require('path')

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/images')
  },
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
  }
})
var upload = multer({ storage: storage })


// GET product edit
router.get('/product/:id/edit', alfaCont.productEdit);
// PUT product edit
router.post('/product/:id',upload.any(), alfaCont.editingProduct);


//DELETE
router.post('/product/delete/:id', alfaCont.delete);


// GET product list
router.get('/list', alfaCont.list)


// GET product detail
router.get('/productDetail/:id', alfaCont.productDetail);


// GET product cart
router.get('/productCart', alfaCont.productCart);


//  GET product add
router.get('/productAdd', alfaCont.productAdd);
// POST product add
router.post('/products',upload.any(), alfaCont.addingProduct);



// GET register
router.get('/register', alfaCont.register);


// GET login
router.get('/login',alfaCont.login)


// GET home page / index
router.get('/', alfaCont.index);




module.exports = router;
