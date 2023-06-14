create database laboratorio;
use laboratorio;
 create table software(
 id smallint unsigned not null, 
 nombre varchar(50) not null,
 primary key(id)
 );
 select*
 from software;
 
 create table centroComputo(
	 cod tinyint unsigned not null,
	 nombre varchar(50) not null,
	 direccion varchar(50) not null,
	 primary key(cod)
 );
  
  create table materia(
	  sigla varchar(10) not null,
	  nombre varchar(50) not null,
      primary key(sigla)
  );
  
  create table agenda(
  codCentro tinyint unsigned not null,
  SiglaMateria varchar(10) not null,
  primary key(codCentro, siglaMateria),
  foreign key(codCentro) references centroComputo(cod)
  on update cascade 
  on delete cascade,
  foreign key(siglaMateria) references materia(sigla)
  on update cascade
  on delete cascade);
  -- tabla horario
CREATE TABLE horario(
	codCentro tinyint unsigned not null,
	siglaMateria varchar(10) not null,
    id smallint unsigned not null,
    dia varchar(10) not null,
    horainicio time not null,
    horafin time not null,
    primary key(codCentro,siglaMateria,id),
    foreign key(codCentro) references agenda(codCentro)
    on delete cascade on update cascade,
    foreign key(siglaMateria) references agenda(siglaMateria)
    on delete cascade on update cascade
);

-- tabla computadora
CREATE TABLE computadora(
	cod smallint unsigned not null,
    marca varchar(30) not null,
    ram tinyint unsigned not null, -- se maneja en Gb
    almacenamiento tinyint unsigned not null, -- se maneja en Tb
	codCentro tinyint unsigned not null,
    primary key (cod),
    foreign key(codCentro) references centroComputo(cod)
    on delete cascade on update cascade
);

-- tabla alumno
CREATE TABLE alumno(
	registro int unsigned not null,
    nombre varchar(50) not null,
    correo varchar(50) not null,
    primary key(registro)
);

-- tabla boleta 
CREATE TABLE boleta(
	nro smallint unsigned not null,
    fecha date not null,
    horainicio time not null,
    horafin time not null,
    regAlumno int unsigned not null,
    codComputadora smallint unsigned not null,
    primary key(nro),
    foreign key(regAlumno) references alumno(registro)
    on update cascade on delete cascade,
    foreign key(codComputadora) references computadora(cod)
    on update cascade on delete cascade
);

-- table soft_compu
CREATE TABLE softCompu(
	idSoftware smallint unsigned not null,
    codComputadora smallint unsigned not null,
    version decimal(10,2) not null,
    primary key(idSoftware, codComputadora)
);

-- POBLAR LAS TABLAS
-- tabla materia
insert into materia values ('INF110','Introduccion a la informatica'),
('INF120','Programacion 1'),
('INF210','Programacion 2'),
('INF220','Estructura de datos 1'),
('INF310','Estructura de datos 2'),
('INF323','Sistemas Operativos 1'),
('INF413','Sistemas Operativos 2'),
('INF312','Bases de datos 1'),
('INF322','Bases de datos 2'),
('INF342','Sistemas de informacion 1');

select *
from materia;


-- tabla centro_computo
show columns from centroComputo;
insert into centroComputo (cod,nombre,direccion) values 
(1, 'Centro de Computo A','Modulo 236 44 - Modulos'),
(2, 'Centro de Computo B','Aula 155 - Campus'),
(3, 'Centro de Computo C','Aula 151 - Campus'),
(4, 'Centro de Computo D','Modulo 236 45 - Modulos'),
(5, 'Centro de Computo E','Modulo 236 42 - Modulos');

select *
from centroComputo;

-- tabla agenda
show columns from agenda;
insert into agenda(codCentro,siglaMateria) values (1,'INF110'),
(2,'INF110'),
(2,'INF120'),
(3,'INF120'),
(3,'INF210'),
(1,'INF220'),
(2,'INF220'),
(4,'INF220'),
(3,'INF310'),
(5,'INF310'),
(2,'INF312'),
(3,'INF312'),
(4,'INF322'),
(1,'INF323'),
(4,'INF323'),
(5,'INF323'),
(1,'INF342'),
(5,'INF342'),
(2,'INF413'),
(5,'INF413');

select * 
from agenda;

-- tabla horario
show columns from horario;
insert into horario(codCentro, siglaMateria, id , dia, horainicio, horafin) values 
(1,'INF110',1,'Martes','07:00:00','09:15:00'),
(2,'INF110',1,'Jueves','07:00:00','09:15:00'),
(2,'INF120',1,'Martes','07:00:00','09:15:00'),
(3,'INF120',1,'Jueves','07:00:00','09:15:00'),
(3,'INF210',1,'Lunes','10:00:00','11:30:00'),
(3,'INF210',2,'Miercoles','10:00:00','11:30:00'),
(3,'INF210',3,'Viernes','10:00:00','11:30:00'),
(1,'INF220',1,'Lunes','07:00:00','08:30:00'),
(2,'INF220',1,'Miercoles','07:00:00','08:30:00'),
(4,'INF220',1,'Viernes','07:00:00','08:30:00'),
(3,'INF310',1,'Martes','09:15:00','11:30:00'),
(5,'INF310',1,'Jueves','09:15:00','11:30:00'),
(4,'INF322',1,'Martes','18:15:00','20:30:00'),
(4,'INF322',2,'Jueves','18:15:00','20:30:00'),
(1,'INF323',1,'Lunes','08:30:00','10:00:00'),
(4,'INF323',1,'Miercoles','08:30:00','10:00:00'),
(5,'INF323',1,'Viernes','08:30:00','10:00:00');

select *
from horario;

-- tabla computadora
show columns from computadora;
insert into computadora (cod,marca,ram,almacenamiento,codCentro) values 
(1, 'hp',8,1,1),
(2, 'hp',8,1,1),
(3, 'hp',4,1,1),
(4, 'hp',8,1,1),
(5, 'hp',8,1,1),
(6, 'dell',4,1,2),
(7, 'dell',4,1,2),
(8, 'dell',4,1,2),
(9, 'hp',8,1,3),
(10, 'hp',8,1,3),
(11, 'hp',8,1,3),
(12, 'hp',8,1,3),
(13, 'hp',8,1,3),
(14, 'hp',8,1,3),
(15, 'hp',8,1,3),
(16, 'lenovo',8,1,4),
(17, 'lenovo',8,1,4),
(18, 'lenovo',8,1,4),
(19, 'lenovo',8,1,4),
(20, 'hp',8,1,5),
(21, 'hp',8,1,5),
(22, 'hp',8,1,5),
(23, 'hp',8,1,5),
(24, 'hp',8,1,5),
(25, 'hp',8,1,5),
(26, 'hp',8,1,5);
select *
from computadora;

-- tabla software
show columns from software; 
insert into software (id,nombre) values
(1,'SQL Server'),
(2,'Visual Studio'),
(3,'MySQL Workbench'),
(4,'NetBeans Apache'),
(5,'Embarcadero'),
(6,'VirtualBox');
select *
from software;

-- tabla soft_compu
show columns from softCompu;
insert into softCompu (idSoftware, codComputadora, version) values
-- Comp 1
(1,1,1.8),(2,1,1.0),(3,1,1.0),(4,1,1.0),(5,1,1.0),(6,1,1.0),
-- Comp 2
(1,2,2.8),(2,2,1.0),(3,2,1.0),(4,2,1.0),(5,2,1.0),(6,2,1.0),
-- Comp 3
(1,3,2.8),(2,3,1.0),(3,3,1.0),(4,3,1.0),(5,3,1.0),(6,3,1.0),
-- Comp 4
(1,4,2.8),(2,4,1.0),(3,4,1.0),(4,4,1.0),(5,4,1.0),(6,4,1.0),
-- Comp 5
(1,5,2.8),(2,5,1.0),(3,5,1.0),(4,5,1.0),(5,5,1.0),(6,5,1.0);

insert into softCompu (idSoftware, codComputadora, version) values
-- Comp 6
(1,6,1.8),(2,6,1.0),(5,6,1.0),(6,6,1.0),
-- Comp 7
(1,7,2.8),(2,7,1.0),(5,7,1.0),(6,7,1.0),
-- Comp 8
(1,8,2.8),(2,8,1.0),(5,8,1.0),(6,8,1.0);

insert into softCompu (idSoftware, codComputadora, version) values
-- Comp 9
(1,9,1.8),(2,9,1.0),(3,9,1.0),(4,9,1.0),(5,9,1.0),
-- Comp 10
(1,10,1.8),(2,10,1.0),(3,10,1.0),(4,10,1.0),(5,10,1.0),
-- Comp 11
(1,11,1.8),(2,11,1.0),(3,11,1.0),(4,11,1.0),(5,11,1.0),
-- Comp 12
(1,12,1.8),(2,12,1.0),(3,12,1.0),(4,12,1.0),(5,12,1.0),
-- Comp 13
(1,13,1.8),(2,13,1.0),(3,13,1.0),(4,13,1.0),(5,13,1.0),
-- Comp 14
(1,14,1.8),(2,14,1.0),(3,14,1.0),(4,14,1.0),(5,14,1.0),
-- Comp 15
(1,15,1.8),(2,15,1.0),(3,15,1.0),(4,15,1.0),(5,15,1.0);

insert into softCompu (idSoftware, codComputadora, version) values
-- Comp 16
(1,16,1.8),(2,16,1.0),(3,16,1.0),(4,16,1.0),(5,16,1.0),
-- Comp 17
(1,17,1.8),(2,17,1.0),(3,17,1.0),(4,17,1.0),(5,17,1.0),
-- Comp 18
(1,18,1.8),(2,18,1.0),(3,18,1.0),(4,18,1.0),(5,18,1.0),
-- Comp 19
(1,19,1.8),(2,19,1.0),(3,19,1.0),(4,19,1.0),(5,19,1.0);

insert into softCompu (idSoftware, codComputadora, version) values
-- Comp 20
(1,20,1.8),(2,20,1.0),(3,20,1.0),(4,20,1.0),(5,20,1.0),
-- Comp 21
(1,21,1.8),(2,21,1.0),(3,21,1.0),(4,21,1.0),(5,21,1.0),
-- Comp 22
(1,22,1.8),(2,22,1.0),(3,22,1.0),(4,22,1.0),(5,22,1.0),
-- Comp 23
(1,23,1.8),(2,23,1.0),(3,23,1.0),(4,23,1.0),(5,23,1.0),
-- Comp 24
(1,24,1.8),(2,24,1.0),(3,24,1.0),(4,24,1.0),(5,24,1.0),
-- Comp 25
(1,25,1.8),(2,25,1.0),(3,25,1.0),(4,25,1.0),(5,25,1.0),
-- Comp 26
(1,26,1.8),(2,26,1.0),(3,26,1.0),(4,26,1.0),(5,26,1.0);

select *
from softCompu;

-- tabla alumno 
show columns from alumno;
insert into alumno (registro,nombre,correo) values
(218111111,'Juan Perez','juan@gmail.com'),
(218111112,'Maria Gonzales','maria@hotmail.com'),
(218111113,'Pedro Lopez','pedro@gmail.com'),
(218111114,'Laura Ramiro','laura@ficct.uagrm.edu.bo'),
(218111115,'Carlos Herrera','carlos@hotmail.com'),
(218111116,'Ana Martinez','ana@gmail.com'),
(218111117,'Jose Rodruiguez','jose@ficct.uagrm.edu.bo'),
(218111118,'Luisa Torrez','luisa@gmail.com');
select *
from alumno;

-- tabla boleta
show columns from boleta;
insert into boleta (nro,fecha,horainicio,horafin,regAlumno,codComputadora) values 
(1,'2023-05-24','09:00:00','10:30:00',218111111,2);
insert into boleta (nro,fecha,horainicio,horafin,regAlumno,codComputadora) values 
(2,'2023-05-25','14:00:00','16:00:00',218111112,4),
(3,'2023-05-25','15:00:00','17:00:00',218111111,6),
(4,'2023-05-26','14:00:00','16:00:00',218111113,1),
(5,'2023-05-27','07:00:00','10:00:00',218111118,2),
(6,'2023-05-27','10:00:00','13:00:00',218111117,8),
(7,'2023-05-27','10:00:00','15:00:00',218111116,20),
(8,'2023-05-27','15:00:00','16:30:00',218111115,23),
(9,'2023-05-28','14:00:00','16:00:00',218111114,11),
(10,'2023-05-28','07:00:00','16:00:00',218111111,5);

select *
from boleta;
-- CONSULTAS.....
#1.Mostrar las computadoras del Centro de computo A
select computadora.*
from computadora,centroComputo
where centroComputo.cod=computadora.codCentro and centroComputo.nombre='Centro de Computo A';
#2. Mostrar las materias que pasan clases en el Centro de Computo E
select materia.*
from materia,agenda,centroComputo
where materia.sigla=agenda.siglaMateria and agenda.codCentro=centroComputo.cod
and centroComputo.nombre='Centro de computo E';

#3. Mostrar los softwares que tienen las computadoras de los centros donde se pasa la materia 'Estructura de datos ll'
select distinct(software.id), software.nombre
from materia,agenda,centroComputo, computadora,softCompu,software
where materia.sigla=agenda.siglaMateria and agenda.codCentro=centroComputo.cod
and centroComputo.cod=computadora.codCentro and computadora.cod=softCompu.codComputadora
 and softCompu.idSoftware= software.id and materia.nombre='Estructura de datos 2';

#4. Mostrar a aquellos alumnos que tienen correo electronico institucional
select alumno.*
from alumno
where correo like '%@ficct.uagrm.edu.bo';

#5. Mostrar aquellos centros de computos que se encuentren en los modulos
select *
from centroComputo
where direccion like '%Modulo%';

#6. Mostrar la cantidad de computadoras de cada centro de computo
select centroComputo.cod,centroComputo.nombre,count(Computadora.cod)
from centroComputo,computadora
Where centroComputo.cod=computadora.codCentro
group by centroComputo.cod;