/****** Script for SelectTopNRows command from SSMS  ******/
  SELECT sales.Product_id,Product.product_name,Sales.sale_quantity
  FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Where Sales.sale_date = '2019/11/07'
  Group by sales.Product_id,Product.product_name,Sales.sale_quantity


 /****** SELECT sales.sale_date,SUM(sale_quantity)as Sold_Quantity
from Product
Join Sales on Product.Product_id=Sales.Product_id
group by sales.sale_date
having SUM(sale_quantity)= (select Max(qty ) 
   from (select SUM(sale_quantity)  qty 
     from Sales
     group by sales.sale_date ) tab)  ******/
  
  
