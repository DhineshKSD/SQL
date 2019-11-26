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
CREATE PROCEDURE Datewise_Sales @Saledate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT sales.Product_id,Product.product_name,Category.Category_type,Sales.sale_quantity
  FROM Product
  Join Sales on Product.Product_id=Sales.Product_id
  Join Category on Product.Category_id = Category.Category_id
  Where Sales.sale_date = @Saledate 
  Group by sales.Product_id,Product.product_name,Category.Category_type,Sales.sale_quantity
END
GO
