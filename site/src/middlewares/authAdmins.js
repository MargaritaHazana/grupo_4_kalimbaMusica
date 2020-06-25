const path = require('path');
const fs = require("fs");
const rutaUsersJson = path.join(__dirname, '../../data/Users.json');
const users = fs.readFileSync(rutaUsersJson, 'utf-8');
const dataUsers = JSON.parse(users);
module.exports = function authMiddleware(req,res,next){
    usuario = dataUsers.find(user => user.id == req.session.userID) || {category: 2}
    if(usuario.category == 2){
        return res.redirect('/users/login')
    }
    next()
}
