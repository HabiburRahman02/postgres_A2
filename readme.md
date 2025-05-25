### 1. What is PostgreSQL?
PostgreSQL is an open-source relational database system that I find really powerful and flexible. It supports complex queries, transactions, and works well with big projects. What I like most about PostgreSQL is that it follows the SQL standards and also allows some object-oriented features like table inheritance and custom data types. I’ve used it in projects where I needed to store and manage structured data like user info, products, and orders. It also supports JSON, which makes it useful when combining relational and non-relational data together.

### 2. What is the purpose of a database schema in PostgreSQL?
In PostgreSQL, a schema is like a folder inside a database. I use it to organize tables and other database objects. For example, if I’m working on a big project that has multiple modules like users, products, and sales, I can create separate schemas for each module. This helps avoid name conflicts, improves structure, and makes permissions easier to manage. I learned that schemas are especially useful when many developers or teams are sharing the same database.

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
From what I’ve learned, a Primary Key is used to uniquely identify each row in a table. It doesn’t allow NULL values or duplicates. I always make sure to use it in tables where I need each row to be distinct — like user_id in a users table.

A Foreign Key, on the other hand, is used to create a link between two tables. For example, if I have an orders table and a users table, I can add a user_id as a foreign key in the orders table. This way, it ensures that every order is connected to a valid user, which keeps the data consistent and avoids broken relationships.

### 4. What is the difference between the VARCHAR and CHAR data types?
When I worked with text fields in PostgreSQL, I learned that both VARCHAR and CHAR are used to store strings, but they behave differently.

VARCHAR(n) stores a variable-length string with a maximum of n characters. It only uses the space it needs.

CHAR(n) always stores a fixed-length string. If the string is shorter than n, it pads the rest with spaces.

So, I usually prefer VARCHAR because it’s more flexible and space-efficient. I use CHAR only when I know the string length will always be the same, like country codes (CHAR(2) for 'BD', 'US').

### 5. Explain the purpose of the WHERE clause in a SELECT statement.
The WHERE clause is something I use all the time in PostgreSQL. It helps me filter rows based on certain conditions. Without it, a SELECT statement returns all the rows from a table, which is not useful when I’m looking for specific data.

This is really helpful when I'm debugging or displaying filtered data on a web page. I also combine it with other clauses like ORDER BY, LIMIT, or even subqueries to build more advanced queries.

