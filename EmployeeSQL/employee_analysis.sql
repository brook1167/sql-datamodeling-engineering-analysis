-- Data Analysis

-- Question 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT employee.emp_no
	,employee.last_name
	,employee.first_name
	,employee.sex
	,salary.salary
FROM employees AS employee
INNER JOIN salaries AS salary ON salary.emp_no = employee.emp_no;

-- Question 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
    first_name, 
    last_name,
    hire_date
FROM employees 
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'

-- Question 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT departments.dept_no,
       departments.dept_name,
       dept_manager.emp_no,
       employees.last_name,
       employees.first_name
FROM departments departments
    INNER JOIN department_manager dept_manager
        ON departments.dept_no = dept_manager.dept_no
    INNER JOIN employees employee
        ON dept_manager.emp_no = employee.emp_no;

-- Question 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dept_emp.emp_no,
       employees.last_name,
       employees.first_name,
       departments.dept_name
FROM department_Employee dept_emp
    INNER JOIN employee
        ON dept_emp.emp_no = employee.emp_no
    INNER JOIN departments
        ON dept_emp.dept_no = departments.dept_no;

-- Question 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
    first_name, 
    last_name, 
    sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- Question 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employee.emp_no,
       employee.last_name,
       employee.first_name
FROM department_Employee dept_emp
    INNER JOIN employees employee
        ON dept_emp.emp_no = employee.emp_no
    INNER JOIN departments departments
        ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


-- Question 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employee.emp_no,
       employee.last_name,
       employee.first_name,
       departments.dept_name
FROM department_Employee dept_emp
    INNER JOIN employees employee
        ON dept_emp.emp_no = employee.emp_no
    INNER JOIN departments departments
        ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name IN ( 'Sales', 'Development' );

-- Question 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name,
       COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;