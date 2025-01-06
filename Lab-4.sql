--Part – A
--1. Write a function to print "hello world".
CREATE OR ALTER FUNCTION FN_HelloWorld
()
RETURNS VARCHAR(20)
AS 
BEGIN
	RETURN 'HELLO WORLD'
END;

SELECT dbo.FN_HelloWorld()

--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_Addition
(
	@A INT,
	@B INT
)
RETURNS INT
AS 
BEGIN
	RETURN @A + @B
END

SELECT dbo.FN_Addition(5,5)
--3. Write a function to check whether the given number is ODD or EVEN.
CREATE OR ALTER FUNCTION FN_ODD_EVEN
(
	@N INT
)
RETURNS VARCHAR(200)
AS 
BEGIN
	IF(@N % 2 != 0)
		RETURN 'ODD'

	RETURN 'EVEN'
END;

SELECT dbo.FN_ODD_EVEN(8)
--4. Write a function which returns a table with details of a person whose first name starts with B.
CREATE OR ALTER FUNCTION FN_FNAME_START_B()
RETURNS TABLE
AS 
	RETURN (SELECT * FROM Person
		WHERE FirstName LIKE 'B%')

SELECT * FROM DBO.FN_FNAME_START_B()

--5. Write a function which returns a table with unique first names from the person table.
CREATE OR ALTER FUNCTION FN_FNAME_UNIQUE()
RETURNS TABLE
AS 
	RETURN 
	(
		SELECT DISTINCT(FirstName)
		FROM Person
	)

SELECT * FROM dbo.FN_FNAME_UNIQUE()
--6. Write a function to print number from 1 to N. (Using while loop)
CREATE OR ALTER FUNCTION FN_1_TO_N(@NO INT)
RETURNS VARCHAR(100)
AS 
BEGIN
	DECLARE @MSG VARCHAR(100), @COUNT INT
	SET @MSG = ''
	SET @COUNT = 1
	WHILE(@COUNT<= @NO)
	BEGIN
		SET @MSG = @MSG + ' ' + CAST(@COUNT AS varchar)

		SET @COUNT = @COUNT + 1
	END
	RETURN @MSG
END;

SELECT dbo.FN_1_TO_N(5)
--7. Write a function to find the factorial of a given integer.CREATE OR ALTER FUNCTION FN_FAC(@NO INT) 
RETURNS BIGINT 
AS  
BEGIN  
    DECLARE @FAC BIGINT, @I INT  
    
    SET @FAC = 1  
    SET @I = 1  
    
    WHILE(@I <= @NO)  
    BEGIN  
        SET @FAC = @FAC * @I  
        SET @I = @I + 1  
    END  
    
    RETURN @FAC  
END;

SELECT dbo.FN_FAC(5)

-------------EXTRA------------------
-- Write a function which returns a table with details of a person whose first name starts with B. (WITH USER INPUT)
CREATE OR ALTER FUNCTION FN_FNAME_START_B(@A VARCHAR(100))
RETURNS TABLE
AS 
	RETURN (SELECT * FROM Person
		WHERE FirstName LIKE @A + '%');

SELECT * FROM DBO.FN_FNAME_START_B('B')
