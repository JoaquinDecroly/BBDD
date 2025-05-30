DROP DATABASE IF EXISTS PROC_FUNC;
CREATE DATABASE PROC_FUNC;
USE PROC_FUNC;

CREATE TABLE impares (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero INT
);

-- 1
DELIMITER $$ 
CREATE PROCEDURE SumarDosNumeros(
    IN numero1 INT,
    IN numero2 INT,
    OUT resultado INT
)
BEGIN
    SET resultado = numero1 + numero2;
END $$


-- 2
DELIMITER $$

CREATE PROCEDURE SumarYMultiplicar(numero1 INT, INOUT numero2 INT, OUT resultadoSuma INT)
BEGIN

    SET resultadoSuma = numero1 + numero2;
    
    SET numero2 = numero1 * numero2;
  
END$$

-- 3
DELIMITER $$
CREATE FUNCTION SumarDosNumerosF(numero1 INT, numero2 INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE resultado INT;
  SET resultado = numero1 + numero2;
  RETURN resultado;
END $$

-- 4 
DELIMITER $$

CREATE PROCEDURE CalcularPrecioSinIVA(IN precio DECIMAL(10, 2), OUT precioSinIVA DECIMAL(10, 2))
BEGIN
    SET precioSinIVA = precio / 1.21;
END $$

-- 5
DELIMITER $$

CREATE FUNCTION DiaDeLaSemana(dia INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    CASE dia
        WHEN 1 THEN RETURN 'Lunes';
        WHEN 2 THEN RETURN 'Martes';
        WHEN 3 THEN RETURN 'Miércoles';
        WHEN 4 THEN RETURN 'Jueves';
        WHEN 5 THEN RETURN 'Viernes';
        WHEN 6 THEN RETURN 'Sábado';
        WHEN 7 THEN RETURN 'Domingo';
        ELSE RETURN 'Día inválido';
    END CASE;
END $$

-- 6
DELIMITER $$

CREATE FUNCTION Calculadora(num1 DECIMAL(10, 2), num2 DECIMAL(10, 2), operacion VARCHAR(10))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL(10, 2);
    
    IF operacion = 'suma' THEN
        SET resultado = num1 + num2;
    ELSEIF operacion = 'resta' THEN
        SET resultado = num1 - num2;
    ELSEIF operacion = 'mult' THEN
        SET resultado = num1 * num2;
    ELSEIF operacion = 'div' THEN
        IF num2 != 0 THEN
            SET resultado = num1 / num2;
        ELSE
            SET resultado = NULL;
        END IF;
    ELSE
        SET resultado = NULL;
    END IF;

    RETURN resultado;
END $$

-- 7
DELIMITER $$

CREATE PROCEDURE CalcularFactorial(IN N INT, OUT resultado INT)
DETERMINISTIC
BEGIN
    DECLARE i INT;

    IF N < 0 THEN
        SET resultado = NULL; 
    ELSEIF N = 0 THEN
        SET resultado = 1; 
    ELSE
        SET resultado = 1;
        SET i = 1;
        WHILE i <= N DO
            SET resultado = resultado * i;
            SET i = i + 1;
        END WHILE;
    END IF;
END $$

-- 8
DELIMITER $$

CREATE PROCEDURE InsertarImpares()
DETERMINISTIC
BEGIN
    DECLARE i INT;
    SET i = 1;

    WHILE i <= 100 DO
        IF MOD(i, 2) != 0 THEN
            INSERT INTO impares (numero) VALUES (i);
        END IF;
        SET i = i + 1;
    END WHILE;
END $$

-- 1
CALL SumarDosNumeros(5, 3, @resultado);
SELECT @resultado;

-- 2
SET @numero2 = 2; 
CALL SumarYMultiplicar(1, @numero2, @resultadoSuma);
SELECT @numero2 AND @resultadoSuma;

 -- 3
SELECT SumarDosNumerosF(5, 3);

-- 4
CALL CalcularPrecioSinIVA(10.99, @precioSinIVA);
SELECT @precioSinIVA;

-- 5
SELECT DiaDeLaSemana(2);

-- 6
SELECT Calculadora(45.78, 2, "mult");

-- 7 
CALL CalcularFactorial(5, @resultado);
SELECT @resultado;

-- 8
CALL InsertarImpares();
SELECT * FROM impares;


	



