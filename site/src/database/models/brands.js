// modelo brands
var brands = function (sequelize, dataTypes){
    alias = "Brand"
    cols = {
        name: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const brands = sequelize.define(alias,cols,config)
    brands.associate = (models) =>{
        // una marca encierra muchos productos
        brands.hasMany(models.Product,{as:"products", foreignKey: "brandsId"})       
    }
    
    return brands
}
module.exports = brands