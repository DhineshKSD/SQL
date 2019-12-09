/****** Script for SelectTopNRows command from SSMS  ******/

  SELECT Product.Product_Name,Product.Product_id,Category.Category_type,SUM(Sales.sale_quantity) as Sold_Quantity
  FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Join Category on Product.Category_id = Category.Category_id
  Group by Product.Product_Name,Product.Product_id,Category.Category_type
  order by Sold_Quantity desc
  
  
SELECT week,product_name,Category_type,SUM(Sales) sales
FROM
(Select Product.product_name,Category.Category_type,Datepart(week,sale_date) week,sum(sale_quantity) Sales
FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Join Category on Product.Category_id = Category.Category_id
GROUP BY  Product.product_name,Category.Category_type,sale_date
ORDER BY  Product.product_name,Category.Category_type,week
offset 0 rows) Sales
GROUP BY week,product_name,Category_type