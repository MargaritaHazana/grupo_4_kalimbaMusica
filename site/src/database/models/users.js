// modelo users
var users = function (sequelize, dataTypes){
    alias = "User"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        firstName: dataTypes.STRING,
        lastName: dataTypes.STRING,
        role: dataTypes.DECIMAL,
        tel: dataTypes.INTEGER,
        birthDate: dataTypes.DATE,
        email: dataTypes.STRING,
        password: dataTypes.STRING,
        image: dataTypes.STRING,
        deletedAt: dataTypes.DATE
    }
    config = {
        timestamps: false
    }
    const users = sequelize.define(alias,cols,config)
    users.associate = (models) =>{
        // un usuario puede hacer multiples ordenes
        users.hasMany(models.Order,{as:"orders", foreignKey: "usersId"})
        // CARRITO - muchos productos tienen muchos usuarios
        users.belongsToMany(models.Product,{as:"products", through:"products_users", foreignKey:"usersId", otherKey:"productsId", timestamps:false})
    }
    
    return users
}
module.exports = users