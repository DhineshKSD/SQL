-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-11-28 13:04:45.636

-- tables
-- Table: Category
CREATE TABLE Category (
    Category_id int  NOT NULL,
    category_code varchar(30)  NOT NULL,
    category_type varchar(30)  NOT NULL,
    category_description nvarchar(max)  NOT NULL,
    CONSTRAINT Category_pk PRIMARY KEY  (Category_id)
);

-- Table: Product
CREATE TABLE Product (
    Product_id int  NOT NULL,
    Category_id int  NOT NULL,
    product_code varchar(50)  NOT NULL,
    product_name varchar(80)  NOT NULL,
    product_description nvarchar(max)  NOT NULL,
    product_cost float(5)  NOT NULL,
    manufacturing_date date  NOT NULL,
    expiry_date date  NOT NULL,
    reorder_level int  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (Product_id)
);

-- Table: Product_Stock
CREATE TABLE Product_Stock (
    Product_Stock_id int  NOT NULL,
    Product_id int  NOT NULL,
    quantity_in_stock int  NOT NULL,
    stock_date date  NOT NULL,
    CONSTRAINT Product_Stock_pk PRIMARY KEY  (Product_Stock_id)
);

-- Table: Sales
CREATE TABLE Sales (
    Sales_id int  NOT NULL,
    Product_id int  NOT NULL,
    sale_date date  NOT NULL,
    sale_quantity int  NOT NULL,
    CONSTRAINT Sales_pk PRIMARY KEY  (Sales_id)
);

-- Table: Stock_Location
CREATE TABLE Stock_Location (
    Stock_Location_id int  NOT NULL,
    Product_id int  NOT NULL,
    column_location varchar(10)  NOT NULL,
    row_location varchar(10)  NOT NULL,
    CONSTRAINT Stock_Location_pk PRIMARY KEY  (Stock_Location_id)
);

-- Table: Stock_Reorder
CREATE TABLE Stock_Reorder (
    Stock_Reorder_id int  NOT NULL,
    Product_Stock_id int  NOT NULL,
    reorder_date date  NOT NULL,
    reorder_quantity int  NOT NULL,
    CONSTRAINT Stock_Reorder_pk PRIMARY KEY  (Stock_Reorder_id)
);

-- Table: Stock_Return
CREATE TABLE Stock_Return (
    Stock_Return_id int  NOT NULL,
    Product_Stock_id int  NOT NULL,
    return_date date  NOT NULL,
    return_quantity int  NOT NULL,
    CONSTRAINT Stock_Return_pk PRIMARY KEY  (Stock_Return_id)
);

-- Table: Supplier
CREATE TABLE Supplier (
    Supplier_id int  NOT NULL,
    supplier_name varchar(50)  NOT NULL,
    supplier_contact varchar(50)  NOT NULL,
    supplier_email varchar(50)  NOT NULL,
    supplier_address nvarchar(max)  NOT NULL,
    city varchar(30)  NOT NULL,
    state varchar(30)  NOT NULL,
    pincode varchar(30)  NOT NULL,
    CONSTRAINT Supplier_pk PRIMARY KEY  (Supplier_id)
);

-- Table: Supplier_Items
CREATE TABLE Supplier_Items (
    Supplier_Items_id int  NOT NULL,
    Supplier_id int  NOT NULL,
    Product_id int  NOT NULL,
    CONSTRAINT Supplier_Items_pk PRIMARY KEY  (Supplier_Items_id)
);

-- foreign keys
-- Reference: Commodity_Items_Category (table: Product)
ALTER TABLE Product ADD CONSTRAINT Commodity_Items_Category
    FOREIGN KEY (Category_id)
    REFERENCES Category (Category_id);

-- Reference: Product_Stock_Product (table: Product_Stock)
ALTER TABLE Product_Stock ADD CONSTRAINT Product_Stock_Product
    FOREIGN KEY (Product_id)
    REFERENCES Product (Product_id);

-- Reference: Re_Order_Commodity_Stock (table: Stock_Reorder)
ALTER TABLE Stock_Reorder ADD CONSTRAINT Re_Order_Commodity_Stock
    FOREIGN KEY (Product_Stock_id)
    REFERENCES Product_Stock (Product_Stock_id);

-- Reference: Return_Commodity_Stock (table: Stock_Return)
ALTER TABLE Stock_Return ADD CONSTRAINT Return_Commodity_Stock
    FOREIGN KEY (Product_Stock_id)
    REFERENCES Product_Stock (Product_Stock_id);

-- Reference: Sales_Product (table: Sales)
ALTER TABLE Sales ADD CONSTRAINT Sales_Product
    FOREIGN KEY (Product_id)
    REFERENCES Product (Product_id);

-- Reference: Stock_Location_Commodity_Items (table: Stock_Location)
ALTER TABLE Stock_Location ADD CONSTRAINT Stock_Location_Commodity_Items
    FOREIGN KEY (Product_id)
    REFERENCES Product (Product_id);

-- Reference: Supplier_Items_Commodity_Items (table: Supplier_Items)
ALTER TABLE Supplier_Items ADD CONSTRAINT Supplier_Items_Commodity_Items
    FOREIGN KEY (Product_id)
    REFERENCES Product (Product_id);

-- Reference: Supplier_Items_Supplier (table: Supplier_Items)
ALTER TABLE Supplier_Items ADD CONSTRAINT Supplier_Items_Supplier
    FOREIGN KEY (Supplier_id)
    REFERENCES Supplier (Supplier_id);

-- End of file.

