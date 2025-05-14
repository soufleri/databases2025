# Pulse University Music Festival - Database Project

**Backend-only relational database design and implementation for managing a multi-day international music festival**


<div align="center">
  <img src="https://github.com/user-attachments/assets/42b33f14-68a2-4caa-97bf-4d33944cf98e" alt="Image" />
</div>

## 📚 Overview

This repository contains the implementation of the semester-long Database course project (DBLAB 2024–2025) at ECE, NTUA. The project models and implements a relational database for organizing the **Pulse University International Music Festival**.

The system captures complex real-world requirements related to festival logistics, performances, artist management, ticket sales, staff allocation, and visitor interactions including ticket resale and performance reviews.

## 📁 Repository Structure
```text
.
├── README.md
├── diagrams/
│   ├── er.pdf
│   └── relational.pdf
├── sql/
│   ├── install.sql
│   ├── load.sql
│   ├── Q01.sql … Q15.sql
│   └── Q01_out.txt … Q15_out.txt
├── docs/
│   └── report.pdf
└── code/ (optional)
```
---
## 🔳 Diagram
![Image](https://github.com/user-attachments/assets/d2fb9093-c4b5-46f5-9b3a-0855cd77c3e0)

## ✅ Features Implemented

- Full ER and relational design with 22+ entities and several junction tables.
- Comprehensive SQL schema with integrity constraints, indexing, and field validations.
- The project follows specific assignment requirements:
  - Enum types, JSON/XML columns, or ORM tools were **not** allowed
  - Front-end development was nor required
- Data population scripts covering:
  - 10 festivals (2 in the future)
  - 100 performances
  - 30 stages
  - 50+ performers (artists/bands)
  - 200+ tickets with resale and ratings support
- Efficient solutions to 15 complex SQL queries including:
  - Revenue analysis
  - Genre-based artist discovery
  - Cross-year statistics
  - Staff scheduling and resource optimization

---

## 🛠 Setup & Usage

To download and test the database locally, follow the steps below:

### 📦 Requirements
- MySQL 5.7+ or MariaDB 10.4+
- MySQL client or GUI (e.g., MySQL Workbench, DBeaver, or phpMyAdmin)

### 💾 Installation
1. **Clone the repository:**
  ```bash
   git clone https://github.com/soufleri/databases2025.git
   cd databases2025
  ```
2. **Create the database:**
  ```bash  
    SOURCE sql/install.sql;
  ```
3. **Load initial data:**
  ```bash
  SOURCE sql/load.sql;
  ```
4. **Run the queries:**
  ```bash
  SOURCE sql/load.sql;
  ```
  You can test each query `Qxx.sql` and compare results with the ones in the corresponding `Qxx_out.txt` files.

  ---

## 👥 Creators

- [Andronikos Giannousiadis] – [Student ID: 03120241]
- [Alexandra Soufleri] – [Student ID: 03121637]

*This repository complies with NTUA's academic code of ethics and good practice.*

---
