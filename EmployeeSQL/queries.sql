--Data Analysis
--Once you have a complete database, do the following:

--List the following details of each employee:
--employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date LIKE '1986%';

--List the manager of each department with the following information:
--department number, department name, the manager's employee number,
--last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name,
	dm.from_date, dm.to_date
FROM employees as e
RIGHT JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
LEFT JOIN departments AS d ON dm.dept_no = d.dept_no;

--List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
RIGHT JOIN dept_emp AS de on e.emp_no=de.emp_no
LEFT JOIN departments AS d on de.dept_no = d.dept_no;

--List all employees whose first name is "Hercules"
--and last names begin with "B."
SELECT *
FROM employees
WHERE (first_name = 'Hercules' AND last_name LIKE 'B%');

--List all employees in the Sales department,
--including their employee number, last name, first name,
--and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
RIGHT JOIN dept_emp AS de on e.emp_no=de.emp_no
LEFT JOIN departments AS d on de.dept_no = d.dept_no
WHERE e.emp_no IN
	(SELECT emp_no
	FROM dept_emp
	WHERE dept_no = 'd007')
	;

--List all employees in the Sales and Development departments,
--including their employee number, last name, first name,
--and department name.

--Does not get rid of extra departments Employees worked at
CREATE VIEW q1 AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
RIGHT JOIN dept_emp AS de on e.emp_no=de.emp_no
LEFT JOIN departments AS d on de.dept_no = d.dept_no
WHERE e.emp_no IN
	(SELECT emp_no
	FROM dept_emp
	WHERE dept_no = 'd007' or dept_no = 'd005')
	;
--Use q1 to drop non Sales/Development rows
SELECT * FROM q1 WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as total
FROM employees
GROUP BY last_name
ORDER BY total DESC;
