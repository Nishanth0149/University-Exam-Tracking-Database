
-- 1. Faculty Table

CREATE TABLE Faculty (
    Emp_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Designation VARCHAR(50) CHECK (
        Designation IN ('Professor', 'Associate Professor', 'Lecturer', 'Assistant Professor', 'Other')
    )
);


-- 2. Department Table

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE NOT NULL,
    Head_EmpID INT,
    FOREIGN KEY (Head_EmpID) REFERENCES Faculty(Emp_ID)
);


-- 3. Semester Table

CREATE TABLE Semester (
    Semester_ID INT PRIMARY KEY,
    Semester_Name VARCHAR(20) NOT NULL
);


-- 4. Course Table

CREATE TABLE Course (
    Course_Code VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Dept_ID INT NOT NULL,
    Coordinator_ID INT NOT NULL,
    Semester_ID INT NOT NULL,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Coordinator_ID) REFERENCES Faculty(Emp_ID),
    FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID)
);


-- 5. Student Table

CREATE TABLE Student (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Dept_ID INT NOT NULL,
    Semester_ID INT NOT NULL,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Semester_ID) REFERENCES Semester(Semester_ID)
);


-- 6. Enrollment Table (with fixed generated column)

CREATE TABLE Enrollment (
    Roll_No INT,
    Course_Code VARCHAR(10),
    Total_Classes INT DEFAULT 0,
    Classes_Attended INT DEFAULT 0,
    Attendance_Percentage DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE 
            WHEN Total_Classes = 0 THEN 0
            ELSE (Classes_Attended * 100.0) / Total_Classes
        END
    ) STORED,
    PRIMARY KEY (Roll_No, Course_Code),
    FOREIGN KEY (Roll_No) REFERENCES Student(Roll_No),
    FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code)
);


-- 7. Course_Teaching Table

CREATE TABLE Course_Teaching (
    Emp_ID INT,
    Course_Code VARCHAR(10),
    PRIMARY KEY (Emp_ID, Course_Code),
    FOREIGN KEY (Emp_ID) REFERENCES Faculty(Emp_ID),
    FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code)
);


-- 8. Exam Table

CREATE TABLE Exam (
    Exam_ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Subject_Name VARCHAR(100) NOT NULL,
    Duration INT,
    Date DATE NOT NULL,
    Type VARCHAR(20) CHECK (Type IN ('Internal', 'External')),
    Course_Code VARCHAR(10) NOT NULL,
    Created_By INT NOT NULL,
    FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code),
    FOREIGN KEY (Created_By) REFERENCES Faculty(Emp_ID)
);


-- 9. Exam_Attempt Table

CREATE TABLE Exam_Attempt (
    Exam_ID INT,
    Roll_No INT,
    Attempt_No INT,
    Marks INT CHECK (Marks BETWEEN 0 AND 100),
    Attempt_Date DATE NOT NULL,
    PRIMARY KEY (Exam_ID, Roll_No, Attempt_No),
    FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID),
    FOREIGN KEY (Roll_No) REFERENCES Student(Roll_No)
);

-- 10. Stored Procedure: Update Attendance Based on Class
DELIMITER $$

CREATE PROCEDURE AddAttendanceClass (
    IN input_Roll_No INT,
    IN input_Course_Code VARCHAR(10),
    IN attended BOOLEAN
)
BEGIN
    IF EXISTS (
        SELECT 1 FROM Enrollment
        WHERE Roll_No = input_Roll_No AND Course_Code = input_Course_Code
    ) THEN
        UPDATE Enrollment
        SET 
            Total_Classes = Total_Classes + 1,
            Classes_Attended = Classes_Attended + IF(attended, 1, 0)
        WHERE Roll_No = input_Roll_No AND Course_Code = input_Course_Code;
    ELSE
        INSERT INTO Enrollment (Roll_No, Course_Code, Total_Classes, Classes_Attended)
        VALUES (
            input_Roll_No, input_Course_Code,
            1,
            IF(attended, 1, 0)
        );
    END IF;
END$$

DELIMITER ;
