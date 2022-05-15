-- Create retirement_titles table
SELECT e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS t
    ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Order By to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO cleaned_retirement_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM cleaned_retirement_titles;

-- Number of employees about to retire from each title
SELECT COUNT(crt.emp_no), crt.title
INTO retiring_titles
FROM cleaned_retirement_titles as crt
GROUP BY crt.title
ORDER BY COUNT(crt.emp_no) DESC;

SELECT * FROM retiring_titles;

-- Create mentorship_eligibility table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp AS de
    ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
    ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Create table for department specific mentors
SELECT DISTINCT ON (e.emp_no) e.emp_no,
de.from_date,
de.to_date,
d.dept_name,
t.title
INTO dept_mentors
FROM employees as e
INNER JOIN dept_emp AS de
    ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
    ON (de.dept_no = d.dept_no)
INNER JOIN titles AS t
    ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Number of employees that can mentor for each department and title
SELECT COUNT(dm.emp_no),
dm.dept_name,
dm.title
INTO dept_mentors_count
FROM dept_mentors as dm
GROUP BY dm.dept_name, dm.title
ORDER BY COUNT(dm.emp_no) DESC;

SELECT * FROM dept_mentors_count;

-- Number of employees that can mentor for each title
SELECT COUNT(dm.emp_no),
dm.title
INTO dept_mentors_title
FROM dept_mentors as dm
GROUP BY dm.title
ORDER BY COUNT(dm.emp_no) DESC;

SELECT * FROM dept_mentors_title;

-- Create table for non-retiring possible promotions
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
d.dept_name,
t.title
INTO dept_promotions
FROM employees as e
INNER JOIN dept_emp AS de
    ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d
    ON (de.dept_no = d.dept_no)
INNER JOIN titles AS t
    ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (birth_date NOT BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM dept_promotions;