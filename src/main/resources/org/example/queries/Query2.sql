COPY(
    SELECT courseName 
    FROM course
    WHERE REGEXP_MATCHES(LOWER(courseId), '^[a-z]+4[0-9]{2}')
    ORDER BY courseName, courseId
)TO 'src/main/resources/data/output/Query2.csv'