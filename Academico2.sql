CREATE DATABASE ACADEMICO2;
USE ACADEMICO2;

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

select * from alumno ;
insert into ALUMNO values (111,'Joaquin Chumacero','m','s',71020304,'Urb. Las Lomas','187-3');
insert into ALUMNO values (222,'Saturdino Mamani','m','c',null,'Calle Landivar 200','187-4');
insert into ALUMNO values (333,'Fabiola Mendez','f','s',755520304,'UAv. Los Montes','187-3');
insert into ALUMNO values (444,'Carlos Camacho','m','s',7156770,null,'187-3');
insert into ALUMNO values (555,'Patricia Aguilera','f','s',71739743,'Urb. Las Lomas','187-4');

select * from carrera;

-- Mostrar alumnos que estudian la carrera d iingenieria informatica
select registro,alumno.nombre
from alumno,carrera
where codigoc=codigo and carrera.nombre='Ingenieria informatica';
-- Sistemas
select registro,alumno.nombre
from alumno,carrera
where codigoc=codigo and carrera.nombre='Ingenieria en Sistemas';

select codigo
from carrera
where nombre='Ingenieria informatica';

-- Mostrar alumnos varones de la carrera de ing informatica
select registro,alumno.nombre
from alumno,carrera
where codigoc=codigo and carrera.nombre='Ingenieria Informatica' and sexo='m';
select registro,nombre
from alumno
where sexo='m' and codigoc in (select codigo 
								from carrera
                                where nombre='Ingenieria Informatica');
select alumno.registro,alumno.nombre
from alumno,carrera
where codigo=codigoc and carrera.nombre='Ingenieria en Sistemas' and sexo='m';

-- Mostrar los alumnos de la carrera ingenieria informatica ordenados de manera ascendente
select alumno.registro,alumno.nombre
from alumno,carrera
where codigo=codigoc and carrera.nombre='Ingenieria informatica'
order by alumno.registro asc;

-- Cambiar codigo de la carrera ing Informatica 187-3 por 187-6
update carrera set 
codigo='187-6' where
codigo='187-3';

-- Eliminar la carrera ing en Sistemas
delete from carrera
where codigo='187-4';
select* from carrera;
-- Mostrar por cada carrera la cantidad de alumnos
select codigoc,carrera.nombre, count(*) as cantidad
from alumno,carrera
where codigo=codigoc
group by codigoc;

-- Mostrar la cantidad de alumnos por sexo
select alumno.sexo,count(*) as cantidad
from alumno
group by sexo;