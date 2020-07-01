// modelo categories
var categories = function (sequelize, dataTypes){
    alias = "Categories"
    cols = {
        name: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const categories = sequelize.define(alias,cols,config)
    categories.associate = (models) =>{
        // una categoria encierra muchas subcategorias y muchos productos
        categories.hasMany(models.Subcategories,{as:"subcategories", foreignKey: "categories_id"})
        categories.hasMany(models.Products,{as:"products", foreignKey: "categories_id"})
    }
    
    return categories
}
module.exports = categories