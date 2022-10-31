
-- create
CREATE TABLE Student (
  id INTEGER PRIMARY KEY,
  FIO TEXT,
  id_class INTEGER
);

CREATE TABLE Phone (
  id_student INTEGER,
  phone TEXT,
  commit TEXT
);

CREATE TABLE Class (
  id INTEGER PRIMARY KEY,
  name TEXT,
  commit TEXT
);

CREATE TABLE Cabinet (
  id INTEGER PRIMARY KEY,
  number INTEGER,
  name TEXT
);

CREATE TABLE Rassadka (
  id_student INTEGER,
  id_cabinet INTEGER,
  ryd INTEGER,
  desk INTEGER,
  variant INTEGER
);

CREATE TABLE Timetable (
  id_cabinet INTEGER,
  id_class INTEGER,
  start_les timestamp,
  end_les timestamp
);


-- insert
INSERT INTO Student VALUES (1,	"Иванов В. В.",	1);
INSERT INTO Student VALUES (2,	"Петров А. А.",	2);
INSERT INTO Student VALUES (3,	"Сидоров Н. А.",	3);
INSERT INTO Student VALUES (4,	"Васечкин П. Р.",	1);

INSERT INTO Phone VALUES (1,	"+7(963) 4566-123",	"Бабушка");
INSERT INTO Phone VALUES (1,	"+7(963) 4566-456",	"Домашний");
INSERT INTO Phone VALUES (2,	"+7(963) 4566-789",	"Личный");
INSERT INTO Phone VALUES (4,	"+7(963) 4566-990",	"Мама");

INSERT INTO Class VALUES (1,	"5А",	"Математический");
INSERT INTO Class VALUES (2,	"5Б",	"Обычный");
INSERT INTO Class VALUES (3,	"5В",	"Обычный");

INSERT INTO Cabinet VALUES (1,	101,	"Математика");
INSERT INTO Cabinet VALUES (2,	205,	"Русский язык и литература");

INSERT INTO Rassadka VALUES (1,	1,	1,	2,	1);
INSERT INTO Rassadka VALUES (2,	1,	2,	3,	2);
INSERT INTO Rassadka VALUES (3,	1,	2,	4,	1);
INSERT INTO Rassadka VALUES (4,	1,	1,	5,	2);
INSERT INTO Rassadka VALUES (1,	2,	1,	2,	1);
INSERT INTO Rassadka VALUES (2,	2,	1,	1,	1);
INSERT INTO Rassadka VALUES (3,	2,	2,	4,	1);
INSERT INTO Rassadka VALUES (4,	2,	1,	5,	2);

INSERT INTO Timetable VALUES (1,	1,	"2022-12-30 09:00:00",	"2022-12-30 09:45:00");
INSERT INTO Timetable VALUES (1,	2,	"2022-12-30 10:00:00",	"2022-12-30 10:45:00");
INSERT INTO Timetable VALUES (1,	3,	"2022-12-30 11:00:00",	"2022-12-30 11:45:00");
INSERT INTO Timetable VALUES (2,	1,	"2022-12-30 10:00:00",	"2022-12-30 10:45:00");
INSERT INTO Timetable VALUES (2,	1,	"2022-12-30 11:00:00",	"2022-12-30 11:45:00");


-- fetch 
-- Запрос показываем кто сидел в данном кабинете, в заданное время, 
-- на заданном ряду, варианте, парте.
SELECT Class.name, Student.FIO, Phone.phone FROM Student
INNER JOIN Class
ON Class.id = Student.id_class 
INNER JOIN Timetable
ON Timetable.id_class = Class.id
INNER JOIN Cabinet
ON Cabinet.id = Timetable.id_cabinet 
AND Cabinet.number = 205 -- номер кабинета
AND Timetable.start_les >="2022-12-30 10:00:00" -- начало занятия
AND Timetable.end_les <="2022-12-30 10:45:00"  -- окончание занятия
INNER JOIN Rassadka
ON Rassadka.id_cabinet = Cabinet.id 
AND Student.id = Rassadka.id_student
AND Rassadka.ryd = 1     -- ряд
AND Rassadka.desk = 5    -- парта
AND Rassadka.variant = 2 -- вариант
INNER JOIN Phone
ON Phone.id_student = Student.id;


SELECT("");


-- Запрос показывает где находился ученик в данное время 
-- в каком кабинете на каком ряду, варианте, парте.
SELECT Cabinet.number, Cabinet.name, Rassadka.ryd, Rassadka.desk, Rassadka.variant FROM Student
INNER JOIN Class
ON Class.id = Student.id_class 
AND Class.name = "5А" -- в каком классе учиться ученик
AND Student.FIO = "Васечкин П. Р." -- ФИО ученика
INNER JOIN Timetable
ON Timetable.id_class = Class.id
INNER JOIN Cabinet
ON Cabinet.id = Timetable.id_cabinet 
AND Timetable.start_les >="2022-12-30 10:00:00" -- начало занятия
AND Timetable.end_les <="2022-12-30 10:45:00"  -- окончание занятия
INNER JOIN Rassadka
ON Rassadka.id_cabinet = Cabinet.id 
AND Student.id = Rassadka.id_student;






