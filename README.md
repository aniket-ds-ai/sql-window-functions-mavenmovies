# 🎯 SQL Window Functions – Real Interview Practice (MavenMovies DB)

This project contains real-world, interview-style SQL queries using advanced **window functions** like `LAG()`, `LEAD()`, `ROW_NUMBER()` and `RANK()` — executed on the **MavenMovies** database.

📌 **Use Case:**  
Simulate common business problems asked in data analyst interviews and solve them using clean, structured SQL queries.

---

## 🧠 Problem Solved

> **Find the top 3 most active customers based on rental count, and assign their rank using the RANK() function.**

🎯 Objective: Identify top repeat customers from the rental history using advanced SQL logic.

---

## 💻 SQL Query

```sql
WITH rental_counts AS (
  SELECT
    c.customer_id,
    CONCAT(c.first_name, " ", c.last_name) AS customer_name,
    COUNT(r.rental_id) AS total_rentals
  FROM customer c
  JOIN rental r ON c.customer_id = r.customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
)

SELECT *,
  RANK() OVER (ORDER BY total_rentals DESC) AS customer_rank
FROM rental_counts
WHERE total_rentals > 0
LIMIT 3;

```

## 📸 Output Preview
```Top 3 most active customers ranked by their rental count:```

![Logo](https://github.com/aniket-ds-ai/sql-window-functions-mavenmovies/blob/main/top_customers_rank.png)


## ✅ SQL Concepts Used
```
- RANK() OVER (ORDER BY ...)
- WITH clause (Common Table Expression)
- Aggregate function COUNT()
- String manipulation using CONCAT()
- JOIN, GROUP BY, and filtering
```
## 📁 Folder Structure
```sql

sql-window-functions-mavenmovies/
├── queries/
│   └── top_customers_rank.sql
├── output/
│   └── top_customers_rank.png
├── database/
│   └── mavenmovies_schema.sql 
├── README.md

```

## 🔗 Related Tools
```
- Database: MavenMovies (MySQL/PostgreSQL compatible)
- SQL IDE: DBeaver / MySQL Workbench / PgAdmin / DB Fiddle
- Skills Practiced: Window Functions, Data Ranking, Real-world SQL Interview Problems

```

---

## 🗄️ Setup MavenMovies Database Locally

To test these SQL queries, you can set up the MavenMovies database on your local system.

### 📦 Steps:

1. Import the SQL script inside the `database/` folder into your SQL IDE (MySQL/PostgreSQL)
2. Use any free tools like:
   - DBeaver
   - MySQL Workbench
   - DB Fiddle (online)

> Script: `database/mavenmovies_schema.sql`

💡 Tip: You can also generate mock data or use limited sample records to test the logic faster.
