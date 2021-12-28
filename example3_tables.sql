/*Questions:

Single-Row Subqueries:

Write a query to find the maximum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

Write a query to find the minimum duration among the tracks. Your query should include TrackId, Name, Milliseconds.

Write a query to find the tracks whose bytes are higher than the average of the bytes of all tracks. Your query should include TrackId, Name, Bytes, general average and should be ordered by Bytes from highest to lowest. General average is the average of all tracks. General average should repeat in every row. (Hint: You need to use two subqueries)

   Multiple-Row Subqueries:

Write a query that returns the customers whose sales representatives are Jane Peacock and Margaret Park. Your query should include CustomerID, First Name and Last Name of the customers.

Rewrite the subquery above using the JOIN.

   DDL (CREATE, ALTER, DELETE) and DML (SELECT, INSERT, UPDATE, DELETE) Statements

Create a table inside the chinook database. This table tracks the employees’ courses inside the organization. Your table should have the followings features:

               Name of the table: courses
               Columns:
                    CourseId (Primary Key)
                    CourseName (Cannot be null)
                    EmployeeId (Foreign Key - Refers to EmployeeId of employees table ) 
                    CoursePrice

      2. Insert at least 5 rows into the courses table. Your EmployeeId should contain the values of the EmployeeId column on the employees table. You’re free to choose any values for other columns (CourseId, CourseName, CoursePrice)
Delete the last row of your courses table.

Add a new column to your courses table named StartDate. The new column cannot be null.

Delete the CoursePrice column.

Delete the courses table. */


--ANSWERS

--1
SELECT TrackId,name,MAX(Milliseconds)
FROM tracks

--2
SELECT TrackId,name,MIN(Milliseconds)
FROM tracks

--3
SELECT TrackId,name,Bytes, AVG(Bytes) as General_Average
FROM tracks
WHERE Bytes> (SELECT AVG(Bytes) FROM tracks)
GROUP BY TrackId
ORDER BY Bytes DESC

--1
SELECT CustomerId,FirstName,LastName
FROM customers
WHERE SupportRepId IN (3,4)

--2
SELECT customers.CustomerId,customers.FirstName,customers.LastName
FROM customers
JOIN employees
ON customers.SupportRepId=employees.EmployeeId
WHERE employees.LastName IN ('Park', 'Peacock')

--1
CREATE TABLE courses(
CourseId INT PRIMARY KEY,
CourseName TEXT NOT NULL,
CoursePrice REAL,
EmployeeId INT,
FOREIGN KEY(EmployeeId)
REFERENCES employees(EmployeeId)
);

--2
INSERT INTO courses(CourseId,CourseName,CoursePrice,EmployeeId)
VALUES(1,"HTML",1170,1),
	  (2,"CSS",500,2),
	  (3,"PYTHON",1500,3),
	  (4,"JAVA",1350,4),
	  (5,"REACT",800,5);
	  
--3
DELETE FROM courses
WHERE CourseId=5

--4
ALTER TABLE courses
ADD COLUMN StartDate DATE NOT NULL DEFAULT "2021-01-01";

--5
ALTER TABLE courses
DROP COLUMN CoursePrice;

--6
DROP TABLE courses
