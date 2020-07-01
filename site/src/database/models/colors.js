//  modelos colors
var colors = function (sequelize, dataTypes){
    alias = "Colors"
    cols = {
        name: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const colors = sequelize.define(alias,cols,config)
    colors.associate = (models)=>{
        // un color encierra muchos productos
        colors.hasMany(models.Products,{as:"products", foreignKey: "colors_id"})
    }    

    return colors
}
module.exports = colors