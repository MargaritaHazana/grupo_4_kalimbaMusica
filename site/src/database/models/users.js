// modelo users
var users = function (sequelize, dataTypes){
    alias = "Users"
    cols = {
        first_name: dataTypes.STRING,
        last_name: dataTypes.STRING,
        role: dataTypes.DECIMAL,
        tel: dataTypes.INTEGER,
        birth_date: dataTypes.DATE,
        username: dataTypes.STRING,
        password: dataTypes.STRING,
        image: dataTypes.STRING,
    }
    config = {
        timestamps: false
    }
    const users = sequelize.define(alias,cols,config)
    users.associate = (models) =>{
        // un usuario puede hacer multiples ordenes
        users.hasMany(models.Orders,{as:"orders", foreignKey: "users_id"})
    }
    
    return users
}
module.exports = users