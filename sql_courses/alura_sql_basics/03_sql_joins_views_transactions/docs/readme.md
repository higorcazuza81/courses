# Course: SQL, Views, Joins, and Transactions - Serenatto Café Project

![alt text](image.png)

## Introduction

This repository contains the SQL queries I developed during the **"SQL, Views, Joins, and Transactions"** course offered by Alura, applied to a fictional database called *Serenatto Café*. The course’s goal was to solve business demands using SQL, applying concepts ranging from basic queries to advanced techniques for data manipulation and analysis.

Throughout the course, I used SQLite as the database and Visual Studio Code (VSCode) with the SQLTools extension to develop the queries.

In this repository, you will find files that include table creation, insertion of fictitious data, record updates, table joins, and the creation of views and triggers, all focused on simulating a business environment for data analysis and report generation.

## Project Structure

The project follows the directory structure below:

```
text
├── data
│   └── insert_data.sql        # Script to insert data into database tables
├── db
│   └── Serenatto.db           # SQLite database containing tables and data
├── docs
│   ├── readme.md              # This file with project information
│   └── schema_diagram.pdf     # Database schema diagram
├── queries
│   ├── serenatto_queries.sql  # SQL queries performed on the database
│   ├── update_data.sql        # Script for data updates
│   └── views
│       └── create_views.sql   # Script to create views
└── schemas
    ├── create_tables.sql      # Script to create database tables
    └── create_triggers.sql    # Script to create triggers
```

---

## File Descriptions

- **data/insert_data.sql**: Contains scripts to insert data into the database tables. This script populates the tables with fictitious data about `clientes`, `produtos`, `colaboradores`, `fornecedores`, and `pedidos`. Additionally, it inserts items into orders and updates statuses and prices as part of the simulated business flow.

- **docs/schema_diagram.pdf**: Visual diagram of the database schema illustrating the relationships between tables.

- **queries/serenatto_queries.sql**: File with SQL queries to perform searches, joins, and filtering in the database. This file also includes examples of data manipulation, such as updating order statuses and removing employee records. It can be expanded with new queries as learning progresses.

- **queries/update_data.sql**: Script to update data in database tables. This file contains queries to modify existing data, such as updating product prices or order statuses.

- **queries/views/create_views.sql**: Script to create views in the database. Views simplify complex queries and aggregate data from multiple tables, providing an easier way to access frequently used information.

- **schemas/create_tables.sql**: Script to create the necessary tables in the database based on course requirements. The tables include information about `colaboradores`, `fornecedores`, `clientes`, `produtos`, and `pedidos`.

- **schemas/create_triggers.sql**: Script to create triggers in the database, automating calculations or checks whenever certain events occur, such as data insertion or record updates. Triggers ensure data integrity and automate processes like revenue calculations or adjustments in related records.

---

## How to Use

### Prerequisites

Before getting started, ensure you have the necessary tools installed on your machine:

1. **SQLite**: SQLite is the database system used in this project. If you don’t have SQLite installed, follow these steps:
   - Visit the [official SQLite website](https://www.sqlite.org/download.html).
   - Download the version suitable for your operating system.
   - Follow the installation instructions provided on the website.

2. **Visual Studio Code (VSCode)**: To easily edit and execute SQL files, we recommend using Visual Studio Code (VSCode). If you haven’t installed it yet, download and install it from the [official VSCode website](https://code.visualstudio.com/).

3. **SQLTools Extension in VSCode**: To integrate SQLite with VSCode, you need to install the **SQLTools** extension. Follow these steps:
   - Open **Visual Studio Code**.
   - Go to the extensions tab (square icon on the left sidebar).
   - Search for **SQLTools** in the search bar.
   - Click **Install** on the **SQLTools** extension.
   - After installation, restart VSCode if necessary.

4. **SQLTools Configuration in VSCode**:
   - After installing the SQLTools extension, configure SQLite as your database:
     - Click the SQLTools icon in the left sidebar.
     - Select **New Connection** and choose **SQLite**.
     - In the **Database File** option, provide the path to create or load the database (e.g., Serenatto.db).
     - Save the connection settings.

---

### Steps to Use the Project

1. **Clone the Repository**:
   - First, clone this repository to your local machine. Open the terminal (or command prompt) and run the following command:
     ```bash
     git clone https://github.com/higorcazuza81/courses/tree/main/sql_courses/alura_sql_basics/03_sql_joins_views_transactions
     ```

2. **Create the Database**:
   - Open the `schemas/create_tables.sql` file in VSCode.
   - Connect to the SQLite database using SQLTools, as described above.
   - Run the `create_tables.sql` script to create the necessary tables in the database. This script will create tables for `clientes`, `produtos`, `colaboradores`, `fornecedores`, and `pedidos`.

3. **Insert Data**:
   - Open the `data/insert_data.sql` file in VSCode.
   - Execute the script to insert fictitious data into the tables. This includes data about `clientes`, `produtos`, `colaboradores`, `fornecedores`, and `pedidos`, along with order items and order statuses.

4. **Run Queries**:
   - After creating the tables and inserting data, open the `queries/serenatto_queries.sql` file to perform SQL queries on the database.
   - Execute queries to perform searches, joins, filtering, and data manipulation. Use this file to explore different aspects of the data.

5. **Update Data**:
   - If you need to update existing data, use the `queries/update_data.sql` script. It contains queries to modify information in the database, such as product prices or order statuses.

6. **Create Views**:
   - The `queries/views/create_views.sql` file allows creating views in the database. Views simplify complex queries and aggregate data from multiple tables, making it easier to extract frequently accessed information.

7. **Use Triggers**:
   - The `schemas/create_triggers.sql` script can be used to create triggers in the database. Triggers automate actions like calculations and adjustments in records whenever a specific event occurs (e.g., data insertion or updates).

### Additional Tips

- **VSCode + SQLTools**: When using VSCode with the SQLTools extension, you can execute SQL queries directly in the editor, making it easier to manage the database without switching between tools.
  
- **Database Backup**: If you’re experimenting or making changes to the data, always back up the `Serenatto.db` file to avoid losing important data.

- **Expanding the Project**: As you advance in your learning, you can add new queries to the `serenatto_queries.sql` file, create new views in the `create_views.sql` file, or even modify the database schema to accommodate new requirements.

With these steps, you are ready to use the database and explore the project while learning SQL.

---

### Query Examples

Below are some examples of SQL queries demonstrating the use of joins, subqueries, aggregations, and data manipulation in the Serenatto Café database system.

1. **Combine employee and supplier addresses using UNION**:

This query combines employee and supplier addresses, removing duplicates between the datasets using the UNION operator.

```sql
-- Combine employee and supplier addresses, removing duplicates
SELECT Rua, Bairro, Cidade, Estado, cep
FROM colaboradores
UNION
SELECT Rua, Bairro, Cidade, Estado, cep
FROM fornecedores;
```

2. **Display products with prices above average**:

In this example, the query calculates the average product price and returns products priced above the average using a subquery within a HAVING clause.

```sql
-- Display products with prices above average
SELECT nome, preco
FROM produtos
GROUP BY nome, preco
HAVING preco > (
    SELECT AVG(preco)
    FROM produtos
);
```

3. **Verify which products were ordered in October**:

Using JOIN and `strftime`, this query returns products ordered during October.

```sql
-- Query products ordered in October
SELECT pr.nome, x.idproduto, x.idpedido
FROM (
    SELECT ip.idpedido, ip.idproduto
    FROM pedidos p
    JOIN itenspedidos ip ON p.id = ip.idpedido
    WHERE strftime('%m', p.datahorapedido) = '10'
) x
RIGHT JOIN produtos pr ON pr.id = x.idproduto;
```

---

## Contributing

This project is solely for educational purposes within the context of the Alura course. If you wish to contribute or improve this repository, feel free to open an **issue** or **pull request** with suggestions.

---

## License

This project is licensed under the MIT License.

