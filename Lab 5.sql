CREATE TABLE PersonInfo ( 
	PersonID INT PRIMARY KEY, 
	PersonName VARCHAR(100) NOT NULL, 
	Salary DECIMAL(8,2) NOT NULL, 
	JoiningDate DATETIME NULL, 
	City VARCHAR(100) NOT NULL, 
	Age INT NULL, 
	BirthDate DATETIME NOT NULL 
); 

CREATE TABLE PersonLog ( 
	PLogID int primary key identity(1,1),
	PersonID INT not null, 
	PersonName VARCHAR(100) NOT NULL, 
	Operation VARCHAR(100) NOT NULL, 
	UpdatedDate DATETIME NOT NULL 
); 

------------------------------------------------------------------Part – A--------------------------------------------------------------------------- 
--1. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table to display a message “Record is Affected.”

CREATE OR ALTER TRIGGER TR_PER_INS_UPD_DEL
ON PersonInfo
AFTER INSERT,update,delete
AS
BEGIN
	PRINT 'Record is Affected'
end;

------------------insert----------------------
 insert into PersonInfo values(1,'yash',70000,'2021-01-02','rajkot',22,'2006-07-14')

 ------------------------------update---------------------
 update PersonInfo
 set PersonName='priyanshi'
 where PersonID=2

 ---------------------------delete-----------------------
 delete from PersonInfo where PersonID=2
 -----
 select * from PersonInfo

 drop trigger TR_PER_INS_UPD_DEL


--2. Create a trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog.

------------------insert----------------------

CREATE OR ALTER TRIGGER TR_PER_INS
ON PersonInfo
AFTER INSERT
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	select @PersonID=PersonId,@PersonName=PersonName from inserted
	insert into PersonLog values
	(@PersonID,@PersonName ,'insertad',GETDATE())
end;


 insert into PersonInfo values(12,'rudra',90000,'2021-01-02','rajkot',15,'2012-08-24')

 ------------------------------update---------------------

 CREATE OR ALTER TRIGGER TR_PER_INS
ON PersonInfo
AFTER update
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	select @PersonID=PersonId,@PersonName=PersonName from inserted
	insert into PersonLog values
	(@PersonID,@PersonName ,'updated',GETDATE())
end;

 update PersonInfo
 set PersonName='priyanshi'
 where PersonID=12
 ---------------------------delete-----------------------

 CREATE OR ALTER TRIGGER TR_PER_INS
ON PersonInfo
AFTER delete
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	select @PersonID=PersonId,@PersonName=PersonName from deleted
	insert into PersonLog values
	(@PersonID,@PersonName ,'deleted',GETDATE())
end;

 delete from PersonLog where PersonID=12

 select * from PersonLog

 drop trigger TR_PER_INS

--3. Create an INSTEAD OF trigger that fires on INSERT, UPDATE and DELETE operation on the PersonInfo table. For that, log all operations performed on the person table into PersonLog. 

-----------------------insert-------------------
CREATE OR ALTER TRIGGER TR_PER_INS
ON PersonInfo
instead of INSERT
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	select @PersonID=PersonId,@PersonName=PersonName from inserted
	insert into PersonLog values
	(@PersonID,@PersonName ,'insertad',GETDATE())
end;

 insert into PersonInfo values(12,'rudra',90000,'2021-01-02','rajkot',15,'2012-08-24')
 insert into PersonInfo values(3,'namya',70000,'2021-01-02','rajkot',15,'2002-09-5')
 insert into PersonInfo values(4,'darshan',50000,'2021-01-02','rajkot',15,'2001-08-2')

 drop trigger TR_PER_INS

----------------------------update------------------
CREATE OR ALTER TRIGGER TR_PER_upd
ON PersonInfo
instead of update
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	select @PersonID=PersonId,@PersonName=PersonName from inserted
	insert into PersonLog values
	(@PersonID,@PersonName ,'update',GETDATE())
end;

update PersonInfo
 set PersonName='priyanshi'
 where PersonID=12

 drop TRIGGER TR_PER_upd
-------------------------delete---------------------------

CREATE OR ALTER TRIGGER TR_PER_dele
ON PersonInfo
instead of delete
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	select @PersonID=PersonId,@PersonName=PersonName from deleted
	insert into PersonLog values
	(@PersonID,@PersonName ,'deleted',GETDATE())
end;

 delete from PersonLog where PersonID=12

 drop TRIGGER TR_PER_dele

 select * from PersonInfo
 select * from PersonLog

--4. Create a trigger that fires on INSERT operation on the PersonInfo table to convert person name into uppercase whenever the record is inserted. 

CREATE OR ALTER TRIGGER TR_PER_INSERT
ON PersonInfo
AFTER INSERT
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	DECLARE @Salary DECIMAL(8,2); 
	DECLARE @JoiningDate DATETIME;
	DECLARE @City VARCHAR(100);
	DECLARE @Age INT; 
	DECLARE @BirthDate DATETIME; 
	select @PersonName from inserted
	select @PersonID=PersonID from inserted
	update PersonInfo
	set @PersonName=UPPER(@PersonName)
	where @PersonID=PersonID
end;

 insert into PersonInfo values(5,'Shree',50000,'2021-01-02','rajkot',15,'2001-08-2')

 drop TRIGGER TR_PER_INSERT

--5. Create trigger that prevent duplicate entries of person name on PersonInfo table. 

CREATE OR ALTER TRIGGER TR_PER_INS
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	DECLARE @Salary DECIMAL(8,2); 
	DECLARE @JoiningDate DATETIME;
	DECLARE @City VARCHAR(100);
	DECLARE @Age INT; 
	DECLARE @BirthDate DATETIME; 
	select @PersonID=PersonId,@PersonName=PersonName,@Salary=Salary,@JoiningDate=JoiningDate,@City=City,@Age=Age,@BirthDate=BirthDate from inserted
	where PersonName not in (select PersonName from PersonInfo)
end;

drop TRIGGER TR_PER_INS
--6. Create trigger that prevent Age below 18 years. 

CREATE OR ALTER TRIGGER TR_PER_ins
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN  
	declare @PersonID INT; 
	declare @PersonName varchar(50);
	DECLARE @Salary DECIMAL(8,2); 
	DECLARE @JoiningDate DATETIME;
	DECLARE @City VARCHAR(100);
	DECLARE @Age INT; 
	DECLARE @BirthDate DATETIME; 
	select @PersonID=PersonId,@PersonName=PersonName,@Salary=Salary,@JoiningDate=JoiningDate,@City=City,@Age=Age,@BirthDate=BirthDate from inserted
	if @Age>=18
		insert into PersonInfo values (@PersonID,@PersonName,@Salary,@JoiningDate,@City,@Age,@BirthDate)
end;

drop TRIGGER TR_PER_ins
------------------------------------------------------------------Part – B----------------------------------------------------------------------------- 
--7. Create a trigger that fires on INSERT operation on person table, which calculates the age and update that age in Person table.

CREATE OR ALTER TRIGGER TR_PER_INSERT
ON PersonInfo
aFter INSERT
AS
BEGIN  
	declare @PersonID INT;  
	DECLARE @BirthDate DATETIME;
	declare @Age int;
	select @PersonID=PersonId from inserted
	select @BirthDate=BirthDate from inserted
	set @Age=DATEDIFF(year,@BirthDate,GETDATE())
		update PersonInfo
		set Age=@Age
		where PersonID=@PersonId
end;

--8. Create a Trigger to Limit Salary Decrease by a 10%. 


CREATE OR ALTER TRIGGER TR_LIMITSALARY
ON PersonInfo
after update
as
begin
	declare @PersonID int;
	declare @oldsalary decimal(8,2),@Newsalary decimal(8,2);
	select @oldsalary=d.Salary,@Newsalary=i.Salary
	from deleted d
	join inserted i on d.PersonID=i.PersonID;

	if @Newsalary<@oldsalary*0.9
	begin
		update PersonInfo
		set Salary=@oldsalary
		where PersonID=@PersonID
	end

end
-------------------------------------------------------------------Part – C----------------------------------------------------------------------------  
--9. Create Trigger to Automatically Update JoiningDate to Current Date on INSERT if JoiningDate is NULL during an INSERT. 

CREATE OR ALTER TRIGGER TR_PER_ins
ON PersonInfo
INSTEAD OF INSERT
AS
BEGIN  
	update PersonInfo
	set JoiningDate=GETDATE()
	from PersonInfo p
	join inserted i on p.PersonID=i.PersonID
	where i.JoiningDate is null
end;

drop TRIGGER TR_PER_ins

--10. Create DELETE trigger on PersonLog table, when we delete any record of PersonLog table it prints ‘Record deleted successfully from PersonLog’. 

CREATE OR ALTER TRIGGER TR_PER_INS_UPD_DEL
ON PersonLog
AFTER delete
AS
BEGIN
	PRINT 'Record deleted successfully from PersonLog'
end;

drop TRIGGER TR_PER_INS_UPD_DEL