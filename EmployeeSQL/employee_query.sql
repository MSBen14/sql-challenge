--Create Tables and import CSV file for each Table

CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY ,
	title VARCHAR NOT NULL
);

CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);


-- The dept_emp table is >-< relationship, we need 2 primary keys

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE salaries(
	emp_no INT PRIMARY KEY ,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-----------------------------------------*Data Analysis*------------------------------------------

--1. List the employee number, last name, first name, sex, and salary of each employee.
-- USING JOIN method
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON  employees.emp_no = salaries.emp_no; 

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
-- USING WHERE & Wildcard : % before to get all the employees hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
--Using JOIN method
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees on dept_manager.emp_no = employees.emp_no;


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--Using JOIN method
SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no


---5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
-- USING WHERE & Wildcard : % after to get the last name begins with B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.
--Display the deprtments table to know dept_no of Sales department to filter by the department number sales = 'd007'
SELECT * 
FROM departments;
--------------------------- Using JOIN and WHERE method
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees 
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--Display the deprtments table to know dept_no of Sales & Development departments to filter by the department number of Sales = 'd007' & Development = 'd005'
SELECT * 
FROM departments;
--------------------------- Using JOIN, WHERE & OR method
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007' OR departments.dept_no = 'd005';


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
--Using COUNT, GROUP BY & ORDER BY DESC
SELECT last_name, COUNT(last_name) as "Frequency counts"
FROM employees
GROUP BY last_name
ORDER BY "Frequency counts" DESC;


