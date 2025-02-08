-- Samuel Aikulola
-- This is My SQL note with Ebuka

-- 1. Select Statement
select * from dbo.customers;
select * from [dbo].[Customers];

-- I only need customerid, companyname and contactname

select CustomerID, CompanyName, ContactName from dbo.customers;

-- Classwork
-- give me all the details of our employees
-- I need the ID, LastName, FirstName, date of birth and coutntry of 
-- all our staff- from employee table

-- 2. Top Function
select top 10 * from dbo.customers;

-- classwork
-- give me top 5 out of the employees table

-- 3 Alias
select CustomerID as ID, CompanyName as Organization, ContactName as "full name"
from dbo.customers;

select CustomerID ID, CompanyName Organization, ContactName "full name"
from dbo.customers;

--  Class work
-- I need the employeeID and Lastname but change the column names to
-- Staff ID and Father's Name from the employees table

-- 4. Distinct
select * from dbo.employees;

select distinct Region from dbo.employees;
select distinct region as Unique_Region from dbo.employees;

-- classwork
-- give me all the unique cities we have in our customers table
-- give me all the unique regions we have in our customers table

select distinct city, region from dbo.customers;

-- 5. Concat
select * from dbo.customers;

select customerid, companyname, contacttitle, 
concat(address, ' ', city, ' ', region, ' ',country, ' ', postalcode) as "Full Address"
from dbo.customers

select * from dbo.employees
-- classwork
-- give me the employeeid, fullname of staff by joining the 
-- titleofcourtesy, firstname, lastname, also join the address, city, region, country and postalcode
-- to form full address

select EmployeeID, CONCAT(titleofcourtesy, ' ', firstname, ' ', lastname) as "Fullname",
concat(address, ' ', city, ' ', region, ' ', country, ' ', postalcode) as "Fulladdress"
from dbo.employees;

-- 6 Where clause
select * from dbo.customers;

select * from dbo.customers where country = 'Nigeria'

select customerid, contactname, address from dbo.customers
where country = 'Nigeria';

select * from dbo.customers where country = 'Nigeria' or country = 'Canada' or country = 'USA'

-- class work
-- give details of our customer that stay in london city or Abuja city
-- give me details of our staff that come from Seattle city and greater london region. -- use employee table
-- give me details of our staff that come from Seattle city or greater london region -- use employee table
-- give me details of our staff that come from Seattle city or WA region -- use employee table

-- 7. In clause
-- give details of our customer that stay in london city or Abuja city

select * from dbo.customers where city = 'London' or city = 'Abuja' or city = 'Berlin'

select * from dbo.customers where city in ('London', 'Abuja', 'Berlin')

-- classwork
-- give me details of our customers that come from Nigeria, UK, USA, France
-- give me details of our staff that come from Seattle or London or Redmond cities. 

-- 8. using where clause with numbers
select * from dbo.orders;
select * from dbo.orders where shipvia = 2
select * from dbo.orders where freight >= 50

-- instances where the freight is over 30 but less then 50

-- Assignment
-- 1. Give me the orderid, productid, shipvia, requireddate, unit price, quantity, discount from data.orders table
-- 2. Give me all the distinct regions we have in the region table
-- 3. give me the names of all the shippers we have -- shippers table
-- 4. give me details of all our customers that stay in london or abuja using the in clause.
-- 5. give me orderid, customerid, orderdate and freight of all the freight that is over 30-- use the orders table
-- 6. give me orderid, customerid, orderdate and freight of all the freight that is between 20 and 40 -- use the orders table
-- 7. get me all the orders that where placed from 1st september 1996 to ending of November 1996
-- 8. get me all the orders placed on april 1998  -- you can research
select * from dbo.orders where orderdate between '1998-4-1' and '1998-4-30';

select * from dbo.orders where month(orderdate) = 4 and year(orderdate) = 1998

select orderid, orderdate, day(orderdate) as orderday, month(orderdate) as ordermonth,
year(orderdate) as orderyear from dbo.orders
 
-- assignment
-- 1. give me the orderid, ordrdate, and extract the day, month(interms of Jan, Feb, Mar),and also extract the order year.
-- 2. give me all in question 1 plus an extra column to extract the day of the week.
-- 3. give me the orderid, customerid, concat the shipaddress, city, region, country and postcode to give you
-- full address , orderdate, shipdate, age (difference between orderdate and shipdate)
-- 4. give me everything on queston 3 but for freight greater than 35 but less then 70

-- 9.like and not like.
-- these 2 functions works with 2 wildcards % and _

select * from dbo.customers;
-- customers that their names starts with letter A
select * from dbo.customers where ContactName like 'A%'

select * from dbo.customers where ContactName like '%A'

select * from dbo.customers where ContactName like '%A%'

select * from dbo.customers where contactname = 'Mary'

select * from dbo.customers where contactname like '%Mary%'

select * from dbo.customers where contactname like 'A________'


select * from dbo.customers where ContactName not like 'A%' -- 

select * from dbo.employees;

-- classwork
-- 1. give me details of our customers that have sales in their title  -- customer table
-- 2. give me details of our customers that do not have sales in their title  -- customer table
-- 3. give me all the details of our customers, make sure to concat all the address to give full address of
-- our customers that stay in london city and their name starts with A  -- customer table
-- 4. details of our customers that their names starts with letter A or B


-- 10 is null and is not null
 
select * from dbo.customers where address is null
 
select * from dbo.customers where address is not null and region is not null
 
-- 11. Order by

select * from dbo.customers order by contactname asc

select * from dbo.customers order by contactname desc
 
-- class work

-- details of all our employees and arrange their first names

-- in ascending order or alphabethically use employee table

select * from dbo.employees order by firstname asc

-- employee table (select their firstname, last name, concat both names)

-- order by the last name
 
select firstname, lastname, concat(firstname, ' ', lastname) as Names from dbo.employees order by lastname;
 
select lastname, firstname, concat(firstname, ' ', lastname) as Names from dbo.employees 

order by lastname asc, firstname asc;
 
-- class work

-- give me the details of all the orders then order it by freight in desc order
 
select * from dbo.orders order by freight desc;

-- give me the details of all the orders then order it by order date in desc order
 
select * from dbo.orders order by orderdate desc;

-- 12. Union all
select * from dbo.customers;

select * from dbo.suppliers;

select companyname, contactname, contacttitle, address, city, 'from customer table' as source_table from dbo.customers

union all

select companyname, contactname, contacttitle, address, city, 'from supplier table' as source_table from dbo.suppliers

-- classwork
-- 1. consolidate the companyname,phone from customer table, supplier table and shippers table

-- 2. consolidate ID, companyname, contact name, contacttitle, address from customer and supplier table


-- 13. Case Statement
select * from dbo.categories;

-- all beverages should be calles Milo
-- Condiments should be called ingredents
--anything else should be calles food

select categoryid, categoryname, 
case when categoryname = 'Beverages' then 'Milo'
when categoryname = 'Condiments' then 'Ingredents'
else 'Food' end as FoodCategory, description, picture
from dbo.categories;


select * from dbo.customers;

select customerid, contactname, contacttitle,
case when contacttitle like '%sales%' then 'Person in Sales Dept'
else 'Person Not in Sales Dept'
end as Department, concat(Address, ' ', city, ' ', country) as full_address
from dbo.customers



select * from dbo.orders;
-- classwork
-- 1. Give me the order id, customerid, orderdate, freight, and create a new column to show freight greater than
-- 50 and freight less then 50 you can call the new column freight category

-- 2. give me all the columns as above and include ship via, a new column with ship via called deliver company name
-- with the following conditions
-- ship via 1 = DHL, 2=FedEX , 3 = Royal mail

Select orderid, customerid, orderdate, freight, 
case when freight > 50 then 'Freight greater than 50'
when freight < 50 then 'Freight less than 50' end as Freight_category 
from dbo.orders;
 
select orderid, customerid, orderdate, freight, 
case when freight > 50 then 'Freight greater than 50'
when freight < 50 then 'Freight less than 50' end as Freight_category,
shipvia, 
case when shipvia = 1 then 'DHL' when shipvia = 2 then 'FedEX'
else 'Royal Mail' end as DeliveryCompanyName 
from dbo.orders;

select orderid, customerid, freight, 
concat(shipaddress, ' ', shipcity, ' ', shipregion, ' ', shipcountry, ' ', shippostalcode) as "Full Address",
orderdate, shippeddate, datediff(day, orderdate, shippeddate) as Age,
case when datediff(day, orderdate, shippeddate) < 50 then 'Under 50'
when datediff(day, orderdate, shippeddate) >= 50 then 'over 50'
end as Age_category
from dbo.orders 
where freight > 35 and freight < 70
order by freight;

with ebuka as (
select orderid, customerid, freight, 
concat(shipaddress, ' ', shipcity, ' ', shipregion, ' ', shipcountry, ' ', shippostalcode) as "Full Address",
orderdate, shippeddate, datediff(day, orderdate, shippeddate) as Age  
from dbo.orders)
select orderid, customerid, freight,
"full address", age,
case when age < 50 then 'Under 50'
when age >= 50 then 'over 50' end as Age_Category
from ebuka


-- assignemt
-- give me the id, companyname, contactname, contacttitle, 
-- create a new column called department that lets us know person in sales dept or not,
-- concat the address, city, region, country, postal code to give full address,
-- phone, and fax from customer and supplier's table.

-- Assignment no 2.
-- First create a new database
create database ebukaclasswork

select customerid as ID, companyname, contactname, contacttitle, 
case when contacttitle like '%sales%' then 'Person in Sales Dept'
else 'Person not in Sales Dept' end as Department,
concat(address, ' ', city, ' ', region, ' ', country, ' ', postalcode) as FullAddress, phone, fax1 as Fax 
from dbo.customers
union all
select cast(supplierid as varchar) as ID, companyname, contactname, contacttitle,
case when contacttitle like '%sales%' then 'Person in Sales Dept'
else 'Person not in Sales Dept' end as Department,
concat(address, ' ', city, ' ', region, ' ', country, ' ', postalcode) as FullAddress, phone, fax as Fax 
from dbo.suppliers



-- 14. Aggregate function and mathematical Function.
-- count, sum, avg, min, max

Select * from dbo.customers;
select count(*) as total_customers from dbo.customers

select count(customerid) as total_customers from dbo.customers;

-- count of customers that theur names starts with letter A

select count(customerid) as total_customers from dbo.customers
where contactname like 'A%'

select * from dbo.sales
select sum(sales_amount) as Total_sales from dbo.sales

select city, sum(sales_amount) as total_sales from dbo.sales
group by city

select city, order_date, sum(sales_amount) as total_sales from dbo.sales
group by city, order_date

select avg(sales_amount) as Total_sales from dbo.sales
 
 select max(sales_amount) as Total_sales from dbo.sales

 -- class work
-- get the max sales amount per each city -- use sales table
-- get the min sales amount per each city -- use sales table
-- all the total freight group by shipcountry-- order table
-- count of employees that come from london
-- count of customer that their name start with A  -- no need
-- sum of fright by month for all order placed in 1996
-- sum of fright by year, month for all order placed before 1998

SELECT year(OrderDate) as OrderYear, month(OrderDate) as OrderMonth, 
sum(Freight) as TotalFreight from dbo.orders 
where year(OrderDate) = 1996
group by year(OrderDate), month(OrderDate)
order by OrderMonth;

select year(OrderDate) as OrderYear, datename(month, OrderDate) as OrderMonth,
sum(Freight) as TotalFreight from dbo.orders
where OrderDate < '1998-01-01' -- where yeas(orderdate) < 1998
group by year(OrderDate), month(OrderDate),
datename(month, OrderDate)
order by OrderYear, month(OrderDate);
 

select city, max(sales_amount) as max_sales from dbo.sales
group by city;

select city, min(sales_amount) as Total_sales from dbo.sales
group by city;

select shipcountry, sum(freight) as Total_freight from dbo.orders
group by shipcountry;

select city, count(employeeid) as Total_employee from dbo.employees
group by city;

select city, count(employeeid) as Total_employee from dbo.employees
where city like '%london%'
group by city;

select * from dbo.orders
select 
case when shipvia = 1 then 'DHL' when shipvia = 2 then 'FedEX'
else 'Royal Mail' end as DeliveryCompanyName, sum(freight) as total_freight
from dbo.orders
group by 
case when shipvia = 1 then 'DHL' when shipvia = 2 then 'FedEX'
else 'Royal Mail' end

select shipvia,
case when shipvia = 1 then 'DHL' when shipvia = 2 then 'FedEX'
else 'Royal Mail' end as DeliveryCompanyName, sum(freight) as total_freight
from dbo.orders
group by 
shipvia,
case when shipvia = 1 then 'DHL' when shipvia = 2 then 'FedEX'
else 'Royal Mail' end

select city, sum(sales_amount) as total_sales, avg(sales_amount) as Avg_sales,
max(sales_amount) as max_sales, min(sales_amount) as min_sals from dbo.sales
group by city

-- 15. join
-- Inner Join, Right join, left join and full join

select * from dbo.orders;
select * from dbo.customers;
select * from [dbo].[Order Details];



-- customerid, orderid, company name, contactactname, address, orderdate, shipdate, ship via, freight
select dbo.customers.customerid, orderid, companyname, contactname, address, orderdate, shippeddate, shipvia, freight
from dbo.customers inner join dbo.orders on dbo.customers.customerid = dbo.orders.customerid


select dbo.customers.customerid, orderid, companyname, contactname, address, orderdate, shippeddate, shipvia, freight
from dbo.customers left join dbo.orders on dbo.customers.customerid = dbo.orders.customerid

select dbo.customers.customerid, orderid, companyname, contactname, address, orderdate, shippeddate, shipvia, freight
from dbo.orders right join  dbo.customers  on dbo.customers.customerid = dbo.orders.customerid




select dbo.customers.customerid, orderid, companyname, contactname, address, orderdate, shippeddate, shipvia, freight
from dbo.customers right join dbo.orders on dbo.customers.customerid = dbo.orders.customerid

select dbo.customers.customerid, orderid, companyname, contactname, address, orderdate, shippeddate, shipvia, freight
from dbo.orders left join  dbo.customers  on dbo.customers.customerid = dbo.orders.customerid


select C.customerid, orderid, companyname, contactname, address, orderdate, shippeddate, shipvia, freight
from dbo.orders as O right join  dbo.customers as C  on C.customerid = O.customerid
where contactname like 'A%'

-- classwork
-- customerid, orderid, company name, contactactname, address, orderdate, shipdate, ship via, freight,
-- unitprice, quantity, discount, revenue by multiplying price * quantity

select C.customerid, O.orderid, companyname, contactname, address, orderdate, shippeddate, shipvia, freight,
unitprice, quantity, discount, (unitprice * quantity) as Revenue 
from dbo.customers as C left join dbo.orders as O on c.customerid = o.customerid
left join [dbo].[Order Details] as D on D.orderid = O.orderID 

----- Data manipulation Language
-- 1. Creating a back up
select * from dbo.customers

select * into dbo.customerbackup from dbo.customers

select * into emeka.customerbackup from dbo.customers

select * into supervisor.customerbackup from dbo.customers

select * from dbo.customerbackup

select * 

-- 2. Creating database and scheme
create database ebukasql

drop database ebukasql

create schema supervisor


-- create 2 backups of the customer table using emeka as the schema

--3 creating a view
select * from emeka.customerbackup

create view shipviaordrs as(
select 
case when shipvia = 1 then 'DHL' when shipvia = 2 then 'FedEX'
else 'Royal Mail' end as DeliveryCompanyName, sum(freight) as total_freight
from dbo.orders
group by 
case when shipvia = 1 then 'DHL' when shipvia = 2 then 'FedEX'
else 'Royal Mail' end )

select * from dbo.londoncustomters

USE [Northwind]
GO


select * from dbo.shipviaordrs

-- 4 dropping tables or views
drop table [supervisor].[customerbackup]

drop view dbo.shipviaordrs


create database costcodata


-- 1. creare table
create table dbo.studentrecords_new(
student_id	int primary key,
Firstname	varchar(50),
Lastname	varchar(50),
Sex			varchar(10),
DOB			date,
Phone_no	int,
department	varchar(30)
)

select * from dbo.studentrecords;

-- 2. Insert Records
insert into dbo.studentrecords
(Student_id, Firstname, Lastname, Sex, DOB, Phone_no, Department)
values
(1003, 'Idris', 'Elba', 'M', '1957-09-17', 078928, 'Hollywood'),
(1004, 'The', 'Rock', 'M', '1997-09-17', 0789669628, 'Hollywood and WWE'),
(1005, 'Tayo', '', 'F', '2007-09-17', 0789669628, 'Nollywood'),
(1006, 'Funsho', 'Thomas', 'F', '1957-09-17', 0789669628, 'RAW')


insert into dbo.studentrecords
(Student_id, Firstname, Sex, DOB, Phone_no, Department)
values
(1007, 'Taiwo', 'M', '1957-09-17', 078928, 'Hollywood')


-- 3. Alter
alter table dbo.studentrecords add Country varchar(40);

-- 4. update
-- before I update, let me create a backup of the student record table 

select * into dbo.studentrecordbackup from dbo.studentrecords

select * from dbo.studentrecordbackup

update dbo.studentrecordbackup set Country = 'UK'
where student_id = 1002


update dbo.studentrecordbackup set Country = 'France', Lastname = 'Trump'
where student_id = 1005

-- 5. deleting records
delete dbo.studentrecordbackup where student_id = 1007 and firstname = 'Taiwo'

create database mysqlproject
