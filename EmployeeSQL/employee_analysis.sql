-- Data Analysis

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT employee.emp_no
	,employee.last_name
	,employee.first_name
	,employee.sex
	,salary.salary
FROM employees AS employee
INNER JOIN salaries AS salary ON salary.emp_no = employee.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name, 
    last_name,
    hire_date
FROM employees 
WHERE hire_date >= '1986-01-01' AND emp.hire_date <= '1986-12-31'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT departments.dept_no,
       departments.dept_name,
       dept_manager.emp_no,
       employees.last_name,
       employees.first_name
FROM departments departments
    INNER JOIN dept_manager dept_manager
        ON departments.dept_no = dept_manager.dept_no
    INNER JOIN employees employees
        ON dept_manager.emp_no = employees.emp_no;

        