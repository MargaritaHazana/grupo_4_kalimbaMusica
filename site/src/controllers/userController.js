const path = require('path');
const fs = require("fs")
const bcrypt = require('bcryptjs');
const {chack, body, validationResult, check} = require('express-validator');
const session = require('express-session');

const DB = require('../database/models');
const OP = DB.Sequelize.Op;


userController = {

    // Renderiza la view de Registro
    registerView: async function(req,res){
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        try {
            let mensaje = []
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('register', { view: 'forms', mensaje, categorias, marcas, sessionUserID, categoryUser});
        } catch (error) {
            res.send(error)
        }
        
    },

    // Procesa el registro del usuario
    register: async(req, res)=>{
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        // para el menu colapsable del Header
        let categorias = await DB.Category.findAll()
        let marcas = await DB.Brand.findAll()
 
        let errors = validationResult(req);
        let mensaje = []
        // Valida los datos del form
        if (!errors.isEmpty()) {
            mensaje.push(errors)
            // Si hay errores - Redirige al register y envía errores
            return res.render('register', { view: 'forms', mensaje, errors: errors.errors, sessionUserID, categoryUser, categorias,marcas});
        // Si no hay errores
        } else {
            try {
                // Busca si ya hay un usuario con ese email
                const user = await DB.User.findAll({where: {email: req.body.email}});
                if (user.length === 0) {
                    // Si no existe el usuario - Crea el usuario nuevo en la DB
                    if (categoryUser == undefined || categoryUser !==  1) {
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
                    } else {
                        const newUser = await DB.User.create({
                            firstName: req.body.first_name,
                            lastName: req.body.last_name,
                            email: req.body.email,
                            tel: req.body.tel,
                            birthDate: req.body.birth_date,
                            password: bcrypt.hashSync (req.body.password, 10), 
                            role: 1,
                            image: req.files[0].filename,    
                        });
                        res.redirect('/')
                    }
                } else {
                    // Si el usuario ya existe - Redirige el register y manda mensaje de error
                    mensaje.push('Ya existe un usuario con ese email');
                    res.render('register', {view: 'forms', mensaje, sessionUserID, categoryUser, categorias, marcas});
                }  
            } catch (error) {
                res.send(error);   
            }
        }    
    },

    // Renderiza la view de Inicio de Sesion
    loginView: async (req,res)=>{
        try {
            // ID y categoría del usuario en sesion
            let sessionUserID = req.session.userID;
            let categoryUser = req.session.category;
 
            let mensaje = []
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('login', {view: 'forms', sessionUserID, mensaje, marcas, categorias, categoryUser});
        } catch (error) {
            res.send(error)
        }
        
    },

    // Procesa el usuario en login
    login: async(req,res,next)=>{
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        // para el menu colapsable del Header
        let categorias = await DB.Category.findAll()
        let marcas = await DB.Brand.findAll()
        let errors = validationResult(req);
        let mensaje = []
 
        // Valida los datos del form
        if (!errors.isEmpty()) {
            // Si hay errores - Redirige al login y envía errores
            return res.render('login', {errors: errors.errors, view: 'forms', sessionUserID, mensaje, categorias, categoryUser, marcas});
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
                    
                res.render('login', { view: 'forms', sessionUserID, mensaje, categoryUser, categorias, marcas});
            }
 
        // Si no encuentra el usuario - Redirige al login y manda mensaje de error        
        } catch (error) {
            mensaje.push('Email o contraseña invalida'); 
                    
            res.render('login', { view: 'forms', sessionUserID, mensaje, categoryUser, categorias, marcas});
        }
    },

    // Renderiza la vista del logout
    logoutView: async (req,res)=>{
        try {
            // ID y categoría del usuario en sesion
            let sessionUserID = req.session.userID;
            let categoryUser = req.session.category;
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('logout', {view: 'forms', sessionUserID, categorias, marcas, categoryUser});
        } catch (error) {
            res.send(error)
        }
        
    },

    // Saca al usuario de sesión y elimina la cookie
    logout: (req,res)=>{
        req.session.destroy();
        res.cookie('userIDCookie', null, {maxAge: 1});
        res.redirect('/');
    }, 

    // Renderiza la vista del perfil del usuario en sesión
    profile: async(req, res)=>{
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        try {
            const user = await DB.User.findByPk(sessionUserID);
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('profile', {view: 'profile', sessionUserID, user, categorias, marcas, categoryUser});
        } catch (error) {
            res.redirect('/users/login');
        }
    },

    // Renderiza la vista de edición del perfil
    editView: async(req, res)=>{
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        try {
            const user = await DB.User.findByPk(sessionUserID);
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('userEdit', {view: 'profile', sessionUserID, user, categorias, marcas, categoryUser})
        } catch (error) {
            res.redirect('/users/login');
        }  
    },

    // Procesa la edición del perfil
    edit: async (req, res)=>{
        try { 
            let userId = req.params.id
            let usuario = await DB.User.findByPk(userId)

            await usuario.update(req.body) 
            if (req.files[0] != undefined) {
                await usuario.update({image : req.files[0].filename})
            }
            
            res.redirect('/')
        }
        catch (error) {
            res.send(error)
        }
    },
    // Renderiza la vista para cambiar constraseña
    passwordChangeView: async(req, res)=>{
        // ID y categoría del usuario en sesion
        let mensaje = []
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        try {
            const user = await DB.User.findByPk(sessionUserID);
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('passwordChangeView', {view: 'profile', sessionUserID, user, marcas, categorias, categoryUser, mensaje})
        } catch (error) {
            res.redirect('/users/login');
        }  
    },

    // Procesa el cambio de contraseña
    passwordChange: async (req,res)=>{
       
        try {
            let mensaje = []
            let categoryUser = req.session.category;
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            let sessionUserID = req.session.userID;
            let user = await DB.User.findByPk(sessionUserID)
            let contraseñaPrevia = req.body.oldPassword
            let password = bcrypt.hashSync (req.body.password, 10)
            if (bcrypt.compareSync(  contraseñaPrevia,user.password)) {
                await user.update({password: password}) 
                res.redirect('/')
            } else {
                mensaje.push("Contraseña previa incorrecta")
                res.render('passwordChangeView',{view: 'profile',sessionUserID, user,mensaje, categorias, categoryUser, marcas}) 
            }
        } catch (error) {
            
        }
    },

    // Renderiza la vista del listado de usuarios
    userList: async (req,res)=>{
        try {
            // ID y categoría del usuario en sesion
            let sessionUserID = req.session.userID;
            let categoryUser = req.session.category;
            let usuarios = await DB.User.findAll()
            // para el menu colapsable del Header
            let categorias = await DB.Category.findAll()
            let marcas = await DB.Brand.findAll()
            res.render('userList', {view: 'index', usuarios, sessionUserID, categorias, marcas, categoryUser});
        } catch (error) {
            res.send(error)
        }
        
    },

    // Borra un usuario
    delete: async function(req,res){  
        await DB.User.destroy({
            where: {
                id: req.params.id
            }
        })
        res.redirect('/users/userList');
    },
}

module.exports = userController;