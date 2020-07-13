module.exports = (sequelize, DataTypes) => {
    const products_users = sequelize.define(
        'Product_user',
        {   productsId: DataTypes.INTEGER,
            usersId: DataTypes.INTEGER,
            deletedAt: DataTypes.DATE
        },
        {tableName: 'products_users'}
    )
    return products_users;
}