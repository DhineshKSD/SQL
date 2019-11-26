/****** Script for SelectTopNRows command from SSMS  ******/

  SELECT Product.Product_Name,Product.Product_id,Category.Category_type,SUM(Sales.sale_quantity) as Sold_Quantity
  FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Join Category on Product.Category_id = Category.Category_id
  Group by Product.Product_Name,Product.Product_id,Category.Category_type
  order by Sold_Quantity desc
  
  
