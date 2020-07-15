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

category.onChange = (e)=>{
    // fetch('http://localhost:3001/api/products/subcategories'+ e.value)
    console.log(e.value);
}