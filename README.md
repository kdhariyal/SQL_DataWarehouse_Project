# 🏗️ Modern Data Warehouse: End-to-End SQL Server Engineering & Analytics

![Project Status](https://img.shields.io/badge/Status-Completed-success)
![Data Architecture](https://img.shields.io/badge/Architecture-Medallion_(Bronze_Silver_Gold)-orange)
![Tools](https://img.shields.io/badge/Stack-SQL_Server_|_ETL_|_SSMS-blue)
![License](https://img.shields.io/badge/License-MIT-green)

## 📖 Project Overview
This project demonstrates the design and implementation of a robust, modern data warehouse using **SQL Server**. Following the industry-standard **Medallion Architecture**, the system transforms raw ERP and CRM data into a high-performance analytical engine optimized for business intelligence.

[Image of Medallion Architecture layers Bronze Silver Gold]

### 🧩 Key Components:
* **Data Architecture:** Implementing a 3-layer Medallion structure (Bronze ➔ Silver ➔ Gold).
* **ETL Pipelines:** Automated Extraction, Transformation, and Loading logic using T-SQL.
* **Data Modeling:** Development of a **Star Schema** with optimized Fact and Dimension tables.
* **Analytics & Reporting:** Advanced SQL-based business reports for actionable insights.

---

## 🎯 Target Job Roles
This repository showcases core technical competencies for:
`Data Architect` | `Data Engineer` | `ETL Developer` | `SQL Developer` | `Data Analyst`

---

## 🛠️ Toolstack & Resources
| Category | Tools | Purpose |
| :--- | :--- | :--- |
| **Database** | SQL Server Express | Hosting the Data Warehouse |
| **IDE** | SSMS | Database management and SQL development |
| **Design** | [Draw.io](https://draw.io) | Architecture & ERD Diagramming |
| **Project Management**| [Notion](https://notion.so) | Task tracking & Documentation |
| **Version Control** | GitHub | Code collaboration and versioning |

---

## 🚀 Project Requirements

### 1️⃣ Data Engineering (Building the Warehouse)
**Objective:** Consolidate disparate sales data into a "Single Source of Truth."
* **Multi-Source Integration:** Ingested and joined data from **ERP** and **CRM** systems.
* **Data Governance:** Cleansed and resolved quality issues (nulls, duplicates, and data type standardization) in the Silver layer.
* **Unified Model:** Designed a Star Schema optimized for downstream analytical queries.
* **Performance:** Implemented indexing and schema design focused on query speed.

[Image of Star Schema showing fact and dimension tables]

### 2️⃣ Data Analysis (BI & Reporting)
**Objective:** Leverage SQL to extract high-value insights regarding:
* 👤 **Customer Behavior:** Identification of high-value segments and retention patterns.
* 📦 **Product Performance:** Sales volume and profit margin analysis per category.
* 📈 **Sales Trends:** Period-over-period growth and performance forecasting.

---

## 📁 Repository Structure
```text
├── 1_Architecture/      # Diagrams and Medallion flowcharts
├── 2_Scripts/           # SQL DDL/DML for Bronze, Silver, and Gold layers
├── 3_Data/              # CSV Source files (ERP & CRM) - Anonymized
├── 4_Analytics/         # SQL scripts for complex business reports
└── README.md            # Project documentation
