
-- Assuming the required tables: Students, Departments, Courses, StudentCourseEnrollment, Attendance already exist.

-- Stored Procedure to Generate Total Attendance Report
DELIMITER $$

CREATE PROCEDURE GenerateTotalAttendanceReport()
BEGIN
    SELECT 
        s.StudentID,
        s.Name AS StudentName,
        d.DeptName AS Department,
        c.CourseName,
        COUNT(a.AttendanceID) AS ClassesHeld,
        SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS ClassesAttended,
        ROUND(
            (SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) / 
             COUNT(a.AttendanceID)) * 100, 2
        ) AS AttendancePercentage
    FROM Students s
    JOIN Departments d ON s.DeptID = d.DeptID
    JOIN StudentCourseEnrollment e ON s.StudentID = e.StudentID
    JOIN Courses c ON e.CourseID = c.CourseID
    JOIN Attendance a ON a.StudentID = s.StudentID AND a.CourseID = c.CourseID
    GROUP BY s.StudentID, c.CourseID
    ORDER BY s.StudentID, c.CourseName;
END$$

DELIMITER ;
