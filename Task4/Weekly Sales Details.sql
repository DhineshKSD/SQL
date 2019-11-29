/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Week,product_name,Category_type,SUM(Sales) Sales
FROM
(Select Product.product_name,Category.Category_type,Datepart(Week,sale_date) Week,sum(sale_quantity) Sales
FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Join Category on Product.Category_id = Category.Category_id
GROUP BY  Product.product_name,Category.Category_type,sale_date
ORDER BY  Product.product_name,Category.Category_type,Week
offset 0 rows) Sales
GROUP BY Week,product_name,Category_type
 




