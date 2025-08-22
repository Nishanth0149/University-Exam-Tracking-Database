
-- ===========================================
-- COMPLEX UNIVERSITY EXAM TRACKING DATABASE
-- ===========================================

-- 1. Departments
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Students
CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    EnrollmentYear YEAR,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- 3. Semesters
CREATE TABLE Semester (
    SemesterID INT PRIMARY KEY AUTO_INCREMENT,
    SemesterName VARCHAR(50), -- e.g., 'Semester 1', 'Semester 2', etc.
    Year INT
);

-- 4. Courses (Department + Semester specific)
CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    SemesterID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID)
);

-- 5. Enrollment
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    SemesterID INT,
    AttemptNumber INT DEFAULT 1,
    Grade VARCHAR(2),
    POSR_Status ENUM('Pass', 'Outstanding', 'Satisfactory', 'Repeat'),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID)
);

-- 6. GPA per Semester
CREATE TABLE SemesterGPA (
    GPAID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    SemesterID INT,
    GPA DECIMAL(3, 2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (SemesterID) REFERENCES Semester(SemesterID)
);

-- 7. Attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    AttendanceDate DATE,
    Status ENUM('Present', 'Absent'),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- 8. Transcript Generation View
CREATE VIEW StudentTranscript AS
SELECT
    s.StudentID,
    s.FullName,
    d.DepartmentName,
    sem.SemesterName,
    c.CourseName,
    e.AttemptNumber,
    e.Grade,
    e.POSR_Status,
    g.GPA
FROM Student s
JOIN Department d ON s.DepartmentID = d.DepartmentID
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
JOIN Semester sem ON e.SemesterID = sem.SemesterID
LEFT JOIN SemesterGPA g ON g.StudentID = s.StudentID AND g.SemesterID = sem.SemesterID;

-- 9. Stored Procedure: Generate Total Attendance Report
DELIMITER //
CREATE PROCEDURE GenerateTotalAttendanceReport()
BEGIN
    SELECT
        s.StudentID,
        s.FullName,
        d.DepartmentName,
        c.CourseName,
        COUNT(a.AttendanceID) AS TotalClasses,
        SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS ClassesAttended,
        ROUND(SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) / COUNT(a.AttendanceID) * 100, 2) AS AttendancePercentage
    FROM Student s
    JOIN Department d ON s.DepartmentID = d.DepartmentID
    JOIN Attendance a ON s.StudentID = a.StudentID
    JOIN Course c ON a.CourseID = c.CourseID
    GROUP BY s.StudentID, c.CourseID;
END;
//
DELIMITER ;

-- You can call the procedure like this:
-- CALL GenerateTotalAttendanceReport();
