const path = require('path');
const fs = require("fs");

const DB = require('../database/models');
const OP = DB.Sequelize.Op;


//Pasando el JSON a JS - DB de productos
const rutaProductosJson = path.join(__dirname, '../../data/Products.json');
const productos = fs.readFileSync( rutaProductosJson, 'utf-8');
const dataProductos = JSON.parse(productos);

//Pasando el JSON a JS - DB de usuarios
const rutaUsersJson = path.join(__dirname, '../../data/Users.json');
const users = fs.readFileSync(rutaUsersJson, 'utf-8');
const dataUsers = JSON.parse(users);



var numberWithCommas = x => {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1.$2");
    return x;
}

navController = {
    ofertas: async function(req, res, next){
        let sessionUserID = req.session.userID;
        let ofertas = await DB.Product.findAll()

        let categorias = await DB.Category.findAll()
        let marcas = await DB.Brand.findAll()
    
        res.render('ofertas', {view: 'ofertas', sessionUserID, ofertas, numberWithCommas, categorias, marcas})
    },
    ayuda: async function(req, res,next){
        let sessionUserID = req.session.userID;

        let categorias = await DB.Category.findAll()
        let marcas = await DB.Brand.findAll()

        res.render('help', {view:'ayuda', sessionUserID, categorias, marcas})
    }
}

module.exports = navController