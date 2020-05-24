var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', { view: 'index' });
});

router.get('/productDetail', function(req, res) {
  res.render('productDetail', { view: 'detail' });
});

router.get('/productCart', function(req, res) {
  res.render('productCart', { view: 'carrito' });
});

router.get('/productAdd', function(req, res) {
  res.render('productAdd', { view: 'forms' });
});

router.get('/register', function(req, res) {
  res.render('register', { view: 'forms' });
});

module.exports = router;
