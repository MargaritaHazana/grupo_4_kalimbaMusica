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

// Variable que pasa los productos destacados
let destacados = [dataProductos[1],dataProductos[2],dataProductos[3],dataProductos[4]];


productController = {
    // Renderiza la view del Index
    index: async function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        let destacados = await DB.Product.findAll({
            limit:4, include: ['images']})
        res.render('index', { view: 'index', destacados, sessionUserID });
    },

    // Renderiza la lista de los productos
    list: async function(req,res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        // Chequea si el user en session es admin
        let categoryUser = 0
        if (sessionUserID !== undefined) {
            dataUsers.find((user)=>user.id == sessionUserID);
            categoryUser = 1
        }
        let productos = await DB.Product.findAll()

        res.render('list', {view: 'list', productos, numberWithCommas, sessionUserID, categoryUser});
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
        // Encontrando el producto
        var idProducto = req.params.id;
         let producto = await DB.Product.findByPk(idProducto)
        // Calculando el precio con descuento
        var precioViejo = "$" + numberWithCommas(Math.round(producto.price));
        var descuento = producto.price * (producto.discount / 100);
        var precioDescuento = Math.round(producto.price - descuento);
        var precioFinal = "$" + numberWithCommas(precioDescuento);
        
        res.render('productDetail', { view: 'detail' , producto, precioViejo, precioFinal, destacados, sessionUserID, categoryUser });
    },

    // Renderiza la view del Carro de los Productos
    productCart:function(req, res){
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('productCart', { view: 'carrito', destacados, sessionUserID });
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

            res.render('productAdd', { view: 'forms', sessionUserID, categories, subcategories, types, brands, colors });

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
            await imagen.update({name : req.files[0].filename})       
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
            res.render('searchList', {sessionUserID, result, view: 'list', busqueda, numberWithCommas});
        } catch (error) {
            res.send(error)
        }
    }
}

module.exports= productController;



