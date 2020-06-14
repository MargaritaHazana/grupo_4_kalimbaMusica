const path = require('path');
const fs = require("fs")

//Pasando el JSON a JS
const rutaUsersJson = path.join(__dirname, '../../data/Users.json');
const users = fs.readFileSync(rutaUsersJson, 'utf-8');
const dataUsers = JSON.parse(users);


userController = {

    // Renderiza la view de Registracion
    register: function(req,res){
        res.render('register', { view: 'forms' });
    },

    // Renderiza la view de Inicio de Sesion
    login: function(req,res){
        res.render('login',{ view: 'forms'});
    }
}

module.exports = userController;
