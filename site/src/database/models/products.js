// modelo products
var products = function (sequelize, dataTypes){
    alias = "Product"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: dataTypes.STRING,
        price: dataTypes.DECIMAL,
        discount: dataTypes.INTEGER,
        stock: dataTypes.INTEGER,
        description: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const products = sequelize.define(alias,cols,config)
    products.associate = (models) =>{
        // un producto tiene  pertenece a categorias, subcategorias, tipos y marcas
        products.belongsTo(models.Category,{as:"categories", foreignKey: "categoriesId"})
        products.belongsTo(models.Subcategory,{as:"subcategories", foreignKey: "subcategoriesId"})
        products.belongsTo(models.Brand,{as:"brands", foreignKey: "brandsId"})
        products.belongsTo(models.Type,{as:"types", foreignKey: "typesId"})
        // un producto tiene muchas imagenes
        products.hasMany(models.Image,{as:"images", foreignKey: "productsId"})
        // muchos productos tienen muchas ordenes
        products.belongsToMany(models.Order,{as:"orders", through: "orders_products", foreignKey: "productsId", otherKey:"ordersId" ,timestamps:false})
        // muchas colores tienen muchos productos
        products.belongsToMany(models.Color,{as:"colors", through:"colors_products", foreignKey:"productsId", otherKey:"colorsId", timestamps:false})
    }
    
    return products
}
module.exports = products