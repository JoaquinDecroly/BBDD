DROP DATABASE IF EXISTS empleados;
CREATE DATABASE IF NOT EXISTS empleados;
USE empleados;

DROP TABLE IF EXISTS dept_emp,
                     empleado, 
                     departamento;

CREATE TABLE empleado (
    cod_empleado      INT             NOT NULL,
    fecha_nacimiento  DATE            NOT NULL,
    nombre  VARCHAR(14)     NOT NULL,
    apellido   VARCHAR(16)     NOT NULL,
    sexo      ENUM ('M','F')  NOT NULL,    
    fecha_contratacion  DATE            NOT NULL,
    PRIMARY KEY (cod_empleado)
);

CREATE TABLE departamento (
    cod_departamento     CHAR(4)         NOT NULL,
    nombre_departamento   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (cod_departamento),
    UNIQUE  KEY (nombre_departamento)
);

CREATE TABLE dept_emp (
    cod_empleado      INT             NOT NULL,
    cod_departamento     CHAR(4)         NOT NULL,
    fecha_desde   DATE            NOT NULL,
    fecha_hasta     DATE            NOT NULL,
    FOREIGN KEY (cod_empleado)  REFERENCES empleado   (cod_empleado)  ON DELETE CASCADE,
    FOREIGN KEY (cod_departamento) REFERENCES departamento (cod_departamento) ON DELETE CASCADE,
    PRIMARY KEY (cod_empleado,cod_departamento)
);

INSERT INTO `empleado` VALUES (10001,'1953-09-02','Georgi','Facello','M','2021-06-26'),
(10002,'1964-06-02','Bezalel','Simmel','F','2018-11-21'),
(10003,'1979-12-03','Parto','Bamford','M','2019-08-28'),
(10004,'1982-05-01','Chirstian','Koblick','M','2022-12-01'),
(10005,'1983-01-21','Kyoichi','Maliniak','M','2019-09-12'),
(10006,'1990-04-20','Anneke','Preusig','F','2018-06-02'),
(10007,'1965-05-23','Tzvetan','Zielinski','F','2018-02-10'),
(10008,'1990-02-19','Saniya','Kalloufi','M','2021-09-15'),
(10009,'1991-04-19','Sumant','Peac','F','2019-02-18'),
(10010,'1978-06-01','Duangkaew','Piveteau','F','2018-08-24'),
(10011,'1972-11-07','Mary','Sluis','F','2018-01-22'),
(10012,'1988-09-02','Lucas','Perez','M','2019-06-26');

INSERT INTO `departamento` VALUES 
('d001','Marketing'),
('d002','Finance'),
('d003','Human Resources'),
('d004','Production'),
('d005','Development'),
('d006','Quality Management'),
('d007','Sales'),
('d008','Research'),
('d009','Customer Service'),
('d010','IT');

INSERT INTO `dept_emp` VALUES (10001,'d006','2021-06-26','9999-01-01'),
(10002,'d006','2018-11-21','9999-01-01'),
(10003,'d004','2019-08-28','9999-01-01'),
(10004,'d004','2022-12-01','9999-01-01'),
(10005,'d004','2019-09-12','9999-01-01'),
(10006,'d005','2018-06-02','9999-01-01'),
(10007,'d008','2018-02-10','9999-01-01'),
(10008,'d006','2021-09-15','2022-07-31'),
(10009,'d006','2019-02-18','9999-01-01'),
(10010,'d004','2018-08-24','2020-10-11'),
(10010,'d006','2020-10-12','9999-01-01'),
(10011,'d005','2018-01-22','2019-09-10'),
(10012,'d005','2019-06-26','9999-01-01');

UPDATE EMPLEADO SET NOMBRE = 'HELEN' WHERE NOMBRE = 'MARY' AND APELLIDO = 'SLUIS';
UPDATE DEPT_EMP SET FECHA_HASTA='9999-02-02' WHERE FECHA_HASTA='9999-01-01';

INSERT INTO EMPLEADO VALUES(10013, '1995-08-14', 'Marco', 'Fernández', 'M', '2024-01-22');
INSERT INTO EMPLEADO VALUES(10014, '2000-08-16', 'Lucía', 'Castillar', 'F', '2025-01-08');

INSERT INTO DEPT_EMP VALUES(10013, 'd010', '2024-01-22', '9999-02-02');
INSERT INTO DEPT_EMP VALUES(10014, 'd010', '2025-01-08', '9999-02-02');

UPDATE DEPARTAMENTO SET NOMBRE_DEPARTAMENTO = 'Equipo de Titanes Digitales' WHERE COD_DEPARTAMENTO = 'd010';

SELECT * FROM DEPARTAMENTO;

SELECT NOMBRE_DEPARTAMENTO FROM DEPARTAMENTO;

SELECT NOMBRE, APELLIDO, FECHA_NACIMIENTO FROM EMPLEADO WHERE FECHA_NACIMIENTO >= '1990-04-20';

SELECT NOMBRE, APELLIDO, FECHA_NACIMIENTO FROM EMPLEADO WHERE FECHA_NACIMIENTO BETWEEN '1980-01-01' AND '1989-12-31';

SELECT NOMBRE, APELLIDO, FECHA_NACIMIENTO FROM EMPLEADO WHERE SEXO = 'F' AND FECHA_NACIMIENTO BETWEEN '1980-01-01' AND '1999-12-31';

SELECT APELLIDO, NOMBRE FROM EMPLEADO WHERE APELLIDO='P%';