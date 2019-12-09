  /****** Script for SelectTopNRows command from SSMS  ******/
Create VIEW [Product_Location] AS

SELECT Product.Product_id,Category.category_type,Product.Product_Name,column_location,row_location
  FROM Product
  Join Category on Category.Category_id=Product.Category_id
  Join Stock_Location on Stock_Location.Product_id=Product.Product_id
  Group by Product.Product_id,Category.category_type,Product.Product_Name,column_location,row_location

  SELECT * FROM [Product_Location];