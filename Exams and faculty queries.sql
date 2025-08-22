-- 21. Which course has the highest enrollment?
SELECT Course_Code FROM Enrollment
GROUP BY Course_Code
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 22. How many exams are scheduled on a particular date?
SELECT Date, COUNT(*) AS Exam_Count FROM Exam
WHERE Date = '2025-12-20'
GROUP BY Date;

-- 23. List all exams of a particular course.
SELECT * FROM Exam WHERE Course_Code = 'ECE101';

-- 24. What is the duration of each exam in a course?
SELECT Exam_ID, Title, Duration FROM Exam WHERE Course_Code = 'ECE101';

-- 25. What is the total number of exams conducted for each course?
SELECT Course_Code, COUNT(*) AS Exam_Count FROM Exam GROUP BY Course_Code;

-- 26. List exams grouped by type (e.g., midterm, final, practical).
SELECT Type, COUNT(*) AS Exam_Count FROM Exam GROUP BY Type;

-- 27. Which exams are scheduled in the current week/month?
SELECT * FROM Exam
WHERE EXTRACT(MONTH FROM Date) = EXTRACT(MONTH FROM CURRENT_DATE)
AND EXTRACT(YEAR FROM Date) = EXTRACT(YEAR FROM CURRENT_DATE);

-- 28. What is the average exam duration for each course?
SELECT Course_Code, AVG(Duration) AS Avg_Duration FROM Exam GROUP BY Course_Code;

-- 29. What is the duration and subject of each exam?
SELECT Exam_ID, Subject_Name, Duration FROM Exam;

-- 30. How many exams has each student appeared for?
SELECT Roll_No, COUNT(*) AS Exams_Attended FROM Exam_Attempt GROUP BY Roll_No;
