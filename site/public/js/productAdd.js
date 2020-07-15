// const subCatOptn = document.querySelector('.subcategories');
// const category = document.querySelector('selected');
// console.log(category);

// fetch('http://localhost:3001/api/products/subcategories')
//     .then(result=>{
//         return result.json()
//     })
//     .then(subcategories=>{

//     })

const category = document.querySelector('.category');
const subcategory = document.querySelector('.subcategory');
const type = document.querySelector('.type');


    category.addEventListener('change', (e)=>{
        fetch('http://localhost:3001/api/products/categories/'+ category.value)
            .then(resultado=>{
            return resultado.json();
            })
            .then(subcategories=>{
                subcategories.forEach(subcat => {
                    subcategory.innerHTML += '<option value="'+ subcat.id + '" >' + subcat.name + '</option>'
                });
            })
            .catch(error=>{
                console.log(error);
            })
        })
    
    subcategory.addEventListener('change', (e)=>{
        fetch('http://localhost:3001/api/products/subcategories/'+ subcategory.value)
            .then(resultado=>{
            return resultado.json();
            })
            .then(types=>{
                types.forEach(t => {
                    type.innerHTML += '<option value="'+ t.id + '" >' + t.name + '</option>'
                });
            })
            .catch(error=>{
                console.log(error);
            })
        })
