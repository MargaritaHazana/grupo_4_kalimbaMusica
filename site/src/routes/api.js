var express = require('express');
var router = express.Router();
var multer = require('multer');
var path = require('path');

let apiController = require('../controllers/apiController');

router.get('/products-total', (req,res)=>{
        res.json([
            {
                titulo:'Products in Data Base',
                cifra:135,
                color:"primary",
                icono:"fas fa-clipboard-list fa-2x text-gray-300"
            },
            {
                titulo:'Amount in products',
                cifra:'$'+ 546.456,
                color:"success",
                icono:"fas fa-dollar-sign fa-2x text-gray-300"
            },
            {
                titulo: 'border-left-primary',
                cifra:38,
                color:"warning",
                icono:"fas fa-user-check fa-2x text-gray-300"
            }
        ])
    }
)

router.get('/products-last', (req,res)=>{
    res.json({
        description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores, consequatur explicabo officia inventore libero veritatis iure voluptate reiciendis a magnam, vitae, aperiam voluptatum non corporis quae dolorem culpa exercitationem ratione?'
    })
})

router.get('/products-categories', (req,res)=>{
    res.json([{number:'01'},{number:'02'},{number:'03'},{number:'04'},{number:'05'},{number:'06'}])
})

router.get('/products-all-info', (req,res)=>{
    res.json([
        {name: 'Tiger Nixon',
        work: 'System Architect',
        category: ['01','02','03'],
        color: ['Red', 'Blue', 'Green'],
        stock: 245
        },
        {name: 'Jane Doe',
        work: 'Fullstack developer',
        category: ['01','02','03'],
        color: ['Red', 'Blue', 'Green'],
        stock: 245
        }])
})

// Muestra todas las categorías
router.get('/products/categories/all', apiController.categoriesAll);
// Muestra todas las subcategorías dentro de una categoría
router.get('/products/categories/:id', apiController.categories);
// Muestra todas las subcategorías
router.get('/products/subcategories', apiController.subcategoriesAll);
// Muestra todos los tipos dentro de una subcategoría
router.get('/products/subcategories/:id', apiController.subcategories);
// Muestra todos los tipos
router.get('/products/types', apiController.types);

module.exports = router;