-- 47. Courses that each faculty member teaches
SELECT f.Emp_ID, f.Name, ct.Course_Code
FROM Course_Teaching ct
JOIN Faculty f ON ct.Emp_ID = f.Emp_ID;

-- 48. Faculty members teaching more than one course
SELECT f.Emp_ID, f.Name, COUNT(ct.Course_Code) AS Course_Count
FROM Course_Teaching ct
JOIN Faculty f ON ct.Emp_ID = f.Emp_ID
GROUP BY f.Emp_ID, f.Name
HAVING Course_Count > 1;

-- 49. Faculty member assigned to the most exams
SELECT ex.Created_By AS Emp_ID, f.Name,
       COUNT(*) AS Exam_Count
FROM Exam ex
JOIN Faculty f ON ex.Created_By = f.Emp_ID
GROUP BY ex.Created_By, f.Name
ORDER BY Exam_Count DESC
LIMIT 1;

-- 50. Total number of faculty members
SELECT COUNT(*) AS Total_Faculty FROM Faculty;

-- 51. Names of all faculty members and their corresponding course codes
SELECT f.Name, ct.Course_Code
FROM Faculty f
LEFT JOIN Course_Teaching ct ON f.Emp_ID = ct.Emp_ID;

-- 52. Exams conducted under a specific faculty member
SELECT ex.Exam_ID, ex.Title
FROM Exam ex
WHERE ex.Created_By = 101;

-- 53. Exam schedule (date & type) for a particular faculty’s courses (coordinator role)
SELECT ex.Course_Code, ex.Date, ex.Type
FROM Exam ex
JOIN Course c ON ex.Course_Code = c.Course_Code
WHERE c.Coordinator_ID = 101;

-- 54. All exams grouped by faculty
SELECT f.Emp_ID, f.Name,
       GROUP_CONCAT(ex.Exam_ID ORDER BY ex.Date) AS Exams_List
FROM Exam ex
JOIN Faculty f ON ex.Created_By = f.Emp_ID
GROUP BY f.Emp_ID, f.Name;

-- 55. Faculty responsible for conducting the longest exam
SELECT f.Emp_ID, f.Name,
       ex.Exam_ID, ex.Duration
FROM Exam ex
JOIN Faculty f ON ex.Created_By = f.Emp_ID
ORDER BY ex.Duration DESC
LIMIT 1;

-- 56. How many exams each faculty member has been assigned
SELECT ex.Created_By AS Emp_ID, f.Name,
       COUNT(*) AS Num_Exams
FROM Exam ex
JOIN Faculty f ON ex.Created_By = f.Emp_ID
GROUP BY ex.Created_By, f.Name;

-- 57. Courses taught by only one faculty member
SELECT ct.Course_Code
FROM Course_Teaching ct
GROUP BY ct.Course_Code
HAVING COUNT(DISTINCT ct.Emp_ID) = 1;

-- 58. Any courses without an assigned faculty?
SELECT Course_Code, Title
FROM Course
WHERE Course_Code NOT IN (SELECT ct.Course_Code FROM Course_Teaching ct);

-- 59. For each faculty: list departments they are associated with via courses
SELECT DISTINCT f.Emp_ID, f.Name, d.Name AS Department
FROM Faculty f
JOIN Course_Teaching ct ON f.Emp_ID = ct.Emp_ID
JOIN Course c ON ct.Course_Code = c.Course_Code
JOIN Department d ON c.Dept_ID = d.Dept_ID;

-- 60. Which faculty teaches the most students (based on enrollments)
SELECT ct.Emp_ID, f.Name,
       COUNT(DISTINCT e.Roll_No) AS Student_Count
FROM Course_Teaching ct
JOIN Enrollment e ON ct.Course_Code = e.Course_Code
JOIN Faculty f ON ct.Emp_ID = f.Emp_ID
GROUP BY ct.Emp_ID, f.Name
ORDER BY Student_Count DESC
LIMIT 1;

-- 61. Students who attended all classes and gave all exams under a specific faculty
-- Example for faculty 101
SELECT DISTINCT e.Roll_No
FROM Enrollment e
JOIN Course_Teaching ct ON e.Course_Code = ct.Course_Code
LEFT JOIN Exam ex ON ex.Created_By = ct.Emp_ID
LEFT JOIN Exam_Attempt ea
  ON ea.Roll_No = e.Roll_No AND ea.Exam_ID = ex.Exam_ID
WHERE ct.Emp_ID = 101
GROUP BY e.Roll_No
HAVING MIN(Attendance_Percentage) = 100
   AND COUNT(ea.Exam_ID) = COUNT(ex.Exam_ID);

-- 62. Subjects each faculty conducted exams for
SELECT f.Emp_ID, f.Name,
       GROUP_CONCAT(DISTINCT ex.Subject_Name ORDER BY ex.Exam_ID) AS Subjects
FROM Exam ex
JOIN Faculty f ON ex.Created_By = f.Emp_ID
GROUP BY f.Emp_ID, f.Name;
