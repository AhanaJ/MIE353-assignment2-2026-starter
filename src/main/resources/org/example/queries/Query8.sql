COPY(
    WITH attempts AS (
        SELECT
            tr.studentId,
            LOWER(REGEXP_EXTRACT(c.courseId, '^([A-Za-z]+)', 1)) AS department,
            CAST(REGEXP_EXTRACT(c.courseId, '^[A-Za-z]+([0-9]+)', 1) AS INTEGER) AS courseNumber,
            c.courseId,
            tr.grade
        FROM transcript AS tr
        INNER JOIN course AS c ON c.courseId = tr.courseId
    ),
    ranked AS (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY studentId, department
                ORDER BY courseNumber, courseId
            ) AS lowestRank,
            ROW_NUMBER() OVER (
                PARTITION BY studentId, department
                ORDER BY courseNumber DESC, courseId DESC
            ) AS highestRank,
            MIN(courseNumber) OVER (PARTITION BY studentId, department) AS minimumNumber,
            MAX(courseNumber) OVER (PARTITION BY studentId, department) AS maximumNumber
        FROM attempts
    )
    SELECT
        CONCAT(s.firstName, ' ', s.lastName) AS studentName,
        lo.department,
        lo.courseId AS lowestLevelCourse,
        lo.grade AS lowestLevelGrade,
        hi.courseId AS highestLevelCourse,
        hi.grade AS highestLevelGrade
    FROM ranked AS lo
    INNER JOIN ranked AS hi
        ON hi.studentId = lo.studentId
       AND hi.department = lo.department
       AND hi.highestRank = 1
    INNER JOIN student AS s ON s.studentId = lo.studentId
    WHERE lo.lowestRank = 1
      AND lo.minimumNumber < lo.maximumNumber
    ORDER BY studentName, lo.department, s.studentId
)TO 'src/main/resources/data/output/Query8.csv'