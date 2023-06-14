CREATE DATABASE SUPERMERCADO;
USE SUPERMERCADO;

CREATE TABLE CLIENTE
(
NIT INT NOT NULL PRIMARY KEY,
NOMBRE VARCHAR(60) NOT NULL
);
 CREATE TABLE NOTAVENTA
 (
 NUMERO INT NOT NULL PRIMARY KEY,
 FECHA DATE NOT NULL,
 MONTO FLOAT NOT NULL,
 NIT INT NOT NULL, 
 FOREIGN KEY (NITCLIENTE)REFERENCES CLIENTE(NIT)
 ON UPDATE CASCADE
 ON DELETE CASCADE
 );
 
 CREATE TABLE CATEGORIA
 (
 ID INT NOT NULL PRIMARY KEY,
 DESCRIPCION VARCHAR (60) NOT NULL 
 );
 
 CREATE TABLE PRODUCTO
 (
 CODIGO VARCHAR (5) NOT NULL PRIMARY KEY,
 NOMBRE VARCHAR(50) NOT NULL,
 PRECIO FLOAT NOT NULL,
 IDCATEGORIA INT NOT NULL,
 FOREIGN KEY (IDCATEGORIA)
 REFERENCES CATEGORIA(ID)
 ON UPDATE CASCADE
 ON DELETE CASCADE
 );
 
 CREATE TABLE VENDE
 (
 NRONOTA INT NOT NULL,
 FOREIGN KEY(NRONOTA)
 REFERENCES NOTAVENTA(NRO)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 CODIGOP VARCHAR(5) NOT NULL,
 FOREIGN KEY(CODIGOP)
 REFERENCES PRODUCTO(CODIGO)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 CANTIDAD INT NOT NULL,
 PRECIO FLOAT NOT NULL
 );
SELECT * FROM CATEGORIA;
insert into categoria values (1,'Gaseosas');
insert into categoria values (2,'Abarrotes');
insert into categoria values (3,'Limpieza');

SELECT * FROM PRODUCTO;
insert into producto values ('P001','Coca Cola 2 lts',10,1);
insert into producto values ('P002','Azucar 1 kg',5,2);
insert into producto values ('P003','Jabon',3,3);
insert into producto values ('P004','Fanta naranja 2 lts',10,1);
insert into producto values ('P005','Pepsi 3 lts',15,1);
insert into producto values ('P006','Detergente vajilla',20,3);
insert into producto values ('P007','Fideo 1 kg',7,2);

SELECT * FROM CLIENTE;
insert into cliente values (111,'Joaquin Chumacero');
insert into cliente values (222,'Saturdino Mamani');
insert into cliente values (333,'Fabiola Mendez');

SELECT * FROM NOTAVENTA;
insert into notaventa values (100,'2023/01/10',27,111);
insert into notaventa values (101,'2023/01/10',40,222);
insert into notaventa values (102,'2023/01/15',37,111);
insert into notaventa values (103,'2023/01/16',15,333);
insert into notaventa values (104,'2023/01/16',35,111);

SELECT * FROM VENDE; 
insert into vende values (100,'P004',2,10);
insert into vende values (100,'P007',1,7);
insert into vende values (101,'P004',5,8);
insert into vende values (102,'P001',2,10);
insert into vende values (102,'P002',2,5);
insert into vende values (102,'P007',1,7);
insert into vende values (103,'P003',5,3);
insert into vende values (104,'P001',1,10);
insert into vende values (104,'P002',5,5);