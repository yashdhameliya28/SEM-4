use	CSE_5A_187

CREATE TABLE Products (
 Product_id INT PRIMARY KEY,
 Product_Name VARCHAR(250) NOT NULL,
 Price DECIMAL(10, 2) NOT NULL
);INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);

--1. Create a cursor Product_Cursor to fetch all the rows from a products table.
declare @product_id int , @product_name varchar(50) , @price int

declare Product_Cursor cursor
for
	select Product_id, Product_Name, Price
	from Products

open Product_Cursor

fetch next from Product_Cursor
into @product_id , @product_name , @price

while @@FETCH_STATUS = 0
	begin
		print 'ProudctID id '+cast(@product_id as varchar)+' and product name '+@product_name+' Product price '+cast(@price as varchar)

		fetch next from Product_Cursor
		into @product_id , @product_name , @price
	end

close Product_Cursor

deallocate Product_Cursor

--2. Create a cursor Product_Cursor_Fetch to fetch the records in form of ProductID_ProductName.
--(Example: 1_Smartphone)
declare @product_ID int , @product_Name varchar(50)

declare Product_Cursor_Fetch cursor
for
	select Product_id, Product_Name
	from Products

open Product_Cursor_Fetch

fetch next from Product_Cursor_Fetch
into @product_ID , @product_Name

while @@FETCH_STATUS = 0
	begin
		print cast(@product_ID as varchar)+'_'+@product_Name

		fetch next from Product_Cursor_Fetch
		into @product_ID , @product_Name
	end

close Product_Cursor_Fetch

deallocate Product_Cursor_Fetch

--3. Create a Cursor to Find and Display Products Above Price 30,000.
declare @name varchar(50) , @price int

declare product_name_above_30000 cursor
for 
	select Product_Name , Price
	from Products	

open product_name_above_30000

fetch next from product_name_above_30000
into @name , @price

while @@FETCH_STATUS = 0
		begin
			if(@price > 30000)
				print 'Product are above 30000 price '+@name+' and price is '+cast(@price as varchar)+' .'

				fetch next from product_name_above_30000
				into @name , @price
		end

close product_name_above_30000

deallocate product_name_above_30000

--4. Create a cursor Product_CursorDelete that deletes all the data from the Products table.
declare @productId int

declare Product_CursorDelete cursor
for
	select Product_id
	from Products

open Product_CursorDelete

fetch next from Product_CursorDelete
into @productId

while @@FETCH_STATUS = 0
	begin
		delete from Products
		where Product_id = @productId

		fetch next from Product_CursorDelete
		into @productId
	end

close Product_CursorDelete

deallocate Product_CursorDelete



--Part – B


--5. Create a cursor Product_CursorUpdate that retrieves all the data from the products table and increases the price by 10%.

DECLARE @Product_ID INT,
		@Price DECIMAL(10,2)
		
DECLARE Product_CursorUpdate CURSOR
FOR
	SELECT Product_id,Price FROM Products

OPEN Product_CursorUpdate

FETCH NEXT FROM Product_CursorUpdate
INTO @Product_ID,@Price

WHILE @@FETCH_STATUS=0
	BEGIN
		UPDATE Products
		SET Price=(@Price+(@Price*0.1))
		WHERE Product_id=@Product_ID

		FETCH NEXT FROM Product_CursorUpdate
		INTO @Product_ID,@Price
	END

CLOSE Product_CursorUpdate

DEALLOCATE Product_CursorUpdate


select * from Products

--6. Create a Cursor to Rounds the price of each product to the nearest whole number.


DECLARE @Price DECIMAL(10,2)

DECLARE Cursor_Price_Round CURSOR
FOR
	SELECT Price
	FROM Products

OPEN Cursor_Price_Round

FETCH NEXT FROM Cursor_Price_Round
INTO @Price

WHILE @@FETCH_STATUS=0
	BEGIN
		PRINT Round(@Price,2)

		FETCH NEXT FROM Cursor_Price_Round
		INTO @Price
	END

CLOSE Cursor_Price_Round

DEALLOCATE Cursor_Price_Round
