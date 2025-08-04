-- EXERCISE 1: String Functions

-- Q1: Concatenate first name and last name of all employees.
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;

-- Q2: Convert all employee names to lowercase.
SELECT LOWER(CONCAT(first_name, ' ', last_name)) AS name_lowercase FROM employees;

-- Q3: Extract the first 3 letters of each employee's first name.
SELECT LEFT(first_name, 3) AS first3_letters FROM employees;

-- Q4: Replace domain in email with '@org.com'.
SELECT REPLACE(email, '@company.com', '@org.com') AS updated_email FROM employees;

-- Q5: Trim spaces from the name 'Alice'.
SELECT TRIM('   Alice   ') AS trimmed_name;

-- Q6: Calculate the total length of the full name.
SELECT LENGTH(CONCAT(first_name, ' ', last_name)) AS name_length FROM employees;

-- Q7: Find position of '@' symbol in email.
SELECT INSTR(email, '@') AS at_position FROM employees;

-- Q8: Add titles (Mr./Ms.) based on gender.
SELECT 
  CASE 
    WHEN gender = 'M' THEN CONCAT('Mr. ', first_name, ' ', last_name)
    WHEN gender = 'F' THEN CONCAT('Ms. ', first_name, ' ', last_name)
  END AS titled_name
FROM employees;

-- Q9: Convert project names to uppercase.
SELECT UPPER(project_name) AS project_upper FROM projects;

-- Q10: Remove dashes from project names.
SELECT REPLACE(project_name, '-', '') AS project_no_dash FROM projects;

-- Q11: Display employee name and department together.
SELECT CONCAT('Emp: ', first_name, ' ', last_name, ' (', department_name, ')') AS emp_label
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Q12: Show email and its character count.
SELECT email, LENGTH(email) AS email_length FROM employees;

-- Q13: Extract the user part from email.
SELECT SUBSTRING_INDEX(email, '@', 1) AS email_user_part FROM employees;

-- Q14: Format names like LASTNAME, Firstname.
SELECT CONCAT(UPPER(last_name), ', ', first_name) AS formatted_name FROM employees;

-- Q15: Add '(Active)' label to employees in active projects.
SELECT CONCAT(first_name, ' ', last_name, ' (Active)') AS active_employee
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id
WHERE p.end_date IS NULL OR p.end_date > CURDATE();


-- EXERCISE 2: Numeric Functions

-- Q16: Round off salaries of all employees.
SELECT first_name, last_name, salary, ROUND(salary) AS salary_rounded FROM employees;

-- Q17: Find employees whose salary is an even number.
SELECT first_name, last_name, salary FROM employees WHERE MOD(salary, 2) = 0;

-- Q18: Calculate duration of each project in days.
SELECT project_name, start_date, end_date, DATEDIFF(end_date, start_date) AS duration_days
FROM projects WHERE end_date IS NOT NULL;

-- Q19: Find absolute salary difference between employee 101 and 102.
SELECT ABS(
  (SELECT salary FROM employees WHERE employee_id = 101) -
  (SELECT salary FROM employees WHERE employee_id = 102)
) AS salary_difference;

-- Q20: Show salary after 10% increase.
SELECT first_name, last_name, salary, salary * POWER(1.10, 1) AS salary_with_increase FROM employees;

-- Q21: Generate random ID between 0 and 999.
SELECT FLOOR(RAND() * 1000) AS random_id;

-- Q22: Show ceiling and floor values of salary.
SELECT first_name, last_name, salary, CEIL(salary) AS salary_ceiling, FLOOR(salary) AS salary_floor FROM employees;

-- Q23: Show phone number length for each employee.
SELECT first_name, last_name, phone, LENGTH(phone) AS phone_length FROM employees;

-- Q24: Categorize salary as High, Medium, or Low.
SELECT first_name, last_name, salary,
  CASE
    WHEN salary >= 6000 THEN 'High'
    WHEN salary >= 4000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_category
FROM employees;

-- Q25: Count the number of digits in formatted salary.
SELECT first_name, last_name, salary, LENGTH(REPLACE(FORMAT(salary, 0), ',', '')) AS salary_digits FROM employees;


-- EXERCISE 3: Date/Time Functions

-- Q26: Get current date.
SELECT CURRENT_DATE AS today_date;

-- Q27: Calculate how many days each employee has worked.
SELECT first_name, last_name, DATEDIFF(CURRENT_DATE, hire_date) AS days_worked FROM employees;

-- Q28: Show employees hired this year.
SELECT first_name, last_name, hire_date FROM employees WHERE YEAR(hire_date) = YEAR(CURRENT_DATE);

-- Q29: Show current date and time.
SELECT NOW() AS current_datetime;

-- Q30: Extract year, month, and day from hire date.
SELECT first_name, last_name, YEAR(hire_date) AS hire_year, MONTH(hire_date) AS hire_month, DAY(hire_date) AS hire_day FROM employees;

-- Q31: List employees hired before 2020.
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date < '2020-01-01';

-- Q32: Show projects ending within the last 30 days.
SELECT project_name, end_date FROM projects WHERE end_date IS NOT NULL AND end_date >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY);

-- Q33: Calculate project duration in days.
SELECT project_name, start_date, end_date, DATEDIFF(end_date, start_date) AS total_days FROM projects WHERE end_date IS NOT NULL;

-- Q34: Format a specific date.
SELECT CONCAT(MONTHNAME('2025-07-23'), ' ', DAY('2025-07-23'), ', ', YEAR('2025-07-23')) AS formatted_date;

-- Q35: Label projects as 'Ongoing' or 'Completed'.
SELECT project_name,
  CASE 
    WHEN end_date IS NULL THEN 'Ongoing'
    ELSE 'Completed'
  END AS project_status
FROM projects;


-- EXERCISE 4: Conditional Functions

-- Q36: Categorize salaries using CASE.
SELECT first_name, last_name, salary,
  CASE
    WHEN salary >= 6000 THEN 'High'
    WHEN salary >= 4000 THEN 'Medium'
    ELSE 'Low'
  END AS salary_label
FROM employees;

-- Q37: Replace NULL emails with 'No Email'.
SELECT first_name, last_name, COALESCE(email, 'No Email') AS email_display FROM employees;

-- Q38: Determine employee status based on hire date.
SELECT first_name, last_name, hire_date,
  CASE
    WHEN hire_date < '2015-01-01' THEN 'Veteran'
    ELSE 'New'
  END AS employee_status
FROM employees;

-- Q39: Replace NULL salary with default value.
SELECT first_name, last_name, COALESCE(salary, 3000) AS adjusted_salary FROM employees;

-- Q40: Categorize departments using CASE.
SELECT first_name, last_name, department_id,
  CASE department_id
    WHEN 3 THEN 'IT'
    WHEN 1 THEN 'HR'
    ELSE 'Other'
  END AS dept_category
FROM employees;

-- Q41: Mark employees as assigned or unassigned to projects.
SELECT e.first_name, e.last_name,
  CASE
    WHEN ep.project_id IS NULL THEN 'Unassigned'
    ELSE 'Assigned'
  END AS project_status
FROM employees e
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id;

-- Q42: Assign tax band based on salary.
SELECT first_name, last_name, salary,
  CASE
    WHEN salary >= 6000 THEN '25% Tax'
    WHEN salary >= 4000 THEN '15% Tax'
    ELSE '5% Tax'
  END AS tax_band
FROM employees;

-- Q43: Classify projects as Long-Term or Short-Term.
SELECT project_name,
  CASE
    WHEN end_date IS NULL THEN 'Ongoing'
    WHEN DATEDIFF(end_date, start_date) > 365 THEN 'Long-Term'
    ELSE 'Short-Term'
  END AS project_length
FROM projects;

-- Q44: Categorize employee IDs as Even or Odd.
SELECT employee_id, salary,
  CASE
    WHEN MOD(employee_id, 2) = 0 THEN 'Even ID'
    ELSE 'Odd ID'
  END AS id_type
FROM employees;

-- Q45: Display full name or fallback to 'Unknown Employee'.
SELECT COALESCE(CONCAT(first_name, ' ', last_name), 'Unknown Employee') AS full_name FROM employees;

-- Q46: Label names as Short or Long.
SELECT first_name, last_name,
  CASE
    WHEN LENGTH(CONCAT(first_name, last_name)) > 10 THEN 'Long Name'
    ELSE 'Short Name'
  END AS name_size
FROM employees;

-- Q47: Identify dummy email accounts.
SELECT email,
  CASE
    WHEN UPPER(email) LIKE '%TEST%' THEN 'Dummy Account'
    ELSE 'Valid Account'
  END AS email_status
FROM employees;

-- Q48: Classify employees by seniority.
SELECT first_name, last_name, hire_date,
  CASE
    WHEN YEAR(hire_date) <= 2015 THEN 'Senior'
    WHEN YEAR(hire_date) <= 2020 THEN 'Mid-Level'
    ELSE 'Junior'
  END AS seniority
FROM employees;

-- Q49: Recommend salary increase based on current pay.
SELECT first_name, last_name, salary,
  CASE
    WHEN salary >= 6000 THEN 'Increase by 5%'
    WHEN salary >= 4000 THEN 'Increase by 10%'
    ELSE 'Increase by 15%'
  END AS increment_plan
FROM employees;

-- Q50: Check if hire month is the current month.
SELECT first_name, last_name, hire_date,
  CASE
    WHEN MONTH(hire_date) = MONTH(CURDATE()) THEN 'Anniversary Month'
    ELSE 'Not Anniversary Month'
  END AS anniversary_status
FROM employees;
