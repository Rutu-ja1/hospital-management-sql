
-- Hospital Management System SQL Schema

-- Patients Table
CREATE DATABASE Hospital_Managment_SQL;
USE Database Hospital_Managment_SQL;
CREATE TABLE patients (
  patient_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  gender VARCHAR(10),
  age INT,
  contact VARCHAR(15),
  address VARCHAR(255)
);

-- Doctors Table
CREATE TABLE doctors (
  doctor_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  specialization VARCHAR(50),
  contact VARCHAR(15)
);

-- Appointments Table
CREATE TABLE appointments (
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  doctor_id INT,
  appointment_date DATE,
  appointment_time TIME,
  status VARCHAR(20),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Treatments Table
CREATE TABLE treatments (
  treatment_id INT PRIMARY KEY AUTO_INCREMENT,
  appointment_id INT,
  diagnosis TEXT,
  prescribed_medicine TEXT,
  cost DECIMAL(10,2),
  FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Billing Table
CREATE TABLE billing (
  bill_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  treatment_id INT,
  amount DECIMAL(10,2),
  status VARCHAR(20),
  payment_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (treatment_id) REFERENCES treatments(treatment_id)
);

-- Rooms Table
CREATE TABLE rooms (
  room_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT,
  admission_date DATE,
  discharge_date DATE,
  status VARCHAR(20),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
INSERT INTO patients (name, gender, age, contact, address) VALUES
('Anjali Sharma', 'Female', 29, '9876543210', 'Pune'),
('Rahul Verma', 'Male', 35, '9123456780', 'Mumbai'),
('Sita Joshi', 'Female', 42, '9988776655', 'Nagpur');

INSERT INTO doctors (name, specialization, contact) VALUES
('Dr. Mehta', 'Cardiologist', '9898989898'),
('Dr. Kulkarni', 'Dermatologist', '9876543211'),
('Dr. Roy', 'General Physician', '9123456790');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2025-02-01', '10:30:00', 'Completed'),
(2, 3, '2025-02-02', '11:00:00', 'Completed'),
(3, 2, '2025-02-03', '09:30:00', 'Scheduled');

INSERT INTO treatments (appointment_id, diagnosis, prescribed_medicine, cost) VALUES
(1, 'Hypertension', 'Amlodipine 5mg', 1500.00),
(2, 'Fever and cough', 'Paracetamol, Cough Syrup', 500.00);

INSERT INTO billing (patient_id, treatment_id, amount, status, payment_date) VALUES
(1, 1, 1500.00, 'Paid', '2025-02-02'),
(2, 2, 500.00, 'Unpaid', NULL);
INSERT INTO rooms (patient_id, admission_date, discharge_date, status) VALUES
(1, '2025-01-31', '2025-02-02', 'Discharged'),
(3, '2025-02-03', NULL, 'Admitted');

SELECT * FROM rooms;
