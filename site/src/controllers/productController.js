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

    productEdit: async (req, res)=>{
        try { 
                // para cookies
            let sessionUserID = req.session.userID;
            let idProducto = req.params.id;
            let productoAEditar = await DB.Product.findByPk(idProducto,{include: ['colors','brands','subcategories','categories','types']})
            
            // para el select de categorias en la view
            let categorias = await DB.Category.findAll()
            let colores = await DB.Color.findAll()
            let subcategorias = await DB.Subcategory.findAll()
            let tipos = await DB.Type.findAll()
        
            // hay que hacer el select de colores pero primero hay que cambiar la base de datos
            res.render('productEdit', {view: 'forms', productoAEditar, categorias, colores, subcategorias, tipos, sessionUserID});
            }
        catch (error) {
            res.send(error)
        }
    },

    editingProduct: async(req, res)=>{
        try { 
            


            
            let idProducto = req.params.id;
            let producto= await DB.Product.findByPk(idProducto,{include: ['colors','brands','subcategories','categories','types']})
            
            // update de cosas relacionadas al producto
            await DB.Product.update(req.body, {where : {id : idProducto}})
            // update de tablas externas
            
            // colors
            await producto.removeColor(producto.colors)
            await producto.addColor(req.body.colors)
            // brands
            // await producto.removeBrand(producto.brands)
            // await producto.addBrand(req.body.brand)
            // // categories
            // await producto.removeCategory(producto.categories)
            // await producto.addCategory(req.body.category)
            // // types
            // await producto.removeType(producto.types)
            // await producto.addType(req.body.type)
            // // subcategories
            // await producto.removeSubcategory(producto.Subcategory)
            // await producto.addSubcategory(req.body.type)
            res.redirect('/products')
        }
        catch (error) {
            res.send(error)
        }
       
        
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
    },
    tester: async (req, res)=>{
        try { 
            
            var products = await DB.Category.findAll()
            
            res.send(products)
        }
        catch (error) {
            res.send(error)
        }
    }
}

module.exports= productController;



