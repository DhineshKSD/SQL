  /****** Script for SelectTopNRows command from SSMS  ******/
Create VIEW [Product_Location] AS

SELECT Product.Product_id,Category.category_type,Product.Product_Name,Product.product_cost,Min(Product_Stock.quantity_in_stock) as Current_Stock,column_location,row_location
FROM Product
Join Category on Category.Category_id=Product.Category_id
Join Stock_Location on Stock_Location.Product_id=Product.Product_id
Join Product_Stock on Product.Product_id = Product_Stock.Product_id
Group by Product.Product_id,Category.category_type,Product.Product_Name,Product.product_cost,column_location,row_location

SELECT * FROM [Product_Location];