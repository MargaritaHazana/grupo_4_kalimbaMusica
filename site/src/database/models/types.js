// modelo types
var types = function (sequelize, dataTypes){
    alias = "Type"
    cols = {
        name: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const types = sequelize.define(alias,cols,config)
    types.associate = (models) =>{
        // muchos tipos entran en una subcategorias
        types.belongsTo(models.Subcategory,{as:"subcategories", foreignKey: "subcategoriesId"})
        // un tipo tiene muchos productos
        types.hasMany(models.Product,{as:"products", foreignKey: "TypesId"})
    }
    
    return types
}
module.exports = types