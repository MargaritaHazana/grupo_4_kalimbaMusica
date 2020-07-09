// modelo orders
var orders = function (sequelize, dataTypes){
    alias = "Order"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        shipping_city: dataTypes.STRING,
        shipping_postalcode: dataTypes.INTEGER,
        shipping_date: dataTypes.DATE,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const orders = sequelize.define(alias,cols,config)
    orders.associate = (models) =>{
        // una orden pertenece a muchos usuarios (aparentemente)
        orders.belongsTo(models.User,{as:"users", foreignKey: "usersId"})
        // muchas ordenes tienen muchos productos
        orders.belongsToMany(models.Product,{as:"products", through: "orders_products", foreignKey: "ordersId", otherKey: "productsId", timestamps:false})
    }
    
    return orders
}
module.exports = orders