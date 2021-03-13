const express = require('express')
const app = express()
const pagination = require('./middleware')


app.get('/:table', pagination.getAllitems)
app.get('/category/:category', pagination.getAllproducts)
app.get('/lessprice/:category', pagination.getlessPrice)
app.get('/featured/:product',pagination.getFeatured)



app.listen(3000)