-- Insert Faculty
INSERT INTO Faculty (Emp_ID, Name, Designation) VALUES
(101, 'Dr. A. Rao', 'Professor'),
(102, 'Dr. B. Sharma', 'Associate Professor'),
(103, 'Ms. C. Iyer', 'Lecturer'),
(104, 'Mr. D. Kumar', 'Assistant Professor');

-- Insert Departments
INSERT INTO Department (Dept_ID, Name, Head_EmpID) VALUES
(1, 'Electronics and Communication', 101),
(2, 'Computer Science', 102),
(3, 'Mechanical Engineering', 103);

-- Insert Semesters
INSERT INTO Semester (Semester_ID, Semester_Name) VALUES
(1, 'Semester 1'),
(2, 'Semester 2'),
(3, 'Semester 3'),
(4, 'Semester 4'),
(5, 'Semester 5'),
(6, 'Semester 6'),
(7, 'Semester 7'),
(8, 'Semester 8');

-- Insert Courses (including ME courses used in enrollments)
INSERT INTO Course (Course_Code, Title, Dept_ID, Coordinator_ID, Semester_ID) VALUES
-- ECE
('ECE101', 'Digital Electronics', 1, 101, 1),
('EC102', 'Signals and Systems', 1, 101, 1),
('EC103', 'Basic Electronics', 1, 101, 1),
('EC104', 'Electronic Devices', 1, 101, 2),
('EC105', 'Network Analysis', 1, 101, 2),
('EC106', 'Communication Systems', 1, 101, 2),
('EC107', 'Linear IC Applications', 1, 101, 3),
('EC108', 'Electromagnetics', 1, 101, 3),
('EC109', 'Microprocessors', 1, 101, 3),
('ECE201', 'Microprocessors', 1, 104, 3),
('EC110', 'Control Systems', 1, 101, 4),
('EC111', 'Analog Communications', 1, 101, 4),
('EC112', 'Digital Signal Processing', 1, 101, 4),
('EC113', 'VLSI Design', 1, 101, 5),
('EC114', 'Embedded Systems', 1, 101, 5),
('EC115', 'Microwave Engineering', 1, 101, 6),
('EC116', 'Antenna Theory', 1, 101, 6),
('EC117', 'Wireless Communications', 1, 101, 7),
('EC118', 'Optical Communications', 1, 101, 7),
('EC119', 'Radar Systems', 1, 101, 8),
('EC120', 'Project Work', 1, 101, 8),
('EC201', 'Power Electronics', 1, 101, 4),
('EC202', 'Computer Architecture', 1, 101, 4),
('EC203', 'Robotics', 1, 101, 6),
('EC204', 'Sensor Networks', 1, 101, 6),
('EC205', 'IoT Systems', 1, 101, 5),
('EC206', 'Satellite Communication', 1, 101, 5),
('EC207', 'Machine Learning for ECE', 1, 101, 7),
('EC208', 'Digital Image Processing', 1, 101, 7),

-- CSE
('CSE102', 'Data Structures', 2, 102, 1),
('CS101', 'Programming in C', 2, 102, 1),
('CS103', 'OOPs with Java', 2, 102, 3),
('CS104', 'DBMS', 2, 102, 4),
('CS105', 'Operating Systems', 2, 102, 4),
('CS106', 'Computer Networks', 2, 102, 5),
('CS107', 'Web Technologies', 2, 102, 6),
('CS108', 'Software Engineering', 2, 102, 6),
('CS109', 'Machine Learning', 2, 102, 7),
('CS110', 'Artificial Intelligence', 2, 102, 7),
('CS111', 'Blockchain', 2, 102, 8),
('CS112', 'Major Project', 2, 102, 8),
('CS113', 'Cybersecurity', 2, 102, 6),

-- ME
('ME101', 'Thermodynamics', 3, 103, 5),
('ME102', 'Fluid Mechanics', 3, 103, 5),
('ME103', 'Machine Design', 3, 103, 6),
('ME104', 'Heat Transfer', 3, 103, 6),
('ME105', 'Production Engineering', 3, 103, 7),
('ME106', 'Mechatronics', 3, 103, 7);

-- Insert Students
INSERT INTO Student (Roll_No, Name, Dept_ID, Semester_ID) VALUES
(201, 'Nishanth Reddy', 1, 2),
(202, 'Aaditya Chauhan', 2, 3),
(203, 'Akshat Aatreya', 2, 4),
(204, 'Shreyas Iyer', 1, 1),
(205, 'MS Dhoni', 2, 1),
(206, 'Virat Kohli', 1, 3),
(207, 'Rohit Sharma', 1, 4),
(208, 'KL Rahul', 2, 2),
(209, 'Ravindra Jadeja', 3, 5),
(210, 'R Ashwin', 1, 6),
(211, 'Shubman Gill', 2, 7),
(212, 'Hardik Pandya', 3, 8),
(213, 'Suryakumar Yadav', 1, 5),
(214, 'Jasprit Bumrah', 2, 6),
(215, 'Yuzvendra Chahal', 3, 2),
(216, 'Bhuvneshwar Kumar', 1, 7);

-- Insert Enrollments
INSERT INTO Enrollment (Roll_No, Course_Code, Total_Classes, Classes_Attended) VALUES
(201, 'ECE101', 10, 9),
(201, 'EC102', 30, 28),
(201, 'EC103', 30, 27),
(202, 'CSE102', 10, 8),
(202, 'CS101', 30, 29),
(202, 'CS104', 28, 25),
(203, 'ECE201', 5, 5),
(203, 'EC107', 25, 24),
(203, 'EC108', 25, 23),
(203, 'EC109', 25, 25),
(204, 'EC104', 28, 26),
(204, 'EC110', 28, 27),
(205, 'CS103', 30, 28),
(205, 'CS105', 30, 27),
(206, 'CS106', 28, 25),
(206, 'CS107', 28, 27),
(207, 'EC201', 26, 25),
(207, 'EC202', 28, 26),
(208, 'CS108', 30, 29),
(208, 'CS109', 25, 23),
(209, 'ME101', 30, 28),
(209, 'ME102', 26, 25),
(210, 'EC203', 30, 27),
(210, 'EC204', 25, 24),
(211, 'CS110', 28, 26),
(211, 'CS111', 30, 30),
(212, 'ME103', 30, 28),
(212, 'ME104', 26, 25),
(213, 'EC205', 30, 28),
(213, 'EC206', 25, 24),
(214, 'CS112', 28, 27),
(214, 'CS113', 30, 29),
(215, 'ME105', 30, 29),
(215, 'ME106', 28, 27),
(216, 'EC207', 30, 30),
(216, 'EC208', 28, 28);

-- Insert Course Teaching Assignments
INSERT INTO Course_Teaching (Emp_ID, Course_Code) VALUES
(101, 'ECE101'),
(102, 'CSE102'),
(104, 'ECE201'),
(101, 'EC102'),
(101, 'EC103'),
(102, 'CS101'),
(102, 'CS104'),
(101, 'EC107'),
(101, 'EC108'),
(101, 'EC109'),
(101, 'EC110'),
(102, 'CS103'),
(102, 'CS105'),
(102, 'CS106'),
(102, 'CS107');

-- Insert Exams
INSERT INTO Exam (Exam_ID, Title, Subject_Name, Duration, Date, Type, Course_Code, Created_By) VALUES
(301, 'Midterm Exam', 'Digital Electronics', 120, '2025-09-15', 'Internal', 'ECE101', 101),
(302, 'Final Exam', 'Data Structures', 180, '2025-12-20', 'External', 'CSE102', 102),
(303, 'Midterm Exam', 'Signals and Systems', 120, '2025-09-16', 'Internal', 'EC102', 101),
(304, 'Midterm Exam', 'Basic Electronics', 120, '2025-09-17', 'Internal', 'EC103', 101),
(305, 'Final Exam', 'Microprocessors', 180, '2025-12-21', 'External', 'ECE201', 104),
(306, 'Final Exam', 'OOPs with Java', 180, '2025-12-22', 'External', 'CS103', 102),
(307, 'Midterm Exam', 'Network Analysis', 120, '2025-09-18', 'Internal', 'EC105', 101),
(308, 'Final Exam', 'Operating Systems', 180, '2025-12-23', 'External', 'CS105', 102);

-- Insert Exam Attempts
INSERT INTO Exam_Attempt (Exam_ID, Roll_No, Attempt_No, Marks, Attempt_Date) VALUES
(301, 201, 1, 85, '2025-09-15'),
(302, 202, 1, 90, '2025-12-20'),
(303, 201, 1, 78, '2025-09-16'),
(304, 201, 1, 82, '2025-09-17'),
(305, 203, 1, 88, '2025-12-21'),
(306, 205, 1, 75, '2025-12-22'),
(307, 204, 1, 80, '2025-09-18'),
(308, 206, 1, 89, '2025-12-23'),
(305, 207, 1, 84, '2025-12-24'),
(302, 208, 1, 77, '2025-12-25'),
(301, 209, 1, 79, '2025-12-26'),
(303, 210, 1, 91, '2025-12-27'),
(304, 211, 1, 86, '2025-12-28'),
(306, 212, 1, 74, '2025-12-29'),
(307, 213, 1, 88, '2025-12-30'),
(308, 214, 1, 85, '2026-01-02'),
(301, 215, 1, 79, '2026-01-03'),
(302, 216, 1, 83, '2026-01-04');
