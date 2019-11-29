SELECT Sales.Week,Sales.Product_id,Sales.product_name,Sales.Sales,Inventories.Current_Inventory
From
(SELECT Week,Sales.Product_id,product_name,Category_type,SUM(Sale) Sales
FROM
(Select Sales.Product_id,Product.product_name,Category.Category_type,Datepart(Week,sale_date) Week,sum(sale_quantity) Sale
FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Join Category on Product.Category_id = Category.Category_id
GROUP BY  Sales.Product_id,Product.product_name,Category.Category_type,sale_date
ORDER BY  Sales.product_id,Product.product_name,Category.Category_type,Week
offset 0 rows) Sales
GROUP BY Week,Sales.Product_id,product_name,Category_type)Sales
Join
(SELECT Week,Product_id,product_name,Category_type,min(Inventory) Current_Inventory
FROM
(Select Product_Stock.Product_id,Product.product_name,Category.Category_type,Datepart(Week,stock_date) Week,min(Product_Stock.quantity_in_stock) Inventory
FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Join Product_Stock on Sales.Product_id = Product_Stock.Product_id
  Join Category on Product.Category_id = Category.Category_id
GROUP BY  Product_Stock.Product_id,Product.product_name,Category.Category_type,stock_date
ORDER BY  Product_Stock.Product_id,Product.product_name,Category.Category_type,Week
offset 0 rows) Inventory
GROUP BY Week,Product_id,product_name,Category_type)Inventories
on Sales.week=Inventories.week and Inventories.Product_id=Sales.Product_id


