// modelo brands
var brands = function (sequelize, dataTypes){
    alias = "Brands"
    cols = {
        name: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const brands = sequelize.define(alias,cols,config)
    brands.associate = (models) =>{
        // una marca encierra muchos productos
        brands.hasMany(models.Products,{as:"products", foreignKey: "brands_id"})       
    }
    
    return brands
}
module.exports = brands