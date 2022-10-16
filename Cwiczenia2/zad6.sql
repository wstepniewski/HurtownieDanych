-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 19:17:19.433

-- tables
-- Table: Dim_Product
CREATE TABLE Dim_Product (
    id int  NOT NULL,
    name varchar(50)  NOT NULL,
    brand varchar(50)  NOT NULL,
    quantity int  NOT NULL,
    CONSTRAINT Dim_Product_pk PRIMARY KEY  (id)
);

-- Table: Dim_Warehouse
CREATE TABLE Dim_Warehouse (
    id int  NOT NULL,
    address varchar(100)  NOT NULL,
    country varchar(30)  NOT NULL,
    CONSTRAINT Dim_Warehouse_pk PRIMARY KEY  (id)
);

-- Table: Fact_Warehouse_State
CREATE TABLE Fact_Warehouse_State (
    id int  NOT NULL,
    date date  NOT NULL,
    product_id int  NOT NULL,
    warehouse_id int  NOT NULL,
    CONSTRAINT Fact_Warehouse_State_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: Fact_Warehouse_State_Dim_Product (table: Fact_Warehouse_State)
ALTER TABLE Fact_Warehouse_State ADD CONSTRAINT Fact_Warehouse_State_Dim_Product
    FOREIGN KEY (product_id)
    REFERENCES Dim_Product (id);

-- Reference: Fact_Warehouse_State_Dim_Warehouse (table: Fact_Warehouse_State)
ALTER TABLE Fact_Warehouse_State ADD CONSTRAINT Fact_Warehouse_State_Dim_Warehouse
    FOREIGN KEY (warehouse_id)
    REFERENCES Dim_Warehouse (id);

-- End of file.

