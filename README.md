# Human Resources Data Base
![image](https://project-management.com/wp-content/uploads/2021/03/Database-scaled.jpeg)

## Background

This repository discusses a research project on the human resources data base at Pewlett Hackard company from 1980s and 1990s. All that remains of the employee database from that period are six CSV files.

For this project,  tables are deisgned to hold the data from the CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, perform data modeling, data engineering, and data analysis, respectively.

## 1. Data Modeling

To model the employee data a basic data modleing technique called Entity-Relationship-Diagrams or ERD was used. By using this technique six employee tables are identified, this entities are employees, departments, salaries, titles, department managers, and department employees. 
The ERD also looks as follows:
![employee_ERD](https://user-images.githubusercontent.com/116973607/218816884-b58c5d24-9102-405e-8cba-3f8f27e25bee.png)

## 2. Data Engineering

By usnig the availabe information a table schema for each of the six CSV files was created, and the data types, primary keys, foreign keys and constraints also developped. The order of the tables is based on the primary and foreign arrangments.

> Note: to import each CSV file into the corresponding SQL table the order strictly should be followed to avoid errors.

