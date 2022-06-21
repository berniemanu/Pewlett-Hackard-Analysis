-- Challenge - Deliverable 1
SELECT e.emp_no, e.first_name, e.last_name, e.gender, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, 
	rt.first_name, 
	rt.last_name, 
	rt.title
INTO unique_titles
FROM ret_titles AS rt
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;


-- Number of employees by their most recent job title about to retire.
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;


-- Challenge - Deliverable 2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, t.from_date, t.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;