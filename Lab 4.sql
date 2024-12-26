--Note: for Table valued function use tables of Lab-2 

----------------------------------------------Part – A------------------------------------------------------


--1. Write a function to print "hello world".

CREATE OR ALTER FUNCTION FN_HELLOWORLD()
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'Hello World'
END

SELECT dbo.FN_HELLOWORLD()

--2. Write a function which returns addition of two numbers.

CREATE OR ALTER FUNCTION FN_ADDITION_OF_TWO_NO(
		@N1 INT,
		@N2 INT
)
RETURNS INT
AS
BEGIN
	RETURN @N1+@N2
END

SELECT dbo.FN_ADDITION_OF_TWO_NO(10,20) AS ADDITION

   ----------OR--------

CREATE OR ALTER FUNCTION FN_ADDITION_OF_TWO_NO(
		@N1 INT,
		@N2 INT
)
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT
	SET @SUM = @N1+@N2
	RETURN @SUM
END

SELECT dbo.FN_ADDITION_OF_TWO_NO(10,20) AS ADDITION

--3. Write a function to check whether the given number is ODD or EVEN.

CREATE OR ALTER FUNCTION FN_ODD_OR_EVEN(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50)
	IF @NO%2=0
		SET @MSG='NUMBER IS EVEN'
	ELSE 
		SET @MSG='NUMBER IS ODD'
	RETURN @MSG
END

SELECT dbo.FN_ODD_OR_EVEN(6)


--4. Write a function which returns a table with details of a person whose first name starts with B.

CREATE OR ALTER FUNCTION FN_PERSON_DETAILS()
RETURNS TABLE
AS
	RETURN (SELECT * FROM Person where FirstName like 'B%')

SELECT * FROM dbo.FN_PERSON_DETAILS()
SELECT * FROM Person

--5. Write a function which returns a table with unique first names from the person table. 

CREATE OR ALTER FUNCTION FN_PERSON_unique()
RETURNS TABLE
AS
	RETURN (SELECT DISTINCT FirstName FROM Person)

SELECT * FROM dbo.FN_PERSON_unique()
SELECT * FROM Person

--6. Write a function to print number from 1 to N. (Using while loop) 

CREATE OR ALTER FUNCTION FN_1_to_n(
		@NO INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @MSG VARCHAR(50),@count int
	SET @MSG=''
	SET @count=1
	while (@count<=@NO)
	begin
		set @MSG=@MSG+' '+CAST(@count AS varchar(100))
		SET @count=@count+1
	end
	RETURN @MSG
END

SELECT dbo.FN_1_to_n(10)

--7. Write a function to find the factorial of a given integer. 

CREATE OR ALTER FUNCTION FN_FACTORIAL(
		@NO INT
)
RETURNS INT
AS
BEGIN
	DECLARE @FAC int
	SET @FAC=1
	while (@NO>1)
	begin
		set @FAC=@FAC*@NO
		SET @NO=@NO-1
	end
	RETURN @FAC
END

SELECT dbo.FN_FACTORIAL(5)

-----------------------------------------------Part – B---------------------------------------------------- 
--8. Write a function to compare two integers and return the comparison result. (Using Case statement) 

CREATE OR ALTER FUNCTION FN_COMPARISON(
		@N1 INT,
		@N2 INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @MSG VARCHAR(100)
	SET @MSG=CASE
				wheN (@N1=@N2) THEN 'BOATH ARE SAME'
				wheN (@N1>@N2) THEN 'N1 IS MAX'
				wheN (@N1<@N2) THEN 'N2 IS MAX'
				ELSE 'INVALID NUMBER'
				END
	RETURN @MSG
END

SELECT dbo.FN_COMPARISON(10,10)

--9. Write a function to print the sum of even numbers between 1 to 20. 

CREATE OR ALTER FUNCTION FN_SUM_OF_ODD_OR_EVEN()
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT,@I INT
	SET @SUM=0
	SET @I=1
	WHILE (@I<=20)
	BEGIN
		IF(@I%2=0)
			SET @SUM=@SUM+@I
		SET @I=@I+1
	END
	RETURN @SUM
END

SELECT dbo.FN_SUM_OF_ODD_OR_EVEN()


--10. Write a function that checks if a given string is a palindrome

CREATE OR ALTER FUNCTION FN_PALINDROM_CHECK(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @TEMP INT,@REVERSE INT
	SET @REVERSE=0
	SET @TEMP=@NO
	WHILE @TEMP>0
	BEGIN
		SET @REVERSE=@REVERSE*10+@TEMP%10
		SET @TEMP=@TEMP/10
	END
	IF(@NO=@REVERSE)
		RETURN 'GIVEN NUMBER IS PALINDROM'
	ELSE
		RETURN 'GIVEN NUMBER IS NOT PALINDROM'
	RETURN 'NOT VALID'
END

SELECT dbo.FN_PALINDROM_CHECK(121)

---------------------------------------------------Part – C----------------------------------------------------- 
--11. Write a function to check whether a given number is prime or not. 

CREATE OR ALTER FUNCTION FN_PRIME_CHECK(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50),@COUNT INT
	SET @COUNT=1
	IF @NO%2=0
		SET @COUNT=@COUNT+1
	ELSE IF @COUNT>2
		SET @MSG='NUMBER IS NOT PRIME'
	ELSE
		SET @MSG='NUMBER IS PRIME'
RETURN @MSG
END

SELECT dbo.FN_PRIME_CHECK(5)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 

--Note: for Table valued function use tables of Lab-2 

----------------------------------------------Part – A------------------------------------------------------


--1. Write a function to print "hello world".

CREATE OR ALTER FUNCTION FN_HELLOWORLD()
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'Hello World'
END

SELECT dbo.FN_HELLOWORLD()

--2. Write a function which returns addition of two numbers.

CREATE OR ALTER FUNCTION FN_ADDITION_OF_TWO_NO(
		@N1 INT,
		@N2 INT
)
RETURNS INT
AS
BEGIN
	RETURN @N1+@N2
END

SELECT dbo.FN_ADDITION_OF_TWO_NO(10,20) AS ADDITION

   ----------OR--------

CREATE OR ALTER FUNCTION FN_ADDITION_OF_TWO_NO(
		@N1 INT,
		@N2 INT
)
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT
	SET @SUM = @N1+@N2
	RETURN @SUM
END

SELECT dbo.FN_ADDITION_OF_TWO_NO(10,20) AS ADDITION

--3. Write a function to check whether the given number is ODD or EVEN.

CREATE OR ALTER FUNCTION FN_ODD_OR_EVEN(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50)
	IF @NO%2=0
		SET @MSG='NUMBER IS EVEN'
	ELSE 
		SET @MSG='NUMBER IS ODD'
	RETURN @MSG
END

SELECT dbo.FN_ODD_OR_EVEN(6)


--4. Write a function which returns a table with details of a person whose first name starts with B.

CREATE OR ALTER FUNCTION FN_PERSON_DETAILS()
RETURNS TABLE
AS
	RETURN (SELECT * FROM Person where FirstName like 'B%')

SELECT * FROM dbo.FN_PERSON_DETAILS()
SELECT * FROM Person

--5. Write a function which returns a table with unique first names from the person table. 

CREATE OR ALTER FUNCTION FN_PERSON_unique()
RETURNS TABLE
AS
	RETURN (SELECT DISTINCT FirstName FROM Person)

SELECT * FROM dbo.FN_PERSON_unique()
SELECT * FROM Person

--6. Write a function to print number from 1 to N. (Using while loop) 

CREATE OR ALTER FUNCTION FN_1_to_n(
		@NO INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @MSG VARCHAR(50),@count int
	SET @MSG=''
	SET @count=1
	while (@count<=@NO)
	begin
		set @MSG=@MSG+' '+CAST(@count AS varchar(100))
		SET @count=@count+1
	end
	RETURN @MSG
END

SELECT dbo.FN_1_to_n(10)

--7. Write a function to find the factorial of a given integer. 

CREATE OR ALTER FUNCTION FN_FACTORIAL(
		@NO INT
)
RETURNS INT
AS
BEGIN
	DECLARE @FAC int
	SET @FAC=1
	while (@NO>1)
	begin
		set @FAC=@FAC*@NO
		SET @NO=@NO-1
	end
	RETURN @FAC
END

SELECT dbo.FN_FACTORIAL(5)

-----------------------------------------------Part – B---------------------------------------------------- 
--8. Write a function to compare two integers and return the comparison result. (Using Case statement) 

CREATE OR ALTER FUNCTION FN_COMPARISON(
		@N1 INT,
		@N2 INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @MSG VARCHAR(100)
	SET @MSG=CASE
				wheN (@N1=@N2) THEN 'BOATH ARE SAME'
				wheN (@N1>@N2) THEN 'N1 IS MAX'
				wheN (@N1<@N2) THEN 'N2 IS MAX'
				ELSE 'INVALID NUMBER'
				END
	RETURN @MSG
END

SELECT dbo.FN_COMPARISON(10,10)

--9. Write a function to print the sum of even numbers between 1 to 20. 

CREATE OR ALTER FUNCTION FN_SUM_OF_ODD_OR_EVEN()
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT,@I INT
	SET @SUM=0
	SET @I=1
	WHILE (@I<=20)
	BEGIN
		IF(@I%2=0)
			SET @SUM=@SUM+@I
		SET @I=@I+1
	END
	RETURN @SUM
END

SELECT dbo.FN_SUM_OF_ODD_OR_EVEN()


--10. Write a function that checks if a given string is a palindrome

CREATE OR ALTER FUNCTION FN_PALINDROM_CHECK(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @TEMP INT,@REVERSE INT
	SET @REVERSE=0
	SET @TEMP=@NO
	WHILE @TEMP>0
	BEGIN
		SET @REVERSE=@REVERSE*10+@TEMP%10
		SET @TEMP=@TEMP/10
	END
	IF(@NO=@REVERSE)
		RETURN 'GIVEN NUMBER IS PALINDROM'
	ELSE
		RETURN 'GIVEN NUMBER IS NOT PALINDROM'
	RETURN 'NOT VALID'
END

SELECT dbo.FN_PALINDROM_CHECK(121)

---------------------------------------------------Part – C----------------------------------------------------- 
--11. Write a function to check whether a given number is prime or not. 

CREATE OR ALTER FUNCTION FN_PRIME_CHECK(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50),@COUNT INT
	SET @COUNT=1
	IF @NO%2=0
		SET @COUNT=@COUNT+1
	ELSE IF @COUNT>2
		SET @MSG='NUMBER IS NOT PRIME'
	ELSE
		SET @MSG='NUMBER IS PRIME'
RETURN @MSG
END

SELECT dbo.FN_PRIME_CHECK(5)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 

--Note: for Table valued function use tables of Lab-2 

----------------------------------------------Part – A------------------------------------------------------


--1. Write a function to print "hello world".

CREATE OR ALTER FUNCTION FN_HELLOWORLD()
RETURNS VARCHAR(100)
AS
BEGIN
	RETURN 'Hello World'
END

SELECT dbo.FN_HELLOWORLD()

--2. Write a function which returns addition of two numbers.

CREATE OR ALTER FUNCTION FN_ADDITION_OF_TWO_NO(
		@N1 INT,
		@N2 INT
)
RETURNS INT
AS
BEGIN
	RETURN @N1+@N2
END

SELECT dbo.FN_ADDITION_OF_TWO_NO(10,20) AS ADDITION

   ----------OR--------

CREATE OR ALTER FUNCTION FN_ADDITION_OF_TWO_NO(
		@N1 INT,
		@N2 INT
)
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT
	SET @SUM = @N1+@N2
	RETURN @SUM
END

SELECT dbo.FN_ADDITION_OF_TWO_NO(10,20) AS ADDITION

--3. Write a function to check whether the given number is ODD or EVEN.

CREATE OR ALTER FUNCTION FN_ODD_OR_EVEN(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50)
	IF @NO%2=0
		SET @MSG='NUMBER IS EVEN'
	ELSE 
		SET @MSG='NUMBER IS ODD'
	RETURN @MSG
END

SELECT dbo.FN_ODD_OR_EVEN(6)


--4. Write a function which returns a table with details of a person whose first name starts with B.

CREATE OR ALTER FUNCTION FN_PERSON_DETAILS()
RETURNS TABLE
AS
	RETURN (SELECT * FROM Person where FirstName like 'B%')

SELECT * FROM dbo.FN_PERSON_DETAILS()
SELECT * FROM Person

--5. Write a function which returns a table with unique first names from the person table. 

CREATE OR ALTER FUNCTION FN_PERSON_unique()
RETURNS TABLE
AS
	RETURN (SELECT DISTINCT FirstName FROM Person)

SELECT * FROM dbo.FN_PERSON_unique()
SELECT * FROM Person

--6. Write a function to print number from 1 to N. (Using while loop) 

CREATE OR ALTER FUNCTION FN_1_to_n(
		@NO INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @MSG VARCHAR(50),@count int
	SET @MSG=''
	SET @count=1
	while (@count<=@NO)
	begin
		set @MSG=@MSG+' '+CAST(@count AS varchar(100))
		SET @count=@count+1
	end
	RETURN @MSG
END

SELECT dbo.FN_1_to_n(10)

--7. Write a function to find the factorial of a given integer. 

CREATE OR ALTER FUNCTION FN_FACTORIAL(
		@NO INT
)
RETURNS INT
AS
BEGIN
	DECLARE @FAC int
	SET @FAC=1
	while (@NO>1)
	begin
		set @FAC=@FAC*@NO
		SET @NO=@NO-1
	end
	RETURN @FAC
END

SELECT dbo.FN_FACTORIAL(5)

-----------------------------------------------Part – B---------------------------------------------------- 
--8. Write a function to compare two integers and return the comparison result. (Using Case statement) 

CREATE OR ALTER FUNCTION FN_COMPARISON(
		@N1 INT,
		@N2 INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @MSG VARCHAR(100)
	SET @MSG=CASE
				wheN (@N1=@N2) THEN 'BOATH ARE SAME'
				wheN (@N1>@N2) THEN 'N1 IS MAX'
				wheN (@N1<@N2) THEN 'N2 IS MAX'
				ELSE 'INVALID NUMBER'
				END
	RETURN @MSG
END

SELECT dbo.FN_COMPARISON(10,10)

--9. Write a function to print the sum of even numbers between 1 to 20. 

CREATE OR ALTER FUNCTION FN_SUM_OF_ODD_OR_EVEN()
RETURNS INT
AS
BEGIN
	DECLARE @SUM INT,@I INT
	SET @SUM=0
	SET @I=1
	WHILE (@I<=20)
	BEGIN
		IF(@I%2=0)
			SET @SUM=@SUM+@I
		SET @I=@I+1
	END
	RETURN @SUM
END

SELECT dbo.FN_SUM_OF_ODD_OR_EVEN()


--10. Write a function that checks if a given string is a palindrome

CREATE OR ALTER FUNCTION FN_PALINDROM_CHECK(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @TEMP INT,@REVERSE INT
	SET @REVERSE=0
	SET @TEMP=@NO
	WHILE @TEMP>0
	BEGIN
		SET @REVERSE=@REVERSE*10+@TEMP%10
		SET @TEMP=@TEMP/10
	END
	IF(@NO=@REVERSE)
		RETURN 'GIVEN NUMBER IS PALINDROM'
	ELSE
		RETURN 'GIVEN NUMBER IS NOT PALINDROM'
	RETURN 'NOT VALID'
END

SELECT dbo.FN_PALINDROM_CHECK(121)

---------------------------------------------------Part – C----------------------------------------------------- 
--11. Write a function to check whether a given number is prime or not. 

CREATE OR ALTER FUNCTION FN_PRIME_CHECK(
		@NO INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @MSG VARCHAR(50),@COUNT INT
	SET @COUNT=1
	IF @NO%2=0
		SET @COUNT=@COUNT+1
	ELSE IF @COUNT>2
		SET @MSG='NUMBER IS NOT PRIME'
	ELSE
		SET @MSG='NUMBER IS PRIME'
RETURN @MSG
END

SELECT dbo.FN_PRIME_CHECK(5)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days. 

CREATE OR ALTER FUNCTION FN_DATE_DIFF(
	@STARTDATE VARCHAR(20),
	@ENDDATE VARCHAR(20) 
)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN DATEDIFF(DAY,@STARTDATE,@ENDDATE)
END

SELECT dbo.FN_DATE_DIFF(12-01-1995,13-02-2000)

--13. Write a function which accepts two parameters year & month in integer and returns total days each year.
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991. 

--13. Write a function which accepts two parameters year & month in integer and returns total days each year.
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991. 

--13. Write a function which accepts two parameters year & month in integer and returns total days each year.
--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons. 
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991. 