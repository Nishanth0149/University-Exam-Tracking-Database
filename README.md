# 🏫 University Exam Tracking System

This project is a **relational database model** built using **MySQL** to manage and track university academic data, including students, faculty, courses, exams, and attendance.

The system ensures smooth management of **exam records, attendance monitoring, and academic performance tracking**.

---

## 📌 Key Features

* 📚 Manage **Faculty, Departments, Students, Courses, and Semesters**
* 📝 Track **student enrollments** in courses with automated **attendance calculation**
* 🧑‍🏫 Map **faculty members** to courses they teach
* 🧾 Maintain **exam schedules, types (Internal/External), and subjects**
* 🎯 Track **student exam attempts and marks** with validation
* ⚡ Stored procedure for **updating attendance dynamically**

---

## 🗂️ Database Schema

### Tables Implemented

* **Faculty** – Stores faculty details with designations
* **Department** – Department information with HOD mapping
* **Semester** – Defines academic semesters
* **Course** – Course details linked to department, semester, and faculty coordinator
* **Student** – Student records with department and semester mapping
* **Enrollment** – Student enrollment in courses with auto-calculated attendance percentage
* **Course\_Teaching** – Links faculty members to the courses they teach
* **Exam** – Exam details (title, duration, type, subject, and course association)
* **Exam\_Attempt** – Records student exam attempts, marks, and dates

---

## ⚙️ Stored Procedure

### `AddAttendanceClass`

This stored procedure automates attendance tracking for each class:

* Increments **Total\_Classes**
* Updates **Classes\_Attended** if the student is present
* Automatically recalculates and stores **Attendance\_Percentage**

---

## 📊 ER Diagram

The complete **Entity-Relationship Diagram** of the system is available here:

📄 [model.pdf](https://github.com/Nishanth0149/University-Exam-Tracking-Database/blob/main/model.pdf)

---

## 🛠️ Technologies Used

* **MySQL** – Relational Database
* **SQL** – Schema design, constraints, and stored procedure implementation
* **PDF** – ER Diagram

---

## 👨‍💻 Author

**Kandukuri Venkat Nishanth Reddy**
🔗 [LinkedIn Profile](https://www.linkedin.com/in/nishanth-reddy-285955221/)



