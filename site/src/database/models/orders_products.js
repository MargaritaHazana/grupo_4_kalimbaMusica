module.exports = (sequelize, DataTypes) => {
    const orders_products = sequelize.define(
        'Order_product',
        {   productsId: DataTypes.INTEGER,
            ordersId: DataTypes.INTEGER,
            colors: DataTypes.STRING,
            cantidad: DataTypes.INTEGER,
            deletedAt: DataTypes.DATE
        },
        {tableName: 'orders_products',
        timestamps: false}
    )
    return orders_products;
}