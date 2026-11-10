COPY(
    SELECT CONCAT(p.firstName,' ', p.lastName) as professorName
    FROM professor AS p
    WHERE EXISTS( 
        SELECT 1 FROM teaches AS t WHERE t.profId = p.profId) 
        AND NOT EXISTS( SELECT 1 FROM teaches AS ts 
        INNER JOIN transcript AS tr ON tr.courseId = ts.courseId
        WHERE ts.profId = p.profId AND tr.grade <50)
    ORDER BY professorName, p.profId
)TO 'src/main/resources/data/output/Query5.csv'