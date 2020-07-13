module.exports = (sequelize, DataTypes) => {
    const colors_products = sequelize.define(
        'Color_product',
        {   productsId: DataTypes.INTEGER,
            colorsId: DataTypes.INTEGER,
            deletedAt: DataTypes.DATE
        },
        {tableName: 'colors_products'}
    )
    return colors_products;
}