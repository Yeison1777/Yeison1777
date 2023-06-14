CREATE DATABASE MAESTROOFERTA;
USE MAESTROOFERTA;

CREATE TABLE SEMESTRE
(
PERIODO VARCHAR(10) NOT NULL PRIMARY KEY,
FECHAI DATE NOT NULL,
FECHAF DATE NOT NULL
);

CREATE TABLE MATERIA(
SIGLA VARCHAR(6) NOT NULL PRIMARY KEY,
NOMBRE VARCHAR(60) NOT NULL,
SEMESTRE TINYINT NOT NULL
);

CREATE TABLE DOCENTE
(
CODIGO INT NOT NULL PRIMARY KEY,
NOMBRE VARCHAR(60) NOT NULL,
SEXO CHAR NOT NULL
);

CREATE TABLE GRUPO
(
ID INTEGER NOT NULL PRIMARY KEY,
NOMBRE VARCHAR(2)NOT NULL,
CUPO TINYINT NOT NULL,
PERIODO VARCHAR(6) NOT NULL,
SIGLAMAT VARCHAR(6) NOT NULL,
FOREIGN KEY (PERIODO) REFERENCES SEMESTRE(PERIODO)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY(CODIGOC) REFERENCES DOCENTE(CODIGO)
ON UPDATE CASCADE
ON DELETE CASCADE,
FOREIGN KEY (SIGLAMAT) REFERENCES MATERIA(SIGLA)
ON UPDATE CASCADE
ON DELETE CASCADE
);

CREATE TABLE HORARIO
(
IDGRUPO INT NOT NULL,
ID TINYINT NOT NULL,
DIA VARCHAR (3)NOT NULL,
HORAI TIME NOT NULL,
HORAF TIME NOT NULL,
AULA VARCHAR(6)NOT NULL,
PRIMARY KEY(IDGRUPO,ID),
FOREIGN KEY (IDGRUPO)REFERENCES GRUPO(ID)
ON UPDATE CASCADE
ON DELETE CASCADE
);
SELECT*
FROM SEMESTRE;
INSERT INTO SEMESTRE VALUES(1-2023,20/03/2023,25/07/2023);
INSERT INTO SEMESTRE VALUES(2-2023,07/08/2023,15/12/2023);
INSERT INTO SEMESTRE VALUES(3-2023,02/01/2024,30/01/2024);

SELECT*
FROM MATERIA;
INSERT INTO MATERIA VALUES('INF110','INTRODUCCION A LA INFORMATICA',1);
INSERT INTO MATERIA VALUES('FIS100','FISICA I',1);
INSERT INTO MATERIA VALUES('INF120','PROGRAMACION I',2);
INSERT INTO MATERIA VALUES('FIS102','FISICA II',2);
INSERT INTO MATERIA VALUES('INF210','PROGRAMACION II',3);
INSERT INTO MATERIA VALUES('FIS200','FISICA III',3);
INSERT INTO MATERIA VALUES('INF220','ESTRUCTURA DE DATOS I',4);
INSERT INTO MATERIA VALUES('INF221','PROGRAMACION ENSAMBLADOR',4);
INSERT INTO MATERIA VALUES('INF310','ESTRUCTURA DE DATOS II',5);
INSERT INTO MATERIA VALUES('ADM300','ORGANIZACION Y METODOS',5);
INSERT INTO MATERIA VALUES('ADM320','FINANZAS PARA LA EMPRESA',6);
INSERT INTO MATERIA VALUES('INF322','BASE DE DATOS II',6);
INSERT INTO MATERIA VALUES('INF412','SISTEMAS DE INFORMACION II',7);
INSERT INTO MATERIA VALUES('INF413','SISTEMAS OPERATIVOS II',7);
INSERT INTO MATERIA VALUES('ECO449','PREPARACION Y EVALUACION DE PROYECTOS',8);
INSERT INTO MATERIA VALUES('INF423','REDES II',8);
INSERT INTO MATERIA VALUES('INF511','TALLER DE GRADO I',9);
INSERT INTO MATERIA VALUES('INF513','TECNOLOGIA WEB',9);
INSERT INTO MATERIA VALUES('GRL001','MODALIDAD DE GRADUACION',10);

SELECT*
FROM DOCENTE;
INSERT INTO DOCENTE VALUES(111,'JUAN CARLOS CONTRERAS','M');
INSERT INTO DOCENTE VALUES(222,'JORGE CHAU WONG','M');
INSERT INTO DOCENTE VALUES(333,'ALBERTO MOLLO','M');
INSERT INTO DOCENTE VALUES(444,'DANIEL ZEBALLOS','M');
INSERT INTO DOCENTE VALUES(555,'DUNNIA LOPEZ','F');
INSERT INTO DOCENTE VALUES(666,'IRMA ARGOTE','F');
INSERT INTO DOCENTE VALUES(777,'UBALDO PEREZ','M');
INSERT INTO DOCENTE VALUES(888,'EDWIN VARGAS','M');

SELECT*
FROM GRUPO;
INSERT INTO GRUPO VALUES(1000,'SA',100,1-2023,'INF110');


