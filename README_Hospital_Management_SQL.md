
# 🏥 Hospital Management System (SQL Project)

This project simulates a real-world Hospital Management System using MySQL. It is designed to manage key hospital operations such as appointments, treatments, billing, and room assignments using a relational database.

---

## 📌 Project Features

- Relational database design using **MySQL**
- Patient, doctor, treatment, billing, appointment, and room management
- Foreign key constraints to maintain data integrity
- Sample data insertions for simulation
- Real-world SQL queries for analytics and reporting

---

## 🛠 Technologies Used

- MySQL
- SQL Workbench
- SQL Queries (Joins, Aggregations, Subqueries, Indexing)

---

## 🗃 Database Schema

**Tables:**
- `patients` – Patient details
- `doctors` – Doctor information
- `appointments` – Patient-doctor scheduling
- `treatments` – Diagnosis and medicines
- `billing` – Payment tracking
- `rooms` – Admission and discharge status

---

## 🔢 Sample SQL Queries

### 1. Upcoming Appointments
```sql
SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name,
       a.appointment_date, a.appointment_time, a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Scheduled'
ORDER BY a.appointment_date, a.appointment_time;
```

### 2. Total Revenue Collected
```sql
SELECT SUM(amount) AS total_revenue
FROM billing
WHERE status = 'Paid';
```

### 3. Current Admitted Patients
```sql
SELECT r.room_id, p.name AS patient_name, r.admission_date, r.status
FROM rooms r
JOIN patients p ON r.patient_id = p.patient_id
WHERE r.status = 'Admitted';
```

### 4. Patient Billing Summary
```sql
SELECT b.bill_id, p.name AS patient_name, t.diagnosis,
       b.amount, b.status, b.payment_date
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
JOIN treatments t ON b.treatment_id = t.treatment_id;
```

---

## ✅ How to Run

1. Clone or download this project.
2. Open the SQL script in MySQL Workbench or any SQL IDE.
3. Execute the schema to create tables.
4. Insert sample data from `insert_sample_data.sql`.
5. Run analysis queries from `HMS_queries.sql`.

---

## 🙋‍♀️ Author

**Rutuja Mehare**  
LinkedIn: [linkedin.com/in/rutuja-mehare-a52216252](https://linkedin.com/in/rutuja-mehare-a52216252)  
GitHub: [github.com/Rutu-ja1](https://github.com/Rutu-ja1)

---

⭐ Feel free to fork this project and use it for your portfolio or learning!
