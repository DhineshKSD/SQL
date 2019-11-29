SELECT Sales.Product_id,Product.product_name,Category.category_type,SUM(sale_quantity)as Max_Sold_Qty  
from Product
Join Sales on Product.Product_id=Sales.Product_id
Join Category on Product.Category_id=Category.Category_id
group by Sales.Product_id,Product.product_name,Category.category_type 
having SUM(sale_quantity)= (select Max(qty ) 
   from (select SUM(sale_quantity)  qty 
     from Sales
     group by Sales.Product_id )Sales)