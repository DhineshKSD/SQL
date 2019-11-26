Select Product.Product_id,Supplier_Items.Supplier_id,Supplier.supplier_name,Category.Category_id,Category.Category_type,Product.product_name,Max(Product_Stock.quantity_in_stock) as Initial_Stock,Min(Product_Stock.quantity_in_stock) as Available_Stock, Product.manufacturing_date,Product.expiry_date,Stock_Return.return_quantity,Stock_Return.return_date
from Product
Join Product_Stock on Product.Product_id = Product_Stock.Product_id
Join Category on Product.Category_id = Category.Category_id
Join Supplier_Items on Product.Product_id = Supplier_Items.Product_id
Join Supplier on Supplier_Items.Supplier_id = Supplier.Supplier_id 
Join Stock_Return on Product_Stock.Product_id = Stock_Return.Product_Stock_id
Group by Product.Product_id,Supplier_Items.Supplier_id,Supplier.supplier_name,Category.Category_id,Category.Category_type,Product.product_name,Product.manufacturing_date,Product.expiry_date,Stock_Return.return_quantity,Stock_Return.return_date