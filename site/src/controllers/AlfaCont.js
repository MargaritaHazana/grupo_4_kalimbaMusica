const path = require('path');
const fs = require("fs")
let rutaProductosJson = path.join(__dirname, '../../data/Products.json');
let productos = fs.readFileSync( rutaProductosJson, 'utf-8');
let dataProductos = JSON.parse(productos)

function idMatcher(id,data){
    for (let i = 0; i < data.length; i++) {
        if (id==data[i].id){
            return data[i]
        }
    }
}
function productDestroyer(id,data){
    for (let i = 0; i < data.length; i++) {
        if(id === data[i].id){
            data.splice(id,1)
        }
    }
}






AlfaCont = {
    // Renderiza la view del Index
    index: function(req,res){
        res.render('index', { view: 'index' })
    },

    // Renderiza la lista de los productos
    list: function(req,res){
        res.render('list', { view: 'list', dataProductos})
    },

    // Renderiza la view del Detalle del Producto
    productDetail:function(req,res){
        var idProducto = req.params.id
        var producto = idMatcher(idProducto,dataProductos)
        res.render('productDetail', { view: 'detail' , producto })
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
    },

    // Borra un producto
    delete: function(req,res){
        var idProducto = req.params.id
        productDestroyer(idProducto,dataProductos)
        res.redirect('/list')

    }
}
module.exports= AlfaCont