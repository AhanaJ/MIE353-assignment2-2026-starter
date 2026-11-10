COPY(
    SELECT CONCAT(s.firstName,' ', s.lastName) as studentName
    FROM student AS s
    WHERE EXISTS( 
        SELECT 1 FROM transcript AS tr 
        INNER JOIN course AS c on c.courseId = tr.courseId
        WHERE s.studentId = tr.studentId AND LOWER(c.courseName) == 'data modelling') 
        AND EXISTS( SELECT 1 FROM transcript AS tp 
        INNER JOIN course AS c on c.courseId = tp.courseId
        WHERE s.studentId = tp.studentId AND LOWER(c.courseName) <> 'data modelling' AND tp.grade >= 90) 
    ORDER BY studentName, s.studentId
)TO 'src/main/resources/data/output/Query6.csv'