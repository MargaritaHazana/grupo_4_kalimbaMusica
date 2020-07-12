const subCatOptn = document.querySelector('.subcategories');
const category = document.querySelector('selected');
console.log(category);

fetch('http://localhost:3001/api/products/subcategories')
    .then(result=>{
        return result.json()
    })
    .then(subcategories=>{

        // <% subcategories.forEach(subcategory => { %>
        //     <option class="subcategories" value="<%= subcategory.id %>" > <%= subcategory.name %> </option>
        // <% }) %>
    })