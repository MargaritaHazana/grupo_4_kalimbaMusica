const path = require('path');
const fs = require("fs")
const bcrypt = require('bcryptjs');
const {chack, body, validationResult, check} = require('express-validator');
const session = require('express-session');

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
    loginView: (req,res)=>{
        let mensaje = []
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('login', {view: 'forms', sessionUserID, mensaje});
    },

    // Procesa el usuario en login
    login: function(req,res, next){
        
        let sessionUserID = req.session.userID;
        let user = dataUsers.find((us)=> us.email == req.body.email);
        let errors = validationResult(req);
        let mensaje = []

        // Valida los datos del form
        if (!errors.isEmpty()) {
            // Si hay errores - Redirige al login y envía errores
            return res.render('login', {errors: errors.errors, view: 'forms', sessionUserID, mensaje});
        } 

        // Si no hay errores - Busca si el el email está registrado
        if (user !== undefined) {
        // BORRAR CUANDO EL REGISTER ESTE LISTO
            let passHash = bcrypt.hashSync(user.password);
            
            // Chequea contraseña
            if (bcrypt.compareSync(req.body.password, passHash)) {
                // Si está bien - Guarda el userID en session y redirige al home
                req.session.userID = user.id;

                // Si tocó recordarme - Guarda el userID en cookies
                if (req.body.recordarme){
                    res.cookie('userIDCookie', user.id, {maxAge: 604800000});
                }
                res.redirect('/');
            } else {
                // Si está mal - Redirige al login y manda mensaje de error

                mensaje.push('Email o contraseña invalida'); 
                
                res.render('login', { view: 'forms', sessionUserID, mensaje});
            }
        } else {
            // Si no encientra el usuario - Redirige al login
            res.redirect('/users/login');
        }
        
    },
    logoutView: (req,res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('logout', {view: 'forms', sessionUserID});
    },
    logout: (req,res)=>{
        req.session.destroy();
        res.cookie('userIDCookie', null, {maxAge: 1});
        res.redirect('/');
    }, 
    profile: (req, res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('profile', {view: 'index', sessionUserID});
    }
}

module.exports = userController;
