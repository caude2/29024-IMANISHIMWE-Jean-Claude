# Assignment - PostgreSQL Query Execution

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
- <img width="1366" height="768" alt="Screenshot (550)" src="https://github.com/user-attachments/assets/8298226f-03e5-4081-9586-4cbceea13117" />

- <img width="1366" height="768" alt="Screenshot (536)" src="https://github.com/user-attachments/assets/2298accc-b27b-4e7e-8a95-61e688fbf2db" />


- `Numeric Functions`: MOD, ROUND, ABS, POWER
- <img width="1366" height="768" alt="Screenshot (553)" src="https://github.com/user-attachments/assets/fce437c7-f327-428d-9fcc-5839085277fb" />

- <img width="1366" height="768" alt="Screenshot (552)" src="https://github.com/user-attachments/assets/14ae91bc-7295-4cb4-97c7-f42bd88a957d" />


- `Date/Time`: CURRENT_DATE, DATEDIFF, YEAR, MONTH, DAY
- <img width="1366" height="768" alt="Screenshot (560)" src="https://github.com/user-attachments/assets/611794e5-013e-48a3-96b0-e23c051491f8" />
- <img width="1366" height="768" alt="Screenshot (559)" src="https://github.com/user-attachments/assets/f5df8181-d831-4fdc-ab19-53cc51816e92" />

  
- `Conditional`: CASE, COALESCE, Nested logic
- <img width="1366" height="768" alt="Screenshot (569)" src="https://github.com/user-attachments/assets/0328b8ba-e162-4195-916d-dd98f78e0602" />
- <img width="1366" height="768" alt="Screenshot (567)" src="https://github.com/user-attachments/assets/d8ca9445-23c1-46ab-be24-758ce22bb71b" />


- `Joins & Aggregations`: Employee-project mappings, department-based logic
- <img width="1366" height="768" alt="Screenshot (574)" src="https://github.com/user-attachments/assets/a620f16c-78dc-43f1-8a7a-93cb6fadd495" />
- <img width="1366" height="768" alt="Screenshot (573)" src="https://github.com/user-attachments/assets/6426c6f9-737a-4813-87ac-62815eefb966" />


Over **50 SQL queries** included in `exercise_queries.sql` to test all edge cases and business scenarios.

---

## 🚀 Getting Started

### 🔧 Prerequisites

- PostgreSQL installed (version 14+ recommended)
- A GUI tool like **pgAdmin**, **DBeaver**, or **DataGrip** (optional but useful)
- Basic knowledge of SQL



**📌 Author:** Confiance UFITAMAHORO  
**📚 Course:** Database Development with PL/SQL  






