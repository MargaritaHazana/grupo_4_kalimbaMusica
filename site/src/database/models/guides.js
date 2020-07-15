// modelo guides
var guides = function (sequelize, dataTypes){
    alias = "Guide"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        title: dataTypes.STRING,
        deletedAt: dataTypes.DATE,
        text1: dataTypes.STRING,
        text2: dataTypes.STRING,
        text3: dataTypes.STRING,
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