create database ArbolG;
use ArbolG;
Create table persona(
Id int not null primary key,
nombre varchar (40) not null,
sexo char not null,
idMadre integer,
idPadre integer,
foreign key(idPadre) references persona(id)
on update no action
on delete no action,
foreign key(idMadre) references persona (id)
on update no action
on delete no action
);
SELECT * FROM PERSONA;
delete from persona where id=3;
delete from persona where id=2;

insert into PERSONA values (1,'Joaquin Chumacero','m', null,null);
insert into PERSONA values (2,'Carla Aranibar','f',null,null);
insert into PERSONA values (3,'Pedro Chumacero Aranibar','m',1,2);
insert into PERSONA values (4,'Prisila Yupanqui','f',null,null);
insert into PERSONA values (5,'Joaquin Chumacero Yupanqui','m',3,4);
insert into PERSONA values (6,'Carla Aguilera','f',null,null);
insert into PERSONA values (7,'Joaquin Jr. Chumacero Aguilera','m',5,6);
insert into PERSONA values (8,'Carla Chumacero Aguilera','f',5,6);
insert into PERSONA values (9,'Fabiola Mendez','f',null,null);
insert into PERSONA values (10,'Fabian Chumacero Mendez','m',5,9);
select persona1.nombre,persona2.nombre as padre
FROM PERSONA persona1
inner join persona persona2 on persona2.nombre=persona1.nombre
where persona1.nombre='Carla Chumacero Aguilera' and persona1.idpadre=persona2.id;

update persona set sexo='m' where id=10; /*para actualizar datos*/

-- MOSTRAR TODOS LOS HIJOS DE JOAQUIN CHUMACERO YUPANQUI
SELECT HIJO.NOMBRE
FROM PERSONA PADRE, PERSONA HIJO
WHERE PADRE.ID=HIJO.IDPADRE AND PADRE.NOMBRE='Joaquin Chumacero Yupanqui' ;
/MOSTRAR EL ID Y EL NOMBRE DE JOAQUIN CHUMACERO YUPANQUI/
SELECT PADRE.ID,PADRE.NOMBRE AS PADRE
FROM PERSONA HIJO, PERSONA PADRE
WHERE HIJO.NOMBRE='Joaquin Chumacero Yupanqui' AND HIJO.IDPADRE=PADRE.ID;
/CON CANSULTAS ANIDADAS/
SELECT ID,NOMBRE
FROM PERSONA
WHERE ID IN (SELECT IDPADRE
			 FROM PERSONA
			 WHERE NOMBRE='Joaquin Chumacero Yupanqui');

/MOSTRAR EL ID Y NOMBRE DEL ABUELO PATERNO DE JOAQUIN CHUMACERO YUPANQUI/
SELECT ABUELO.ID,ABUELO.NOMBRE
FROM PERSONA HIJO,PERSONA PADRE,PERSONA ABUELO
WHERE HIJO.NOMBRE='Joaquin Chumacero Yupanqui' and HIJO.IDPADRE=PADRE.ID AND PADRE.IDPADRE=ABUELO.ID;
/FORMA ANIDADA/
SELECT ID,NOMBRE
FROM PERSONA
WHERE ID IN (SELECT IDPADRE
             FROM PERSONA
			WHERE ID IN (SELECT IDPADRE
                         FROM PERSONA
			             WHERE NOMBRE='Joaquin Chumacero Yupanqui')
			);