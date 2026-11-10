COPY(
    SELECT COUNT(DISTINCT studentId) AS studentCount
    FROM transcript
    WHERE LOWER(courseId) = 'mie301h1f'  AND grade >= 80
)TO 'src/main/resources/data/output/Query1.csv'