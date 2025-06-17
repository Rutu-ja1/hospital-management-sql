
-- Hospital Management System SQL Schema

-- Patients Table
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
