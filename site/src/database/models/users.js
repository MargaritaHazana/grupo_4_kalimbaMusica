// modelo users
var users = function (sequelize, dataTypes){
    alias = "User"
    cols = {
        id:{
            type: dataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        first_name: dataTypes.STRING,
        last_name: dataTypes.STRING,
        role: dataTypes.DECIMAL,
        tel: dataTypes.INTEGER,
        birth_date: dataTypes.DATE,
        username: dataTypes.STRING,
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
    }
    
    return users
}
module.exports = users