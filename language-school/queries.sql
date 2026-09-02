'Вывести все платежи с суммой от 12000 до 15000'
SELECT surname, name, amount, payment_date FROM Umergalieva321.payment 
inner join umergalieva321.studentgroup using (studentgroup_id)
inner join umergalieva321.student using (student_id)
inner join umergalieva321.people on people_id=student_id
WHERE amount BETWEEN 12000 AND 15000; 

'Вывести все курсы, которые проходили в 2024 и 2025 годах'
SELECT language.name, level.name, start_date, end_date from Umergalieva321.group
inner join umergalieva321.course using (course_id)
inner join Umergalieva321.language using (language_id)
inner join Umergalieva321.level using (level_id)
where extract (year from start_date) in (2024, 2025) and extract (year from end_date) in (2024,2025);

'Вывести учителей, у которых в 25 году на курсах училось более 50 человек'
select surname, name, sum(num_students) from Umergalieva321.group
inner join Umergalieva321.teacher using (teacher_id)
inner join Umergalieva321.people on people_id=teacher_id
where extract (year from start_date) = 2025 or extract (year from end_date) = 2025
group by teacher_id, surname, name
having (sum(num_students)>50);

'Вывести информацию о студентах, указав их фамилию и имя union'
select surname, name, 'student' as role from Umergalieva321.student
inner join Umergalieva321.people on people_id=student_id
union
select surname, name, 'teacher' as role from Umergalieva321.teacher
inner join Umergalieva321.people on people_id=teacher_id;

'Вывести фамилию и имя студентов, которые внесли платех больше средней суммы всех платежей'
SELECT surname, name, amount 
FROM Umergalieva321.payment
LEFT OUTER JOIN Umergalieva321.studentgroup USING (studentgroup_id)
LEFT OUTER JOIN Umergalieva321.student USING (student_id)
LEFT OUTER JOIN Umergalieva321.people ON people_id = student_id
WHERE amount > (SELECT AVG(amount) FROM Umergalieva321.payment);

'Создать представление с результатами тестов студентов, включая фамилию, имя, язык, уровень  балл'
CREATE VIEW st_res AS
SELECT surname, Umergalieva321.people.name, Umergalieva321.language.name AS language, Umergalieva321.level.name AS level, score
FROM Umergalieva321.testresult
LEFT OUTER JOIN Umergalieva321.studentgroup USING (studentgroup_id)
LEFT OUTER JOIN Umergalieva321.student USING (student_id)
LEFT OUTER JOIN Umergalieva321.people ON people_id = student_id
JOIN Umergalieva321.group USING (group_id)
LEFT OUTER JOIN Umergalieva321.course USING (course_id)
LEFT OUTER JOIN Umergalieva321.language USING (language_id)
LEFT OUTER JOIN Umergalieva321.level USING (level_id);
SELECT * FROM st_res;

'Сформировать недельное расписание занятий с указанием дня недели, времени, языка и преподавателя'
SELECT Umergalieva321.daysofweek.daysofweek, schedule.start_time, Umergalieva321.language.name, surname
FROM Umergalieva321.schedule
JOIN Umergalieva321.daysofweek USING (daysofweek_id)
JOIN Umergalieva321.group USING (group_id)
JOIN Umergalieva321.course USING (course_id)
JOIN Umergalieva321.language USING (language_id)
JOIN Umergalieva321.teacher USING (teacher_id)
JOIN Umergalieva321.people ON people_id = teacher_id;

'Вывести информацию о студенте и сумме всех его платежей'
update umergalieva321.payment set studentgroup_id = 2 where payment_id = 3; 

SELECT surname, name, 
(SELECT coalesce(SUM(amount),0) AS "amount"
 FROM Umergalieva321.payment 
 RIGHT OUTER JOIN Umergalieva321.studentgroup USING (studentgroup_id)
 WHERE Umergalieva321.studentgroup.student_id = Umergalieva321.student.student_id)
FROM Umergalieva321.student 
 JOIN Umergalieva321.people ON people_id = student_id;
