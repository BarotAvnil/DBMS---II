-- Create the Products table
CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);
-- Insert data into the Products table
INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);


--Part - A
--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
DECLARE @Product_id INT, @Product_Name VARCHAR(100), @Price DECIMAL(10,2);

DECLARE Product_Cursor CURSOR
FOR SELECT * FROM Products;

OPEN Product_Cursor;

FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @Product_id AS Product_id, @Product_Name AS Product_Name, @Price AS Price
		FETCH NEXT FROM Product_Cursor INTO @Product_id, @Product_Name, @Price;
	END;

CLOSE Product_Cursor;
DEALLOCATE Product_Cursor;

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)
DECLARE @ProductID_ProductName VARCHAR(100);

DECLARE Product_Cursor_Fetch CURSOR
FOR SELECT CAST(Product_id AS VARCHAR(50)) + '_' + Product_Name AS ProductID_ProductName FROM Products

OPEN Product_Cursor_Fetch;

FETCH NEXT FROM Product_Cursor_Fetch INTO @ProductID_ProductName

WHILE @@FETCH_STATUS = 0
	BEGIN 
		SELECT @ProductID_ProductName AS ProductID_ProductName
		FETCH NEXT FROM Product_Cursor_Fetch INTO @ProductID_ProductName
	END

CLOSE Product_Cursor_Fetch
DEALLOCATE Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
DECLARE @Product_id INT, @Product_Name VARCHAR(100), @Price DECIMAL(10,2);

DECLARE Product_Cursor_Above_30000 CURSOR
FOR SELECT * FROM Products WHERE Price>30000;

OPEN Product_Cursor_Above_30000;

FETCH NEXT FROM Product_Cursor_Above_30000 INTO @Product_id , @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
	BEGIN 
		SELECT @Product_id AS ID, @Product_Name AS NAME, @Price AS PRICE
		FETCH NEXT FROM Product_Cursor_Above_30000 INTO @Product_id , @Product_Name, @Price;
	END;

CLOSE Product_Cursor_Above_30000;
DEALLOCATE Product_Cursor_Above_30000;
--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
DECLARE @Product_id INT;

DECLARE Product_CursorDelete CURSOR
FOR SELECT Product_id FROM Products;

OPEN Product_CursorDelete;

FETCH NEXT FROM Product_CursorDelete INTO @Product_id;

WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM Products
		WHERE Product_id = @Product_id
		FETCH NEXT FROM Product_CursorDelete INTO @Product_id
	END;

CLOSE Product_CursorDelete;
DEALLOCATE Product_CursorDelete; 

--Part – B
--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases
--the price by 10%.
DECLARE @Product_id INT, @Product_Name VARCHAR(100), @Price DECIMAL(10,2);

DECLARE Product_CursorUpdate CURSOR
FOR SELECT * FROM Products;

OPEN Product_CursorUpdate;

FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Product_Name, @Price;

WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Products
		SET Price = Price+(Price*0.1)
		SELECT @Product_id AS ID, @Product_Name AS NAME, @Price AS PRICE
		FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Product_Name, @Price;
	END;

CLOSE Product_CursorUpdate;
DEALLOCATE Product_CursorUpdate;
--6. Create a Cursor to Rounds the price of each product to the nearest whole number.
DECLARE @Price INT;

DECLARE Price_Round CURSOR
FOR SELECT Price FROM Products

OPEN Price_Round

FETCH NEXT FROM Price_Round INTO @Price;

WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Products
		SET Price = ROUND(Price,0)
		SELECT @Price AS PRICE
		FETCH NEXT FROM Price_Round INTO @Price;
	END;

CLOSE Price_Round;
DEALLOCATE Price_Round;
--SELECT Price FROM Products