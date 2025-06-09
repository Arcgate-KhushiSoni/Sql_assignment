hushi@arcgate2743:~$ sudo mysql 
[sudo] password for khushi: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 8.4.5 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> Create database sql_mock_test;
Query OK, 1 row affected (0.02 sec)

mysql> use sql_mock_test;
Database changed
mysql> CREATE TABLE Authors (
    ->     AuthorID INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Country VARCHAR(50),
    ->     BirthYear INT
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE TABLE Books (
    ->     BookID INT PRIMARY KEY,
    ->     Title VARCHAR(100),
    ->     AuthorID INT,
    -> Genre VARCHAR(50),
    ->     Price DECIMAL(10, 2),
    ->     Stock INT,
    ->     FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> -- Customers Table
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE TABLE Customers (
    ->     CustomerID INT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Email VARCHAR(100),
    ->     JoinDate DATE,
    ->     Country VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE Orders (
    ->     OrderID INT PRIMARY KEY,
    ->     CustomerID INT,
    ->     BookID INT,
    ->     OrderDate DATE,
    ->     Quantity INT,
    ->     TotalPrice DECIMAL(10, 2),
    ->     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    ->     FOREIGN KEY (BookID) REFERENCES Books(BookID)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO Authors (AuthorID, Name, Country, BirthYear) VALUES
    -> (1, 'J.K. Rowling', 'United Kingdom', 1965),
    -> (2, 'George R.R. Martin', 'United States', 1948),
    -> (3, 'Haruki Murakami', 'Japan', 1949);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Books (BookID, Title, AuthorID, Genre, Price, Stock) VALUES
    -> (1, 'Harry Potter and the Sorcerer''s Stone', 1, 'Fantasy', 19.99, 120),
    -> (2, 'A Game of Thrones', 2, 'Fantasy', 24.99, 80),
    -> (3, 'Norwegian Wood', 3, 'Fiction', 14.99, 50);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Customers (CustomerID, Name, Email, JoinDate, Country) VALUES
    -> (1, 'Alice Johnson', 'alice@example.com', '2023-01-15', 'United States'),
    -> (2, 'Bob Smith', 'bob@example.com', '2023-02-20', 'Canada'),
    -> (3, 'Charlie Brown', 'charlie@example.com', '2023-03-05', 'United Kingdom');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Orders (OrderID, CustomerID, BookID, OrderDate, Quantity, TotalPrice) VALUES
    -> (1, 1, 1, '2023-03-10', 2, 39.98),
    -> (2, 2, 2, '2023-03-15', 1, 24.99),
    -> (3, 3, 3, '2023-03-20', 3, 44.97);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> Select Select * from Authors;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Select * from Authors' at line 1
mysql> Select * from Authors;
+----------+--------------------+----------------+-----------+
| AuthorID | Name               | Country        | BirthYear |
+----------+--------------------+----------------+-----------+
|        1 | J.K. Rowling       | United Kingdom |      1965 |
|        2 | George R.R. Martin | United States  |      1948 |
|        3 | Haruki Murakami    | Japan          |      1949 |
+----------+--------------------+----------------+-----------+
3 rows in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select name , email
    -> from Customers 
    -> where JoinDate > '2023-02-01';
+---------------+---------------------+
| name          | email               |
+---------------+---------------------+
| Bob Smith     | bob@example.com     |
| Charlie Brown | charlie@example.com |
+---------------+---------------------+
2 rows in set (0.00 sec)

mysql> Select * from Books;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select * from Books
    -> where genre = 'Fantasy';
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
+--------+---------------------------------------+----------+---------+-------+-------+
2 rows in set (0.00 sec)

mysql> Select count(stock) from Books;
+--------------+
| count(stock) |
+--------------+
|            3 |
+--------------+
1 row in set (0.00 sec)

mysql> Select Sum(Stock) as total_books
    -> From Books;
+-------------+
| total_books |
+-------------+
|         250 |
+-------------+
1 row in set (0.01 sec)

mysql> Select * from Orders;
+---------+------------+--------+------------+----------+------------+
| OrderID | CustomerID | BookID | OrderDate  | Quantity | TotalPrice |
+---------+------------+--------+------------+----------+------------+
|       1 |          1 |      1 | 2023-03-10 |        2 |      39.98 |
|       2 |          2 |      2 | 2023-03-15 |        1 |      24.99 |
|       3 |          3 |      3 | 2023-03-20 |        3 |      44.97 |
+---------+------------+--------+------------+----------+------------+
3 rows in set (0.00 sec)

mysql> Select Sum(TotalPrice) as total_price
    -> from Orders;
+-------------+
| total_price |
+-------------+
|      109.94 |
+-------------+
1 row in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select * from Orders
    -> Join Customers on 
    -> Orders.CustomerID = Customers.CustomerID
    -> where Customers.Name = 'Alice Johnson';
+---------+------------+--------+------------+----------+------------+------------+---------------+-------------------+------------+---------------+
| OrderID | CustomerID | BookID | OrderDate  | Quantity | TotalPrice | CustomerID | Name          | Email             | JoinDate   | Country       |
+---------+------------+--------+------------+----------+------------+------------+---------------+-------------------+------------+---------------+
|       1 |          1 |      1 | 2023-03-10 |        2 |      39.98 |          1 | Alice Johnson | alice@example.com | 2023-01-15 | United States |
+---------+------------+--------+------------+----------+------------+------------+---------------+-------------------+------------+---------------+
1 row in set (0.00 sec)

mysql> Select Orders.* 
    -> From Orders
    -> Join Customers on 
    -> Orders.CustomerID = Customers.CustomerID
    -> where Customers.Name = 'Alice Johnson';
+---------+------------+--------+------------+----------+------------+
| OrderID | CustomerID | BookID | OrderDate  | Quantity | TotalPrice |
+---------+------------+--------+------------+----------+------------+
|       1 |          1 |      1 | 2023-03-10 |        2 |      39.98 |
+---------+------------+--------+------------+----------+------------+
1 row in set (0.00 sec)

mysql> Select * from Books;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select Max(Price) From Books;
+------------+
| Max(Price) |
+------------+
|      24.99 |
+------------+
1 row in set (0.00 sec)

mysql> Select Max(Price) From Books Limit 1;
+------------+
| Max(Price) |
+------------+
|      24.99 |
+------------+
1 row in set (0.00 sec)

mysql> Select * from Books
    -> Where Stock < 50 ;
Empty set (0.00 sec)

mysql> Select * from Books Where Stock > 50;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
+--------+---------------------------------------+----------+---------+-------+-------+
2 rows in set (0.00 sec)

mysql> Select * from Books Where Stock <= 50;
+--------+----------------+----------+---------+-------+-------+
| BookID | Title          | AuthorID | Genre   | Price | Stock |
+--------+----------------+----------+---------+-------+-------+
|      3 | Norwegian Wood |        3 | Fiction | 14.99 |    50 |
+--------+----------------+----------+---------+-------+-------+
1 row in set (0.00 sec)

mysql> Select * from Books;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select * from Authors;
+----------+--------------------+----------------+-----------+
| AuthorID | Name               | Country        | BirthYear |
+----------+--------------------+----------------+-----------+
|        1 | J.K. Rowling       | United Kingdom |      1965 |
|        2 | George R.R. Martin | United States  |      1948 |
|        3 | Haruki Murakami    | Japan          |      1949 |
+----------+--------------------+----------------+-----------+
3 rows in set (0.00 sec)

mysql> Select Books.BookID, Books.Title, Books.Genre, Books.Price, Books.Stock, Authors.Name as Author_name 
    -> From Books
    -> Join Authors On 
    -> Books.AuthorID = Authors.AuthorID;
+--------+---------------------------------------+---------+-------+-------+--------------------+
| BookID | Title                                 | Genre   | Price | Stock | Author_name        |
+--------+---------------------------------------+---------+-------+-------+--------------------+
|      1 | Harry Potter and the Sorcerer's Stone | Fantasy | 19.99 |   120 | J.K. Rowling       |
|      2 | A Game of Thrones                     | Fantasy | 24.99 |    80 | George R.R. Martin |
|      3 | Norwegian Wood                        | Fiction | 14.99 |    50 | Haruki Murakami    |
+--------+---------------------------------------+---------+-------+-------+--------------------+
3 rows in set (0.00 sec)

mysql> Select * from Orders;
+---------+------------+--------+------------+----------+------------+
| OrderID | CustomerID | BookID | OrderDate  | Quantity | TotalPrice |
+---------+------------+--------+------------+----------+------------+
|       1 |          1 |      1 | 2023-03-10 |        2 |      39.98 |
|       2 |          2 |      2 | 2023-03-15 |        1 |      24.99 |
|       3 |          3 |      3 | 2023-03-20 |        3 |      44.97 |
+---------+------------+--------+------------+----------+------------+
3 rows in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select Orders.OrderID,Orders.OrderDate, Orders.Quantity, Orders.TotalPrice, Customers.Name as Customer_name , Books.Title as book_title
    -> From Orders
    -> Join Customers ON Orders.CustomerID= Customers.CustomerID
    -> Join Books ON Orders.BookID = Books.BookID;
+---------+------------+----------+------------+---------------+---------------------------------------+
| OrderID | OrderDate  | Quantity | TotalPrice | Customer_name | book_title                            |
+---------+------------+----------+------------+---------------+---------------------------------------+
|       1 | 2023-03-10 |        2 |      39.98 | Alice Johnson | Harry Potter and the Sorcerer's Stone |
|       2 | 2023-03-15 |        1 |      24.99 | Bob Smith     | A Game of Thrones                     |
|       3 | 2023-03-20 |        3 |      44.97 | Charlie Brown | Norwegian Wood                        |
+---------+------------+----------+------------+---------------+---------------------------------------+
3 rows in set (0.02 sec)

mysql> Select Customers.CustomerID, Customers.Name ,
    -> Count(Orders.OrderID) as total_order_by_customers
    -> Form Customers
    -> Join Orders on 
    -> Customers.CustomerID = Orders.CustomerID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Form Customers
Join Orders on 
Customers.CustomerID = Orders.CustomerID' at line 3
mysql> Select Customers.CustomerID, Customers.Name , Count(Orders.OrderID) as total_order_by_customers From Customers Join Orders on  Customers.CustomerID = Orders.CustomerID;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_mock_test.Customers.CustomerID'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Customers.CustomerID, Customers.Name , Count(Orders.OrderID) as total_order_by_customers From  Customers Join Orders on  Customers.CustomerID = Orders.CustomerID
    -> Group by Customers.CustomerID , Customers.Name;
+------------+---------------+--------------------------+
| CustomerID | Name          | total_order_by_customers |
+------------+---------------+--------------------------+
|          1 | Alice Johnson |                        1 |
|          2 | Bob Smith     |                        1 |
|          3 | Charlie Brown |                        1 |
+------------+---------------+--------------------------+
3 rows in set (0.02 sec)

mysql> Select * from Books;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select Avg(Price) as avg_price
    -> from Books
    -> Where Genre = 'Fiction';
+-----------+
| avg_price |
+-----------+
| 14.990000 |
+-----------+
1 row in set (0.00 sec)

mysql> Select Authors.AuthorID, Authors.Name , Sum(Stock) as total_stock
    -> From Authors
    -> Join Books On 
    -> Authors.AuthorID = Books.AuthorID
    -> Group by Authors.AuthorID, Authors.Name 
    -> Order by Sum(Stock) DESC
    -> Limit 1;
+----------+--------------+-------------+
| AuthorID | Name         | total_stock |
+----------+--------------+-------------+
|        1 | J.K. Rowling |         120 |
+----------+--------------+-------------+
1 row in set (0.00 sec)

mysql> Select * from Authors;
+----------+--------------------+----------------+-----------+
| AuthorID | Name               | Country        | BirthYear |
+----------+--------------------+----------------+-----------+
|        1 | J.K. Rowling       | United Kingdom |      1965 |
|        2 | George R.R. Martin | United States  |      1948 |
|        3 | Haruki Murakami    | Japan          |      1949 |
+----------+--------------------+----------------+-----------+
3 rows in set (0.06 sec)

mysql> Select Name From Authors
    -> where BirthYear > 1950;
+--------------+
| Name         |
+--------------+
| J.K. Rowling |
+--------------+
1 row in set (0.07 sec)

mysql> Select Name From Authors where BirthYear < 1950;
+--------------------+
| Name               |
+--------------------+
| George R.R. Martin |
| Haruki Murakami    |
+--------------------+
2 rows in set (0.00 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select Name From Customers
    -> Where Country = 'United Kingdom';
+---------------+
| Name          |
+---------------+
| Charlie Brown |
+---------------+
1 row in set (0.00 sec)

mysql> Select * from Books;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select * from Orders;
+---------+------------+--------+------------+----------+------------+
| OrderID | CustomerID | BookID | OrderDate  | Quantity | TotalPrice |
+---------+------------+--------+------------+----------+------------+
|       1 |          1 |      1 | 2023-03-10 |        2 |      39.98 |
|       2 |          2 |      2 | 2023-03-15 |        1 |      24.99 |
|       3 |          3 |      3 | 2023-03-20 |        3 |      44.97 |
+---------+------------+--------+------------+----------+------------+
3 rows in set (0.00 sec)

mysql> Select Books.BookID, Books.Title , Count(Oorders.OrderID) as count_book 
    -> from books
    -> Join Orders on 
    -> books.bookId = Orders.bookId
    -> where Quantity > 1;
ERROR 1146 (42S02): Table 'sql_mock_test.books' doesn't exist
mysql> Select Books.BookID, Books.Title , Count(Orders.OrderID) as count_book  from books Join Orders on  books.bookId = Orders.bookId where Quantity > 1;
ERROR 1146 (42S02): Table 'sql_mock_test.books' doesn't exist
mysql> Select Books.BookID, Books.Title , Count(Orders.OrderID) as count_book  from Books Join Orders
 on  Books.BookID = Orders.BookID where Quantity > 1;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'sql_mock_test.Books.BookID'; this is incompatible with sql_mode=only_full_group_by
mysql> Select Books.BookID, Books.Name, Count(Orders.OrderID) as count_order
    -> From Books 
    -> Join Orders on 
    -> Books.BookID = Orders.BookID
    -> Group by Books.BookID, Books.Title
    -> Having count(Order.OrderID) > 1;
ERROR 1054 (42S22): Unknown column 'Books.Name' in 'field list'
mysql> Select Books.BookID, Books.Title, Count(Orders.OrderID) as count_order From Books  Join Orders
 on  Books.BookID = Orders.BookID Group by Books.BookID, Books.Title Having count(Order.OrderID) > 1;

ERROR 1054 (42S22): Unknown column 'Order.OrderID' in 'having clause'
mysql> Select Books.BookID, Books.Title, Count(Orders.OrderID) as count_order From Books  Join Orders on  Books.BookID = Orders.BookID Group by Books.BookID, Books.Title Having count(Orders.OrderID) > 1;
Empty set (0.02 sec)

mysql> Select Books.BookID, Books.Title, 
    -> Count(Orders.OrderID) AS count_order
    -> From Books
    -> Join Orders
    -> on 
    -> Books.BookID = Orders.BookID
    -> Group by Books.BookID, Books.Title
    -> Having Count(Orders.OrderID) > 1;
Empty set (0.00 sec)

mysql> Select * from Orders 
    -> where ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 2
mysql> Select Books.BookdID, Books.Title,
    -> Sum(Orders.Quantity) as total_quantity
    -> From Books
    -> Join Orders On 
    -> Books.BookID = Orders.BookID
    -> Group by Books.BookdID, Books.Title 
    -> Order by Sum(Orders.Quantity) Desc
    -> Limit 1;
ERROR 1054 (42S22): Unknown column 'Books.BookdID' in 'field list'
mysql> Select Books.BookID, Books.Title, Sum(Orders.Quantity) as total_quantity From Books Join Orders On  Books.BookID = Orders.BookID Group by Books.BookdID, Books.Title  Order by Sum(Orders.Quantity) Desc Limit 1;
ERROR 1054 (42S22): Unknown column 'Books.BookdID' in 'group statement'
mysql> Select Books.BookID, Books.Title, Sum(Orders.Quantity) as total_quantity From Books Join Orders On  Books.BookID = Orders.BookID Group by Books.BookdID, Books.Title  Order by Sum(Orders.Quantity) Desc Limit 1;
ERROR 1054 (42S22): Unknown column 'Books.BookdID' in 'group statement'
mysql> Select Books.BookID, Books.Title, Sum(Orders.Quantity) as total_quantity From Books Join Orders On  Books.BookID = Orders.BookID Group by Books.BookID, Books.Title  Order by Sum(Orders.Quantity) Desc Limit 1;
+--------+----------------+----------------+
| BookID | Title          | total_quantity |
+--------+----------------+----------------+
|      3 | Norwegian Wood |              3 |
+--------+----------------+----------------+
1 row in set (0.01 sec)

mysql> Select * from Books;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+
3 rows in set (0.01 sec)

mysql> Select BookID , Title, Genre, Price, Stock
    -> ,
    -> (Price*Stock) 
    -> From Books;
+--------+---------------------------------------+---------+-------+-------+---------------+
| BookID | Title                                 | Genre   | Price | Stock | (Price*Stock) |
+--------+---------------------------------------+---------+-------+-------+---------------+
|      1 | Harry Potter and the Sorcerer's Stone | Fantasy | 19.99 |   120 |       2398.80 |
|      2 | A Game of Thrones                     | Fantasy | 24.99 |    80 |       1999.20 |
|      3 | Norwegian Wood                        | Fiction | 14.99 |    50 |        749.50 |
+--------+---------------------------------------+---------+-------+-------+---------------+
3 rows in set (0.02 sec)

mysql> Select * from Customers;
+------------+---------------+---------------------+------------+----------------+
| CustomerID | Name          | Email               | JoinDate   | Country        |
+------------+---------------+---------------------+------------+----------------+
|          1 | Alice Johnson | alice@example.com   | 2023-01-15 | United States  |
|          2 | Bob Smith     | bob@example.com     | 2023-02-20 | Canada         |
|          3 | Charlie Brown | charlie@example.com | 2023-03-05 | United Kingdom |
+------------+---------------+---------------------+------------+----------------+
3 rows in set (0.00 sec)

mysql> Select * from Orders;
+---------+------------+--------+------------+----------+------------+
| OrderID | CustomerID | BookID | OrderDate  | Quantity | TotalPrice |
+---------+------------+--------+------------+----------+------------+
|       1 |          1 |      1 | 2023-03-10 |        2 |      39.98 |
|       2 |          2 |      2 | 2023-03-15 |        1 |      24.99 |
|       3 |          3 |      3 | 2023-03-20 |        3 |      44.97 |
+---------+------------+--------+------------+----------+------------+
3 rows in set (0.00 sec)

mysql> Select Customers.CustomerID, Customers.Name, Orders.OrderID, Orders.TotalPrice
    -> From Orders
    -> Join Customers on 
    -> Orders.CustomerID = Customers.CustomerID
    -> Order by Orders.TotalPrice DESC
    -> Limit 1;
+------------+---------------+---------+------------+
| CustomerID | Name          | OrderID | TotalPrice |
+------------+---------------+---------+------------+
|          3 | Charlie Brown |       3 |      44.97 |
+------------+---------------+---------+------------+
1 row in set (0.00 sec)

mysql> Select * from Books
    -> ;
+--------+---------------------------------------+----------+---------+-------+-------+
| BookID | Title                                 | AuthorID | Genre   | Price | Stock |
+--------+---------------------------------------+----------+---------+-------+-------+
|      1 | Harry Potter and the Sorcerer's Stone |        1 | Fantasy | 19.99 |   120 |
|      2 | A Game of Thrones                     |        2 | Fantasy | 24.99 |    80 |
|      3 | Norwegian Wood                        |        3 | Fiction | 14.99 |    50 |
+--------+---------------------------------------+----------+---------+-------+-------+
3 rows in set (0.00 sec)

mysql> Select Books.BookID, Books.Title, Books.Genre, Books.Stock,Books.Price
    -> from Books
    -> Join Order om 
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Order om' at line 3
mysql> Select Books.BookID, Books.Title, Books.Genre, Books.Stock,Books.Price
    -> From Books 
    -> Join Orders On 
    -> Books.BookID = Orders.BookID
    -> where Orders.BookID Is Null;
Empty set (0.01 sec)

mysql> Select Books.BookID, Books.Title, Books.Genre, Books.Stock,Books.Price From Books Left Join Orders On  Books.BookID = Orders.BookID where Orders.BookID Is Null;
Empty set (0.00 sec)
