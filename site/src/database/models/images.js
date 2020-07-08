// modelo images
var images = function (sequelize, dataTypes){
    alias = "Image"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const images = sequelize.define(alias,cols,config)
    images.associate = (models) =>{
        // muchas imagenes pertenece a un producto
        images.belongsTo(models.Product,{as:"products", foreignKey: "productsId"})
    }
    
    return images
}
module.exports = images