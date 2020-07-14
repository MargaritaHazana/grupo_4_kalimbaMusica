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

// Array de IDs de productos en el carrito 
let cartProds = [];


productController = {
    // Renderiza la view del Index
    index: async function(req,res){
        try {
            let sessionUserID = req.session.userID;
            let destacados = await DB.Product.findAll({
                limit:4, include: ['images']})
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('index', { view: 'index', destacados, sessionUserID, categorias, marcas });
        } catch (error) {
            res.send(error)
        }
        // ID del usuario en sesion
        
    },

    // Renderiza la lista de los productos
    list: async function(req,res){
        try {
            // ID del usuario en sesion
            let sessionUserID = req.session.userID;
            // Chequea si el user en session es admin
            let categoryUser = 0
            if (sessionUserID !== undefined) {
                dataUsers.find((user)=>user.id == sessionUserID);
                categoryUser = 1
            }
            let productos = await DB.Product.findAll()
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            
            res.render('list', {view: 'list', productos, numberWithCommas, sessionUserID, categoryUser, categorias, marcas});
        } catch (error) {
            res.send(error)
        }
        
    },

    // Renderiza la view del Detalle del Producto
    productDetail: async function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        // Chequea si el user en session es admin
        let categoryUser = 0
        if (sessionUserID !== undefined) {
            dataUsers.find((user)=>user.id == sessionUserID);
            categoryUser = 1
        }
        // Productos destacados
        let destacados = await DB.Product.findAll({limit: 4});
        
 
        // Encontrando el producto
        try {
            var idProducto = req.params.id;
            // Encontrando el producto
            let producto = await DB.Product.findByPk(idProducto);
            // Encontrando las fotos
            let buscandoImage = await DB.Image.findAll({where: {productsId: idProducto}});
            let image = buscandoImage[0].dataValues.name;
            // Calculando el precio con descuento
            var precioViejo = "$" + numberWithCommas(Math.round(producto.price));
            var descuento = producto.price * (producto.discount / 100);
            var precioDescuento = Math.round(producto.price - descuento);
            var precioFinal = "$" + numberWithCommas(precioDescuento);
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('productDetail', { view: 'detail' , producto, precioViejo, precioFinal, destacados, sessionUserID, categoryUser, marcas, categorias, image });
        } catch (error) {
            res.send(error)
        }
    },

    // Renderiza la view del Carro de los Productos
    productCart:async function(req, res){
        // Productos destacados
        let destacados = await DB.Product.findAll({limit: 4});
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        // Array de productos e imagenes en el carrito
        let productos = [];
        let images = [];
        // Si no hay un usuario logueado
        if (sessionUserID == undefined) {
            // Se fija si hay productos en el carrito de la session
            if (cartProds.length == 0){
                // Si no hay productos
                productos = [];
                images = [];
                total = 0
                res.render('productCart', { view: 'carrito', destacados, sessionUserID, productos, images, numberWithCommas, total });
            // Si hay productos     
            } else {
                cartProds.forEach(async productId=>{
                    try {
                        // Busca la info de cada producto y lo mete en el array de productos
                        let productInfo = await DB.Product.findByPk(productId, {include: ['colors','brands','subcategories','categories','types']});
                        productInfo = productInfo.dataValues
                        productos.push(productInfo);
                        // Busca la foto de cada producto y lo mete en el array de images
                        let productImage = await DB.Image.findAll({where: {productsId: productId}});
                        productImage = productImage[0].dataValues
                        images.push(productImage);
                        // Calcula el total a pagar
                        let total = 0
                        for (let i = 0; i < productos.length; i++) {
                            total = total + productos[i].price
                        }
    
                        res.render('productCart', { view: 'carrito', destacados, sessionUserID, productos, images, numberWithCommas, total });
                    } catch (error) {
                        res.send(error)
                    }
                })
            }
        // Si hay un usuario logueado
        } else {
            try {
                // Busca los IDs de los productos en el carrito de la DB
                let productId = await DB.Product_user.findAll({where: {usersId: sessionUserID}});
                let products = [];
                productId.forEach(product =>{
                    products.push(product.dataValues);
                })
                // Busca la info de cada producto y lo mete en el array de productos
                for (let i = 0; i < products.length; i++) {
                    const productInfo = await DB.Product.findByPk(products[i].productsId, {include: ['colors','brands','subcategories','categories','types']} );
                    productos.push(productInfo.dataValues)  
                }
                // Busca la foto de cada producto y lo mete en el array de images
                for (let i = 0; i < products.length; i++) {
                    let productImage = await DB.Image.findAll({where: {productsId: products[i].productsId}});
                    images.push(productImage[0].dataValues); 
                }
                
                // Calcula el total a pagar
                let total = 0
                for (let i = 0; i < productos.length; i++) {
                    total = total + productos[i].price
                }
                res.render('productCart', { view: 'carrito', destacados, sessionUserID, productos, images, total, numberWithCommas }); 
                   
            } catch (error) {
                // Si no hay productos
                productos = [];
                images = [];
                total = 0
                res.render('productCart', { view: 'carrito', destacados, sessionUserID, productos, images, numberWithCommas, total });
            }   
        }
    },

    // Agrega el producto al carrito
    addToCart: async(req, res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        // Guarda los productos del carrito en session
        req.session.cart = cartProds;
        // Si no hay un usuario logueado - guarda el producto en session
        if (sessionUserID == undefined) {
            // Si el producto ya está en el carrito - No lo vuelve a agregar
            if (cartProds.includes(req.params.id)) {
                res.redirect('/productDetail/' + req.params.id);
            // Si el producto no esta en el carrito - Lo agrega
            } else {
                cartProds.push(req.params.id);
                res.redirect('/productDetail/' + req.params.id);
            }
            
        // Si hay un usuario en logueado - guarda en producto en la DB
        } else {
            try {
                // Encontrando el producto
                let producto = await DB.Product.findByPk(req.params.id); 
                try {
                    // Busca si el producto ya está en el carrito
                    let control = await DB.Product_user.findAll({where: {productsId: producto.id}});
                    // Si no está - Lo agrega a la DB
                    if (control.length == 0) {
                        const newItem = await DB.Product_user.create({
                            productsId: req.params.id,
                            usersId: sessionUserID
                        });
                        res.redirect('/productDetail/' + req.params.id);
                    // Si ya está en el carrito - No lo agrega
                    } else {
                        res.redirect('/productDetail/' + req.params.id);
                    }
                } catch (error) {
                   res.send(error)
                }
            } catch (error) {
                res.send(error);
            }   
        }
    },
 
    // Elimina un producto del carrito
    deleteCart: async(req,res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        await DB.Product_user.destroy({
            where: {
                productsId: req.params.id,
                usersId: sessionUserID
            }
        })
        
        res.redirect('/productCart');
    },

    // Renderiza la view que permite agregar productos
    productAdd: async (req,res, next)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        
        try {
            // Hace el pedido a la DB 
            let categories = await DB.Category.findAll();
            let subcategories = await DB.Subcategory.findAll();
            let types = await DB.Type.findAll();
            let brands = await DB.Brand.findAll();
            let colors = await DB.Color.findAll();   
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('productAdd', { view: 'forms', sessionUserID, categories, subcategories, types, brands, colors, categorias,marcas });

        } catch (error) {
            res.send(error);
        }
    },

    // Agrega el nuevo producto a la base de datos
    addingProduct : async (req, res, next)=>{
       
        try {
            const newProduct = await DB.Product.create(req.body);
            await newProduct.addColors(req.body.colorsId);

            const newImage = await DB.Image.create({
                name: req.files[0].filename,
                productsId: newProduct.id
            });

            res.redirect('/products');
            
        } catch (error) {
            res.send(error);
        }
    },

    // Renderiza la vista de edicion del producto
    productEdit: async (req, res)=>{
        try { 
            // ID del usuario en session
            let sessionUserID = req.session.userID;
            let idProducto = req.params.id;
            let productoAEditar = await DB.Product.findByPk(idProducto,{include: ['colors','brands','subcategories','categories','types']})
            
            // Para el select en la view
            let categorias = await DB.Category.findAll()
            let colores = await DB.Color.findAll()
            let subcategorias = await DB.Subcategory.findAll()
            let tipos = await DB.Type.findAll()
            let marcas = await DB.Brand.findAll()
            // para el menu colapsable del Header
            
            res.render('productEdit', {view: 'forms', productoAEditar, categorias, colores,marcas, subcategorias, tipos, sessionUserID});
            }
        catch (error) {
            res.send(error)
        }
    },

    // Actualiza la base de datos con la informacion nueva
    editingProduct: async(req, res)=>{
        try { 
            let idProducto = req.params.id;
            let producto = await DB.Product.findByPk ( idProducto,{ include: [ 'colors','brands','subcategories','categories','types','images' ] } )
            let imagen = await DB.Image.findByPk (producto.images[0].id)
            // update de caracteriticas del producto y tablas relacionadas 1:n
            
            await producto.update(req.body)   
            if(req.files[0] != undefined){
                await imagen.update({name : req.files[0].filename})
            }
             
                
             // update de relaciones n:m
            await producto.removeColor(producto.colors)
            await producto.addColor(req.body.colors)
            res.redirect('/products')
        }
        catch (error) {
            res.send(error)
        }
    },

    // Borra un producto
    delete: async function(req,res){  
        await DB.Product.destroy({
            where: {
                id: req.params.id
            }
        })
        
        res.redirect('/products');
    },

    search: async(req,res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        let busqueda = req.body.search;

        try {
            const result = await DB.Product.findAll({
                where: {
                    name: {
                        [OP.like]: '%' + busqueda + '%'
                    }
                }
            });
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('searchList', {sessionUserID, result, view: 'list', busqueda, numberWithCommas, categorias, marcas});
        } catch (error) {
            res.send(error)
        }
    }
}

module.exports= productController;



