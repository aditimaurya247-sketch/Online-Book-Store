drop  table if exists Books;
CREATE TABLE Books(Book_id SERIAL  PRIMARY KEY,title VARCHAR(100),Author VARCHAR(100),
Genere VARCHAR(100),Published_year INT,price NUMERIC(10,2),STOCK INT);

SELECT*FROM Books;

-- INSERT INTO Books('Book_id','title','Author','Genere','Published_year','price') VALUES()

drop  table if exists Customers;
CREATE TABLE Customers(Customer_id INT PRIMARY  KEY ,Name VARCHAR(100),Email VARCHAR(100),Phone VARCHAR(15),City VARCHAR(50),Country VARCHAR(150) );
SELECT*FROM Customers;

drop  table if exists Orders;
CREATE TABLE Orders(
order_id SERIAL PRIMARY KEY,Customer_id INT REFERENCES Customers(Customer_id),
Book_id INT REFERENCES Books(Book_id),
order_date DATE,Quantity INT ,Total_Amount NUMERIC(10,2));

SELECT*FROM Orders;

-- import data into Books table
COPY Books(Book_id ,title ,Author,
Genere,Published_year,price ,STOCK)
FROM '‪'
CSV HEADER;
-- impot data into Customers

COPY Customers(Book_id ,title ,Author,
Genere,Published_year,price ,STOCK)
FROM '‪'
CSV HEADER;


-- import data into orders table
COPY Orders(Book_id ,title ,Author,
Genere,Published_year,price ,STOCK)
FROM 'C:\Users\pc\Desktop\SQL\30 Day - SQL Practice Files\Orders.csv'
CSV HEADER;

-- 1)Retrive all books in the "fiction " genre
SELECT*FROM Books
WHERE Genere='Fiction';

SELECT COUNT(*)
FROM  Books
WHERE published_year>1950;

-- 2)Find books published after the year 1950;
SELECT*FROM Books

WHERE Published_year>1950;


-- 3)list  all the customers of the canada
SELECT*FROM Customers
WHERE Country='Canada';

-- 4)show order placed in November 2023
SELECT *FROM  Orders
WHERE order_date BETWEEN '2025-11-01' AND '2023-11-10';

-- 5)Retrive the total stocks of the books is AVLIABLE

SELECT SUM(Stock) AS Total_Books
FROM  Books;


-- 6)find the details of the most expensive books
SELECT*FROM Books ORDER BY Price DESC
LIMIT 1;



-- 7)show all customers who orderd more than one quantity of book

SELECT*FROM Orders
WHERE quantity>1;

-- count with null value
SELECT COUNT(*)
FROM Orders
WHERE quantity>1;

-- 8)Retrive all the order where the total amount exceedd 520;

SELECT*FROM Orders
WHERE total_amount>20;

-- 9)list all  the genere which  display here 
SELECT DISTNCT Genere FROM Books;

-- 10)FIND THE BOOK THE LOWEST STOCK
SELECT*FROM  Books ORDER BY  Stock DESC
LIMIT 1;

11)-- Calculate the total revenue generated from all orders
SELECT SUM(total_amount) AS Revenue 
FROM Orders


-- *****ADVANCE QUERIES*****


--1) Retrive the total no  of books sold  for each genra\
SELECT b.Genere,SUM(o.Quantity) AS total_book_sold
FROM Orders o
JOIN Books b
ON o.Book_id=b.Book_id
GROUP BY b.Genere;

-- SELECT b.Genere,SUM(o.Quantity) AS Total_sold
-- FROM Orders o
-- JOIN Books b
-- ON o.Book-id=b.Book_id
-- GROUP  BY Genere;


-- 2)FIND THE  AVERAGE PRICE OF BOOKS IN THE 'FANTASTY' GENERE
SELECT AVG(price) AS Average_Price
FROM Books
WHERE Genere='Fantasy';

-- 3)List  Customers who  have placed 2 order
SELECT  o.customer_id,c.name,COUNT(o.order_id) AS ORDER_COUNT
FROM Orders o
JOIN Customers c
ON o.customer_id=c.customer_id
GROUP BY o.customer_id,c.name
HAVING COUNT(order_id)>=2;

-- 4)find the most frequently  order book
SELECT Book_id,COUNT(order_id) AS ORDER_COUNT
FROM Orders
GROUP BY Book_id
ORDER BY ORDER_COUNT DESC;

-- FOR BOOK NAME YOU WILL HAVE TO USE JOIN FUNCTION
-- 5) show the top 3 most expensive books of 'Fantasy' Genere;
SELECT*FROM Books 
WHERE Genere='Fantasy'
ORDER BY price  DESC  LIMIT 3;




-- 6)Retrive the total quantity of Books Sold by each authors
SELECT b.Author, SUM(o.Quantity) AS Total_Books_Sold
FROM  Orders o
JOIN Books b
ON o.Book_id=b.Book_id
GROUP BY b.Author;


-- 7)List  the cities where customers who  spent or total_amunt over $30 are locate


SELECT  DISTINCT c.city ,total_amount
FROM  Orders o
JOIN Customers c 
ON o.customer_id=c.customer_id
WHERE o.total_amount>30;







-- 8)find the customer who  spent the most on orders;
SELECT c.customer_id, c.name,SUM(o.total_amount) AS  Total_Spent
FROM Orders o
JOIN Customers c
ON o.customer_id=c.customer_id
GROUP  BY  c.customer_id, c.name
ORDER BY  Total_Spent DESC;


-- 9)Calcuate the stock remaining after fulfilling all orders;
SELECT b.Book_id,b.title,b.stock,COALESCE(SUM(o.Quantity),0) AS order_quantity,b.stock-COALESCE(SUM(o.Quantity),0) AS Rmaining_Quantity
FROM Books b 
LEFT JOIN Orders o
ON b.Book_id=o.Book_id
GROUP BY  b.Book_id;







































  
  











