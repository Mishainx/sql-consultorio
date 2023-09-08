USE consultorio;

DELIMITER $$

-- sp_pacientes_orden es un stored procedure que realiza la consulta de una tabla ordenándola a través de dos parámetros: "campo" y "ord"
-- Ej de uso: call consultorio.sp_pacientes_orden('nombre', 'ASC');

DROP PROCEDURE IF EXISTS sp_pacientes_orden$$ -- Verificación de existencia del stored procedure. En caso de que exista procede a eliminarlo
CREATE PROCEDURE sp_pacientes_orden (
	IN campo VARCHAR(20), -- El parámetro campo responde al nombre de una columna de la tabla consultorio.pacientes
    IN ord VARCHAR(4)) -- El parámetro ord indica si se quiere el tipo de ordenamiento en forma ascendente o descendente. A tal fin sólo admite "ASC" o "DESC"
BEGIN
	SELECT * from consultorio.pacientes;
    IF campo <> '' THEN #comprobación del parámetro campo
		IF ord = 'ASC' OR ord = 'DESC' THEN #comprobación del parámetro ord
			SET @pacientes_order = CONCAT(' ORDER BY ', campo,' ', ord);
		ELSE
			SET @pacientes_order = CONCAT(' ORDER BY ', campo);
		END IF; 
	ELSE
		SET @pacientes_order = '';
    END IF;    
	
	SET @consulta = CONCAT('SELECT * FROM consultorio.pacientes', @pacientes_order); -- configuración de la variable consulta con una sentencia en formato string
    
    
    PREPARE ejecutar FROM @consulta; -- Preparación de la consulta en un objeto SQL
    EXECUTE ejecutar; -- ejecuión de la consulta
    DEALLOCATE PREPARE ejecutar; -- Liberación de memoria
    
END$$

-- Ej de uso: CALL sp_insertar_tratamientos('masaje', 'Limpieza profunda de los dientes', 45, 150);

DROP PROCEDURE IF EXISTS sp_insertar_tratamientos$$

CREATE PROCEDURE sp_insertar_tratamientos(
	IN nombre VARCHAR(50), -- Nombre del tratamiento
    IN descripcion VARCHAR(255), -- Descripción del tratamiento
    IN duracion INT, -- Duración en minutos del tratamiento
    IN precio DECIMAL(8,2) -- Valor del tratamiento
)
BEGIN

	DECLARE numRegistros INT; -- Variable para contar registros
    
    IF nombre IS NOT NULL
		AND nombre <> ''
        AND descripcion IS NOT NULL
        AND descripcion <> ''
        AND duracion IS NOT NULL
        AND duracion > 0
        AND precio IS NOT NULL
        AND precio > 0 THEN
        
        -- Verificar si el tratamiento ya existe antes de insertarlo
        SELECT COUNT(*) INTO numRegistros
        FROM consultorio.tratamientos AS t
        WHERE t.nombre = nombre;
        
        IF numRegistros = 0 THEN
            -- Insertar el nuevo tratamiento
            INSERT INTO consultorio.tratamientos (nombre, descripcion, duracion, precio) VALUES
                (nombre, descripcion, duracion, precio);
            SELECT 'Tratamiento insertado correctamente' AS mensaje;
        ELSE
            SELECT 'El tratamiento ya existe' AS mensaje;
        END IF;
    ELSE
        SELECT 'Campo inválido' AS mensaje;
    END IF;
    
END$$

-- sp_generar_factura es un procedimiento almacenado para generar una nueva factura e insertarla en la tabla correspondiente
-- ej de uso: CALL sp_generar_factura();

DROP PROCEDURE IF EXISTS sp_generar_factura$$

CREATE PROCEDURE sp_generar_factura(IN id_paciente INT, IN id_tratamiento INT, IN id_metodo INT)
BEGIN
    DECLARE tratamiento_precio DECIMAL(8,2);
    DECLARE msg TEXT DEFAULT 'Error desconocido';
    DECLARE rb BOOL DEFAULT FALSE;
    DECLARE error_msg TEXT;

    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET rb := TRUE;

    START TRANSACTION; -- Inicio de la transacción

    IF id_paciente <= 0 OR id_tratamiento <= 0 OR id_metodo <= 0 THEN
		SET msg = 'todos los campos deben ser completados';
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = error_msg;
    ELSE
        SELECT precio
        INTO tratamiento_precio
        FROM tratamientos t
        WHERE t.id_tratamiento = id_tratamiento;

        INSERT INTO factura (id_paciente, id_tratamiento, id_metodo)
        VALUES (id_paciente, id_tratamiento, id_metodo);
    END IF;

    IF rb THEN
        ROLLBACK;
        SELECT CONCAT('Error: ', msg) AS 'Error';
    ELSE
        COMMIT;
    END IF;
END$$


DELIMITER ;

-- call sp_generar_factura(1,1,0)
-- select * from factura