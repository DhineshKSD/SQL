/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Supplier.Supplier_Name,Supplier.Supplier_Id,Count(Supplier_Items.Supplier_id) as Selling_Product_Count
  FROM Supplier_Items
  Join Supplier on Supplier_Items.Supplier_id=Supplier.Supplier_id
  Group by Supplier.Supplier_name,Supplier.Supplier_Id
  order by Supplier.Supplier_Id ASC
  

