const path = require('path');
const fs = require("fs")

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

// Variable que pasa los productos destacados
let destacados = [dataProductos[1],dataProductos[2],dataProductos[3],dataProductos[4]];


productController = {
    // Renderiza la view del Index
    index: function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;

        res.render('index', { view: 'index', destacados, sessionUserID });
    },

    // Renderiza la lista de los productos
    list: function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        // Chequea si el user en session es admin
        let categoryUser = 0
        if (sessionUserID !== undefined) {
            dataUsers.find((user)=>user.id == sessionUserID);
            categoryUser = 1
        }
        res.render('list', {view: 'list', dataProductos, numberWithCommas, sessionUserID, categoryUser});
    },

    // Renderiza la view del Detalle del Producto
    productDetail:function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        // Chequea si el user en session es admin
        let categoryUser = 0
        if (sessionUserID !== undefined) {
            dataUsers.find((user)=>user.id == sessionUserID);
            categoryUser = 1
        }
        // Encontrando el producto
        var idProducto = req.params.id;
        var producto = dataProductos.find((product)=> idProducto == product.id);
        // Calculando el precio con descuento
        var precioViejo = "$" + numberWithCommas(Math.round(producto.price));
        var descuento = producto.price * (producto.discount / 100);
        var precioDescuento = Math.round(producto.price - descuento);
        var precioFinal = "$" + numberWithCommas(precioDescuento);
        
        res.render('productDetail', { view: 'detail' , producto, precioViejo, precioFinal, destacados, sessionUserID, categoryUser });
    },

    // Renderiza la view del Carro de los Productos
    productCart:function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('productCart', { view: 'carrito', destacados, sessionUserID });
    },

    // Renderiza la view que permite agregar productos
    productAdd:function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('productAdd', { view: 'forms', sessionUserID });
    },

    // Agrega el nuevo producto a la base de datos
    addingProduct : function(req, res, next){
       
        let productoNuevo = {
            id: dataProductos[dataProductos.length - 1].id + 1,
            name: req.body.name,
            type: req.body.type,
            brand: req.body.brand,
            category: req.body.category,
            price: req.body.price,
            image: req.files[0].filename,
            discount: req.body.discount,
            size: req.body.size,
            description: req.body.description,
            coloresDisponibles: req.body.coloresDisponibles,
            stock: req.body.stock
        }
        
        dataProductos.push(productoNuevo);

        fs.writeFileSync(rutaProductosJson, JSON.stringify(dataProductos));

        res.redirect('/products');
    },

    productEdit: function(req, res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        
        let idProducto = req.params.id;

        let productoAEditar = dataProductos.find((product)=> idProducto == product.id);
        // Esto es facilmente reemplazable una vez que podamos usar Sql
        var coloresDisponiblesGeneral = ["Blanco","Negro","Azul","Rojo","Marron"]
        
        res.render('productEdit', {view: 'forms', productoAEditar, coloresDisponiblesGeneral, sessionUserID});

    },

    editingProduct: function(req, res){
        
        let idProducto = req.params.id;

        let productoEncontrado = dataProductos.find((producto)=>{
            idProducto == producto.id
        });
        if(req.files[0] == undefined){
            
            productoEncontrado = {
                id: req.params.id,
                name: req.body.name,
                type: req.body.type,
                brand: req.body.brand,
                category: req.body.category,
                price: req.body.price,
                image:  "Bajo.jpg",
                discount: req.body.discount,
                size: req.body.size,
                description: req.body.description,
                stock: req.body.stock,
                coloresDisponibles: req.body.coloresDisponibles,
            };}
        else{
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
            stock: req.body.stock,
            coloresDisponibles: req.body.coloresDisponibles,
        };
        }
        
        
        dataProductos.map(function(producto){
            if(producto.id == idProducto){
                let posicionAEditar = dataProductos.indexOf(producto);
                dataProductos.splice(posicionAEditar, 1, productoEncontrado);
            }
        });
        
        fs.writeFileSync(rutaProductosJson, JSON.stringify(dataProductos));
        res.redirect('/products');
    },
    // Borra un producto
    delete: function(req,res){
       
        var idProducto = req.params.id;

        function productDestroyer(id,data){
            data.map(function(producto){
                if(producto.id == id){
                    let position = data.indexOf(producto);
                    data.splice(position,1);
                }
            })
        }

        productDestroyer(idProducto,dataProductos)
        fs.writeFileSync(rutaProductosJson, JSON.stringify(dataProductos));
        res.redirect('/products');
    }
}

module.exports= productController;



