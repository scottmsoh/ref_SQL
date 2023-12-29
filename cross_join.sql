
# Write your MySQL query statement below
SELECT A.student_id, A.student_name, B.subject_name, COUNT(C.subject_name) AS attended_exams
FROM Students A
CROSS JOIN Subjects B
LEFT JOIN Examinations C ON A.student_id = C.student_id AND C.subject_name = B.subject_name
GROUP by A.student_id, A.student_name, B.subject_name
ORDER by A.student_id, A.student_name;

--
--Example 1:
--
--Input: 
--Students table:
--+------------+--------------+
--| student_id | student_name |
--+------------+--------------+
--| 1          | Alice        |
--| 2          | Bob          |
--| 13         | John         |
--| 6          | Alex         |
--+------------+--------------+
--Subjects table:
--+--------------+
--| subject_name |
--+--------------+
--| Math         |
--| Physics      |
--| Programming  |
--+--------------+
--Examinations table:
--+------------+--------------+
--| student_id | subject_name |
--+------------+--------------+
--| 1          | Math         |
--| 1          | Physics      |
--| 1          | Programming  |
--| 2          | Programming  |
--| 1          | Physics      |
--| 1          | Math         |
--| 13         | Math         |
--| 13         | Programming  |
--| 13         | Physics      |
--| 2          | Math         |
--| 1          | Math         |
--+------------+--------------+
--Output: 
--+------------+--------------+--------------+----------------+
--| student_id | student_name | subject_name | attended_exams |
--+------------+--------------+--------------+----------------+
--| 1          | Alice        | Math         | 3              |
--| 1          | Alice        | Physics      | 2              |
--| 1          | Alice        | Programming  | 1              |
--| 2          | Bob          | Math         | 1              |
--| 2          | Bob          | Physics      | 0              |
--| 2          | Bob          | Programming  | 1              |
--| 6          | Alex         | Math         | 0              |
--| 6          | Alex         | Physics      | 0              |
--| 6          | Alex         | Programming  | 0              |
--| 13         | John         | Math         | 1              |
--| 13         | John         | Physics      | 1              |
--| 13         | John         | Programming  | 1              |
--+------------+--------------+--------------+----------------+
--Explanation: 
--The result table should contain all students and all subjects.
--Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
--Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
--Alex did not attend any exams.
--John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.