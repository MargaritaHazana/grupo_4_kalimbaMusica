const path = require('path');
const fs = require("fs")

//Pasando el JSON a JS
const rutaProductosJson = path.join(__dirname, '../../data/Products.json');
const productos = fs.readFileSync( rutaProductosJson, 'utf-8');
const dataProductos = JSON.parse(productos);

var numberWithCommas = x => {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1.$2");
    return x;
}

productController = {
    // Renderiza la view del Index
    index: function(req,res){
        res.render('index', { view: 'index', dataProductos });
    },

    // Renderiza la lista de los productos
    list: function(req,res){
        res.render('list', {view: 'list', dataProductos, numberWithCommas});
    },

    // Renderiza la view del Detalle del Producto
    productDetail:function(req,res){
        // Encontrando el producto
        var idProducto = req.params.id;
        var producto = dataProductos.find((product)=> idProducto == product.id);
        // Calculando el precio con descuento
        var precioViejo = "$" + Math.round(producto.price);
        var descuento = producto.price * (producto.discount / 100);
        var precioDescuento = Math.round(producto.price - descuento);
        var precioFinal = "$" + numberWithCommas(precioDescuento);
        
        res.render('productDetail', { view: 'detail' , producto, precioViejo, precioFinal });
    },

    // Renderiza la view del Carro de los Productos
    productCart:function(req,res){
        res.render('productCart', { view: 'carrito' });
    },

    // Renderiza la view que permite agregar productos
    productAdd:function(req,res){
        res.render('productAdd', { view: 'forms' });
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
            color: req.body.color.value,
            stock: req.body.stock.value
        }
        
        console.log(req.body);
         
        dataProductos.push(productoNuevo);

        fs.writeFileSync(rutaProductosJson, JSON.stringify(dataProductos));

        res.redirect('/products');
    },

    productEdit: function(req, res){
        
        let idProducto = req.params.id;

        let productoAEditar = dataProductos.find((product)=> idProducto == product.id);

        res.render('productEdit', {view: 'forms', productoAEditar});
    },

    editingProduct: function(req, res){
        
        let idProducto = req.params.id;

        let productoEncontrado = dataProductos.find((producto)=>{
            idProducto == producto.id
        });
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