module.exports = (sequelize, DataTypes) => {
    const colors_products = sequelize.define(
        'Color_product',
        {   productsId: DataTypes.INTEGER,
            colorsId: DataTypes.INTEGER,
            deletedAt: DataTypes.DATE
        },
        {tableName: 'colors_products',
        timestamps:false}
    )
    return colors_products;
}