// modelo orders
var orders = function (sequelize, dataTypes){
    alias = "Order"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        shippingAddress: dataTypes.STRING,
        shippingCity: dataTypes.STRING,
        shippingPostalcode: dataTypes.INTEGER,
        shippingDate: dataTypes.DATE,
        name: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const orders = sequelize.define(alias,cols,config)
    orders.associate = (models) =>{
        // muchas ordenes tienen muchos productos
        orders.belongsToMany(models.Product,{as:"products", through: "orders_products", foreignKey: "ordersId", otherKey: "productsId", timestamps:false})
    }
    
    return orders
}
module.exports = orders