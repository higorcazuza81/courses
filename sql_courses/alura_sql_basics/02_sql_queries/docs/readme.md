# Course: Executing SQL Queries - Fokus Project

![Fokus](fokus.png)

## Introduction

This repository contains the SQL queries I developed during the **Executing SQL Queries** course from Alura, applied to a fictional HR company database called **Fokus**. The main goal was to solve business demands using SQL, applying concepts from basic queries to more advanced techniques for data manipulation and analysis.

Throughout the course, I used **SQLite** as the database and **Visual Studio Code (VSCode)** with the **SQLTools** extension to develop the queries.

## What You'll Find in This Repository

Here are the key learning areas covered in the course, represented by SQL queries:

- **Basic Queries**: Using `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT` to filter and sort data.
- **Advanced Queries**: Applying aggregate functions like `COUNT`, `SUM`, `AVG` and using `GROUP BY` to group data.
- **Data Manipulation**: Commands for modifying data with `UPDATE`, `DELETE`, and inserting data with `INSERT INTO`.
- **Text and Date Queries**: Manipulating and filtering data with `LIKE`, `DATE`, `STRFTIME`, and other text and date functions.
- **Result Analysis**: Calculating averages, totals, and using `CASE` for dynamic data classifications.

## Project Objectives

The goal of this project was to simulate the environment of an HR company and use SQL queries to generate insights useful for decision-making. Some of the objectives were:

- Extract significant data about employees, revenue, training, and other aspects of the company.
- Apply aggregation calculations and transformation functions to generate reports ready for performance analysis and operational improvements.

## Implemented Queries

Here are some of the queries performed during the course:

- **List the top 5 employees with the highest salary**: Displays the employees with the highest recorded salaries.
- **Search for courses with names starting with 'O poder'**: Searches for specific training courses by the first part of the course name.
- **Check the highest monthly gross revenue**: Displays the month with the highest gross revenue.
- **Count terminated contracts**: Calculates the number of employment contracts that were terminated.
- **Salary classification based on salary range**: Classifies employees into salary categories: 'Baixo' (Low), 'Médio' (Medium), and 'Alto' (High).
- **Calculate the number of days between hiring and contract termination**: Calculates the duration of each employee's employment contract.

These queries demonstrate a variety of techniques, including data manipulation, aggregation, and transformation functions.

## Technologies Used

- **Database**: SQLite – Ideal for those starting to work with SQL, offering the main functionalities to perform queries on relational databases.
- **Development Tool**: Visual Studio Code with the SQLTools extension – Enables easy and practical interaction with the SQLite database, facilitating learning and query execution.

## How to Run the Project

### Environment Setup

1. Install **Visual Studio Code** and the **SQLTools** extension.
2. Download the **Fokus** database provided in the course, or use the corresponding SQLite file.

### Running the Queries

1. Open **VSCode** and set up the connection to the SQLite database using the **SQLTools** extension.
2. Execute the SQL queries found in this repository, adapting them as needed to solve new business demands.

## Conclusion

With the completion of this project, I gained a solid understanding of how to use SQL to work with data in relational databases. I am now prepared to apply these skills in real-world challenges in the job market, whether for financial data analysis, business operations, or performance analysis in companies.

## License

This project is licensed under the MIT License.
