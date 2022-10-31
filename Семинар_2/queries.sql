-- create
CREATE TABLE PEOPLE (
  Id INTEGER PRIMARY KEY,
  FIO TEXT,
  Birthday TEXT,
  Status TEXT
);

CREATE TABLE PHONE (
  Id_people INTEGER,
  Phone INTEGER,
  Commit TEXT
);

CREATE TABLE ADDRESS (
  Id_people INTEGER,
  Address TEXT,
  Commit TEXT
);

CREATE TABLE LIST (
  FIO TEXT,
  Birthday TEXT,
  Status TEXT,
  Phone INTEGER,
  Commit TEXT,
  Address TEXT,
  us_group TEXT
);

-- insert
INSERT INTO PEOPLE VALUES (1,	"Иванов И. И.","12/02/1990", "женат");
INSERT INTO PEOPLE VALUES (2,	"Иванов И. И.", "18/09/2001",	"холост");
INSERT INTO PEOPLE VALUES (3,	"Петров П. П.", "23/04/1983",	"женат");
INSERT INTO PEOPLE VALUES (4,	"Васильев В. В.",	"21/05/1998",	"холост");
INSERT INTO PEOPLE VALUES (25,	"Кузьмин К.К.",	"21/05/2020",	"холост");

INSERT INTO PHONE VALUES (1,	123,	"личный");
INSERT INTO PHONE VALUES (1,	124,	"рабочий");
INSERT INTO PHONE VALUES (1,	125,	"для поездок");
INSERT INTO PHONE VALUES (1,	126,	"интернет");
INSERT INTO PHONE VALUES (1,	127,	"старый");
INSERT INTO PHONE VALUES (2,	527,	"личный");
INSERT INTO PHONE VALUES (3,	234,	"личный");
INSERT INTO PHONE VALUES (3,	235,	"рабочий");
INSERT INTO PHONE VALUES (4,	456,	"личный");
INSERT INTO PHONE VALUES (11,	999,	"личный");
INSERT INTO PHONE VALUES (12,	997,	"рабочий");
INSERT INTO PHONE VALUES (13,	995,	"личный");
INSERT INTO PHONE VALUES (14,	993,	"для поездок");
INSERT INTO PHONE VALUES (15,	991,	"для поездок");

INSERT INTO ADDRESS VALUES (1,	"Можга",	"Место рождения");
INSERT INTO ADDRESS VALUES (1,	"Казань",	"По прописке");
INSERT INTO ADDRESS VALUES (1,	"Москва",	"Рабочий");
INSERT INTO ADDRESS VALUES (2,	"Санкт-Петербург",	"По прописке");
INSERT INTO ADDRESS VALUES (3,	"Москва",	"По прописке");
INSERT INTO ADDRESS VALUES (4,	"Белгород",	"По прописке");
INSERT INTO ADDRESS VALUES (5,	"Уфа",	"По прописке");
INSERT INTO ADDRESS VALUES (6,	"Сочи",	"По прописке");
INSERT INTO ADDRESS VALUES (7,	"Киров",	"Рабочий");
INSERT INTO ADDRESS VALUES (8,	"Владивосток",	"Место рождения");
INSERT INTO ADDRESS VALUES (9,	"Рязань",	"Рабочий");
INSERT INTO ADDRESS VALUES (10,	"Хабаровск",	"Место рождения");

INSERT INTO LIST VALUES ("Иванов И. И.", "12/02/1990",	"женат",	126,	"интернет",	"Можга",	"Работа");
INSERT INTO LIST VALUES ("Иванов И. И.", "12/02/1990",	"женат",	127,	"старый",	"Можга",	"Работа");
INSERT INTO LIST VALUES ("Иванов И. И.", "18/09/2001",	"холост",	527,	"личный",	"Санкт-Петербург",	"Школа");
INSERT INTO LIST VALUES ("Петров П. П.", "23/04/1983",	"женат",	234,	"личный",	"Москва",	"Родня");
INSERT INTO LIST VALUES ("Петров П. П.", "24/04/1983",	"женат",	235,	"рабочий",	"Москва",	"Родня");
INSERT INTO LIST VALUES ("Васильев В. В.", "21/05/1998",	"холост",	456,	"личный",	"Белгород",	"Друзья");
INSERT INTO LIST VALUES ("Сидоров С.С.", "13/07/2007",	"холост",	643,	"личный",	"Киров",	"Родня");
INSERT INTO LIST VALUES ("Сидоров С.С.", "13/07/2007",	"холост",	654,	"старый",	"Киров",	"Родня");
INSERT INTO LIST VALUES ("Александров А.А.", "05/03/1987",	"женат",	412,	"рабочий",	"Уфа",	"Друзья");
INSERT INTO LIST VALUES ("Борисов Б.Б.",	"16/08/1989",	"холост",	723,	"рабочий",	"Москва",	"Работа");
INSERT INTO LIST VALUES ("Михайлов М.М.", "08/01/1997",	"женат",	876,	"личный",	"Сочи",	"Университет");
INSERT INTO LIST VALUES ("Михайлов М.М.", "08/01/1997",	"женат",	875,	"рабочий",	"Сочи",	"Университет");
INSERT INTO LIST VALUES ("Кириллов К.К.", "03/12/1996",	"холост",	933,	"личный",	"Киров",	"Работа");


-- fetch 
-- 1. SELECT ФИО, Д/р, Адрес FROM Общий список
SELECT("");
SELECT FIO,Birthday,Address FROM LIST; 
SELECT("");

-- 2. SELECT ФИО, Статус FROM Общий список WHERE Адрес = «Можга»
SELECT FIO,Status 
FROM LIST 
WHERE Address = "Можга"; 
SELECT("");

-- 3. SELECT ФИО FROM Общий список WHERE Адрес = «Москва» AND Группа = «Работа»
SELECT FIO 
FROM LIST 
WHERE Address = "Москва" AND us_group = "Работа";
SELECT("");

-- 4. SELECT Д/р FROM Общий список WHERE Адрес = «Москва» OR Группа = «Работа»
SELECT Birthday 
FROM LIST 
WHERE Address = "Москва" OR us_group = "Работа";
SELECT("");

-- 5. INNER JOIN Люди, Адреса ON id = Чей адрес
SELECT * 
FROM PEOPLE 
INNER JOIN ADDRESS 
ON PEOPLE.Id = ADDRESS.Id_people;
SELECT("");

-- 6. LEFT JOIN Люди, Адреса ON id = Чей адрес
SELECT *
FROM PEOPLE
LEFT JOIN ADDRESS
ON PEOPLE.Id = ADDRESS.Id_people;
SELECT("");

-- 7. RIGHT JOIN Люди, Адреса ON id = Чей адрес
SELECT *
FROM PEOPLE
RIGHT JOIN ADDRESS
ON PEOPLE.Id = ADDRESS.Id_people;
SELECT("");

-- 8. FULL JOIN Люди, Адреса ON id = Чей адрес
SELECT *
FROM PEOPLE
LEFT JOIN ADDRESS
ON PEOPLE.Id = ADDRESS.Id_people

UNION 

SELECT *
FROM PEOPLE
RIGHT JOIN ADDRESS
ON PEOPLE.Id = ADDRESS.Id_people;
SELECT("");

-- 9. SELECT ФИО, Адрес, Комментарий FROM Люди RIGHT JOIN Адреса ON id = Чей Адрес
SELECT FIO,Address,Commit
FROM PEOPLE
RIGHT JOIN ADDRESS
ON PEOPLE.Id = ADDRESS.Id_people;



