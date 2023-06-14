-- CREAR LA BASE

create database modelo1;
use modelo1;

-- area
create table area(
	id tinyint unsigned not null,
    descripcion varchar(30) not null,
    primary key(id)
);

-- lector
create table lector(
	ci int unsigned not null,
    nombre varchar(50) not null,
    sexo char(1) not null,
    telefono int unsigned not null,
    primary key(ci)
);

-- libro
create table libro(
	codigo varchar(5) not null,
    titulo varchar(50) not null,
    aco smallint unsigned not null,
    idArea tinyint unsigned not null,
	primary key(codigo),
    foreign key(idArea) references area(id)
    on update cascade on delete cascade
);

-- Prestamo
create table prestamo(
	nro int unsigned not null,
    fecha date not null,
    dias tinyint unsigned not null,
    monto smallint unsigned not null,
    ciLector int unsigned not null,
	primary key(nro),
    foreign key(ciLector) references lector(ci)
    on update cascade on delete cascade
);


-- Detalle prestamo
create table detallePrestamo(
	nrop int unsigned not null,
    codigol varchar(5) not null,
    primary key(nrop,codigol),
    foreign key(nrop) references prestamo(nro)
    on update cascade on delete cascade,
    foreign key(codigol) references libro(codigo)
    on update cascade on delete cascade
);

show tables;

-- POBLAR
-- area
show columns from area;
insert into area (id,descripcion) values
(1,'Matematicas'),
(2,'Computacion'),
(3,'Fisica');
 
-- lector
show columns from lector;
insert into lector (ci,nombre,sexo,telefono) values
(101,'Joaquin Chumacero Yupanqui','m',3567587),
(102,'Patricia Aguilera Candia','f',7098899),
(103,'Saturnino Mamani Rodriguez','m',5677766);

-- libro
show columns from libro;
insert into libro (codigo,titulo,año,idArea) values
('L01','Mamatematica Aplicada',2010,1),
('L02','Algoritmos y programas',2010,2),
('L03','Excel Avanzado',2007,2),
('L04','Introduccion a la fisica',2010,3),
('L05','Mamatematica 1',2009,1);


-- prestamo
show columns from prestamo;
insert into prestamo(nro,fecha,dias,monto,ciLector) values
(1,'2011-05-15',2,10,103),
(2,'2011-05-17',2,20,101),
(3,'2011-05-17',1,15,102),
(4,'2011-05-19',2,20,103);

-- detalle prestamo
show columns from detallePrestamo;
insert into detallePrestamo (nrop,codigol) values
(1,'L01'),
(2,'L02'),
(2,'L03'),
(3,'L01'),
(3,'L03'),
(4,'L03');
-- CONSULTAS
-- MOSTRAR TODOS LOS LIBROS PRESTADOS DEL AREA DE COMPUTACION MAYORES AL ANO 2009 A 'SATURNINO MAMANI RODRIGUEZ'
select libro.*
from lector,prestamo, detallePrestamo,libro,area
where lector.ci=prestamo.ciLector and prestamo.nro=detallePrestamo.nrop and detallePrestamo.codigol=libro.codigo
 and libro.idArea=area.id and area.descripcion='Computacion' and libro.año>2009 
 and lector.nombre='Saturnino Mamani Rodriguez';
 -- Mostrar el monto total pagado por lector varon de aquellos que tiene un pago mayor a 25 
select lector.ci, lector.nombre, sum(prestamo.monto) as MontoTotalPagado
from lector, prestamo
where lector.ci = prestamo.ciLector and lector.sexo = 'm'
group by lector.ci
having sum(prestamo.monto)>25;

-- Mostrar todos los libros que nunca han sido sacados del area de 'Matematicas'
select libro.*
from libro, area
where area.id = libro.idArea and libro.codigo not in (select codigol from detallePrestamo) and area.descripcion = 'Matematicas';

drop database modelo1;

