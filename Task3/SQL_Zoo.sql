/*
Show the first name and the email address of customer with CompanyName 'Bike World'
*/
SELECT
FirstName,
EmailAddress
FROM
Customer
WHERE
CompanyName = 'Bike World';


/*
Show the CompanyName for all customers with an address in City 'Dallas'.
*/
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


/*
How many items with ListPrice more than $1000 have been sold?
*/
SELECT
Count(*) No_of_Items
FROM
SalesOrderDetail
JOIN
Product
ON SalesOrderDetail.ProductID = Product.ProductID
WHERE
Product.ListPrice > 1000;


/*
Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.
*/
SELECT
Customer.CompanyName
FROM
SalesOrderHeader
JOIN
Customer
ON SalesOrderHeader.CustomerID = Customer.CustomerID
WHERE
SalesOrderHeader.SubTotal + SalesOrderHeader.TaxAmt + SalesOrderHeader.Freight > 100000;


/*
A "Single Item Order" is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.
*/
SELECT
  SalesOrderID,
  UnitPrice
FROM
  SalesOrderDetail
WHERE
  OrderQty = 1;


/*
Where did the racing socks go? List the product name and the CompanyName for all Customers who ordered ProductModel 'Racing Socks'.
*/
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


/*
Show the product description for culture 'fr' for product with ProductID 736.
*/
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


/*
How many products in ProductCategory 'Cranksets' have been sold to an address in 'London'?
*/
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


/*
Show the best selling item by value.
*/
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


/*
For every customer with a 'Main Office' in Dallas show AddressLine1 of the 'Main Office' and AddressLine1 of the 'Shipping' address - if there is no shipping address leave it blank. Use one row per customer.
*/
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
