CREATE DATABASE MYSAMPLE
USE MYSAMPLE

CREATE TABLE EMPLOYEE (ID INT,NAME CHAR(10),SAL INT,AGE INT)

SP_HELP EMPLOYEE

ALTER TABLE EMPLOYEE ALTER COLUMN NAME VARCHAR(50)
ALTER TABLE EMPLOYEE ALTER COLUMN MOBILE BIGINT

ALTER TABLE EMPLOYEE ADD MOBILE INT

SP_RENAME 'EMPLOYEE.NAME','ENAME'
SP_RENAME 'EMPLOYEE.ID' , 'EID'

ALTER TABLE EMPLOYEE DROP COLUMN AGE


 INSERT INTO EMPLOYEE VALUES(101,'SAI',10000,7893570611)
 INSERT INTO EMPLOYEE VALUES(101,'VARDHAN',20000,7893570622)
 INSERT INTO EMPLOYEE VALUES(101,'VENKATA',30000,7893570633)

 INSERT INTO EMPLOYEE(EID,ENAME,SAL) VALUES (102,'AKHIL',40000)

 UPDATE EMPLOYEE SET SAL = 1000 WHERE EID=101
 UPDATE EMPLOYEE SET MOBILE = 7893570644 WHERE MOBILE IS NULL

 UPDATE EMPLOYEE SET SAL = 20000

 DELETE FROM EMPLOYEE WHERE ENAME = 'VENKATA'
 
 
SELECT * FROM EMPLOYEE

DELETE FROM EMPLOYEE WHERE MOBILE IS NULL

DELETE FROM EMPLOYEE

DROP TABLE EMPLOYEE



SELECT * FROM EMP
INSERT INTO EMP VALUES('SAI',20000)
INSERT INTO EMP VALUES('VARDHAN',40000)
INSERT INTO EMP(ENAME,ESAL) VALUES('VENKAT',6000)

SELECT * FROM EMP1
CREATE TABLE EMP1(EID INT IDENTITY(100,5),ENAME VARCHAR(40),ESAL MONEY)
INSERT INTO EMP1 VALUES('SAI',20000)
INSERT INTO EMP1 VALUES('VARDHAN',40000)
INSERT INTO EMP1(ENAME,ESAL) VALUES('VENKAT',6000)

SELECT * FROM EMP
INSERT INTO EMP(EID,ENAME,ESAL) VALUES (4,'AKHIL',15000)
SET IDENTITY_INSERT EMP ON
INSERT INTO EMP(EID,ENAME,ESAL) VALUES (4,'AKHIL',15000)



--SET OPERATIONS--
CREATE TABLE EMP_HYD (EID INT ,ENAME VARCHAR(20), ESAL MONEY)
INSERT INTO EMP_HYD VALUES(101,'ADAMS',85000)
INSERT INTO EMP_HYD VALUES(102,'SCOTT',34000)
INSERT INTO EMP_HYD VALUES(103,'JAMES',120000)
INSERT INTO EMP_HYD VALUES(104,'WARNER',85000)

CREATE TABLE EMP_CHENNAI (EID INT ,ENAME VARCHAR(20), ESAL MONEY)
INSERT INTO EMP_CHENNAI VALUES(101,'ADAMS',85000)
INSERT INTO EMP_CHENNAI VALUES(105,'ALLEN',850000)
INSERT INTO EMP_CHENNAI VALUES(106,'MILLER',95000)

--1.UNION 
SELECT * FROM EMP_HYD
UNION
SELECT * FROM EMP_CHENNAI
--2.UNION ALL
SELECT * FROM EMP_HYD
UNION ALL
SELECT * FROM EMP_CHENNAI
--3.INTERSECT
SELECT * FROM EMP_HYD
INTERSECT
SELECT * FROM EMP_CHENNAI
--4.EXCEPT
SELECT * FROM EMP_HYD
EXCEPT
SELECT * FROM EMP_CHENNAI


--PRIMARY KEY AND FOREIGN KEY
--STEP 1
CREATE TABLE DEPT(DEPTNO INT PRIMARY KEY,DNAME VARCHAR(20),LOCATION VARCHAR(20))
(PARENT)
--STEP 2
INSERT DEPT VALUES (10,'DBA','HYD'),(20,'SAP','MUMBAI'),(30,'HR','PUNE')

SELECT * FROM DEPT

--STEP 3
CREATE TABLE EMPLY(EMPID INT,ENAME VARCHAR(20),SALARY MONEY,DEPTNO INT FOREIGN KEY REFERENCES DEPT(DEPTNO))
(CHILD)
--TEST
INSERT EMPLY VALUES(101,'ADAMS',5500,10)
INSERT EMPLY VALUES(102,'SAI',3400,40)
INSERT EMPLY VALUES(102,'ADAM',5500,20)

SELECT * FROM DEPT
SELECT * FROM EMPLY

--JOIN CONCEPTS
CREATE TABLE STUDENT(STID INT,SNAME VARCHAR(20),SMALLID VARCHAR(20),COURSEID INT)

INSERT STUDENT VALUES(101,'ADAMS','ADD@GMAIL.COM',10),(102,'JAMES','JAY@GMAIL.COM',20),(103,'SCOTT','SCOT@YAHOO',30)

CREATE TABLE COURSE(COURSEID INT,CNAME VARCHAR(20),CFEE DECIMAL(6,2))

INSERT COURSE VALUES(10,'SQL SERVER',1200),(20,'SQL DBA',1500),(40,'MSQL',3200),(50,'SAP',2400)



--INNER JOIN : -
SELECT * FROM STUDENT INNER JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID

--OUTER JOIN : -

--LEFT OUTER JOIN : -
SELECT * FROM STUDENT S LEFT OUTER JOIN COURSE C ON S.COURSEID = C.COURSEID
--RIGHT OUTER JOIN  : -
SELECT * FROM STUDENT S RIGHT OUTER JOIN COURSE C ON S.COURSEID = C.COURSEID
--FULL OUTER JOIN : -
SELECT * FROM STUDENT S FULL OUTER JOIN COURSE C ON S.COURSEID = C.COURSEID

--CROSS JOIN
SELECT * FROM STUDENT CROSS JOIN COURSE

--EQUI JOIN
SELECT * FROM STUDENT,COURSE WHERE STUDENT.COURSEID = COURSE.COURSEID
SELECT * FROM STUDENT JOIN COURSE ON STUDENT.COURSEID = COURSE.COURSEID

--NON EQUI JOIN
SELECT * FROM STUDENT
SELECT * FROM COURSE
SELECT * FROM STUDENT,COURSE WHERE STUDENT.COURSEID > COURSE.COURSEID

--SELF JOIN

CREATE TABLE EMPDETAILS (EID INT,ENAME VARCHAR(20),ESAL INT,AGE INT)
INSERT EMPDETAILS VALUES (101,'AA',10000,20),(102,'BB',10000,21),(103,'CC',20000,23),(104,'DD',23000,24)
SELECT * FROM EMPDETAILS

SELECT E1.EID,E1.ENAME,E1.ESAL,E1.AGE FROM EMPDETAILS E1, EMPDETAILS E2 WHERE E1.ESAL = E2.ESAL AND E2.ENAME = 'AA'


--CLAUSES : 
--GROUP BY CLAUSE  : -
CREATE TABLE EMPLYDETAILS (ID INT,NAME VARCHAR(20),JOB VARCHAR(20))
INSERT EMPLYDETAILS VALUES (101,'A','CLERK') , (102,'B','MANAGER') , (103,'C','HR') , (104,'D','CLERK') , (105,'E','HR') , (106,'F','MANAGER'),
					(107,'G','CLERK') , (108,'H','PRESIDENT') , (109,'I','HR') , (110,'J','HR') , (111,'K','CLERK') , (112,'L','PRESIDENT')
ALTER TABLE EMPLYDETAILS ADD SALARY INT
ALTER TABLE EMPLYDETAILS ADD DEPT INT
SELECT * FROM EMPLYDETAILS
UPDATE EMPLYDETAILS SET SALARY = 10000 WHERE SALARY IS NULL AND JOB = 'CLERK'
UPDATE EMPLYDETAILS SET SALARY = 20000 WHERE SALARY IS NULL AND JOB = 'MANAGER'
UPDATE EMPLYDETAILS SET SALARY = 30000 WHERE SALARY IS NULL AND JOB = 'HR'
UPDATE EMPLYDETAILS SET SALARY = 50000 WHERE SALARY IS NULL AND JOB = 'PRESIDENT'

UPDATE EMPLYDETAILS SET DEPT = 10 WHERE DEPT IS NULL AND JOB = 'CLERK'
UPDATE EMPLYDETAILS SET DEPT = 20 WHERE DEPT IS NULL AND JOB = 'MANAGER'
UPDATE EMPLYDETAILS SET DEPT = 30 WHERE DEPT IS NULL AND JOB = 'HR'
UPDATE EMPLYDETAILS SET DEPT = 30 WHERE DEPT IS NULL AND JOB = 'PRESIDENT'
--QUERY IS NUMBER OF EMPLOYESS WORKING IN PARTICULAR JOB(SINGLE COLUMN)
SELECT JOB,COUNT(*) CNT FROM EMPLYDETAILS GROUP BY JOB

--QUERY IS TO FIND THE TOTAL SALARY OF THE SPECIFIC JOBS(SINGLE COLUMN)
SELECT JOB,SUM(SALARY) TOTAL FROM EMPLYDETAILS GROUP BY JOB

--QUERY TO FIND MAX SALARY, MINIMUM SALARY, AVERAGE SAKARY OF THE JOBS(SINGLE COLUMN)
SELECT JOB,MAX(SALARY) MAXSAL , MIN(SALARY) MINSAL , AVG(SALARY) AVGSAL FROM EMPLYDETAILS GROUP BY JOB

--QUERY TO FIND THAT HOW MANY PEOPLE ARE WORKING IN EACH JOB ALONG WITH DEPT NUMBER(MULTIPLE COLUMN)
SELECT JOB,COUNT(*) CNT,DEPT FROM EMPLYDETAILS GROUP BY JOB,DEPT


--HAVING CLAUSE : -
--QUERY TO FIND THE COUNT OF JOBS LESS THAN 4
SELECT JOB,COUNT(*) CNT FROM EMPLYDETAILS GROUP BY JOB HAVING COUNT(*) < 4

--QUERY IS TO FIND THE TOTAL SALARY OF THE SPECIFIC JOBS HAVING LESS THAN 30000
SELECT JOB,SUM(SALARY) TOTAL FROM EMPLYDETAILS GROUP BY JOB HAVING SUM(SALARY) > 40000

select * from EMPLYDETAILS

--ROLLUP AND CUBE :-

SELECT * FROM EMPLYDETAILS
--ROLLUP:-
SELECT JOB,COUNT(*) CNT FROM EMPLYDETAILS GROUP BY ROLLUP(JOB)
--CUBE :-
SELECT JOB,COUNT(*) CNT,DEPT FROM EMPLYDETAILS GROUP BY CUBE(JOB,DEPT)













--TRANSACTIONAL CONTROL LANGUAGE :-
CREATE TABLE BRANCH(BCODE VARCHAR(20),BNAME VARCHAR(20), LOCATION VARCHAR(50))
ALTER TABLE BRANCH ALTER COLUMN BCODE INT

--TESTING : -
INSERT INTO BRANCH VALUES(1021,'SBI','HYD')
UPDATE BRANCH SET LOCATION = 'MUMBAI' WHERE BCODE = 1021
DELETE FROM BRANCH WHERE BCODE = 1021
--ALL THE OPERATIONS DONE ABOVE ARE PERMENENTLY EXECUTED
--SO USER DOES NOT HAVE A CHANCE TO ALTER THOSE DATA
-->BY DEFAULT THE DML OPERATIONS (INSERT,UPDATE,DELETE) ARE
-- AUTO COMMIT OPERATIONS
--INSERT :-
BEGIN TRANSACTION 
INSERT BRANCH VALUES(1022,'CANARA','MUMBAI')
INSERT INTO BRANCH VALUES(1021,'SBI','HYD')
INSERT INTO BRANCH VALUES (1022,'CANARA','HYD')
COMMIT

BEGIN TRANSACTION
ROLLBACK
SELECT * FROM BRANCH

--UPDATE :-
BEGIN TRANSACTION
UPDATE BRANCH SET LOCATION = 'MUMBAI' WHERE BCODE = 1021
SELECT * FROM BRANCH
BEGIN TRANSACTION
ROLLBACK
SELECT * FROM BRANCH
	--COMMIT
	BEGIN TRANSACTION
	UPDATE BRANCH SET BCODE = 1023 WHERE BNAME = 'SBI' AND LOCATION = 'HYD'
	UPDATE BRANCH SET BCODE = 1024 WHERE BNAME = 'CANARA' AND LOCATION = 'MUMBAI'

	COMMIT
	SELECT * FROM BRANCH
	BEGIN TRANSACTION
	ROLLBACK

--DELETE :-
BEGIN TRANSACTION
DELETE FROM BRANCH WHERE BCODE = 1021
SELECT * FROM BRANCH
BEGIN TRANSACTION
ROLLBACK
SELECT * FROM BRANCH
	--COMMIT
	BEGIN TRANSACTION
    DELETE FROM BRANCH WHERE BCODE = 1021
	COMMIT
    SELECT * FROM BRANCH
    BEGIN TRANSACTION
    ROLLBACK
    SELECT * FROM BRANCH

--SAVEPOINT:-
BEGIN TRANSACTION
DELETE FROM BRANCH WHERE BCODE = 1021
DELETE FROM BRANCH WHERE BCODE = 1022
SAVE TRANSACTION S1
DELETE FROM BRANCH WHERE BCODE = 1023
SELECT * FROM BRANCH
BEGIN TRANSACTION
ROLLBACK TRANSACTION S1
SELECT * FROM BRANCH

SELECT * FROM EMPLYDETAILS


--SUB BLOCKS --
--TWO TYPES
	--STORED PROCEDURE
	--STORED FUNCTIONS
--STORED PROCEDURES
	--WITHOUT PARAMETERS
	--EXAMPLE : -
		CREATE PROCEDURE P1 
		AS
		BEGIN
			SELECT * FROM EMPLOYEE1
		END
		EXECUTE P1
	--WITH PARAMETERS
	--EXAMPLE : -
		CREATE PROCEDURE PP1 (@SL INT)
		AS
		BEGIN
			SELECT ENAME FROM EMPLOYEE1 WHERE SAL > @SL
		END

		EXEC PP1 50000 
--STORED FUNCTIONS
	--SCALAR VALUED FUNCTION
	--EXAMPLE :-
		CREATE FUNCTION FRS(@EID INT)
		RETURNS MONEY
		AS
		BEGIN
			DECLARE @BASIC MONEY,@HRA MONEY,@DA MONEY,@PF MONEY,@GROSS MONEY
		
			SELECT @BASIC = SAL FROM EMPLOYEE1 WHERE EID = @EID
			SET @HRA = @BASIC * 0.1
			SET @DA = @BASIC * 0.2
			SET @PF = @BASIC * 0.1
			SET @GROSS = @BASIC + @HRA + @DA + @PF
			RETURN @GROSS
		END

		SELECT DBO.FRS(102) GROSSSALARY
	--TABLE VALUED FUNCTION
	--EXAMPLE :-
		CREATE FUNCTION F2 (@DEPTNAME VARCHAR(40))
		RETURNS TABLE
		AS
		RETURN (SELECT * FROM EMPLOYEE1 WHERE DEPTNAME = @DEPTNAME) 

		SELECT * FROM F2('.NET')
		
--RANKING CLASUES :-
SELECT * FROM EMPLOYEE1
	--ROW_NUMBER():

		SELECT ENAME,SAL,ROW_NUMBER()
		OVER(
			ORDER BY SAL DESC 
		) AS RNK FROM EMPLOYEE1

		SELECT ENAME,SAL,ROW_NUMBER()
		OVER(
			PARTITION BY DEPTNO
			ORDER BY SAL DESC 
		) AS RNK FROM EMPLOYEE1

	--RANK() :
		SELECT ENAME,SAL,RANK()
		OVER(
			ORDER BY SAL DESC 
		) AS RNK FROM EMPLOYEE1

		SELECT ENAME,SAL,RANK()
		OVER(
			PARTITION BY DEPTNO
			ORDER BY SAL DESC 
		) AS RNK FROM EMPLOYEE1

	--DENSE_RANK() :-
		SELECT ENAME,SAL,DENSE_RANK()
		OVER(
			ORDER BY SAL DESC 
		) AS RNK FROM EMPLOYEE1

		SELECT ENAME,SAL,DENSE_RANK()
		OVER(
			PARTITION BY DEPTNO
			ORDER BY SAL DESC 
		) AS RNK FROM EMPLOYEE1

--SUB QUERIES :-
	--NON CORELATED SUB QUERY :-
		--SINGLE SUB QUERY
		SELECT * FROM EMPLOYEE1
		SELECT * FROM EMPLOYEE1 WHERE SAL = (SELECT MAX(SAL) FROM EMPLOYEE1)

		--MULTI SUB QUERY : -
		SELECT * FROM EMPLOYEE1
		SELECT * FROM EMPLOYEE1 WHERE DEPTNAME IN 
		(SELECT DEPTNAME FROM EMPLOYEE1 WHERE ENAME = 'A' OR ENAME = 'B')

				--(or)

		SELECT * FROM EMPLOYEE1
		SELECT * FROM EMPLOYEE1 WHERE DEPTNAME IN 
		(SELECT DEPTNAME FROM EMPLOYEE1 WHERE ENAME IN ('A','B')	)



	--CORELATED SUB QUERY :-

SELECT * FROM EMPLOYEE1

select CURRENT_USER