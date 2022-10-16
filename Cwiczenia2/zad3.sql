-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 18:55:06.362

-- tables
-- Table: Dim_Client
CREATE TABLE Dim_Client (
    id int  NOT NULL,
    NIP int  NOT NULL,
    address varchar(100)  NOT NULL,
    name varchar(50)  NOT NULL,
    CONSTRAINT Dim_Client_pk PRIMARY KEY  (id)
);

-- Table: Dim_Date
CREATE TABLE Dim_Date (
    id int  NOT NULL,
    hour int  NOT NULL,
    day int  NOT NULL,
    month int  NOT NULL,
    CONSTRAINT Dim_Date_pk PRIMARY KEY  (id)
);

-- Table: Dim_Fruit
CREATE TABLE Dim_Fruit (
    id int  NOT NULL,
    category varchar(30)  NOT NULL,
    name varchar(30)  NOT NULL,
    price_per_kg decimal(5,2)  NOT NULL,
    CONSTRAINT Dim_Fruit_pk PRIMARY KEY  (id)
);

-- Table: Dim_Fruit_To_Order
CREATE TABLE Dim_Fruit_To_Order (
    fruit_id int  NOT NULL,
    order_id int  NOT NULL,
    quantity int  NOT NULL,
    Fact_Order_id int  NOT NULL,
    Dim_Fruit_id int  NOT NULL,
    CONSTRAINT Dim_Fruit_To_Order_pk PRIMARY KEY  (fruit_id,order_id)
);

-- Table: Fact_Order
CREATE TABLE Fact_Order (
    id int  NOT NULL,
    total_amount decimal(10,2)  NOT NULL,
    sell_point varchar(100)  NOT NULL,
    Dim_Date_id int  NOT NULL,
    Dim_Client_id int  NOT NULL,
    CONSTRAINT Fact_Order_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: Dim_Fruit_To_Order_Dim_Fruit (table: Dim_Fruit_To_Order)
ALTER TABLE Dim_Fruit_To_Order ADD CONSTRAINT Dim_Fruit_To_Order_Dim_Fruit
    FOREIGN KEY (Dim_Fruit_id)
    REFERENCES Dim_Fruit (id);

-- Reference: Dim_Fruit_To_Order_Fact_Order (table: Dim_Fruit_To_Order)
ALTER TABLE Dim_Fruit_To_Order ADD CONSTRAINT Dim_Fruit_To_Order_Fact_Order
    FOREIGN KEY (Fact_Order_id)
    REFERENCES Fact_Order (id);

-- Reference: Fact_Order_Dim_Client (table: Fact_Order)
ALTER TABLE Fact_Order ADD CONSTRAINT Fact_Order_Dim_Client
    FOREIGN KEY (Dim_Client_id)
    REFERENCES Dim_Client (id);

-- Reference: Fact_Order_Dim_Date (table: Fact_Order)
ALTER TABLE Fact_Order ADD CONSTRAINT Fact_Order_Dim_Date
    FOREIGN KEY (Dim_Date_id)
    REFERENCES Dim_Date (id);

-- End of file.

