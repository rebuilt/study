# Basic queries

## Creating records

Su as postgres user

```bash
su - postgres
createuser neil
```

## Create the database

```bash
createdb bpsimple
psql -U neil -d bpsimple
```

```
CREATE DATABASE test;
\c test
```

## Create the tables

Run an external sql file

```
\i create_tables.sql
```

Create the table in the psql console:

```SQL
CREATE TABLE item
(
  item_id serial,
  description varchar(64),
  CONSTRAINT item_pk PRIMARY KEY(item_id)
);
```

Tip: Create temporary tables for loading data.  
Temporary tables don't have primary keys or constraints of any kind. It is normal when cross-
loading data into a loading table to make it as easy as possible to get the data into that table.
Removing the constraints makes this easier. Also notice that all the required columns are there,
except the customer_id sequence number, which PostgreSQL can create for us as we load the data.
Suppose we have loaded some data into tcust (via ODBC, \copy, or some other method),
validated, and corrected it. (A suitable script for creating and populating the tcust table is
included in this book’s downloadable code, available from the Apress web site.) Then a SELECT
output looks like this:

## Drop tables

```
DROP TABLE item;
```

## Insert

```
INSERT INTO item(description, cost_price, sell_price)
VALUES('Wood Puzzle', 15.23, 21.95);
```

## Correcting an out of sync id count

```
SELECT max(customer_id) FROM customer;
```

The name of the sequence is in the format [tablename]\_[column_id_name]\_seq

```
SELECT setval('customer_customer_id_seq', 19);
```

## Basic commands in psql

```
\? Get help
\do Describe operators
\dt Describe tables
\dT Describe types
\h <cmd>  Get help on a specific command
\i <filename>  Execute commands from <filename>
\r Reset the buffer
\q Quit
```

## Basic selection

```
SELECT * FROM item;
```

## Override column names

```
Select town, lname AS "Last Name" FROM customer;
```

## Order results

```
Select town, lname AS "Last Name" FROM customer ORDER BY town;
```

## Order by two columns

```
SELECT town, lname AS "Last Name" FROM customer ORDER BY town DESC, lname ASC;
```

## List distinct values

```
SELECT DISTINCT town FROM customer;
```

## Calculations

```
SELECT DESCRIPTION, cast((cost_price * 100) AS int) AS "Cost Price" from item;
```

## casting a number

Tip: Casting a number as an int rounds the number up

```
Select cast(7.5) as int;
```

## CASE statement

Find max of two numbers

```
SELECT CASE WHEN  1 > 2 THEN 1 ELSE 2 END ;
```

## Selecting a subset of data

```
SELECT town, lname, fname FROM customer WHERE town = 'Bingham';
```

Tip: <> means not equal to. You can also use !=

```
SELECT title, fname, lname, town FROM customer WHERE title <> 'Mr' AND (town = 'Bingham' OR town = 'Nicetown');
SELECT title, fname, lname town FROM customer WHERE title <> 'Mr' AND town IN ('Bingham', 'Nicetown');
```

Tip: Be careful when using BETWEEN to search for records. The end of the range must include the last possible element. So searching for names between 'B' and 'N' won't find 'Nelson'. But if you extend the range to 'Nz', it will find 'Nelson'. Use a lowercase z because it comes after uppercase Z in the ascii table

```
SELECT DISTINCT town from customer WHERE town BETWEEN 'B' AND 'Nz';
```

## Pattern matching

% The percent sign matches any string of characters
(\_) Underscore matches a single character

Find firstnames where the second character is 'a' and it's a name of any length.

```
SELECT fname, lname FROM customer WHERE fname LIKE '_a%';
```

## Limit the results

Get 5 results

```
SELECT customer_id, town FROM customer LIMIT 5;
```

Get 5 results skipping the first two table items. Limit always comes first

```
SELECT customer_id, town FROM customer LIMIT 5 OFFSET 2;

```

# Working with multiple tables

## Relating tables with the WHERE clause

SELECT <column list> FROM <table list> WHERE <join condition> AND <row-selection conditions>

```
SELECT customer.fname, orderinfo.date_placed FROM customer, orderinfo WHERE customer.customer_id = 8 AND customer.customer_id = orderinfo.customer_id;
```

```
SELECT c.fname, c.lname, oi.date_placed, ol.item_id, ol.quantity FROM customer c, orderinfo oi, orderline ol WHERE c.customer_id = oi.customer_id AND oi.orderinfo_id = ol.orderinfo_id AND c.fname = 'Ann';
```

## Relating tables with the JOIN clause

SELECT <column list> FROM <table> JOIN <table> ON <join condition>
WHERE <row-selection conditions>

```
Select customer.fname, customer.lname, item.description
FROM customer
JOIN orderinfo ON customer.customer_id = orderinfo.customer_id
JOIN orderline ON orderinfo.orderinfo_id = orderline.orderinfo_id
Join item ON item.item_id = orderline.item_id
WHERE customer.fname = 'Ann';
```

# Adding data to the database

INSERT INTO tablename VALUES (list of column values);

```
INSERT INTO customer VALUES(16, 'Mr', 'Gavyn', 'Smith', '23 Harlestone', 'Milltown', 'MT7 7HI', '746 3725');
```

INSERT INTO tablename(list of column names)
VALUES (list of column values corresponding to the column names);

## The copy method

```
\copy tablename FROM 'filename'
[USING DELIMITERS 'a single character to use as a delimiter']
[WITH NULL AS 'a string that means NULL']

```

## Select from a temporary table and copy the result to a live table

```
Insert into customer(title, fname, lname, addressline, town, zipcode, phone) select title, fname, lname, addressline, town, zipcode, phone from tcust where phone is not null;
```

# Updating records

## The update statement

```
UPDATE tablename SET columnname = value WHERE condition
```

To set several columns at once, define the changed columns in a comma separated list

```
UPDATE customer SET town = 'Leicester', zipcode = 'LE4 2WQ' WHERE some condition
```

## Update from another table

```
UPDATE tablename FROM tablename WHERE condition
```

```
Update tcust SET phone = custphone.phone_num from custphone where tcust.fname = 'Peter' AND tcust.lname = 'Bradley';
```

# Deleting data from the database

## The delete statement

DELETE works on rows so there is no need to specify a column

```
DELETE FROM tablename WHERE condition
```

```
DELETE FROM tcust WHERE town = 'Lincoln';
```

## Deleting all data from a table

```
TRUNCATE TABLE tablename;
```

```
TRUNCATE TABLE tcust;
```

# Advanced data selection

## Aggregate functions

- count
- min
- max
- sum
- avg

```
SELECT count(*) FROM customer;
```

You can also use group by when counting.

```
Select count(*), town from customer group by town order by count DESC;
```

And order

```
SELECT count(*), lname, town FROM customer GROUP BY town, lname ORDER BY town, lname;
```

## Having clause

Conditions don't work with aggregate functions in a where clause. Having is there to provide condition evaluation for aggregate functions

```
Select count(*) from customer having count(*) > 1;
```

```
Select count(*), town from customer group by town having count(*) > 1;
```

Tip: Fortunately, there is often an easy way to develop your queries on a sample of the data, by using the primary key. If we add
the condition WHERE customer_id < 50 to all our queries, we could work on a sample of the first
50 customer_ids in the database. Once we were happy with our SQL, we could simply remove
the WHERE clause to execute our solution on the whole table.

## The min clause

```
Select min(shipping) from orderinfo;
```

## The max clause

```
Select(max) phone from customer;
```

## The sum function

```
SELECT sum(shipping) FROM orderinfo;
SELECT sum(distict shipping) FROM orderinfo;
```

## The avg function

```
SELECT avg(shipping) FROM orderinfo;
SELECT avg(DISTINCT shipping) FROM orderinfo;
```

# The subquery

Tip: Can't check if a value equals null because the answer is unknown. You must use the IS keyword

```
Select * from item where cost_price > (select avg(cost_price) from item ) and sell_price < (select avg(sell_price) from item);
```

## Query that returns multiple rows

```
 Select stock.item_id, stock.quantity, item.description, item.sell_price from item,stock where item.item_id = stock.item_id AND cost_price > 10;
 Select s.item_id, s.quantity, i.description, i.sell_price from item i ,stock s where i.item_id = s.item_id AND cost_price > 10;
```

## Using the IN statement

This returns the same values as the previous query that used joins.

```
SELECT * FROM stock WHERE item_id IN (SELECT item_id FROM item WHERE cost_price > 10);
```

## Correlated subqueries

There is another group of subqueries, called correlated subqueries, where the relationship
between the two parts of the query is somewhat more complex. In a correlated subquery, a table in
the inner SELECT will be joined to a table in the outer SELECT, thereby defining a relationship
between these two queries. This is a powerful group of subqueries, which quite often cannot be
rewritten as simple SELECT statements with joins.
A correlated query has the general form:

```
SELECT columnA from table1 T1
WHERE T1.columnB =
(SELECT T2.columnB FROM table2 T2 WHERE T2.columnC = T1.columnC)
```

```
SELECT oi.date_placed FROM orderinfo oi WHERE oi.customer_id =
(SELECT c.customer_id FROM customer c WHERE c.customer_id = oi.customer_id and town = 'Bingham'   );
```

## Existence subqueries

An EXISTS clause will normally execute more efficiently than other types of joins or IN
conditions.

```
SELECT fname, lname FROM Customer c WHERE EXISTS ( SELECT 1 FROM Orderinfo oi WHERE oi.customer_id = c.customer_id );
```

## The union join

Take a set of towns from tcust and a set of towns from the customer table and create a union removing duplicates

```
SELECT town FROM tcust UNION SELECt town FROM CUSTOMER ORDER BY town;
```

Include all results, including duplicates

```
SELECT town FROM tcust UNION ALL select town FROM customer ORDER BY town;
```

## Self joins

Create a part table

```
CREATE TABLE part (part_id int, description varchar(32), parent_part_id INT);
```

Load values into the parts table

```
\i populate_parts_table.sql
```

Get the part id of the combined parts and their description

```
SELECT p1.part_id, p1.description AS "Combined", p2.description AS "Parts" FROM part p1, part p2 WHERE p1.part_id = p2.parent_part_id;
```

## Outer joins

General format for outer join

```
SELECT columns FROM table1
LEFT OUTER JOIN table2 ON table1.column = table2.column
```

Select the item id and quantity of items

Without an outer join

```
Select i.item_id, s.quantity from item i, stock s where i.item_id = s.item_id union select i.item_id, null from item i where i.item_id not in (SELECT i.item_id from item i, stock s where i.item_id = s.item_id);
```

With an outer join

```
SELECT i.item_id, s.quantity FROM item i
LEFT OUTER JOIN stock s ON i.item_id = s.item_id;
```

More complex queries

```
select i.item_id, s.quantity from item i left outer join stock s on i.item_id = s.item_id AND s.quantity > 2 where i.cost_price > 5 ;
```

# Data types

Tip: Numeric types will give you precision at the cost of speed. Floats will give you speed at the cost of precision.

Get the type of a value with

```
Select pg_typeof(0.1);
```

# It's faster to do calculations within sql

(1..5).each do |value| puts( SurveyItemResponse.where(likert_score: value ).count.to_f / all_responses_count \* 100) end

https://stackoverflow.com/questions/37303779/sql-calculate-percentage-on-countcolumn
383ms

```
ActiveRecord::Base.connection.execute("Select likert_score, count(_) as count, count(_) _ 100 / sum(count(_)) over () as percentage from survey_item_responses
group by likert_score")
```

555ms

```
Select likert_score, count(*) as count, count(*) * 100.0 / (select count(*) from survey_item_responses)    as percentage from survey_item_responses group by likert_score

```

Student survey responses

```
Select scales.id, scales.scale_id, survey_items.survey_item_id, avg(survey_item_responses.likert_score) from measures JOIN scales ON scales.measure_id = measures.id Join survey_items ON  scales.id = survey_items.scale_id  Join survey_item_responses on survey_item_responses.survey_item_id = survey_items.id WHERE survey_items.survey_item_id LIKE 's-%' AND measures.measure_id = '1A-ii' AND survey_item_responses.school_id = 163 AND survey_item_responses.academic_year_id = 6  GROUP BY survey_items.survey_item_id, scales.id;
```

teacher survey responses

```
Select scales.id, scales.scale_id, survey_items.survey_item_id, avg(survey_item_responses.likert_score) from measures JOIN scales ON scales.measure_id = measures.id Join survey_items ON  scales.id = survey_items.scale_id  Join survey_item_responses on survey_item_responses.survey_item_id = survey_items.id WHERE survey_items.survey_item_id LIKE 't-%' AND measures.measure_id = '1A-ii' AND survey_item_responses.school_id = 163 AND survey_item_responses.academic_year_id = 6  GROUP BY survey_items.survey_item_id, scales.id;
```

```
Select avg(scale_averages.avg) from (Select scales.id, scales.scale_id, survey_items.survey_item_id, avg(survey_item_responses.likert_score) from measures JOIN scales ON scales.measure_id = measures.id Join survey_items ON  scales.id = survey_items.scale_id  Join survey_item_responses on survey_item_responses.survey_item_id = survey_items.id WHERE survey_items.survey_item_id LIKE 's-%' AND measures.measure_id = '1A-ii' AND survey_item_responses.school_id = 163 AND survey_item_responses.academic_year_id = 6  GROUP BY survey_items.survey_item_id, scales.id AS scale_averages GROUP BY scales.id;
```
