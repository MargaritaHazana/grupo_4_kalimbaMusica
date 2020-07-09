//  modelos colors
var colors = function (sequelize, dataTypes){
    alias = "Color"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: dataTypes.STRING,
        // deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const colors = sequelize.define(alias,cols,config)
    colors.associate = (models)=>{
        // muchas colores tienen muchos productos
        colors.belongsToMany(models.Product,{as:"products", through:"colors_products", foreignKey:"colorsId", otherKey:"productsId", timestamps:false})
    }    

    return colors
}
module.exports = colors