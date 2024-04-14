SELECT course_nbr,student_name,teacher_name
FROM register
GROUP BY course_nbr,student_name
ORDER BY course_nbr asc;
/*
10	"生徒１       "	"先生１       "
20	"生徒１       "	"先生２       "
20	"生徒１       "	"先生１       "
30	"生徒１       "	"先生３       "
30	"生徒１       "	"先生１       "
30	"生徒１       "	"先生２       "
*/

SELECT course_nbr,student_name,COUNT(teacher_name)
FROM register
GROUP BY course_nbr,student_name
ORDER BY course_nbr asc;

/*
10	"生徒１       "	1
20	"生徒１       "	2
30	"生徒１       "	3
*/

SELECT course_nbr,student_name,MIN(teacher_name) teacher1,
       CASE MAX(teacher_name) 
            WHEN MIN(teacher_name) THEN NULL
            ELSE MAX(teacher_name) END  teacher2
FROM register
GROUP BY course_nbr,student_name
HAVING COUNT(teacher_name)<=2
UNION
SELECT course_nbr,student_name,MIN(teacher_name) teacher1,'more' teacher2
FROM register
GROUP BY course_nbr,student_name
HAVING COUNT(teacher_name)>2
ORDER BY course_nbr asc