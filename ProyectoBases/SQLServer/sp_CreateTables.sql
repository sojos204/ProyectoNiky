USE [IF5100_2022_DATAWAREHOUSE_NIKY]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateTables]    Script Date: 05/06/2022 11:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Description:	Vuelve a crear las tablas
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateTables]
AS
BEGIN
	CREATE TABLE SALES.DIM_Products
	(
		Product_id INT PRIMARY KEY NOT NULL,
		Name_Product VARCHAR(30) NOT NULL,
		Price NUMERIC(6,2) NOT NULL
	)

	CREATE TABLE SALES.DIM_Payment_Method
	(
		Payment_Method_id INT PRIMARY KEY NOT NULL,
		Paid_In_Cash BIT NOT NULL,
		Paid_Type_Description VARCHAR(50) NOT NULL
	)

	CREATE TABLE SALES.DIM_DATES
	(
		Sales_Head_Date_id INT PRIMARY KEY NOT NULL,
		Date_Of_Sale DATE NOT NULL,
		Date_Year VARCHAR(50) NOT NULL,
		Date_Month VARCHAR(50) NOT NULL
	)

	CREATE TABLE SALES.FACT_SALES
	(
		Id INT PRIMARY KEY NOT NULL,
		Product_id INT NOT NULL,
		Payment_Method_id INT NOT NULL,
		Sales_Head_Date_id INT NOT NULL,
		Amount_Of_Sales INT NOT NULL DEFAULT(0),
		SubTotal_Price NUMERIC(9,2) NOT NULL,
		Total_Price NUMERIC(9,2) NOT NULL,
		FOREIGN KEY (Product_id) REFERENCES SALES.DIM_Products(Product_id),
		FOREIGN KEY (Payment_Method_id) REFERENCES SALES.DIM_Payment_Method(Payment_Method_id),
		FOREIGN KEY (Sales_Head_Date_id) REFERENCES SALES.DIM_DATES(Sales_Head_Date_id)
	)
END
