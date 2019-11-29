Create VIEW [Detailed_Product] AS
Select Product.Product_id,Category.Category_type,Supplier_Items.Supplier_id,Supplier.supplier_name,Product.product_name,Product.product_cost,Max(Product_Stock.quantity_in_stock) as Initial_Stock,Min(Product_Stock.quantity_in_stock) as Available_Stock,Stock_Location.column_location,Stock_Location.row_location,Product.manufacturing_date,Product.expiry_date 
from Product
Join Product_Stock on Product.Product_id = Product_Stock.Product_id
Join Category on Product.Category_id = Category.Category_id
Join Supplier_Items on Product.Product_id = Supplier_Items.Product_id
Join Supplier on Supplier_Items.Supplier_id = Supplier.Supplier_id 
Join Stock_Location on Product.Product_id = Stock_Location.Product_id
Group by Product.Product_id,Category.Category_type,Supplier_Items.Supplier_id,Supplier.supplier_name,Product.product_name,Product.product_cost,Stock_Location.column_location,Stock_Location.row_location,Product.manufacturing_date,Product.expiry_date  


SELECT * FROM [Detailed_Product];