// modelo images
var images = function (sequelize, dataTypes){
    alias = "Images"
    cols = {
        name: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const images = sequelize.define(alias,cols,config)
    images.associate = (models) =>{
        // muchas imagenes pertenece a un producto
        images.belongsTo(models.Products,{as:"products", foreignKey: "products_id"})
    }
    
    return images
}
module.exports = images