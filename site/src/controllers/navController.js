const path = require('path');
const fs = require("fs");

const DB = require('../database/models');
const OP = DB.Sequelize.Op;


var numberWithCommas = x => {
    x = x.toString();
    var pattern = /(-?\d+)(\d{3})/;
    while (pattern.test(x))
        x = x.replace(pattern, "$1.$2");
    return x;
}

navController = {
    ofertas: async function(req, res, next){
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;

        let ofertas = await DB.Product.findAll()

        let categorias = await DB.Category.findAll()
        let marcas = await DB.Brand.findAll()
    
        res.render('ofertas', {view: 'ofertas', sessionUserID, ofertas, numberWithCommas, categorias, marcas, categoryUser})
    },
    ayuda: async function(req, res,next){
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;

        let categorias = await DB.Category.findAll()
        let marcas = await DB.Brand.findAll()

        res.render('help', {view:'ayuda', sessionUserID, categorias, marcas, categoryUser})
    },
    admin: (req,res)=>{
        // ID y categoría del usuario en sesion
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;

        res.render()
    },
    tutoriales: async function(req, res, next){
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;

        let categorias = await DB.Category.findAll();
        let marcas = await DB.Brand.findAll();

        res.render('tutoriales', {view: 'tutoriales', sessionUserID, categoryUser, categorias, marcas})

    },
    guias: async function(req, res, next){
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;

        let categorias = await DB.Category.findAll();
        let marcas = await DB.Brand.findAll();

        let guias = await DB.Guide.findAll();

        res.render('guias', {view: 'tutoriales', sessionUserID, categoryUser, categorias, marcas, guias})

    },
    elegirGuia: async function(req, res, next){
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;

        let categorias = await DB.Category.findAll();
        let marcas = await DB.Brand.findAll();

        let guias = await DB.Guide.findAll();

        res.render('elegirGuia', {view: 'tutoriales', sessionUserID, categoryUser, categorias, marcas, guias})
    },
    guiasEdit: async function(req, res, next){
        let parametro = req.params.id
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        
        try{
            let categorias = await DB.Category.findAll();
            let marcas = await DB.Brand.findAll();
    
    
            let guias = await DB.Guide.findAll();

            let guia = guias.findIndex(parametro -1)
            
            res.render('guiasEdit', {view: 'forms',guias,parametro, sessionUserID, categoryUser, categorias, marcas, guiaAEditar})
        }
        catch(error){
            res.send(error)
        }
        
    }
}

module.exports = navController