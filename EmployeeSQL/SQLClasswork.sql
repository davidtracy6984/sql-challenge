-- Question 1
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no

-- Question 2
-- fix the year import issue of no dates before 1970??
UPDATE employees
SET birth_date = birth_date - interval '100 year'
WHERE birth_date > '2020-05-11';
UPDATE employees
SET hire_date = hire_date - interval '100 year'
WHERE hire_date > '2020-05-11';

-- Question 2 Part 2
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01'

--Question 3
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, de.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN departments de ON dm.dept_no = de.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no

--Question 4
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments ON de.dept_no = departments.dept_no;

--Question 5
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select e.first_name, e.last_name
FROM employees e
WHERE e.first_name = 'Hercules'AND e.last_name LIKE 'B%';

--Question 6
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dp.dept_name
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales'

-- Question 7
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select e.emp_no, e.last_name, e.first_name, dp.dept_name
From employees e
INNER Join dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments dp ON de.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales' OR dp.dept_name = 'Development'

Qestion 8
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, COUNT(*) AS "Number of last"
FROM employees e
GROUP BY e.last_name
ORDER BY "Number of last" DESC


