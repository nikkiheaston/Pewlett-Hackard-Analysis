--Deliverable 1
SELECT 	e.emp_no, 
		e.first_name, 
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT COUNT (title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

--Deliverable 2

SELECT 	DISTINCT ON (e.emp_no) e.emp_no, 
		e.first_name, 
		e.last_name, 
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_employees as de
	ON (e.emp_no = de.emp_no)
JOIN titles as t
	ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no


--Deliverable 3 (2 Additional Queries)

--Total current employees, then broken up by title (including those retiring soon)

SELECT COUNT(emp_no)
FROM titles
WHERE to_date = '9999-01-01';
--240124

SELECT COUNT (emp_no) total, title
INTO all_current_titles
FROM titles
WHERE to_date = '9999-01-01'
GROUP BY title; 

--Get the count of all retiring employees by birth year to staggar hiring each year
SELECT 	e.emp_no, 
		e.first_name, 
		e.last_name,
		t.title
INTO born_1952
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1952-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT (title), title
FROM born_1952
GROUP BY title
ORDER BY title;

SELECT 	e.emp_no, 
		e.first_name, 
		e.last_name,
		t.title
INTO born_1953
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1953-01-01' AND '1953-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT (title), title
FROM born_1953
GROUP BY title
ORDER BY title;

SELECT 	e.emp_no, 
		e.first_name, 
		e.last_name,
		t.title
INTO born_1954
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1954-01-01' AND '1954-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT (title), title
FROM born_1954
GROUP BY title
ORDER BY title;

SELECT 	e.emp_no, 
		e.first_name, 
		e.last_name,
		t.title
INTO born_1955
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1955-01-01' AND '1955-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT COUNT (title), title
FROM born_1955
GROUP BY title
ORDER BY title;

