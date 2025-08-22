SHOW PROCEDURE STATUS WHERE Name = 'AddAttendanceClass';
CALL AddAttendanceClass(201, 'EC201', TRUE);


SELECT * FROM Enrollment WHERE Roll_No = 201 AND Course_Code = 'EC201';
CALL AddAttendanceClass(201, 'EC201', TRUE);
SELECT * FROM Enrollment WHERE Roll_No = 201 AND Course_Code = 'EC201';
SELECT DATABASE();
