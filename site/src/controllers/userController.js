const path = require('path');
const fs = require("fs")
const bcrypt = require('bcryptjs');
const {chack, body, validationResult, check} = require('express-validator');
const session = require('express-session');

const DB = require('../database/models');
const OP = DB.Sequelize.Op;


//Pasando el JSON a JS
const rutaUsersJson = path.join(__dirname, '../../data/Users.json');
const users = fs.readFileSync(rutaUsersJson, 'utf-8');
const dataUsers = JSON.parse(users);


userController = {

    // Renderiza la view de Registro
    registerView: function(req,res){
        
        let mensaje = []

        res.render('register', { view: 'forms', mensaje});
    },

    // Procesa el registro del usuario
    register: async(req, res)=>{
            
        let errors = validationResult(req);
        let mensaje = []
        // Valida los datos del form
        if (!errors.isEmpty()) {
            mensaje.push(errors)
            // Si hay errores - Redirige al register y envía errores
            return res.render('register', { view: 'forms', mensaje, errors: errors.errors});

        } else {
            try {
                // Crea el usuario nuevo en la DB
                const newUser = await DB.User.create({
                    firstName: req.body.first_name,
                    lastName: req.body.last_name,
                    email: req.body.email,
                    tel: req.body.tel,
                    birthDate: req.body.birth_date,
                    password: bcrypt.hashSync (req.body.password, 10), 
                    role: 2,
                    image: req.files[0].filename,    
                })

                res.redirect('/users/login');

            } catch (error) {
                res.send(error)
            }
        }    
    },

    // Renderiza la view de Inicio de Sesion
    loginView: (req,res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;

        let mensaje = []
        res.render('login', {view: 'forms', sessionUserID, mensaje});
    },

    // Procesa el usuario en login
    login: async(req,res,next)=>{
        
        let sessionUserID = req.session.userID;
        let errors = validationResult(req);
        let mensaje = []

        // Valida los datos del form
        if (!errors.isEmpty()) {
            // Si hay errores - Redirige al login y envía errores
            return res.render('login', {errors: errors.errors, view: 'forms', sessionUserID, mensaje});
        } 

        // Si no hay errores - Busca si el el email está registrado en la DB
        try {
            // Encuentra el user que se quiere loguear
            const userToLog = await DB.User.findAll({where: {email: req.body.email}});
            const user = userToLog[0].dataValues;            
            
            // Chequea contraseña
            if (bcrypt.compareSync(req.body.password, user.password)) {
                // Si está bien - Guarda el userID en session y redirige al home
                req.session.userID = user.id;
                req.session.category = user.role
                    
                // Si tocó recordarme - Guarda el userID en cookies
                if (req.body.recordarme){
                    res.cookie('userIDCookie', user.id, {maxAge: 604800000});
                }
                res.redirect('/');
            } else {
                // Si está mal la contraseña - Redirige al login y manda mensaje de error
                mensaje.push('Email o contraseña invalida'); 
                    
                res.render('login', { view: 'forms', sessionUserID, mensaje});
            }

        // Si no encuentra el usuario - Redirige al login y manda mensaje de error        
        } catch (error) {
            mensaje.push('Email o contraseña invalida'); 
                    
            res.render('login', { view: 'forms', sessionUserID, mensaje});
        }
    },

    // Renderiza la vista del logout
    logoutView: (req,res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('logout', {view: 'forms', sessionUserID});
    },

    // Saca al usuario de sesión y elimina la cookie
    logout: (req,res)=>{
        req.session.destroy();
        res.cookie('userIDCookie', null, {maxAge: 1});
        res.redirect('/');
    }, 

    // Renderiza la vista del perfil del usuario en sesión
    profile: async(req, res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        try {
            const user = await DB.User.findByPk(sessionUserID);
            res.render('profile', {view: 'profile', sessionUserID, user});
        } catch (error) {
            res.redirect('/users/login');
        }
    },

    // Renderiza la vista de edición del perfil
    editView: async(req, res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        try {
            const user = await DB.User.findByPk(sessionUserID);

            res.render('userEdit', {view: 'profile', sessionUserID, user})
        } catch (error) {
            res.redirect('/users/login');
        }  
    },

    // Procesa la edición del perfil
    edit: function(req, res){
       
        let sessionUserID = req.session.userID;
        let userToEdit = dataUsers.find((user)=> sessionUserID == user.id);

        if(req.files[0] == undefined){
            userToEdit = {
                id: req.session.userID,
                first_name: req.body.first_name,
                last_name: req.body.last_name,
                email: req.body.email,
                tel: req.body.tel,
                birth_date: req.body.birth_date,
                username: req.body.username, 
                password: userToEdit.password,
                category: 2,
                image: userToEdit.image
                
            } 
        }
        else {
            userToEdit = {
                id: req.session.userID,
                first_name: req.body.first_name,
                last_name: req.body.last_name,
                email: req.body.email,
                tel: req.body.tel,
                birth_date: req.body.birth_date,
                username: req.body.username, 
                password: user.password,
                category: 2,
                image: req.files[0].filename,
        }}
        dataUsers.map(function(user){
            if(user.id == sessionUserID){
                let posicionAEditar = dataUsers.indexOf(user);
                dataUsers.splice(posicionAEditar, 1, userToEdit);
            }
        })
        fs.writeFileSync(rutaUsersJson, JSON.stringify(dataUsers));
        
        req.session.destroy();

        res.redirect('/users/login');
    },

    // Renderiza la vista del listado de usuarios
    userList: (req,res)=>{
        // ID del usuario en sesion
        let sessionUserID = req.session.userID;
        res.render('userList', {view: 'index', dataUsers, sessionUserID});
    }
}

module.exports = userController;