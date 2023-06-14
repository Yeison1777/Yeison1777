create database biblioteca;
use biblioteca;

/*drop database biblioteca;*/

create table cliente(
ci int unsigned not null,
nombre varchar(50)not null,
telefono int not null,
direccion varchar(70) not null,
primary key(ci)
);

create table libro(
id smallint unsigned not null,
nombre varchar(100)not null,
primary key(id)
);

create table area(
id tinyint unsigned not null,
nombre varchar(50)not null,
descripcion varchar(100)not null,
primary key(id)
);

create table libroArea(
idLibro smallint unsigned not null,
idArea tinyint unsigned not null,
primary key(idLibro,idArea),
foreign key(idLibro) references libro(id)
on update cascade
on delete cascade,
foreign key(idArea)references area (id)
on update cascade
on delete cascade
);

create table fichaPrestamo(
Nro int unsigned not null,
fechaI date not null,
fechaF date not null,
ciCliente int unsigned not null,
idLibro smallint unsigned not null,
primary key(nro),
foreign key (ciCliente) references cliente(ci)
on update cascade
on delete cascade,
foreign key (idLibro) references libro(id)
on update cascade
on delete cascade
);

/*Poblacion*/
insert into cliente values
(81902367,'Emanuel Gutierrez',8946733,'Alto San Pedro'),
(28470293,'Juancito Perezz',7867356,'Villa Warnes'),
(45823477,'Juanito Mamani',74912346,'lujan'),
(97602367,'Maria del Carmen',6546733,'Ramada'),
(74370204,'Jak Nivel',3456789,'cuchilla');
select*
from cliente;

/*Libro*/
insert into libro values
(1,'Matematica Aplicada'),
(2,'Introduccion a Pascal'),
(3,'Fisica Mecanica'),
(4,'Algebra Lineal'),
(5,'Aprendiendo Sql'),
(6,'Fnanzas Para La Empresa'),
(7,'Economia'),
(8,'Investigaciones'),
(9,'Calculo Diferencial'),
(10,'Java Para Ingenieros');

select*
from libro;

-- area
insert into area values
(1,'Matematicas','Libros de Matematicas'),
(2,'Fisica','Libros de Fisica'),
(3,'Finanzas','Libros de Finanzas'),
(4,'Programacion','Libros de Programacion');

select*
from area;

-- libroArea
insert into libroArea values
(1,1),
(2,4),
(3,2),
(4,1),
(5,4),
(6,3),
(7,3),
(7,1),
(8,1),
(8,3);
select*
from libroArea;

-- ficha prestamo
show columns from fichaPrestamo;
insert into fichaPrestamo values
(1,'2023-02-15','2023-02-20',81902367,1),
(2,'2023-02-17','2023-02-25',28470293,3),
(3,'2023-03-02','2023-03-10',45823477,2),
(4,'2023-03-03','2023-03-09',97602367,4),
(5,'2023-03-05','2023-03-05',74370204,5),
(6,'2023-03-10','2023-03-15',97602367,3),
(7,'2023-03-20','2023-03-25',28470293,1);
select*
from fichaPrestamo;
-- CONSULTAS
#1. Listar todos los libros que pertenecen al area de 'Matematicas'
select libro.*
from libro,libroArea, area
where libro.id=libroArea.idLibro and libroArea.idArea=area.id
and area.nombre='Matematicas';

#2. Listar todos clientes que llevaron libros
select distinct(cliente.ci),cliente.nombre
from cliente,fichaPrestamo
where cliente.ci=fichaPrestamo.ciCliente;

#3. Listar los clientes que se han llevado libros y que libros se han llevado
select cliente.ci,cliente.nombre,libro.nombre
from cliente,fichaPrestamo,libro
where cliente.ci=fichaPrestamo.ciCliente and fichaPrestamo.idLibro=libro.id;

#4. Mostrar los clientes cuyos nombres empiezan enj J
select *
from cliente
where nombre like 'J%';

#5. Mostarr los clientes que llevaron libro de matematica aplicada
select distinct (cliente.ci),cliente.nombre
from cliente,fichaPrestamo,libro
where cliente.ci=fichaPrestamo.ciCliente and fichaPrestamo.idLibro=libro.id
and libro.nombre='Matematica aplicada';

#6. Mostrar la CANTIDAD DE CLIENTES que llevaron el libro 'Fisica Mecanica'
select count(distinct(cliente.ci)) as cantidadDeCliente
from libro,fichaPrestamo,cliente
where libro.id=fichaPrestamo.idLibro and fichaPrestamo.ciCliente=cliente.ci
	and libro.nombre='Fisica Mecanica';
    
#7.  Mostrar los datos del primer cliente que se llevo el libro de 'Matematica Aplicada'
select cliente.*
from cliente,fichaPrestamo,libro
where cliente.ci=fichaPrestamo.ciCliente and fichaPrestamo.idLibro=libro.id
and libro.nombre='Matematica Aplicada' and fichaPrestamo.fechaI in
 (select min(fechaI)
 from fichaPrestamo,libro
where fichaPrestamo.idLibro=libro.id and libro.nombre='Matematica Aplicada');
														
#8. Mostrar el ultimo libro que se llevo 'Emanuel Gutierrez'
select libro.*
from libro, fichaPrestamo, cliente
where libro.id=fichaPrestamo.idLibro and fichaPrestamo.ciCliente=cliente.ci
and cliente.nombre='Emanuel Gutierrez' and fichaPrestamo.fechaI in(select max(fechaI)
					from fichaPrestamo,cliente
					where cliente.ci=fichaPrestamo.ciCliente and cliente.nombre='Emanuel Gutierrez');
-- fecha maxima
select max(fechaI)
from fichaPrestamo,cliente
where cliente.ci=fichaPrestamo.ciCliente and cliente.nombre='Emanuel Gutierrez';

#9. Mostrar la cantidada de libros distintos que se llevo cada cliente
select cliente.*,count(distinct(libro.id)) as cantidadDeLibrosSacados
from cliente,fichaPrestamo,libro
where cliente.ci=fichaPrestamo.ciCliente and fichaPrestamo.idLibro=libro.id
group by cliente.ci;

#10.Mostrar los libros que pertenecen a mas de una area
select distinct (libro.id),libro.nombre
from libro,libroArea,area
where libro.id=libroArea.idLibro and libroArea.idArea=area.id 
and libro.id in(select idLibro
from libroArea
group by idLibro having count(idArea)>1);

-- Me devuelve el id de los libros que pertenecen a mas de una area
select idLibro
from libroArea;

-- Mostrar los clientes que se lleven algun libro del area de programacion
select distinct(cliente.ci),cliente.nombre
from cliente,fichaPrestamo,libro,libroArea,area
where cliente.ci=fichaPrestamo.ciCliente and fichaPrestamo.idLibro=libro.id and libro.id = libroArea.idLibro
and libroArea.idArea=area.id and area.nombre='Programacion';

# Mostrar los clientes que mas veces han llevado un libro
select cliente.*
from cliente,fichaPretamo,libro
where cliente.ci=fichaPrestamo.ciCliente and fichaPrestamo.idLibro=libro.id and libro.id=libroArea.idLibro and libro.nombre;
