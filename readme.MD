1. git clone git@github.com:MoEssam/task_fatura.git
2. cd task_fatura
3. npm i (to install all dependecnies)
4. npm run start
5. APIs (You can delete ?page=1 as I only have 14 products which fits in page where limit is 25)  
  (Categories are iPhone, galaxy, pens, pencils)
  i. GET http://localhost:3000/products?page=1  (get all the products in the first page, and the limit is default to 25 items)  
  ii. GET http://localhost:3000/lessprice/"iPhone"?page=1 (gets all the lowest prices in iPhone category)  
  iii. GET http://localhost:3000/featured/"12 pro max"  (set/ unset a product which is 12 pro max to featured or un=featured)  
  iv. GET http://localhost:3000/category/"iPhone" (gets all products from category iPhone)
        
