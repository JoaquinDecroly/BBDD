DROP DATABASE IF EXISTS CABCO;
CREATE DATABASE CABCO;
USE CABCO;

CREATE TABLE Taxis (
    Placa VARCHAR(10) PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    CantidadPasajeros INT,
    AdaptadoParaDiscapacitados BOOLEAN
);

CREATE TABLE Conductores (
    DNI_NIE VARCHAR(9) PRIMARY KEY,
    PLACA VARCHAR(10),
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Dirección VARCHAR(100),
    CONSTRAINT FK FOREIGN KEY(PLACA) REFERENCES Taxis(Placa)
);

CREATE TABLE Viajes (
    ID_Viaje INT PRIMARY KEY,
    Origen VARCHAR(100),
    Destino VARCHAR(100),
    Precio DECIMAL(10, 2),
    EsTurnoNocturno BOOLEAN,
    Placa VARCHAR(10),
    FOREIGN KEY (Placa) REFERENCES Taxis(Placa)
);

INSERT INTO Taxis (Placa, Marca, Modelo, CantidadPasajeros, AdaptadoParaDiscapacitados)
VALUES 
('CHB1', 'Toyota', 'Corolla', 4, TRUE),
('HGF3243', 'Ford', 'Focus', 4, FALSE),
('CKD2345', 'Honda', 'Civic', 4, TRUE),
('FHG2378', 'Nissan', 'Altima', 4, FALSE),
('DLV7069', 'Hyundai', 'Elantra', 4, TRUE);

INSERT INTO Conductores (DNI_NIE, PLACA, Nombre, Apellido, Dirección)
VALUES 
('11111111H', 'CHB1', 'Juan', 'Pérez', 'Calle Falsa 123'),
('22222222J', 'HGF3243', 'Ana', 'Gómez', 'Avenida Siempre Viva 456'),
('33333333P', 'CKD2345', 'Carlos', 'López', 'Boulevard de los Sueños Rotos 789'),
('44444444A', 'FHG2378', 'María', 'Martínez', 'Calle del Olvido 101'),
('55555555B', 'DLV7069', 'Luis', 'Fernández', 'Avenida de la Luz 112');

INSERT INTO Viajes (ID_Viaje, Origen, Destino, Precio, EsTurnoNocturno, Placa)
VALUES 
(1, 'Calle Falsa 123', 'Avenida Siempre Viva 456', 15.50, FALSE, 'CHB1'),
(2, 'Avenida Siempre Viva 456', 'Boulevard de los Sueños Rotos 789', 20.00, TRUE, 'HGF3243'),
(3, 'Boulevard de los Sueños Rotos 789', 'Calle del Olvido 101', 18.75, FALSE, 'CKD2345'),
(4, 'Calle del Olvido 101', 'Avenida de la Luz 112', 22.30, TRUE, 'FHG2378'),
(5, 'Avenida de la Luz 112', 'Calle Falsa 123', 17.00, FALSE, 'DLV7069');

/*1*/
SELECT T.Placa, T.Marca, T.Modelo, C.DNI_NIE, C.Nombre FROM Taxis T INNER JOIN Conductores C ON T.Placa = C.Placa;

/*2*/
SELECT V.ORIGEN, V.DESTINO, T.PLACA, T.ADAPTADOPARADISCAPACITADOS FROM VIAJES V INNER JOIN TAXIS T ON T.PLACA = V.PLACA;

-- 3
SELECT C1.NOMBRE, C1.DNI_NIE, T1.MARCA, T1.MODELO, T1.PLACA, T1.CANTIDADPASAJEROS FROM CONDUCTORES C1 LEFT JOIN TAXIS T1 ON T1.PLACA = C1.PLACA
UNION
SELECT C1.NOMBRE, C1.DNI_NIE, T1.MARCA, T1.MODELO, T1.PLACA, T1.CANTIDADPASAJEROS FROM CONDUCTORES C1 RIGHT JOIN TAXIS T1 ON T1.PLACA = C1.PLACA;

-- 4
SELECT T.*, C.* FROM CONDUCTORES C RIGHT JOIN TAXIS T ON T.PLACA = C.PLACA
UNION
SELECT T.*, C.* FROM CONDUCTORES C LEFT JOIN TAXIS T ON T.PLACA = C.PLACA;

-- 5
SELECT V.*, T.* FROM VIAJES V RIGHT JOIN TAXIS T ON T.PLACA = V.PLACA
UNION
SELECT V.*, T.* FROM VIAJES V LEFT JOIN TAXIS T ON T.PLACA = V.PLACA;


