-- Employees Table (Primary Key: emp_no)
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(1) CHECK (gender IN ('M', 'F')),
    hire_date DATE
);

-- Departments Table (Primary Key: dept_no)
CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

-- Department Managers Table (Primary Key: dept_no, emp_no)
CREATE TABLE dept_manager (
    dept_no CHAR(4),
    emp_no INT,
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (dept_no, emp_no), -- Composite Primary Key
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Department Employees Table (Primary Key: emp_no, dept_no)
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no CHAR(4),
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (emp_no, dept_no), -- Composite Primary Key
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE
);

-- Salaries Table (Primary Key: emp_no, from_date)
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (emp_no, from_date), -- Ensures each salary period is unique
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Titles Table (Primary Key: emp_no, title, from_date)
CREATE TABLE titles (
    emp_no INT,
    title VARCHAR(50),
    from_date DATE,
    to_date DATE,
    PRIMARY KEY (emp_no, title, from_date), -- Ensures unique title per period
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);
