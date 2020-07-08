//  modelos colors
var colors = function (sequelize, dataTypes){
    alias = "Color"
    cols = {
        name: dataTypes.STRING,
        // deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const colors = sequelize.define(alias,cols,config)
    colors.associate = (models)=>{
        // un color encierra muchos productos
        colors.hasMany(models.Product,{as:"products", foreignKey: "colorsId"})
    }    

    return colors
}
module.exports = colors