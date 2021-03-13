const connection = require('./config');

exports.getAllitems = (req, res) => {
    const limit = 25
    const page = req.query.page
    const offset = (page - 1) * limit
    const table = req.params.table
    const prodsQuery = "select * from " + table + " limit " + limit + " OFFSET " + offset
    connection.query(prodsQuery, function (error, results, fields) {
        if (error) throw error;
        var jsonResult = {
            'items_page_count': results.length,
            'page_number': page,
            'Items': results
        }

        var myJsonString = JSON.parse(JSON.stringify(jsonResult));
        res.statusMessage = "Products for page " + page;
        res.statusCode = 200;
        res.json(myJsonString);
        res.end();
    })
}

exports.getAllproducts = (req, res) => {
    const limit = 5
    if (req.query.page) {
        const page = req.query.page
        const offset = (page - 1) * limit
        const category = req.params.category
        const query = "SELECT products.name AS `Product Name`,category.name AS `Category Name`FROM products JOIN category ON products.category_id = category.id WHERE category.name =" + category + " limit " + limit + " OFFSET " + offset
        connection.query(query, function (error, results, fields) {
            if (error) throw error;
            var jsonResult = {
                'items_page_count': results.length,
                'page_number': page,
                'Items': results
            }

            var myJsonString = JSON.parse(JSON.stringify(jsonResult));
            res.statusMessage = "Products for page " + page;
            res.statusCode = 200;
            res.json(myJsonString);
            res.end();
        })
    } else {
        //const offset = (page - 1) * limit
        const category = req.params.category
        const query = "SELECT products.name AS `Product Name`,category.name AS `Category Name`FROM products JOIN category ON products.category_id = category.id WHERE category.name =" + category
        connection.query(query, function (error, results, fields) {
            if (error) throw error;
            var jsonResult = {
                'items_page_count': results.length,
                //'page_number': page,
                'Items': results
            }

            var myJsonString = JSON.parse(JSON.stringify(jsonResult));
            //res.statusMessage = "Products for page " + page;
            res.statusCode = 200;
            res.json(myJsonString);
            res.end();
        })
    }


}

exports.getlessPrice = (req, res) => {
    const limit = 25
    const page = req.query.page
    const offset = (page - 1) * limit
    const category = req.params.category
    const query = "SELECT p.name AS `Product Name`, s.name AS `Provider Name`, c.name, MIN(price) AS `Min Price` FROM product_providers AS ps JOIN products AS p ON ps.products_id = p.id JOIN providers AS s ON ps.providers_id = s.id JOIN category as c on c.id = p.category_id WHERE c.name =" + category + " GROUP BY p.name" + " limit " + limit + " OFFSET " + offset
    connection.query(query, function (error, results, fields) {
        if (error) throw error;
        var jsonResult = {
            'items_page_count': results.length,
            'page_number': page,
            'Items': results
        }

        var myJsonString = JSON.parse(JSON.stringify(jsonResult));
        res.statusMessage = "Products for page " + page;
        res.statusCode = 200;
        res.json(myJsonString);
        res.end();
    })
}

exports.getFeatured = (req, res) => {
    const product = req.params.product
    const query = 'UPDATE products JOIN category ON products.category_id = category.id SET `featured` = IF(featured = 0, 1, 0) WHERE `products`.`name` = ' + product
    connection.query(query, function (error, results, fields) {
        if (error) throw error;
        var jsonResult = {
            'Items': results
        }
        var myJsonString = JSON.parse(JSON.stringify(jsonResult));
        res.statusCode = 200;
        res.json(myJsonString);
        res.end();
    })
}