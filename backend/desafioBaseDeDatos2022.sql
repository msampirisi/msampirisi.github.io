/* DROP*/
DROP DATABASE IF EXISTS desafio2022;

/* CREO LA BASE DE DATOS */
CREATE DATABASE desafio2022;

/* elijo la base */
USE desafio2022;

/* TABLA : DEPARTAMENTOS */
CREATE TABLE departamentos (
  dptonumero int(11) NOT NULL,
  nombre varchar(100) NOT NULL,
  presupuesto decimal(18,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (dptonumero),
  UNIQUE KEY departamentosUNno (nombre),
  CONSTRAINT departamentosCHECKpre CHECK (presupuesto >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* INSERTAR LOS DEPARTAMENTOS */
INSERT INTO departamentos (dptonumero, Nombre, presupuesto)
VALUES (14, 'Informática', 80000), (77, 'Investigación', 40000), (15, 'Gestión', 95000), (37, 'Desarrollo', 65000), (16, 'Comunicación', 75000);

/* TABLA : EMPLEADOS */
CREATE TABLE empleados (
  dni int(11) NOT NULL,
  nombre varchar(100) NOT NULL,
  apellido varchar(100) NOT NULL,
  dptonumero int(11) NOT NULL,
  PRIMARY KEY (dni),
  KEY empleadosFKdepartamentos (dptonumero),
  CONSTRAINT empleadosFKdepartamentos FOREIGN KEY (dptonumero) REFERENCES departamentos(dptonumero) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* INSERTAR LOS EMPLEADOS*/
INSERT INTO empleados
(dni, nombre, apellido, dptonumero)
VALUES (31096678,'Juan','Lopez', 14),
(31096675,'Martin','Zarabia', 77),
(34269854,'Jose','velez', 77),
(41369852,'Paula','Madariaga', 77),
(33698521,'Pedro','Perez', 14),
(32698547,'Mariana','Lopez', 15),
(42369854,'Abril','Sanchez', 37),
(36125896,'Marti','Julia', 14),
(36985471,'Omar','Diaz', 15),
(32145698,'Guadalupe','Perez', 77),
(32369854,'Bernardo','pantera', 37),
(36125965,'Lucia','Pesaro', 14),
(31236985,'Maria','diamante', 14),
(32698548,'Carmen','barbieri', 16);

/*
 * el dni del ultimo registro fue modificado, porque rompia el concepto de dni unico, supongo que era un error de datos, dado que dos personas no pueden compartir el dni.
 * */

/* 2.1 obtener los apellidos de los empleados */
SELECT apellido FROM empleados;

/* 2.2 obtener los apellidos de los empleados sin repeticiones */
SELECT DISTINCT apellido FROM empleados;

/* 2.3 obtener los datos de los empleados que tengan el apellido Lopez */
SELECT * FROM empleados WHERE apellido = 'Lopez';

/* 2.4 obtener los datos de los empleados que tengan el apellido Lopez y los que tengan apellido Perez */
SELECT * FROM empleados WHERE apellido = 'Lopez' OR apellido = 'Perez';
-- tambien podria ser :
SELECT * FROM empleados WHERE apellido in ('Lopez','Perez')

/* 2.5 Obtener todos los datos de los empleados que trabajen en el departamento 14 */
SELECT * FROM empleados WHERE dptonumero = 14;

/* 2.6 Obtener todos los datos de los empleados que trabajen en el departamento 37 y 77 */
SELECT * FROM empleados WHERE dptonumero = 37 OR dptonumero = 77;
-- tambien podria ser :
SELECT * FROM empleados WHERE dptonumero in (37,77);

/* 2.7 Obtener los datos de los empleados cuyo apellido comience con P */
SELECT * FROM empleados WHERE SUBSTRING(apellido,1,1) = 'P'; 

/* 2.8 Obtener el presupuesto total de todos los departamentos */
SELECT SUM(presupuesto) FROM departamentos;

/* 2.9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento */
SELECT e.dni, e.nombre, e.apellido, e.dptonumero, d.nombre  FROM empleados e INNER JOIN departamentos d ON d.dptonumero = e.dptonumero;

/* 2.10 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento */
SELECT e.dni, e.nombre, e.apellido, e.dptonumero, d.nombre, d.presupuesto  FROM empleados e INNER JOIN departamentos d ON d.dptonumero = e.dptonumero;

/* 2.11 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60000 */
SELECT e.apellido, e.nombre  
	FROM empleados e 
	INNER JOIN departamentos d ON d.dptonumero = e.dptonumero
	WHERE d.presupuesto > 60000;

/* 2.12 Añadir un nuevo departamento: Calidad con un presupuesto de 40000 y código 11, añadir un empleado vinculado al departamento recién creado: Esther Vazquez, DNI 89267109 */
INSERT INTO departamentos (dptonumero, nombre, presupuesto) VALUES (11, 'Calidad', 40000);
INSERT INTO empleados (dni, nombre, apellido, dptonumero) VALUES (89267109, 'Esther', 'Vazquez', 11);

/* 2.13 Aplicar un recorte presupuestario del 10% a todos los departamentos */
UPDATE departamentos SET presupuesto = presupuesto - (presupuesto * 0.1);

/* 2.14 Reasignar a los empleados del departamento de investigación (código 77) al departamento de informática (código 14) */
UPDATE empleados SET dptonumero = 14 WHERE dptonumero = 77;

/* 2.15 Despedir a los empleados del departamento de informática (código 14) */
SELECT * FROM empleados WHERE dptonumero = 14;

/* 2.16 Despedir a los empleados que trabajen en departamentos con un presupuesto superior a 90000 */
SELECT * FROM empleados WHERE dptonumero IN (SELECT dptonumero FROM departamentos WHERE presupuesto > 90000);

