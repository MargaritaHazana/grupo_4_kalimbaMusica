// modelo guides
var guides = function (sequelize, dataTypes){
    alias = "Guide"
    cols = {
        content: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const guides = sequelize.define(alias,cols,config)
    guides.associate = (models) =>{
        //  muchas guias pertenecen a una subcategoria
        guides.belongsTo(models.Subcategory,{as:"subcategories", foreignKey: "subcategoriesId"})
    }
    return guides
}
module.exports = guides