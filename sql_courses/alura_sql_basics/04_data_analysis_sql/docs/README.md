# Data Analysis with SQL - Zoop Megastore Black Friday Project

![Zoop Megastore](image.png)

## Project Description

This project was developed to analyze Zoop Megastore's sales data during the Black Friday period. Using SQL, we extracted and manipulated data to generate valuable insights about sales performance, product categories, suppliers, and trends over the years.

## Skills Developed

- **Data Manipulation with SQL**: Learned to use aggregation functions, subqueries, and `GROUP BY` and `ORDER BY` clauses to organize and summarize data.
- **Conditional Queries**: Used the `CASE WHEN` clause to create conditional sums and generate comparative reports between different years.
- **Temporal Data Extraction**: Used the `strftime` function to extract specific parts of dates, such as month and year, for temporal analyses.
- **Trend Analysis**: Developed queries to identify sales trends over the years and compare the performance of different categories and suppliers.

## Repository Structure

- `docs/`: Project documentation.
    - `README.md`: This documentation file.

- `output/`: Analysis results and generated reports.
    - `01_graphical_analysis.xlsx`: Graphical sales analysis.
    - `02_graphical_analysis.xlsx`: Graphical sales analysis.
    - `zoop_black_friday_report - Zoop.docx`: Detailed Black Friday sales report.

- `queries/`: SQL queries used in the project.
    - `01_queries.sql`: General queries for counting and selecting data.
    - `02_black_friday_meeting_queries.sql`: Specific queries for the Black Friday meeting.
    - `03_general_framwork.sql`: General query framework for sales analysis.

## SQL Query Examples

### General Queries

The general queries are located in the file [`queries/01_queries.sql`](queries/01_queries.sql) and include:
- **Category Selection**: `SELECT * FROM categorias;`
- **Record Count**: `SELECT COUNT(*) FROM vendas;`
- **Temporal Analysis**: `SELECT strftime('%Y', data_venda) AS Ano, COUNT(*) AS Qtd_Vendas FROM Vendas GROUP BY Ano;`

### Black Friday Meeting Queries

The specific queries for the Black Friday meeting are in the file [`queries/02_black_friday_meeting_queries.sql`](queries/02_black_friday_meeting_queries.sql) and include:
- **Supplier Role**: `SELECT fornecedor, COUNT(*) AS Qtd_Vendas FROM Vendas WHERE data_venda BETWEEN '2021-11-26' AND '2021-11-29' GROUP BY fornecedor;`
- **Product Categories**: `SELECT categoria, COUNT(*) AS Qtd_Vendas FROM Vendas WHERE data_venda BETWEEN '2021-11-26' AND '2021-11-29' GROUP BY categoria;`

### General Query Framework

The general query framework is in the file [`queries/03_general_framwork.sql`](queries/03_general_framwork.sql) and includes:
- **Monthly Sales Summary by Year**:
    ```sql
    SELECT Mes,
    SUM(CASE WHEN Ano='2020' THEN Qtd_Vendas ELSE 0 END) AS "2020",
    SUM(CASE WHEN Ano='2021' THEN Qtd_Vendas ELSE 0 END) AS "2021",
    SUM(CASE WHEN Ano='2022' THEN Qtd_Vendas ELSE 0 END) AS "2022",
    SUM(CASE WHEN Ano='2023' THEN Qtd_Vendas ELSE 0 END) AS "2023"
    FROM (
            SELECT strftime('%m', data_venda) AS Mes, strftime('%Y', data_venda) AS Ano, COUNT(*) AS Qtd_Vendas
            FROM Vendas
            GROUP BY Mes, Ano
            ORDER BY Mes
    )
    GROUP BY Mes
    ORDER BY Mes;
    ```

## How to Run the Queries

To run the SQL queries in this project, follow the steps below:

1. **Clone the Repository**: Download the project to your local environment using the command:
        ```sh
        git clone https://github.com/your-username/repository-name.git
        ```
2. **Install a DBMS**: Ensure you have a Database Management System (DBMS) installed, such as SQLite, MySQL, or PostgreSQL.
3. **Load the Data**: Import Zoop Megastore's sales data into your DBMS. You can use import scripts or database administration tools.
4. **Run the Queries**: Use an SQL client to run the queries located in the `queries/` folder. For example, you can use SQLite3 to run the queries in an SQLite database.

### Installing SQLite on Linux

To install SQLite on Linux, run the following command in the terminal:

```sh
sudo apt-get install sqlite3
```

### Using SQLTools in VSCode

1. **Install the SQLTools Extension**: In VSCode, go to the extensions tab and search for "SQLTools". Install the extension.
2. **Configure the Connection**: Open SQLTools and configure a new connection to your database.
3. **Run the Queries**: Open the query files in the `queries/` folder and run the queries directly in VSCode using SQLTools.

### Example of Running with SQLTools in VSCode

1. **Open VSCode** and navigate to the project directory.
2. **Install the SQLTools Extension**: In VSCode, go to the extensions tab and search for "SQLTools". Install the extension.
3. **Configure the Connection**: Open SQLTools and configure a new connection to your SQLite database.
4. **Load and Run the Queries**:
        - Open the desired query file in the `queries/` folder.
        - Right-click in the code editor and select "Run Query" to execute the query.

```sh
# Example terminal commands to open VSCode in the project directory
cd /path/to/project
code .
```

## Conclusion

This project demonstrated how to use SQL to analyze large volumes of sales data, identify trends, and generate valuable insights. The skills developed here are essential for any professional looking to work in data engineering and data analysis.

## References

- [SQLite Documentation](https://www.sqlite.org/docs.html)
- [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
- [Alura SQL Course](https://www.alura.com.br/curso-online-sql)