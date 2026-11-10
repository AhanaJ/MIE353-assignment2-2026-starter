COPY(
    SELECT CONCAT(p.firstName,' ', p.lastName) as professorName
    FROM professor AS p
    INNER JOIN teaches AS t ON p.profId = t.profId
    GROUP BY p.profId, p.firstName, p.lastName
    HAVING COUNT(DISTINCT t.courseId) = 1
    ORDER BY professorName, p.profId
)TO 'src/main/resources/data/output/Query3.csv'