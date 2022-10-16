-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 17:56:58.742

-- tables
-- Table: Dim_Client
CREATE TABLE Dim_Client (
    id int  NOT NULL,
    phone_number int  NOT NULL,
    name varchar(30)  NOT NULL,
    surname varchar(30)  NOT NULL,
    address varchar(100)  NOT NULL,
    CONSTRAINT Dim_Client_pk PRIMARY KEY (id)
);

-- Table: Dim_Courier
CREATE TABLE Dim_Courier (
    id int  NOT NULL,
    NIP int  NOT NULL,
    name varchar(30)  NOT NULL,
    address varchar(100)  NOT NULL,
    CONSTRAINT Dim_Courier_pk PRIMARY KEY (id)
);

-- Table: Dim_Product
CREATE TABLE Dim_Product (
    id int  NOT NULL,
    name varchar(50)  NOT NULL,
    ISBN int  NOT NULL,
    publisher varchar(50)  NOT NULL,
    author varchar(50)  NOT NULL,
    title varchar(50)  NOT NULL,
    number_of_pages int  NOT NULL,
    CONSTRAINT Dim_Product_pk PRIMARY KEY (id)
);

-- Table: Fact_Order
CREATE TABLE Fact_Order (
    id int  NOT NULL,
    date date  NOT NULL,
    client_id int  NOT NULL,
    Dim_Courier_id int  NOT NULL,
    product_id int  NOT NULL,
    Dim_Product_id int  NOT NULL,
    Dim_Client_id int  NOT NULL,
    CONSTRAINT Fact_Order_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Fact_Order_Dim_Client (table: Fact_Order)
ALTER TABLE Fact_Order ADD CONSTRAINT Fact_Order_Dim_Client
    FOREIGN KEY (Dim_Client_id)
    REFERENCES Dim_Client (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Fact_Order_Dim_Courier (table: Fact_Order)
ALTER TABLE Fact_Order ADD CONSTRAINT Fact_Order_Dim_Courier
    FOREIGN KEY (Dim_Client_id)
    REFERENCES Dim_Courier (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Fact_Order_Dim_Product (table: Fact_Order)
ALTER TABLE Fact_Order ADD CONSTRAINT Fact_Order_Dim_Product
    FOREIGN KEY (Dim_Product_id)
    REFERENCES Dim_Product (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

