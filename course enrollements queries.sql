-- 11. Which courses does a student take?
SELECT e.Roll_No, c.Course_Code, c.Title FROM Enrollment e
JOIN Course c ON e.Course_Code = c.Course_Code
WHERE e.Roll_No = 201;

-- 12. How many students are enrolled in each course?
SELECT Course_Code, COUNT(*) AS Enrolled_Students
FROM Enrollment GROUP BY Course_Code;

-- 13. What is the attendance percentage of each student in a course?
SELECT Roll_No, Course_Code,
ROUND(CAST(Classes_Attended AS FLOAT) / Total_Classes * 100, 2) AS Attendance_Percentage
FROM Enrollment;

-- 14. What exams has a particular student appeared for?
SELECT ea.Roll_No, e.Exam_ID, e.Title, e.Course_Code FROM Exam_Attempt ea
JOIN Exam e ON ea.Exam_ID = e.Exam_ID
WHERE ea.Roll_No = 201;

-- 15. What is the schedule (date and type) of exams for a course?
SELECT Course_Code, Date, Type FROM Exam WHERE Course_Code = 'ECE101';

-- 16. How many courses are associated with each department?
SELECT Dept_ID, COUNT(*) AS Course_Count FROM Course GROUP BY Dept_ID;

-- 17. Which department offers the most courses?
SELECT Dept_ID FROM Course
GROUP BY Dept_ID
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 18. What are the names of all departments and their corresponding courses?
SELECT d.Name AS Department, c.Course_Code, c.Title FROM Department d
JOIN Course c ON d.Dept_ID = c.Dept_ID;

-- 19. How many students belong to each department?
SELECT Dept_ID, COUNT(*) AS Student_Count FROM Student GROUP BY Dept_ID;

-- 20. What is the total attendance (summed) in each department?
SELECT s.Dept_ID, SUM(e.Classes_Attended) AS Total_Attended
FROM Student s
JOIN Enrollment e ON s.Roll_No = e.Roll_No
GROUP BY s.Dept_ID;
