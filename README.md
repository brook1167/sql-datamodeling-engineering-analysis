# Background

As a newly hired data engineer at Pewlett Hackard, your primary objective is to investigate the employment records of individuals hired during the 1980s and 1990s. With only six CSV files remaining from that period, your responsibilities include constructing SQL tables to store the CSV data, importing the CSV files into the SQL database, and conducting comprehensive data analysis. This entails designing the SQL queries for importing the CSV data and performing thorough analysis to extract meaningful insights.

## Objectives

### Data Modeling

The first step in this project involves downloading the provided CSV files containing data from Pewlett Hackard. With these files in hand, your task is to design an appropriate database schema by modeling tables that accurately represent the data within the CSV files.

[Download Starter Code Zip](https://static.bc-edx.com/data/dl-1-1/m9/lms/starter/m9-starter-code.zip)

ERD Image

![Employee Erd](EmployeeSQL/employee_erd.png)


### Data Engineering

Utilize the provided data to devise a table schema for each of the six CSV files.

```sql
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(25) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary DECIMAL(7,2) NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE departments (
    dept_no INT NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE dept_manager (
    dept_no INT NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no INT NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

