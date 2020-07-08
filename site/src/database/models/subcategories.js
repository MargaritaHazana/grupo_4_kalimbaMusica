// modelo subcategories
var subcategories = function (sequelize, dataTypes){
    alias = "Subcategory"
    cols = {
        name: dataTypes.STRING,
        // deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const subcategories = sequelize.define(alias,cols,config)
    subcategories.associate = (models) =>{
        // muchos tipos entran en una subcategorias
        subcategories.belongsTo(models.Category,{as:"categories", foreignKey: "categoriesId"})
        // un tipo tiene muchos productos
        subcategories.hasMany(models.Product,{as:"products", foreignKey: "subcategoriesId"})
    }
    
    return subcategories
}
module.exports = subcategories