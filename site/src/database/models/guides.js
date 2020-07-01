// modelo guides
var guides = function (sequelize, dataTypes){
    alias = "Guides"
    cols = {
        content: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const guides = sequelize.define(alias,cols,config)
    guides.associate = (models) =>{
        //  muchas guias pertenecen a una subcategoria
        guides.belongsTo(models.Subcategories,{as:"subcategories", foreignKey: "subcategories_id"})
    }
    return guides
}
module.exports = guides