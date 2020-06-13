var express = require('express');
var router = express.Router();
var alfaCont = require('../controllers/AlfaCont')



// GET home page / index
router.get('/', alfaCont.index);


// GET product detail
router.get('/productDetail', alfaCont.productDetail);


// GET product cart
router.get('/productCart', alfaCont.productCart);


//  GET product add
router.get('/productAdd', alfaCont.productAdd);


// GET register
router.get('/register', alfaCont.register);

// GET login
router.get('/login',alfaCont.login)




module.exports = router;
