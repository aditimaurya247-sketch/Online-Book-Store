
# Online Book Store Management System (SQL Project)

## Project Overview
This project is a SQL-based Online Book Store Management System. It manages books, customers, and orders while providing various business insights using SQL queries.

The database consists of three main tables:

- Books
- Customers
- Orders

The project includes basic queries, aggregate functions, joins, and analytical SQL operations for reporting and business analysis. 0

---

## Database Schema

### Books Table
Stores information about books available in the store.

| Column | Data Type |
|----------|----------|
| Book_id | SERIAL PRIMARY KEY |
| title | VARCHAR(100) |
| Author | VARCHAR(100) |
| Genere | VARCHAR(100) |
| Published_year | INT |
| price | NUMERIC(10,2) |
| Stock | INT |

### Customers Table
Stores customer information.

| Column | Data Type |
|----------|----------|
| Customer_id | INT PRIMARY KEY |
| Name | VARCHAR(100) |
| Email | VARCHAR(100) |
| Phone | VARCHAR(15) |
| City | VARCHAR(50) |
| Country | VARCHAR(150) |

### Orders Table
Stores book purchase details.

| Column | Data Type |
|----------|----------|
| order_id | SERIAL PRIMARY KEY |
| Customer_id | INT (FK) |
| Book_id | INT (FK) |
| order_date | DATE |
| Quantity | INT |
| Total_Amount | NUMERIC(10,2) |

Database tables and relationships are defined in the SQL script. 1

---

## Features

### Basic Queries

- Retrieve all Fiction books.
- Find books published after 1950.
- List customers from Canada.
- View orders placed in a specific date range.
- Calculate total available stock.
- Find the most expensive book.
- Find customers ordering more than one book.
- Retrieve orders above a specified amount.
- List all available genres.
- Calculate total revenue generated from orders. 2

---

## Advanced SQL Analysis

### Sales Analysis
- Total books sold by genre.
- Total books sold by each author.
- Most frequently ordered book.

### Customer Analysis
- Customers with two or more orders.
- Customer who spent the highest amount.
- Cities where customers spent more than $30.

### Inventory Analysis
- Remaining stock after fulfilling all orders.
- Top 3 most expensive Fantasy books.
- Average price of Fantasy books. 3

---

## SQL Concepts Used

- DDL (CREATE TABLE, DROP TABLE)
- DML Operations
- Aggregate Functions
  - SUM()
  - AVG()
  - COUNT()
- JOIN Operations
  - INNER JOIN
  - LEFT JOIN
- GROUP BY
- HAVING
- ORDER BY
- LIMIT
- COALESCE()
- Foreign Key Constraints 4 5

---

## Project Structure
