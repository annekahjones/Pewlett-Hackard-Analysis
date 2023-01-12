-- CHALLENGE 7 WORK
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
				   			   rt.first_name,
				   			   rt.last_name,
				  			   rt.title

INTO unique_titles
FROM retirement_titles AS rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

-- Number of employees by job title about to retire
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;


-- Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no)
	   				e.emp_no,
	  				e.first_name,
	   				e.last_name,
	   				e.birth_date,
	   				de.from_date,
	   				de.to_date,
	   				ti.title
INTO mentorship_elig
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

-- Finding the largest salary of an employee that could retire
SELECT ut.emp_no,
	   ut.first_name,
	   ut.last_name,
	   ut.title,
	   s.salary
INTO unique_salaries
FROM unique_titles AS ut
INNER JOIN salaries AS s
ON ut.emp_no = s.emp_no
ORDER BY s.salary DESC;

-- Finding how many female employees are eligible for retirement
SELECT e.gender,
	   ut.emp_no,
	   ut.first_name,
	   ut.last_name,
	   ut.title
INTO unique_female
FROM employees AS e
INNER JOIN unique_titles AS ut
ON e.emp_no = ut.emp_no
WHERE gender = 'F';

