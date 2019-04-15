--Exercicio 6.2

--Create tables 


CREATE SCHEMA Company5_1;
GO

CREATE TABLE Company5_1.Employee(
	Fname		VARCHAR(15) NOT NULL,
	Minit		CHAR,
	Lname		VARCHAR(15) NOT NULL,
	Ssn			CHAR(9)		NOT NULL,
	Bdate		DATE,
	[Address]	VARCHAR(30),
	Sex			CHAR,
	Salary		DECIMAL(10,2),
	Super_ssn	CHAR(9),
	Dno			INT,
	PRIMARY KEY (Ssn),
	FOREIGN KEY (Super_ssn) REFERENCES Company5_1.Employee(Ssn),
);


CREATE TABLE Company5_1.Department(
	Dname	VARCHAR(15) NOT NULL,
	Dnumber	INT			NOT NULL,
	Mgr_ssn	CHAR(9),
	Mgr_start_date	DATE,
	PRIMARY KEY(Dnumber),
	UNIQUE (Dname),
	FOREIGN KEY (Mgr_ssn) REFERENCES Company5_1.Employee (Ssn)
);

ALTER TABLE Company5_1.Employee
ADD CONSTRAINT EMPDEPTFK FOREIGN KEY (Dno) REFERENCES Company5_1.Department(Dnumber);

CREATE TABLE Company5_1.[Dependent] (
	Essn			CHAR(9)		NOT NULL,
	Dependent_name	VARCHAR(15) NOT NULL,
	Sex				CHAR,
	Bdate			DATE,
	Relationship	VARCHAR(8),
	PRIMARY KEY (Essn, Dependent_name),
	FOREIGN KEY (Essn) REFERENCES Company5_1.Employee(Ssn)
);

CREATE TABLE Company5_1.Dept_Location(
	Dnumber		INT			NOT NULL,
	Dlocation	VARCHAR(15)	NOT NULL,
	PRIMARY KEY (Dnumber, Dlocation),
	FOREIGN KEY (Dnumber) REFERENCES Company5_1.Department(Dnumber)
);

CREATE TABLE Company5_1.Project(
	Pname		VARCHAR(15)	NOT NULL,
	Pnumber		INT			NOT NULL,
	Plocation	VARCHAR(15),
	Dnum		INT			NOT NULL,
	PRIMARY KEY (Pnumber),
	UNIQUE (Pname),
	FOREIGN KEY (Dnum) REFERENCES Company5_1.Department(Dnumber)
);

CREATE TABLE Company5_1.works_on(
	Essn	CHAR(9)			NOT NULL,
	Pno		INT				NOT NULL,
	[Hours]	DECIMAL(3,1)	NOT NULL,
	PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Essn) REFERENCES Company5_1.Employee(Ssn),
	FOREIGN KEY (Pno) REFERENCES Company5_1.Project(Pnumber)
);
-----------------------------------------------------------------------
--Insert data into tables 

INSERT INTO Company5_1.EMPLOYEE VALUES
('Carlos','D','Gomes','21312332' ,'2000-01-01','Rua XPTO','M',1200.00,NULL,3),
('Juliana','A','Amaral','321233765','1980-08-11','Rua BZZZZ','F',1350.00,NULL,1),
('Maria','I','Pereira','342343434','2001-05-01','Rua JANOTA','F',1250.00,21312332,3),
('Joao','G','Costa','41124234' ,'2001-01-01','Rua YGZ','M',1300.00,21312332,2),
('Ana','L','Silva','12652121' ,'1990-03-03','Rua ZIG ZAG','F',1400.00,21312332,2),
('Paula','A','Sousa','183623612','2001-08-11','Rua da FRENTE','F',1450.00,NULL,2);


INSERT INTO Company5_1.DEPARTMENT VALUES
('RecursosHumanos',4,'12652121','2014-04-02'),
('Investigacao',1,'21312332' ,'2010-08-02'),
('Desporto',5,NULL,NULL),
('Comercial',2,'321233765','2013-05-16'),
('Logistica',3,'41124234' ,'2013-05-16');

INSERT INTO Company5_1.[DEPENDENT] VALUES
('21312332 ','Joana Costa','F','2008-04-01', 'Filho'),
('21312332 ','Maria Costa','F','1990-10-05', 'Neto'),
('21312332 ','Rui Costa','M','2000-08-04','Neto'),
('321233765','Filho Lindo','M','2001-02-22','Filho'),
('342343434','Rosa Lima','F','2006-03-11','Filho'),
('41124234 ','Ana Sousa','F','2007-04-13','Neto'),
('41124234 ','Gaspar Pinto','M','2006-02-08','Sobrinho');

INSERT INTO Company5_1.DEPT_LOCATION VALUES
(2,'AVEIRO'),
(3,'COIMBRA');

INSERT INTO Company5_1.PROJECT VALUES
('Aveiro Digital', 1, 'Aveiro', 3),
('BD Open Day', 2, 'Espinho', 2),
('Dicoogle', 3, 'Aveiro', 4),
('GOPACS', 4, 'Aveiro', 3);

INSERT INTO Company5_1.WORKS_ON VALUES
('183623612',1,20.0),
('183623612',3,10.0),
('21312332 ',1,20.0),
('321233765',1,25.0),
('342343434',1,20.0),
('342343434',4,25.0),
('41124234 ',2,20.0),
('41124234 ',3,30.0);


-----------------------------------------------------------------------
--Exercice C 

--6.2.a)
select Pname, Ssn, Fname, Lname from Company5_1.Project join Company5_1.works_on ON Pnumber=Pno join Company5_1.employee on Essn=Ssn;
------------------------
--6.2.b)
select * from Company5_1.Employee inner join(select Ssn as CarlosSsn from Company5_1.Employee  where Fname='Carlos' and Minit='D' and Lname='Gomes')as coisas on Super_ssn = coisas.CarlosSsn;
------------------------
--6.2.c)
select Pname, sum(Hours) as totalHoursWeek from Company5_1.project inner join Company5_1.works_on on Pnumber=Pno inner join Company5_1.employee on Essn=Ssn group by Pname;
------------------------
--6.2.d)
select Fname, Lname from Company5_1.employee inner join Company5_1.department on Dno=Dnumber inner join Company5_1.project on Dnumber=Dnum inner join Company5_1.works_on on Pnumber=Pno where Dno=3 and Hours>20 and Pname='Aveiro Digital';
------------------------
--6.2.e)
select Fname, Lname, Pno from Company5_1.employee left join Company5_1.works_on on Ssn=Essn where Pno is null
------------------------
--6.2.f)
select Dname, avg(Salary) as salary from Company5_1.employee join Company5_1.department on Dno=Dnumber where Sex='F' group by Dname;
------------------------
--6.2.g)
select Fname, Lname, count(Essn) as Num_Dependentes from Company5_1.employee join Company5_1.Dependent on Ssn=Essn group by Fname,Lname having Num_Dependentes>2;
------------------------
--6.2.h)
select Fname, Lname, count(Essn) as Num_Dependentes from Company5_1.employee  join Company5_1.department on Ssn=Mgr_ssn left join Company5_1.Dependent on Ssn=Essn where Essn is null group by Fname, Lname;
------------------------
--6.2.i)
select Fname, Lname, Address from Company5_1.employee join Company5_1.works_on on Ssn=Essn join Company5_1.project on Pno=Pnumber join Company5_1.department on Dnum=department.Dnumber join Company5_1.dept_location on department.Dnumber=dept_location.Dnumber where Plocation='Aveiro' and Dlocation!='Aveiro' group by Fname, Lname, Address;

