USE consultorio;

DELIMITER $$
-- Función calcular_iva permite calcular el monto del IVA a partir del monto bruto de tratamiento para la facturación
-- Ej de uso: SELECT calcular_iva (500) AS IVA
DROP FUNCTION IF EXISTS calcular_iva$$ -- Verifica si la función existe y la elimina si es necesario para evitar errores

CREATE FUNCTION calcular_iva(monto_bruto DECIMAL(11, 2))
RETURNS DECIMAL(11, 2)
DETERMINISTIC
BEGIN
    DECLARE porcentaje_iva DECIMAL(5, 2);
    DECLARE iva DECIMAL(11, 2);
    SET porcentaje_iva = 21; 
    SET iva = monto_bruto * (porcentaje_iva / 100);
    RETURN iva;
END$$

-- Función caja_diaria permite calcular el monto de caja para una fecha determinada
-- Ej de uso: SELECT caja_diaria('2023-07-23') AS caja;;

DROP FUNCTION IF EXISTS caja_diaria$$ -- Verifica si la función existe y la elimina si es necesario para evitar errores

CREATE FUNCTION caja_diaria(fecha_consulta DATE) 
RETURNS DECIMAL(11, 2)
READS SQL DATA
BEGIN
    DECLARE monto_total DECIMAL(11, 2);
    
    SELECT SUM(tratamientos.precio) INTO monto_total
    FROM consultorio.turnos
    INNER JOIN consultorio.tratamientos ON turnos.id_tratamiento = tratamientos.id_tratamiento
    WHERE DATE(turnos.fecha) = fecha_consulta;
    
    RETURN monto_total;
END$$

-- Función calcular_edad permite determinar la edad de un paciente recibiendo por parámetro el año de nacimiento
-- Ej de uso: SELECT calcular_edad('2000') AS paciente_edad;
DROP FUNCTION IF EXISTS calcular_edad$$ -- Verifica si la función existe y la elimina si es necesario para evitar errores

CREATE FUNCTION calcular_edad(nacimiento_year YEAR)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE actual_year INT;
DECLARE edad INT;
SET actual_year = YEAR(CURDATE());
SET edad = actual_year - nacimiento_year;
RETURN edad;
END$$

DELIMITER ;