-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);
CREATE TABLE employees (
	emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

 CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(40) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY(emp_no) REFERENCES salaries (emp_no)
);

CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (emp_no) REFERENCES salaries (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);


SELECT * FROM departments;


-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_list
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')

-- Check the table
SELECT * FROM retirement_list;


-- Joining retirement_info and titles tables
SELECT rt.emp_no,
    rt.first_name,
rt.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM retirement_list as rt
INNER JOIN titles as ti
ON rt.emp_no = ti.emp_no
order by rt.emp_no;

SELECT * FROM retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title 

INTO unique_titles 
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')

SELECT * FROM unique_titles
ORDER BY emp_no;

-- Retired Employee count by title
SELECT COUNT(ut.emp_no), title
INTo retiring_titles 
FROM unique_titles as ut
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Create new table for retiring employees
SELECT employees.emp_no, 
employees.first_name, 
employees.last_name, 
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date
INTO mentor_elig
FROM employees 
LEFT JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
WHERE (dept_emp.to_date= '9999-01-01')
AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31');

Select * from mentor_elig

SELECT DISTINCT ON (titles.emp_no) mentor_elig.emp_no,
mentor_elig.first_name,
mentor_elig.last_name, 
mentor_elig.birth_date,
mentor_elig.from_date,
mentor_elig.to_date, 
Titles.title
INTO Mentorship_eligibility
From mentor_elig
LEFT JOIN Titles
ON mentor_elig.emp_no = titles.emp_no
ORDER BY titles.emp_no


select * from Mentorship_eligibility
