const path = require('path');
const fs = require("fs");

const DB = require('../database/models');
const OP = DB.Sequelize.Op;

const apiController = {
    categoriesAll: async(req,res)=>{
        try {
            const categories = await DB.Category.findAll()
            res.json(categories);
        } catch (error) {
            res.send(error);
        }
    },
    categories: async (req,res)=>{
        try {
            const category = await DB.Subcategory.findAll({where:{categoriesId: req.params.id}})
            res.json(category)
        } catch (error) {
            res.semd(error);
        }
    },
    subcategoriesAll: async(req,res)=>{
        try {
            const subcategories = await DB.Subcategory.findAll()
            res.json(subcategories);
        } catch (error) {
            res.send(error);
        }
    },
    subcategories: async (req,res)=>{
        try {
            const subcategory = await DB.Type.findAll({where:{subcategoriesId: req.params.id}})
            res.json(subcategory)
        } catch (error) {
            res.semd(error);
        }
    },
    types: async(req,res)=>{
        try {
            const types = await DB.Type.findAll()
            res.json(types);
        } catch (error) {
            res.send(error);
        }
    },
}

module.exports = apiController;