--1
CREATE DATABASE lab2;
--2
CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR,
  region_id INTEGER,
  population INTEGER
);
SELECT * FROM countries;
--3
INSERT INTO countries VALUES(DEFAULT,'China',1,100000);
--4
INSERT INTO countries(country_id,country_name) VALUES(DEFAULT, 'Russia');
--5
INSERT INTO countries(region_id) VALUES(NULL);
--?or
INSERT INTO countries VALUES (DEFAULT,'Russia',NULL,80000);
--6
INSERT INTO countries VALUES
                             (DEFAULT,'Japan',2,90000),
                             (DEFAULT ,'France',3,105000),
                             (DEFAULT ,'England',4,99999);
--7
ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
--8
INSERT INTO countries VALUES(DEFAULT,DEFAULT,2,91000);
--?or
INSERT INTO countries(country_name) VALUES(DEFAULT);
--9
INSERT INTO countries DEFAULT VALUES;
--10
CREATE TABLE countries_new(
  LIKE countries
);
--11
INSERT INTO countries_new SELECT * FROM countries;
SELECT * from countries_new;
--12
UPDATE countries SET region_id=1 WHERE region_id ISNULL;
--13
UPDATE countries SET population=population*1.1
RETURNING country_name,population AS "New Population";
--14
DELETE FROM countries WHERE population<100000;
--15
DELETE FROM countries_new AS cn USING countries AS c
WHERE cn.country_id =c.country_id
RETURNING *;
--16
DELETE FROM countries
RETURNING *;

