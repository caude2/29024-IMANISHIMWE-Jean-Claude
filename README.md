# Assignment - POSTEGRESQL Query Execution

## Student Information
- **Student ID:** 29024
- **Name:** Imanishimwe jean Claude 
- **Departement:** Networking
- **Course:** Database Management System

# 📊 PostgreSQL Employee & Project Management Database

A robust SQL-based relational database project built with PostgreSQL, demonstrating powerful use of **String**, **Numeric**, **Date/Time**, and **Conditional** functions through 50+ real-world queries. This project serves as a practical learning toolkit for mastering complex SQL logic and relational data modeling.

---

## 🧠 Project Overview

This database simulates a simplified **Employee Management System** for a tech company. It includes:

- Employee records with personal and job information
- Departments and their mappings
- Projects (ongoing and completed)
- Employee-Project assignments (many-to-many)

It’s designed to practice and demonstrate SQL functions through **String manipulation**, **Numeric calculations**, **Date/time operations**, and **Conditional logic** using real-world business cases.

---

## ⚙️ Technologies Used

- PostgreSQL 14+
- SQL (PostgreSQL dialect)
- pgAdmin / DBeaver (recommended for query visualization)
- GitHub for version control

---

## 🗂️ Database Schema

The project includes four main tables:

| Table               | Description                            |
|--------------------|----------------------------------------|
| `employees`         | Stores employee info (names, salary, gender, etc.) |
| `departments`       | Holds department names and IDs         |
| `projects`          | Details of projects (name, start, end) |
| `employee_projects` | Links employees with assigned projects |

Relationships:
- `employees.department_id → departments.department_id`
- `employee_projects` serves as a join table for the many-to-many relationship between `employees` and `projects`.

---

## 🧪 Sample Queries (From Exercises)

- `String Functions`: Concatenation, trimming, casing, substring, replacing
- `Numeric Functions`: MOD, ROUND, ABS, POWER
- `Date/Time`: CURRENT_DATE, DATEDIFF, YEAR, MONTH, DAY
- `Conditional`: CASE, COALESCE, Nested logic
- `Joins & Aggregations`: Employee-project mappings, department-based logic

Over **50 SQL queries** included in `exercise_queries.sql` to test all edge cases and business scenarios.

---

## 🚀 Getting Started

### 🔧 Prerequisites

- PostgreSQL installed (version 14+ recommended)
- A GUI tool like **pgAdmin**, **DBeaver**, or **DataGrip** (optional but useful)
- Basic knowledge of SQL



**📌 Author:** Confiance UFITAMAHORO  
**📚 Course:** Database Development with PL/SQL  






