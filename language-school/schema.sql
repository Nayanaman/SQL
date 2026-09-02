CREATE TABLE Umergalieva321.people (
    people_id INTEGER PRIMARY KEY,
    surname VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    patronymic VARCHAR(20),
    phone VARCHAR(15) UNIQUE CHECK(phone ~ '^\+7[0-9]{3} [0-9]{3}-[0-9]{2}-[0-9]{2}')
);

alter table Umergalieva321.people drop constraint people_phone_check;
alter table Umergalieva321.people add constraint people_phone_check check(phone like '+%');

CREATE TABLE Umergalieva321.student (
    student_id INTEGER PRIMARY KEY REFERENCES Umergalieva321.people(people_id) ON DELETE CASCADE,
    registration_date DATE NOT NULL DEFAULT CURRENT_DATE
); 

CREATE TABLE Umergalieva321.level (
    level_id INTEGER PRIMARY KEY,
    name VARCHAR(15) NOT NULL UNIQUE,
    description VARCHAR(20)
);

CREATE TABLE Umergalieva321.teacher (
    teacher_id INTEGER PRIMARY KEY REFERENCES Umergalieva321.people(people_id) ON DELETE CASCADE,
    level_id INTEGER REFERENCES Umergalieva321.level(level_id) ON DELETE CASCADE not null,
    hire_date DATE DEFAULT CURRENT_DATE NOT NULL,
    salary NUMERIC CHECK(SALARY>0)
);

CREATE TABLE Umergalieva321.language (
    language_id INTEGER PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Umergalieva321.course (
    course_id INTEGER PRIMARY KEY,
    level_id INTEGER REFERENCES Umergalieva321.level(level_id) ON DELETE CASCADE not null,
    language_id INTEGER REFERENCES Umergalieva321.language(language_id) ON DELETE CASCADE not null,
 	UNIQUE(level_id,language_id)
);

CREATE TABLE Umergalieva321."group" (
    group_id INTEGER PRIMARY KEY,
    course_id INTEGER REFERENCES Umergalieva321.course(course_id) ON DELETE CASCADE not null,
    teacher_id INTEGER REFERENCES Umergalieva321.teacher(teacher_id) ON DELETE CASCADE not null,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
 	CHECK(end_date>=start_date),
    num_students NUMERIC CHECK(num_students>0) not null,
 	unique(course_id,teacher_id)
);

CREATE TABLE Umergalieva321.lesson (
    lesson_id INTEGER PRIMARY KEY,
    group_id INTEGER REFERENCES Umergalieva321."group"(group_id) ON DELETE CASCADE not null,
    date date not null,
 	time_start time not null,
    duration NUMERIC CHECK (duration>0) NOT NULL,
 	unique(group_id, date,time_start)
);

CREATE TABLE Umergalieva321.studentgroup (
    studentgroup_id INTEGER PRIMARY KEY,
    student_id INTEGER REFERENCES Umergalieva321.student(student_id) ON DELETE CASCADE not null,
    group_id INTEGER REFERENCES Umergalieva321."group"(group_id) ON DELETE CASCADE not null,
 	unique(student_id,group_id)
);

CREATE TABLE Umergalieva321.test (
    test_id INTEGER PRIMARY KEY,
  	name VARCHAR(50) not null 
    course_id INTEGER REFERENCES Umergalieva321.course(course_id) ON DELETE CASCADE not null,
    passing_score NUMERIC check(passing_score>0) not null,
 	unique(name,course_id)
);

CREATE TABLE Umergalieva321.testresult (
    testresult_id INTEGER PRIMARY KEY,
    test_id INTEGER REFERENCES Umergalieva321.test(test_id) ON DELETE CASCADE not null,
    studentgroup_id INTEGER REFERENCES Umergalieva321.studentgroup(studentgroup_id) ON DELETE CASCADE not null,
    score NUMERIC check(score>0),
    date_t date default current_date not null,
 	unique(test_id,studentgroup_id,date_t)
);

CREATE TABLE Umergalieva321.attendance (
    attendance_id INTEGER PRIMARY KEY,
    studentgroup_id INTEGER REFERENCES Umergalieva321.studentgroup(studentgroup_id) ON DELETE CASCADE not null,
    lesson_id INTEGER REFERENCES Umergalieva321.lesson(lesson_id) ON DELETE CASCADE not null,
 	unique(studentgroup_id,lesson_id)
);

CREATE TABLE Umergalieva321.daysofweek (
    daysofweek_id INTEGER PRIMARY KEY,
    daysofweek VARCHAR(15) not null unique
);

CREATE TABLE Umergalieva321.schedule (
    schedule_id INTEGER PRIMARY KEY,
    group_id INTEGER REFERENCES Umergalieva321."group"(group_id) ON DELETE CASCADE not null,
    daysofweek_id INTEGER REFERENCES Umergalieva321.daysofweek(daysofweek_id) ON DELETE CASCADE not null,
    start_time time NOT NULL,
    end_time time NOT NULL,
 	CHECK(end_time>=start_time),
 	unique(group_id,daysofweek_id)
);

CREATE TABLE Umergalieva321.payment (
    payment_id INTEGER PRIMARY KEY,
    studentgroup_id INTEGER REFERENCES Umergalieva321.studentgroup(studentgroup_id) ON DELETE CASCADE not null,
    amount NUMERIC check(amount>0) not null,
    payment_date date not null,
 	unique(studentgroup_id,payment_date)
);

CREATE TABLE Umergalieva321.diploma (
    diploma_id INTEGER PRIMARY KEY REFERENCES Umergalieva321.studentgroup(studentgroup_id) ON DELETE CASCADE not null,
    diplom VARCHAR(20) not null unique,
    issue_date date default current_date not null
);

CREATE TABLE Umergalieva321.material (
    material_id INTEGER PRIMARY KEY,
    course_id INTEGER REFERENCES Umergalieva321.course(course_id) ON DELETE CASCADE not null,
    title VARCHAR(50) not null,
    type_m VARCHAR(20),
 unique(course_id, title)
);
