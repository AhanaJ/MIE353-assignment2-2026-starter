COPY(
    SELECT CONCAT(s1.firstName,' ', s1.lastName) as student1Name, 
    CONCAT(s2.firstName,' ', s2.lastName) as student2Name,
    COUNT(*) AS sharedCourseCount,
    ROUND(AVG(tr1.grade),2) AS student1Avg,
    ROUND(AVG(tr2.grade),2) AS student2Avg
    FROM transcript AS tr1
    INNER JOIN transcript AS tr2 ON tr1.courseId = tr2.courseId 
    AND tr1.studentId > tr2.studentId
    INNER JOIN student AS s1 ON s1.studentId = tr1.studentId 
    INNER JOIN student AS s2 ON s2.studentId = tr2.studentId
    GROUP BY s1.firstName, s1.lastName, s2.firstName, s2.lastName, s1.studentId, s2.studentId
    HAVING COUNT(*) >= 3
    ORDER BY student1Name, student2Name, s1.studentId, s2.studentId
)TO 'src/main/resources/data/output/Query7.csv'