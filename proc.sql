--CREATE A TABLE CALLED TRAINEES
CREATE TABLE Trainees (id INT IDENTITY , fullName VARCHAR(100), dob DATE)

--DELETE THE TABLE NAME Trainees
DROP TABLE Trainees
--CREATE STORED PROCEDURE TO INSERT TRAINEE
CREATE PROCEDURE sp_insertTrainee(@fullname VARCHAR(100), @date DATE)
AS
BEGIN
INSERT INTO Trainees(fullName, dob) VALUES(@fullname, @date)
END

--INSERT NEW ROWS USING THE STORED PROCEDURE
EXECUTE sp_insertTrainee @fullname='Christian', @date='11/02/2005'
EXECUTE sp_insertTrainee @fullname='Joshua', @date='03/02/1998'
EXECUTE sp_insertTrainee @fullname='Elias', @date='01/06/1999'
EXECUTE sp_insertTrainee @fullname='John', @date='21/02/2000'

--DISPLAY TRAINEE TABLE
SELECT * FROM Trainees


--SYNTAX FOR ALTERING STORED PROCEDURE
CREATE OR ALTER PROCEDURE sp_getTrainees(@id INT)
--CREATE WILL CREATE A PROCEDURE IF 
--IT EXISTS, ALTER WILL MODIFY IT
AS
BEGIN
SELECT * FROM Trainees WHERE id=@id
END

--SYNTAX FOR CREATING STORED PROCEDURE
--CREATE PROCEDURE sp_getTrainees 
--AS
--BEGIN
--SELECT * FROM Trainees
--END

--DISPLAY TRAINEE BASED ON ID PASSED
EXEC sp_getTrainees 3

--CREATE A STORED PROCEDURE TO UPDATE TRAINEE TABLE
CREATE PROCEDURE sp_updateTrainee(@id INT, @fullName VARCHAR(100), @date DATE)
AS
BEGIN
UPDATE Trainees SET fullName=@fullname, dob=@date WHERE id=@id
END

EXEC sp_updateTrainee @id=1, @fullname='Ibrahim', @date='01/04/1990' 

--DISPLAY TRAINEE TABLE
SELECT * FROM Trainees


CREATE PROCEDURE sp_deleteTrainee(@id INT)
AS
BEGIN
DELETE FROM Trainees WHERE id=@id
END

EXEC sp_deleteTrainee 1

--DROP DELETES THE CREATED PROCEDURE
DROP PROC sp_deleteTrainee


CREATE TABLE Languages(id INT, userId INT, language VARCHAR(100)
 FOREIGN KEY(useriD) REFERENCES Trainees(id))

 CREATE PROC insertLanguage(@id INT, @userId INT, @lang VARCHAR(100))

 AS
 BEGIN

 INSERT INTO Languages(id, userId, language) VALUES (@id, @userId, @lang)
 END

 EXEC insertLanguage @id=1, @userId=1 @lang='JavaScript'
 EXEC insertLanguage @id=1, @userId=1 @lang='Python'


 CREATE PROC sp_selectUserLanguages
 AS
 BEGIN
 SELECT fullName, language FROM Trainees t LEFT JOIN Languages l ON t.id= l.userId
 END

 EXEC sp_selectUserLanguages