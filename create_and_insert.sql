-- Create Tables

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    hire_date DATE,
    salary NUMERIC(10,2),
    gender CHAR(1),
    department_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE projects (
    project_id INTEGER PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_projects (
    employee_id INTEGER,
    project_id INTEGER,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert Departments

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Operations');

-- Insert Employees

INSERT INTO employees (employee_id, first_name, last_name, email, phone, hire_date, salary, gender, department_id) VALUES
(1, 'John', 'Doe', 'doe@company.com', '078800001', '2011-01-02', 3000.00, 'F', 1),
(2, 'Alice', 'Smith', 'smith@company.com', '078800002', '2012-02-03', 6000.00, 'M', 2),
(3, 'Robert', 'Brown', NULL, '078800003', '2013-03-04', 9000.00, 'F', 3),
(4, 'Mary', 'Johnson', 'johnson@company.com', '078800004', '2014-04-05', NULL, 'M', 4),
(5, 'James', 'Taylor', 'taylor@company.com', '078800005', '2015-05-06', 15000.00, 'F', 2);

-- Insert Projects

INSERT INTO projects (project_id, project_name, start_date, end_date) VALUES
(1, 'Project-1', '2024-01-01', '2024-12-31'),
(2, 'Project-2', '2024-02-01', '2025-01-31'),
(3, 'ProjectTest', '2024-03-01', '2025-03-01'),
(4, 'Project-4', '2024-04-01', '2025-04-01'),
(5, 'Project-5', '2024-05-01', NULL);  -- Ongoing project

-- Assign employees to projects

INSERT INTO employee_projects (employee_id, project_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(5, 5);  -- Employee 4 is unassigned

