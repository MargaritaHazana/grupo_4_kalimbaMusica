module.exports = (sequelize, DataTypes) => {
    const products_users = sequelize.define(
        'Product_user',
        {   productsId: DataTypes.INTEGER,
            usersId: DataTypes.INTEGER,
            colors: DataTypes.STRING,
            cantidad: DataTypes.INTEGER,
            deletedAt: DataTypes.DATE
        },
        {tableName: 'products_users',
        timestamps: false}
    )
    return products_users;
}