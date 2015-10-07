## Database Systems - Overview
### _Homework_

1. What database models do you know?

    - Hierarchical model
    - Network model
    - Relational (table) model
    - Object model
    - Document model
    - Associative (Key-value) model
    - Star Schema
    - etc ...

2. Which are the main functions performed by a Relational Database Management System (RDBMS)


    - Database management system is designed to manage a database.
    - RDBMS Systems are very mature, rock solid.

    - Popular RDBMS Servers: 
        - Microsoft SQL Server
        - Microsoft Access
        - Oracle MySQL
        - Database
        - IBM DB2
        - PostgreSQL (Open-sourse cloning of Oracle)
        - SQLite (.dll - Database Server / .db - DB data)
        - Sybase ASE

    - Using for management of relational data stored in tables.

    -	Present the data to the user as relations – tabular form, collection of tables etc.
  
    - Definition of relational schema (database schema).

    - Create/Alter/Delete tables and relations between them.

    - Add/Change/Delete/Search/Retrieve data stored in tables

    - SQL Language Support.

    - Management (maintenance) of transactions.

3. Define what is "table" in database terms.

    - Table is a set of data elements(values) that is organized using a model of vertical columns  and horizontal rows. A cell is a unit where a row and column intersect. Each row is identified by the values appearing in a particular column subset which could be identified as a unique key.Row represents information about one record.Column represents a piece information / characteristic about certain record. Column has name and type.



4. Explain the difference between a primary and a foreign key.

    - A primary key is a value that is unique for every row of atable. Foreign key is a field that uniquely identifies a row of another table.

 

5. Explain the different kinds of relationships between tables in relational databases.

    - One-to-many – one element from a table can point to multiple entries in another and vice versa.
    
    - Many-to-many – many-to-many relationship is a type of cardinality that refers to the relationship between two entities A and B in which A may contain a parent record for which there are many children in B and vice versa

    - One-to-one – most common relation. One entry from one table points to another from another table. Can be used to create inheritance between tables.



6. When is a certain database schema normalized? What are the advantages of normalized databases?

    -	When redundancy and dependancy are minimized a database is considered normalized. This is usually done through dividing big tables and defining relationships between them. It uses more CPU power to find data when doing operations with tables, but can significantly lower the memory footprint of a database.

7. What are database integrity constraints and when are they used?

    - Ensure data integrity in the database tables    
    - Enforce data rules whick cannot be violated

    - Used for Primary key:
        - Ensures unique value for each table row

    - Used for Unique key:
        - Ensures that all values in a certain column are unique

    - Used for Foreign key:
        - Ensures that the value in given column is a key from another table

    - Used for Check constraint (data restriction):
        - Ensures that values in a certain column meet some predefined condition

8. Point out the pros and cons of using indexes in a database.

    - Pros:
        - Faster lookup for results in certain column or group of columns (using index structures such as B-Trees or Hash Indexes to speed up searching of values). 
        - Instead of scanning the entire table for the results.

    - Cons: 
        - Slower writes - adding / deleting records in indexed tables is slower.
        - May cause the system to restructure the index of structure (Hash Index, B-Tree, etc), which can be very computationally expensive.
        - Takes up more disk space - stores more data.

9. What's the main purpose of the SQL language?

    - DDL - Data Definition Language: 
        - Creating, altering, deleting tables and other objects in the database.

    - DML - Data Manipulation Language:
        - Searching, retrieving, inserting, modifying and deleting table data (rows).

10. What are transactions used for? Give an example.

    - 	A transaction is sequence of operations done in a database which is preformed as one unit of work. This prevents failures in cases of concurrency, system failure, cancellation or uncompleted tasks.	Withdrawal from a bank accout. 


11. What is a NoSQL database?
    
    - Use document-based model (non-relational)
    - Data stored as documents
    - Documents do not have a fixed structure

12. Explain the classical non-relational data models.

    - A non-relational database is a database that does not incorporate the table/key model that relational database management systems (RDBMS) promote.

    -  These kinds of databases require data manipulation techniques and processes designed to provide solutions to big data problems that big companies face. 

    - The most popular emerging non-relational database is called NoSQL (Not Only SQL).

13. Give few examples of NoSQL databases and their pros and cons.

    - Databases:
        - Cassandra (Distributed wide-column database)
        - MongoDB (Mature and powerful JSON-Document database)
        - CouchDB (JSON-based document database with REST API)
        - Redis (Ultra-fast in-memory data structures server)
        - H-Base
        - etc ...

    - Models: 
        - Document model
        - Associative (Key-value) model
        - Hierarchical key-value model
        - Wide-column model
        - Object model
        - etc ...

    - Pros: 
        - Support CRUD operations
        - Support Indexing and querying
        - Support concurrency and transactions
        - Highly optimized for append / retrieve
        - Great performance and scalability
        - etc ...

    - Cons:
        - Difficult administration and support
        - etc ... 