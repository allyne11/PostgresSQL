Employee Database - PostgreSQL Implementation

Project Overview

This project sets up a PostgreSQL database from six CSV files containing employee-related data. The process includes:

Defining table schemas with appropriate data types, primary keys, and foreign keys.

Creating tables in the correct order to maintain foreign key constraints.

Importing CSV files into corresponding tables.

Running SQL queries to extract meaningful employee data.

Database Schema Overview

The database consists of six tables:

Employees: Stores employee details.

Departments: Contains department information.

Department Managers: Tracks managers assigned to departments.

Department Employees: Records department assignments for employees.

Salaries: Maintains employee salary records.

Titles: Stores employee job titles.

Primary and foreign keys are set to ensure data integrity, and composite keys are used where necessary.

Importing CSV Files into PostgreSQL

Use the following commands to load data into the tables:

COPY employees FROM '/path/to/employees.csv' DELIMITER ',' CSV HEADER;
COPY departments FROM '/path/to/departments.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager FROM '/path/to/dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp FROM '/path/to/dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM '/path/to/salaries.csv' DELIMITER ',' CSV HEADER;
COPY titles FROM '/path/to/titles.csv' DELIMITER ',' CSV HEADER;

For permission errors, use \copy instead of COPY.

Key SQL Queries

Retrieve Employee and Salary Information:

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

Employees Hired in 1986:

SELECT first_name, last_name, hire_date FROM employees WHERE EXTRACT(YEAR FROM hire_date) = 1986;

Department Managers:

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;

Employees in Sales and Development Departments:

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

Frequency of Employee Last Names:

SELECT last_name, COUNT(*) AS frequency FROM employees GROUP BY last_name ORDER BY frequency DESC;

Conclusion

This project successfully establishes a PostgreSQL relational database, imports employee-related data, and provides SQL queries for analysis. By following these steps, you can efficiently manage and explore this dataset.