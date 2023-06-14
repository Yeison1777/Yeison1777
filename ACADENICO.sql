CREATE DATABASE ACADEMICO;
USE ACADEMICO;
CREATE TABLE CARRERA
(
	CODIGO VARCHAR (5) NOT NULL PRIMARY KEY,
    NOMBRE VARCHAR(50) NOT NULL
);

CREATE TABLE ALUMNO
(
Registro integer not null primary key,
    Nombre varchar(60) not null,
    Sexo char not null,
    EstadoCivil char not null,
    Telefono integer,
    Direccion varchar(50),
    Codigoc varchar (5) not null,  /* tiene que ser el mismo tipo de dato de donde viene */
    foreign key (Codigoc) references carrera(Codigo)
      on update cascade     /* si se hace una cambio en una tabla tiene que cambiar en la otra automaticamente */
      on delete cascade    /* si se elimina algun codigo se tiene que eliminar los datos que sten relacionados con el */
);
select * from carrera;
insert into carrera values ('187-3','Ingenieria Informatica') ;
insert into carrera values ('187-4','Ingenieria en Sistemas') ;

SELECT*
FROM ALUMNO;

INSERT INTO ALUMNO VALUES(111,'JOAQUIN CHUMACERO','M','S',7102030,'URB. LAS LOMAS');
INSERT INTO ALUMNO VALUES(222,'SATURNINO MAMANI','M','C',NULL,'CALLE LANDIVAR 200');
INSERT INTO ALUMNO VALUES(333,'FABIOLA MENDEZ','F','S',7212134,'AV. LOS MONTES');
INSERT INTO ALUMNO VALUES(444,'CARLOS CAMACHO','M','S',7345678,NULL);
INSERT INTO ALUMNO VALUES(555,'PATRICIA AGUILERA','F','C',3568956,'URB. LAS LOMAS');

/*MOSTRAR LOS ALUMNOS VARONES*/
SELECT*
FROM ALUMNO
WHERE SEXO='M';

/*MOSTRAR LAS ALIMNAS MUJERES*/
SELECT*
FROM ALUMNO
WHERE SEXO='F';

/*MOSTRAR EL REGISTRO, NOMBRE Y ESTADO CIVIL DE LOS ALUMNOS VARONES*/
SELECT REGISTRO,NOMBRE,ESTADOCIVIL
FROM ALUMNO
WHERE SEXO='M';

/*MOSTRAR EL REGISTRO, NOMBRE Y ESTADO CIVIL DE LAS ALUMNAS MUJERES*/
SELECT REGISTRO,NOMBRE,ESTADOCIVIL
FROM ALUMNO
WHERE SEXO='F';

/*MOSTRAR ALUMNOS SOLTEROS VARONES*/
SELECT*
FROM ALUMNO
WHERE SEXO='M' AND ESTADOCIVIL='S';

/*MOSTRAR TODOS LOS ALUMNOS QUE NO TIENEN TELEFONO*/
SELECT*
FROM ALUMNO
WHERE TELEFONO IS NULL;

/*MOSTRAR TODOS LOS ALUMNOS QUE NO TIENEN DIRECCION*/
SELECT*
FROM ALUMNO
WHERE DIRECCION IS NULL;

/*MOSTAR TODOS LOS ALUMNOS QUE SU NOMBRE EMPIEZA CON C%(PRINCIPIO), %C%(MEDIO), %C(FINAL)*/
SELECT *
FROM ALUMNO
WHERE NOMBRE LIKE 'C%';

/*MOSTRAR TODOS LOS ALUMNOS QUE VIVEN EN URB. LAS LOMAS*/
SELECT*
FROM ALUMNO
WHERE DIRECCION LIKE 'URB. LAS LOMAS';
-- Mostrar los alumnos que estudian Ingenieria Informatica
select*
from alumno
where Registro like '333';









