// modelo categories
var categories = function (sequelize, dataTypes){
    alias = "Category"
    cols = {
        name: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const categories = sequelize.define(alias,cols,config)
    categories.associate = (models) =>{
        // una categoria encierra muchas subcategorias y muchos productos
        categories.hasMany(models.Subcategory,{as:"subcategories", foreignKey: "subcategoriesId"})
        categories.hasMany(models.Product,{as:"products", foreignKey: "categoriesId"})
    }
    
    return categories
}
module.exports = categories