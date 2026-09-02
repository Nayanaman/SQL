INSERT INTO Umergalieva321.daysofweek VALUES
(1, 'Monday'),
(2, 'Tuesday'),
(3, 'Wednesday'),
(4, 'Thursday'),
(5, 'Friday'),
(6, 'Saturday'),
(7, 'Sunday');

INSERT INTO Umergalieva321.language VALUES
(1, 'English'),
(2, 'Spanish'),
(3, 'French'),
(4, 'German');

INSERT INTO Umergalieva321.level VALUES
(1, 'A1', 'Beginner'),
(2, 'A2', 'Elementary'),
(3, 'B1', 'Intermediate'),
(4, 'B2', 'Upper-Intermediate'),
(5, 'C1', 'Advanced');

INSERT INTO Umergalieva321.people VALUES
(101, 'Ivanov', 'Petr', 'Sergeevich', '+7900 111-22-33'),
(102, 'Smirnova', 'Anna', 'Vladimirovna', '+7900 111-22-44'),
(201, 'Kuznetsov', 'Alexey', 'Dmitrievich', '+7900 111-33-55'),
(202, 'Popova', 'Maria', 'Igorevna', '+7900 111-33-66'),
(203, 'Sokolov', 'Dmitry', 'Andreevich', '+7900 111-33-77'),
(204, 'Lebedeva', 'Elena', 'Sergeevna', '+7900 111-33-88');

INSERT INTO Umergalieva321.teacher VALUES
(101, 4, '2020-09-01', 46000),
(102, 5, '2019-03-15', 54000);

INSERT INTO Umergalieva321.student VALUES
(201, '2023-09-01'),
(202, '2023-09-01'),
(203, '2024-01-15'),
(204, '2024-01-15');

INSERT INTO Umergalieva321.course VALUES
(1, 3, 1), 
(2, 4, 1),
(3, 2, 2),
(4, 3, 3);

INSERT INTO Umergalieva321."group" VALUES
(1, 2, 101, '2023-09-05', '2024-06-20', 4),
(2, 3, 102, '2024-01-20', '2024-12-15', 2);

INSERT INTO Umergalieva321.studentgroup VALUES
(1, 201, 1),
(2, 202, 1),
(3, 203, 2),
(4, 204, 2);

INSERT INTO Umergalieva321.schedule VALUES
(1, 1, 2, '18:00', '19:30'),
(2, 1, 4, '18:00', '19:30'),
(3, 2, 1, '19:00', '20:30'),
(4, 2, 3, '19:00', '20:30');

INSERT INTO Umergalieva321.lesson VALUES
(1, 1, '2024-04-02', '18:00', 1.5),
(2, 1, '2024-04-04', '18:00', 1.5),
(3, 2, '2024-04-01', '19:00', 1.5),
(4, 2, '2024-04-03', '19:00', 1.5);

INSERT INTO Umergalieva321.attendance VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 2),
(4, 3, 3),
(5, 4, 4);

INSERT INTO Umergalieva321.test VALUES
(1, 'Begin', 2, 70),
(2, 'End', 3, 65);

INSERT INTO Umergalieva321.testresult VALUES
(1, 1, 1, 85.5, '2024-03-15'),
(2, 1, 2, 78.0, '2024-03-15'),
(3, 2, 3, 72.0, '2024-02-28'),
(4, 2, 4, 60.0, '2024-02-28');

INSERT INTO Umergalieva321.payment VALUES
(1, 1, 15000.00, '2023-09-01'),
(2, 2, 15000.00, '2023-09-01'),
(3, 3, 12000.00, '2024-01-15'),
(4, 4, 12000.00, '2024-01-15');

INSERT INTO Umergalieva321.diploma VALUES
(1, 'Certificate B2', '2024-06-25'),
(2, 'Certificate A2', '2024-12-20');

INSERT INTO Umergalieva321.material VALUES
(1, 2, 'English File B2', 'textbook'),
(2, 2, 'Listening Practice', 'audio'),
(3, 3, 'Spanish for Beginners', 'pdf'),
(4, 3, 'Vocabulary Flashcards', 'exercise');
