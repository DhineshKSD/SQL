USE [Medical_Inventory]
GO
/****** Object:  StoredProcedure [dbo].[DetailedView]    Script Date: 18-11-2019 20:46:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DetailedView] @Product_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Select Product.Product_id,Category.Category_type,Supplier_Items.Supplier_id,Supplier.supplier_name,Product.product_name,Product.product_cost,Max(Product_Stock.quantity_in_stock) as Initial_Stock,Min(Product_Stock.quantity_in_stock) as Available_Stock,Stock_Location.column_location,Stock_Location.row_location,Product.manufacturing_date,Product.expiry_date 
from Product
Join Product_Stock on Product.Product_id = Product_Stock.Product_id
Join Category on Product.Category_id = Category.Category_id
Join Supplier_Items on Product.Product_id = Supplier_Items.Product_id
Join Supplier on Supplier_Items.Supplier_id = Supplier.Supplier_id 
Join Stock_Location on Product.Product_id = Stock_Location.Product_id
Where Product.Product_id = @Product_id
Group by Product.Product_id,Category.Category_type,Supplier_Items.Supplier_id,Supplier.supplier_name,Product.product_name,Product.product_cost,Stock_Location.column_location,Stock_Location.row_location,Product.manufacturing_date,Product.expiry_date  

END
