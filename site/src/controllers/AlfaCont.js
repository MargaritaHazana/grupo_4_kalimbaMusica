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
    data.map(function(producto){
        if(producto.id == id){
            let position = data.indexOf(producto)
            data.splice(position,1)
        }
    })
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
        fs.writeFileSync(rutaProductosJson, JSON.stringify(dataProductos));
        res.redirect('/list')
    },

    addingProduct : function(req, res){
        let productoNuevo = {
            id: dataProductos.length +1,
            name: req.body.name,
            type: req.body.type,
            brand: req.body.brand,
            category: req.body.category,
            price: req.body.price,
            image: req.files[0].filename,
            discount: req.body.discount,
            size: req.body.size,
            description: req.body.description,
            stock: req.body.stock

        }

        dataProductos.push(productoNuevo);

        fs.writeFileSync(rutaProductosJson, JSON.stringify(dataProductos));

        res.redirect('/products')
    },

    productEdit: function(req, res){
        
        let idProducto = req.params.id;

        let productoAEditar = idMatcher(idProducto,dataProductos)

        res.render('productEdit', { view: 'forms', productoAEditar})
    },

    editingProduct: function(req, res){
        
        let idProducto = req.params.id;

        let productoEncontrado = dataProductos.find(function(producto){
            idProducto == producto.id
        })
        productoEncontrado = {
            id: req.params.id,
            name: req.body.name,
            type: req.body.type,
            brand: req.body.brand,
            category: req.body.category,
            price: req.body.price,
            image:  req.files[0].filename,
            discount: req.body.discount,
            size: req.body.size,
            description: req.body.description,
            stock: req.body.stock
        };
        dataProductos.map(function(producto){
            if(producto.id == idProducto){
                let posicionAEditar = dataProductos.indexOf(producto);
                dataProductos.splice(posicionAEditar, 1, productoEncontrado)
            }
        });
        
        fs.writeFileSync(rutaProductosJson, JSON.stringify(dataProductos));
        res.redirect('/list')
         res.send("hola")
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