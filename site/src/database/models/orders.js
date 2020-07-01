// modelo orders
var orders = function (sequelize, dataTypes){
    alias = "Orders"
    cols = {
        shipping_city: dataTypes.STRING,
        shipping_postalcode: dataTypes.INTEGER,
        shipping_date: dataTypes.DATE,
    }
    config = {
        timestamps: false
    }
    const orders = sequelize.define(alias,cols,config)
    orders.associate = (models) =>{
        // una orden pertenece a muchos usuarios (aparentemente)
        orders.belongsTo(models.Users,{as:"users", foreignKey: "users_id"})
        // muchas ordenes tienen muchos productos
        orders.belongsToMany(models.Products,{as:"products", through: "orders_products", foreignKey: "orders_id",otherKey: "products_id",timestamps:false})
    }
    
    return orders
}
module.exports = orders