-- 41. Student‑Course pair with the highest attendance
SELECT Roll_No, Course_Code, Attendance_Percentage
FROM Enrollment
ORDER BY Attendance_Percentage DESC
LIMIT 1;

-- 42. For each course: number of students appeared in exams & their average attendance
SELECT e.Course_Code,
       COUNT(DISTINCT ea.Roll_No)    AS Students_Appeared,
       ROUND(AVG(e.Attendance_Percentage),2) AS Avg_Attendance
FROM Enrollment e
JOIN Exam_Attempt ea
  ON e.Roll_No = ea.Roll_No
     AND e.Course_Code = (
           SELECT ex.Course_Code
           FROM Exam ex
           WHERE ex.Exam_ID = ea.Exam_ID
           LIMIT 1
         )
GROUP BY e.Course_Code;

-- 43. For each student: list of exams with course & attendance
SELECT ea.Roll_No,
       ea.Exam_ID,
       ex.Course_Code,
       e.Attendance_Percentage
FROM Exam_Attempt ea
JOIN Exam ex      ON ea.Exam_ID = ex.Exam_ID
JOIN Enrollment e ON ea.Roll_No = e.Roll_No
                  AND e.Course_Code = ex.Course_Code
ORDER BY ea.Roll_No;

-- 44. Students from a specific department who attended all scheduled exams
SELECT s.Roll_No, s.Name
FROM Student s
WHERE s.Dept_ID = 1
  AND NOT EXISTS (
      SELECT 1 FROM Exam ex
      WHERE ex.Course_Code IN (
          SELECT c.Course_Code
          FROM Course c
          WHERE c.Dept_ID = s.Dept_ID
      )
      AND NOT EXISTS (
          SELECT 1 FROM Exam_Attempt ea
          WHERE ea.Exam_ID = ex.Exam_ID
            AND ea.Roll_No = s.Roll_No
      )
  );

-- 45. Students attending a course but not appearing in its exams
SELECT e.Roll_No, e.Course_Code
FROM Enrollment e
WHERE NOT EXISTS (
    SELECT 1 FROM Exam_Attempt ea
    JOIN Exam ex ON ea.Exam_ID = ex.Exam_ID
    WHERE ea.Roll_No = e.Roll_No
      AND ex.Course_Code = e.Course_Code
);

-- 46. Summary per student: department, number of courses, exams appeared, avg attendance
SELECT s.Roll_No, s.Name, d.Name AS Department,
       COUNT(DISTINCT e.Course_Code)      AS Num_Courses,
       COUNT(DISTINCT ea.Exam_ID)         AS Exams_Attended,
       ROUND(AVG(e.Attendance_Percentage),2) AS Avg_Attendance
FROM Student s
JOIN Department d ON s.Dept_ID = d.Dept_ID
LEFT JOIN Enrollment e   ON s.Roll_No = e.Roll_No
LEFT JOIN Exam_Attempt ea ON s.Roll_No = ea.Roll_No
GROUP BY s.Roll_No, s.Name, d.Name;
