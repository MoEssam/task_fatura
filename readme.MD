1. git clone
2. cd task-fatura
3. npm i (to install all dependecnies)
4. npm run start
5. APIs  
  i. GET http://localhost:3000/products?page=1  (get all the products in the first page, and the limit is default to 25 items)  
  ii. GET http://localhost:3000/lessprice/"iPhone"?page=1 (gets all the lowest prices in iPhone category)  
  iii. GET http://localhost:3000/featured/"12 pro max"  (set/ unset a product which is 12 pro max to featured or un=featured)  
  iv. GET http://localhost:3000/category/"iPhone" (gets all products from category iPhone)
        
