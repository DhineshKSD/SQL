SELECT
FirstName,
EmailAddress
FROM
Customer
WHERE
CompanyName = 'Bike World';


SELECT
CompanyName
FROM
Customer
JOIN
CustomerAddress
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN
Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE
Address.City = 'Dallas';


SELECT
Count(*) No_of_Items
FROM
SalesOrderDetail
JOIN
Product
ON SalesOrderDetail.ProductID = Product.ProductID
WHERE
Product.ListPrice > 1000;


SELECT
Customer.CompanyName
FROM
SalesOrderHeader
JOIN
Customer
ON SalesOrderHeader.CustomerID = Customer.CustomerID
WHERE
SalesOrderHeader.SubTotal + SalesOrderHeader.TaxAmt + SalesOrderHeader.Freight > 100000;


SELECT
  SalesOrderID,
  UnitPrice
FROM
  SalesOrderDetail
WHERE
  OrderQty = 1;


SELECT
Product.name, Customer.CompanyName
FROM
ProductModel
JOIN
Product
ON ProductModel.ProductModelID = Product.ProductModelID
JOIN
SalesOrderDetail
ON SalesOrderDetail.ProductID = Product.ProductID
JOIN
SalesOrderHeader
ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
JOIN
Customer
ON SalesOrderHeader.CustomerID = Customer.CustomerID
WHERE
ProductModel.Name = 'Racing Socks';


SELECT
ProductDescription.Description
FROM
Product
JOIN
ProductModel
ON Product.ProductModelID = ProductModel.ProductModelID
  
JOIN
ProductModelProductDescription
ON ProductModel.ProductModelID = ProductModelProductDescription.ProductModelID

JOIN
ProductDescription ON ProductModelProductDescription.ProductDescriptionID = ProductDescription.ProductDescriptionID 
  
WHERE
ProductModelProductDescription.culture = 'fr'
AND Product.ProductID = '736';


SELECT
SUM(SalesOrderDetail.OrderQty) as Sold_Count
FROM
ProductCategory
JOIN
Product
ON ProductCategory.ProductCategoryID = Product.ProductCategoryID
JOIN
SalesOrderDetail
ON Product.ProductID = SalesOrderDetail.ProductID
JOIN
SalesOrderHeader
ON SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesorderID
JOIN
Address
ON SalesOrderHeader.ShipToAddressID = Address.AddressID
WHERE
Address.City = 'London'
AND ProductCategory.Name = 'Cranksets';


SELECT
Product.Name,
SUM(SalesOrderDetail.OrderQty * SalesOrderDetail.UnitPrice) AS Total_Sale_Value
FROM
Product
JOIN
SalesOrderDetail
ON Product.ProductID = SalesOrderDetail.ProductID
GROUP BY
Product.Name
ORDER BY
Total_Sale_Value DESC;


SELECT
Customer.CompanyName,
MAX(CASE WHEN AddressType = 'Main Office' THEN AddressLine1 ELSE '' END) AS 'Main Office Address',
MAX(CASE WHEN AddressType = 'Shipping' THEN AddressLine1 ELSE '' END) AS 'Shipping Address'
FROM
Customer
JOIN
CustomerAddress
ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN
Address
ON CustomerAddress.AddressID = Address.AddressID
WHERE
Address.City = 'Dallas'
GROUP BY
Customer.CompanyName;
