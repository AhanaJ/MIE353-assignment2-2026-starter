COPY(
    SELECT CONCAT(p.firstName,' ', p.lastName) as professorName
    FROM professor AS p
    INNER JOIN teaches AS t ON p.profId = t.profId
    INNER JOIN transcript AS tr ON tr.courseId = t.courseId
    INNER JOIN student AS s ON tr.studentId = s.studentId
    WHERE s.firstName = 'Rebecca' AND s.lastName = 'Ward'
    ORDER BY professorName, p.profId
)TO 'src/main/resources/data/output/Query4.csv'