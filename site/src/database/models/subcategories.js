// modelo subcategories
var subcategories = function (sequelize, dataTypes){
    alias = "Subcategories"
    cols = {
        name: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const subcategories = sequelize.define(alias,cols,config)
    subcategories.associate = (models) =>{
        // muchas subcategorias entran en una categoria
        subcategories.belongsTo(models.Categories,{as:"categories", foreignKey: "categories_id"})
        // una subcategoria tiene muchos productos
        subcategories.hasMany(models.Products,{as:"products", foreignKey: "subcategories_id"})
    }
    
    return subcategories
}
module.exports = subcategories