const path = require('path');
const fs = require("fs")
let rutaProductosJson = path.join(__dirname, '../../data/Products.json');
let productos = fs.readFileSync( rutaProductosJson, 'utf-8');
let dataProductos = JSON.parse(productos)
console.log(dataProductos)
AlfaCont = {
    // Renderiza la view del Index
    index: function(req,res){
        res.render('index', { view: 'index' })
    },

    // Renderiza la view del Detalle del Producto
    productDetail:function(req,res){
        res.render('productDetail', { view: 'detail' })
    },

    // Renderiza la view del Carro de los Productos
    productCart:function(req,res){
        res.render('productCart', { view: 'carrito' })
    },

    // Renderiza la view que permite agregar productos
    productAdd:function(req,res){
        res.render('productAdd', { view: 'forms' })
    },

    // Renderiza la view de Registracion
    register:function(req,res){
        res.render('register', { view: 'forms' })
    },

    // Renderiza la view de Inicio de Sesion
    login:function(req,res){
        res.render('',{})
    }
}
module.exports= AlfaCont