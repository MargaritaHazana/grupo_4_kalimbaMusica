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
            let guia = await DB.Guide.findByPk(parametro);           
            res.render('guiasEdit', {view: 'forms',guia, sessionUserID, categoryUser, categorias, marcas})
        }
        catch(error){
            res.send(error)
        }
        
    },
    guiasEdited: async function(req, res, next){
        let parametro = req.params.id
        let sessionUserID = req.session.userID;
        let categoryUser = req.session.category;
        res.send(req.body)

        try{
            let categorias = await DB.Category.findAll();
            let marcas = await DB.Brand.findAll();
            let guia = await DB.Guide.findByPk(parametro);  
            
            await guia.update({
                title: req.body.title,
                text1: req.body.text1,
                text2: req.body.text2,
                text3: req.body.text3,
            })
            
            //res.redirect('/nav/guias')
        }
        catch(error){
            res.send(error)
        }
    }
}

module.exports = navController