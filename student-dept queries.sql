-- 01. Which students belong to a specific department?
SELECT * FROM Student WHERE Dept_ID = 1;

-- 02. What are the courses offered by each department?
SELECT Dept_ID, Course_Code, Title FROM Course ORDER BY Dept_ID;

-- 03. How many students are in each department?
SELECT Dept_ID, COUNT(*) AS Student_Count FROM Student GROUP BY Dept_ID;

-- 04. What is the department of a given student?
SELECT s.Name, d.Name AS Department FROM Student s
JOIN Department d ON s.Dept_ID = d.Dept_ID
WHERE s.Roll_No = 201;

-- 05. How many exams has a student enrolled in?
SELECT Roll_No, COUNT(DISTINCT Exam_ID) AS Exams_Attended
FROM Exam_Attempt GROUP BY Roll_No;

-- 06. What courses has a student attended?
SELECT e.Roll_No, c.Course_Code, c.Title FROM Enrollment e
JOIN Course c ON e.Course_Code = c.Course_Code
WHERE e.Roll_No = 201;

-- 07. Which students have not appeared in any exams yet?
SELECT Roll_No, Name FROM Student
WHERE Roll_No NOT IN (SELECT DISTINCT Roll_No FROM Exam_Attempt);

-- 08. List students enrolled in the same department.
SELECT s1.Roll_No, s1.Name, s1.Dept_ID
FROM Student s1
JOIN Student s2 ON s1.Dept_ID = s2.Dept_ID
WHERE s1.Roll_No <> s2.Roll_No;

-- 09. Which students are enrolled in the maximum number of exams?
SELECT Roll_No FROM Exam_Attempt
GROUP BY Roll_No
HAVING COUNT(Exam_ID) = (
  SELECT MAX(cnt) FROM (
    SELECT COUNT(Exam_ID) AS cnt FROM Exam_Attempt GROUP BY Roll_No
  ) AS Sub
);

-- 10. Which student has the highest average attendance across all courses?
SELECT e.Roll_No, s.Name, AVG(CAST(Classes_Attended AS FLOAT) / Total_Classes * 100) AS Avg_Attendance
FROM Enrollment e
JOIN Student s ON e.Roll_No = s.Roll_No
GROUP BY e.Roll_No, s.Name
ORDER BY Avg_Attendance DESC
LIMIT 1;
