// modelo subcategories
var subcategories = function (sequelize, dataTypes){
    alias = "Subcategory"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: dataTypes.STRING,
        // categoriesId: dataTypes.INTEGER,
        deletedAt: dataTypes.DATE
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
        subcategories.hasMany(models.Type,{as:"types", foreignKey: "subcategoriesId"})
        subcategories.hasMany(models.Guide,{as:"guides", foreignKey: "subcategoriesId"})
    }
    
    return subcategories
}
module.exports = subcategories