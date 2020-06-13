var express = require('express');
var router = express.Router();
var alfaCont = require('../controllers/AlfaCont')



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


// GET register
router.get('/register', alfaCont.register);


// GET login
router.get('/login',alfaCont.login)


// GET home page / index
router.get('/', alfaCont.index);




module.exports = router;
