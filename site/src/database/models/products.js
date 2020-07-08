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
        // un producto tiene muchos colores y pertenece a categorias, subcategorias y marcas
        products.belongsTo(models.Color,{as:"colors", foreignKey: "colorsId"})
        products.belongsTo(models.Category,{as:"categories", foreignKey: "categoriesId"})
        products.belongsTo(models.Subcategory,{as:"subcategories", foreignKey: "subcategoriesId"})
        products.belongsTo(models.Brand,{as:"brands", foreignKey: "brandsId"})
        products.belongsTo(models.Type,{as:"types", foreignKey: "typesId"})
        // un producto tiene muchas imagenes
        products.hasMany(models.Image,{as:"images", foreignKey: "productsId"})
        // muchos productos tienen muchas ordenes
        products.belongsToMany(models.Order,{as:"products", through: "orders_products", foreignKey: "productsId",otherKey: "orders_id",timestamps:false})
    }
    
    return products
}
module.exports = products