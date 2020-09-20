--Retrieve Names from Employees Table 
SELECT emp_no, first_name, last_name
INTO retirement_info2
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

--Retrieve Titles from the titles table
SELECT title, emp_no
INTO titles_info 
FROM "Titles"


SELECT  employees.emp_no,
        employees.last_name,
        employees.first_name,
        employees.birth_date,
        "Titles".title,
        "Titles".from_date,
        "Titles".to_date
INTO employee_titles_info
FROM employees
    LEFT JOIN "Titles"
    ON (employees.emp_no = "Titles".emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) first_name, last_name, titles 
INTO unique_titles
FROM employee_titles_info
ORDER BY emp_no, to_date DESC;


-- Number of employees retiring
SELECT COUNT(title)
FROM unique_titles
GROUP BY title
ORDER BY count DESC;



--Deliverable 2 

--Retrieve Names from Employees Table 
SELECT emp_no, first_name, last_name, birth_date
INTO employees_1965
FROM employees
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31');

--Retrieve from_date and to_date columns from the Departments Employee table  
SELECT emp_no, title, from_date, to_date
FROM "Titles"
;

-- Mentorship eligibility table 

SELECT DISTINCT ON (emp_no)  employees_1965.emp_no,
                             employees_1965.first_name,
                             employees_1965.last_name,
                             employees_1965.birth_date,
                             "Titles".from_date,
                             "Titles".to_date,
                             "Titles".title
INTO mentorship
FROM "Titles"
    LEFT JOIN employees_1965
    ON ("Titles".emp_no = employees_1965.emp_no)
ORDER BY emp_no, to_date DESC;