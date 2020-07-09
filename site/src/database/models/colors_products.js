module.exports = (sequelize, DataTypes) => {
    const colors_actors = sequelize.define(
        'Color_product',
        {   productsId: DataTypes.INTEGER,
            colorsId: DataTypes.INTEGER,
            deletedAt: DataTypes.DATE
        },
        {tableName: 'colors_actors'}
    )
    return colors_actors;
}