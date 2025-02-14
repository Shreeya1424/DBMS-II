CREATE TABLE EMPLOYEEDETAILS
(
	EmployeeID Int Primary Key,
	EmployeeName Varchar(100) Not Null,
	ContactNo Varchar(100) Not Null,
	Department Varchar(100) Not Null,
	Salary Decimal(10,2) Not Null,
	JoiningDate DateTime Null
)


CREATE TABLE EmployeeLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(100) NOT NULL,
    ActionPerformed VARCHAR(100) NOT NULL,
    ActionDate DATETIME NOT NULL
);

select * from EMPLOYEEDETAILS
select * from EmployeeLogs


--1)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to display the message "Employee record inserted", "Employee record updated", "Employee record deleted"

--------------------------------insert--------------------------------
CREATE OR ALTER TRIGGER TR_PER_INS
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN
	PRINT 'Employee record inserted'
end;

insert into EMPLOYEEDETAILS values(1,'Yash',7016318212,'CSE',80000,2020-07-19)

drop trigger TR_PER_INS

--------------------------------update--------------------------
CREATE  TRIGGER TR_PER_update
ON EMPLOYEEDETAILS
AFTER update
AS
BEGIN
	PRINT 'Employee record updated'
end;

update EMPLOYEEDETAILS
set EmployeeName = 'Prince'
where EmployeeID=1

drop TRIGGER TR_PER_update

--------------------------------------delete--------------------------------

CREATE  TRIGGER TR_PER_delete
ON EMPLOYEEDETAILS
AFTER delete
AS
BEGIN
	PRINT 'Employee record deleted'
end;

delete from EMPLOYEEDETAILS where EmployeeID=1

drop TRIGGER TR_PER_delete


--2)	Create a trigger that fires AFTER INSERT, UPDATE, and DELETE operations on the EmployeeDetails table to log all operations into the EmployeeLog table.

----------------------------insert-----------------------------------

CREATE OR ALTER TRIGGER TR_Emp_INS
ON EMPLOYEEDETAILS
AFTER INSERT
AS
BEGIN  
	declare @EmployeeID INT; 
	declare @EmployeeName varchar(50);
	select @EmployeeID=EmployeeID,@EmployeeName=EmployeeName from inserted
	insert into EmployeeLogs values
	(@EmployeeID,@EmployeeName ,'insertad',GETDATE())
end;

insert into EMPLOYEEDETAILS values(2,'Yash',6354577938,'EC',7000000,'2022-08-24')

 drop TRIGGER TR_Emp_INS

 ------------------------------update--------------------------------------

 CREATE OR ALTER TRIGGER TR_Emp_update_LOG
ON EMPLOYEEDETAILS
AFTER update
AS
BEGIN  
	declare @EmployeeID INT; 
	declare @EmployeeName varchar(50);
	select @EmployeeID=EmployeeID,@EmployeeName=EmployeeName from inserted
	insert into EmployeeLogs values
	(@EmployeeID,@EmployeeName ,'updated',GETDATE())
end;

update EMPLOYEEDETAILS
set EmployeeName='Prince'
where EmployeeID=2

drop TRIGGER TR_Emp_update_LOG

---------------------------------delete---------------------------------------------

CREATE OR ALTER TRIGGER TR_Emp_del_LOG
ON EMPLOYEEDETAILS
AFTER delete
AS
BEGIN  
	declare @EmployeeID INT; 
	declare @EmployeeName varchar(50);
	select @EmployeeID=EmployeeID,@EmployeeName=EmployeeName from deleted
	insert into EmployeeLogs values
	(@EmployeeID,@EmployeeName ,'deleted',GETDATE())
end;

--3)	Create a trigger that fires AFTER INSERT to automatically calculate the joining bonus (10% of the salary) for new employees and update a bonus column in the EmployeeDetails table.

CREATE or ALTER TRIGGER trg_CalculateJoiningBonus
ON EmployeeDetails
AFTER INSERT
AS
BEGIN
    declare @Bonus DECIMAL(10, 2);
    declare @EmployeeID int;
	declare @salary decimal(8,2);
    
	UPDATE EmployeeDetails
    SET @Bonus = Salary*0.10
    WHERE EmployeeID = 2;
END;

drop TRIGGER trg_CalculateJoiningBonus

--4)	Create a trigger to ensure that the JoiningDate is automatically set to the current date if it is NULL during an INSERT operation.


CREATE OR ALTER TRIGGER TR_EmP_ins
ON EMPLOYEEDETAILS
INSTEAD OF INSERT
AS
BEGIN  
	update EMPLOYEEDETAILS
	set JoiningDate=GETDATE()
	from EMPLOYEEDETAILS e
	join inserted i on e.EmployeeID=i.EmployeeID
	where i.JoiningDate is null
end;

drop TRIGGER TR_EmP_ins


--5)	Create a trigger that ensure that ContactNo is valid during insert and update (Like ContactNo length is 10)

CREATE TRIGGER trg_ValidateContactNo
ON EmployeeDetails
after INSERT , UPDATE
AS
BEGIN
    declare @EmployeeID int;
	declare @ContactNo Varchar(100);
	select @EmployeeID=EmployeeID,@ContactNo=ContactNo from inserted
	IF LEN(@ContactNo ) = 10 
		begin
			insert into EMPLOYEEDETAILS values
	(@EmployeeID,@ContactNo ,'insert',GETDATE())
		END
END;



----------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    MovieTitle VARCHAR(255) NOT NULL,
    ReleaseYear INT NOT NULL,
    Genre VARCHAR(100) NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Duration INT NOT NULL
);


CREATE TABLE MoviesLog
(
	LogID INT PRIMARY KEY IDENTITY(1,1),
	MovieID INT NOT NULL,
	MovieTitle VARCHAR(255) NOT NULL,
	ActionPerformed VARCHAR(100) NOT NULL,
	ActionDate	DATETIME  NOT NULL
);

drop table Movies
drop table MoviesLog

--1.	Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the Movies table. For that, log all operations performed on the Movies table into MoviesLog.


CREATE OR ALTER TRIGGER TR_PER_INS
ON Movies
instead of INSERT
AS
BEGIN  
	declare @MovieID INT; 
	declare @MovieTitle varchar(50);
	select @MovieID=MovieID,@MovieTitle=MovieTitle from inserted
	insert into MoviesLog values
	(@MovieID,@MovieTitle ,'insertad',GETDATE())
end;

 insert into Movies values(12,'bahubali',2021,'rajkot',5,3)
 insert into Movies values(3,'namya',2011,'rajkot',15,2)
 insert into Movies values(4,'darshan',2019,'rajkot',1,2)

 drop trigger TR_PER_INS

 select * from Movies
 select * from MoviesLog

 

----------------------------update------------------
CREATE OR ALTER TRIGGER TR_PER_update
ON Movies
instead of update
AS
BEGIN  
	declare @MovieID INT; 
	declare @MovieTitle varchar(50);
	select @MovieID=MovieID,@MovieTitle=MovieTitle from inserted
	insert into MoviesLog values
	(@MovieID,@MovieTitle ,'update',GETDATE())
end;

update Movies
 set MovieTitle='priyanshi'
 where MovieID=3

 drop TRIGGER TR_PER_update

 --------------------------------------delete-------------------------

 CREATE OR ALTER TRIGGER TR_PER_delete
ON Movies
instead of delete
AS
BEGIN  
	declare @MovieID INT; 
	declare @MovieTitle varchar(50);
	select @MovieID=MovieID,@MovieTitle=MovieTitle from deleted
	insert into MoviesLog values
	(@MovieID,@MovieTitle ,'delete',GETDATE())
end;

drop trigger TR_PER_delete
--2.	Create a trigger that only allows to insert movies for which Rating is greater than 5.5 .

CREATE OR ALTER TRIGGER TR_PER_Ratting
ON Movies
instead of insert
AS
BEGIN  
	declare @MovieID INT; 
	declare @MovieTitle varchar(50);
	declare @Rating decimal(8,2);
	select @MovieID=MovieID,@MovieTitle=MovieTitle from inserted
	if @Rating>5.5
	begin
		insert into MoviesLog values
		(@MovieID,@MovieTitle ,'insert',GETDATE())
	end
end;

insert into Movies values(1,'bahubali2',2021,'rajkot',6,3)
insert into Movies values(5,'abcd',2021,'rajkot',4,3)
select * from Movies


drop TRIGGER TR_PER_Ratting

--3.	Create trigger that prevent duplicate 'MovieTitle' of Movies table and log details of it in MoviesLog table.

CREATE OR ALTER TRIGGER TR_PER_update
ON Movies
instead of update
AS
BEGIN  
	declare @MovieID INT; 
	declare @MovieTitle varchar(50);
	declare @ReleaseYear INT;
    declare @Genre VARCHAR(100);
    declare @Rating DECIMAL(3, 1);
    declare @Duration INT;
	select @MovieID=MovieID,@MovieTitle=MovieTitle,@ReleaseYear=ReleaseYear,@Genre=Genre,@Rating=Rating,@Duration=Duration from inserted
	where MovieTitle not in (select MovieTitle from Movies)
end;


--4.	Create trigger that prevents to insert pre-release movies.

CREATE OR ALTER TRIGGER TR_PER_Pre_Release
ON Movies
instead of insert
AS
BEGIN  
	declare @MovieID INT; 
	declare @MovieTitle varchar(50);
	declare @ReleaseYear int;
	select @MovieID=MovieID,@MovieTitle=MovieTitle from inserted
	if @ReleaseYear<DATEDIFF(year,@ReleaseYear,GETDATE())
	begin
		insert into MoviesLog values
		(@MovieID,@MovieTitle ,'insert',GETDATE())
	end
end;
insert into Movies values(7,'bahubali2',2025,'rajkot',6,3)
insert into Movies values(6,'abcd',2021,'rajkot',4,3)

select * from Movies
select * from MoviesLog


drop TRIGGER TR_PER_Pre_Release

--5.Develop a trigger to ensure that the Duration of a movie cannot be updated to a value greater than 120 minutes (2 hours) to prevent unrealistic entries.

CREATE OR ALTER TRIGGER TR_PER_duration
ON Movies
instead of update
AS
BEGIN  
	declare @MovieID INT; 
	declare @MovieTitle varchar(50);
	declare @Duration int;
	select @MovieID=MovieID,@MovieTitle=MovieTitle from inserted
	if @Duration>2
	begin
		insert into MoviesLog values
		(@MovieID,@MovieTitle ,'insert',GETDATE())
	end
end;

drop TRIGGER TR_PER_duration