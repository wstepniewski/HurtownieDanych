-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 19:10:08.521

-- tables
-- Table: Dim_Rating
CREATE TABLE Dim_Rating (
    id int  NOT NULL,
    employee_id int  NOT NULL,
    rating int  NOT NULL,
    CONSTRAINT Dim_Rating_pk PRIMARY KEY  (id)
);

-- Table: Fact_Employee
CREATE TABLE Fact_Employee (
    id int  NOT NULL,
    pesel int  NOT NULL,
    address varchar(100)  NOT NULL,
    salary decimal(5,2)  NOT NULL,
    CONSTRAINT Fact_Employee_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: Dim_Rating_Fact_Employee (table: Dim_Rating)
ALTER TABLE Dim_Rating ADD CONSTRAINT Dim_Rating_Fact_Employee
    FOREIGN KEY (employee_id)
    REFERENCES Fact_Employee (id);

-- End of file.

