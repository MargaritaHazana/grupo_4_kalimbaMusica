// modelo products
var products = function (sequelize, dataTypes){
    alias = "Products"
    cols = {
        name: dataTypes.STRING,
        price: dataTypes.DECIMAL,
        discount: dataTypes.INTEGER,
        stock: dataTypes.INTEGER,
        description: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const products = sequelize.define(alias,cols,config)
    products.associate = (models) =>{
        // un producto tiee muchos colores y pertenece a categorias, subcategorias y marcas
        products.belongsTo(models.Colors,{as:"colors", foreignKey: "colors_id"})
        products.belongsTo(models.Categories,{as:"categories", foreignKey: "categories_id"})
        products.belongsTo(models.Subcategories,{as:"subcategories", foreignKey: "subcategories_id"})
        products.belongsTo(models.Brands,{as:"brands", foreignKey: "brands_id"})
        // un producto tiene muchas imagenes
        products.hasMany(models.Images,{as:"images", foreignKey: "products_id"})
        // muchos productos tienen muchas ordenes
        products.belongsToMany(models.Orders,{as:"products", through: "orders_products", foreignKey: "products_id",otherKey: "orders_id",timestamps:false})
    }
    
    return products
}
module.exports = products