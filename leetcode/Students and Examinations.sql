# Write your MySQL query statement below

SELECT st.student_id , st.student_name ,subject_name , (
    SELECT COUNT(*) 
    FROM Examinations AS e 
    WHERE e.student_id=st.student_id and e.subject_name=su.subject_name) AS attended_exams
FROM Students AS st , Subjects AS su
ORDER BY student_id ASC ,subject_name ASC;
