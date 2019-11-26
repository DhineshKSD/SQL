-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Supplier_Selling_Details @Supplier_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Category.category_type,Product.product_name
	  FROM Product
	  Join Supplier_Items on Product.Product_id=Supplier_Items.Product_id
	  Join Supplier on Supplier_Items.Supplier_id=Supplier.Supplier_id
	  Join Category on Category.Category_id=Product.Category_id
	  Where Supplier.Supplier_id= @Supplier_id
	  Group by Category.category_type,Product.product_name
  
  
END
GO
