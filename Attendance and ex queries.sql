-- 31. Average attendance percentage for each course
SELECT Course_Code,
       ROUND(AVG(Attendance_Percentage), 2) AS Avg_Attendance
FROM Enrollment
GROUP BY Course_Code;

-- 32. Students with attendance below 75% in any course
SELECT Roll_No, Course_Code, Attendance_Percentage
FROM Enrollment
WHERE Attendance_Percentage < 75;

-- 33. Attendance correlated with number of exams attended (per student)
SELECT e.Roll_No,
       ROUND(AVG(e.Attendance_Percentage), 2) AS Avg_Attendance,
       COUNT(DISTINCT ea.Exam_ID)   AS Exams_Attended
FROM Enrollment e
LEFT JOIN Exam_Attempt ea ON e.Roll_No = ea.Roll_No
GROUP BY e.Roll_No;

-- 34. Report of all students, their exams, and attendance
SELECT s.Roll_No, s.Name, e.Course_Code,
       e.Attendance_Percentage, ea.Exam_ID, ea.Marks
FROM Student s
LEFT JOIN Enrollment e ON s.Roll_No = e.Roll_No
LEFT JOIN Exam_Attempt ea ON s.Roll_No = ea.Roll_No
ORDER BY s.Roll_No;

-- 35. All courses with number of students enrolled & exam count
SELECT c.Course_Code,
       COUNT(DISTINCT e.Roll_No)    AS Student_Count,
       COUNT(DISTINCT ex.Exam_ID)   AS Exam_Count
FROM Course c
LEFT JOIN Enrollment e     ON c.Course_Code = e.Course_Code
LEFT JOIN Exam ex          ON c.Course_Code = ex.Course_Code
GROUP BY c.Course_Code;

-- 36. Students with full (100%) attendance in any course
SELECT Roll_No, Course_Code
FROM Enrollment
WHERE Attendance_Percentage = 100;

-- 37. Attendance percentage of each student per course
SELECT Roll_No, Course_Code, Attendance_Percentage
FROM Enrollment;

-- 38. Students with less than 75% attendance in any course
SELECT Roll_No, Course_Code
FROM Enrollment
WHERE Attendance_Percentage < 75;

-- 39. Course with the lowest average attendance
SELECT Course_Code,
       ROUND(AVG(Attendance_Percentage),2) AS Avg_Attendance
FROM Enrollment
GROUP BY Course_Code
ORDER BY Avg_Attendance ASC
LIMIT 1;

-- 40. Students with perfect attendance in all courses
SELECT Roll_No
FROM Enrollment
GROUP BY Roll_No
HAVING MIN(Attendance_Percentage) = 100;
