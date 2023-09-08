-- CURSO SQL
-- Segunda pre-entrega
-- Profesor: César Arena
-- Tutor: Juan Martín Almada Ortíz

CREATE DATABASE IF NOT EXISTS consultorio;

USE consultorio;

CREATE TABLE IF NOT EXISTS cobertura(
    id_cobertura INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_cobertura),
    INDEX(nombre)
);

CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_cobertura INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    tipo_documento VARCHAR(3) DEFAULT 'DNI',
    documento VARCHAR(14),
    PRIMARY KEY (id_paciente),
    CONSTRAINT FOREIGN KEY (id_cobertura) REFERENCES cobertura(id_cobertura) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS profesionales(
    id_profesional INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    tipo_documento VARCHAR(3) DEFAULT 'DNI',
    documento VARCHAR(14),
    cuit VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_profesional)
);

CREATE TABLE IF NOT EXISTS profesionales_auxiliares(
    id_profesional_auxiliar INT NOT NULL UNIQUE AUTO_INCREMENT,
    especialidad VARCHAR(50) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    tipo_documento VARCHAR(3) DEFAULT 'DNI',
    documento VARCHAR(14),
    cuit VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_profesional_auxiliar)
);

CREATE TABLE IF NOT EXISTS proveedores(
    id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT,
    rubro VARCHAR(100) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    cuit VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_proveedor),
    INDEX(nombre, cuit)
);

CREATE TABLE IF NOT EXISTS telefonos(
    id_telefono INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_profesional INT,
    id_paciente INT,
    id_proveedor INT,
    id_profesional_auxiliar INT,
	numero VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_telefono),
    CONSTRAINT FOREIGN KEY (id_profesional) REFERENCES profesionales(id_profesional) ON DELETE CASCADE ,
    CONSTRAINT FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_profesional_auxiliar) REFERENCES profesionales_auxiliares(id_profesional_auxiliar) ON DELETE CASCADE,
	CONSTRAINT chk_exclusive_relation CHECK (
        (id_profesional IS NOT NULL AND id_paciente IS NULL AND id_proveedor IS NULL AND id_profesional_auxiliar IS NULL) OR
        (id_profesional IS NULL AND id_paciente IS NOT NULL AND id_proveedor IS NULL AND id_profesional_auxiliar IS NULL) OR
        (id_profesional IS NULL AND id_paciente IS NULL AND id_proveedor IS NOT NULL AND id_profesional_auxiliar IS NULL) OR
        (id_profesional IS NULL AND id_paciente IS NULL AND id_proveedor IS NULL AND id_profesional_auxiliar IS NOT NULL)
    )
);

CREATE TABLE IF NOT EXISTS email(
    id_email INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_profesional INT,
    id_paciente INT,
    id_proveedor INT,
    id_profesional_auxiliar INT,
    email VARCHAR (120) NOT NULL UNIQUE,
    PRIMARY KEY (id_email),
    CONSTRAINT FOREIGN KEY (id_profesional) REFERENCES profesionales(id_profesional) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_profesional_auxiliar) REFERENCES profesionales_auxiliares(id_profesional_auxiliar) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS direccion(
    id_direccion INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_profesional INT,
    id_paciente INT,
    id_proveedor INT,
    id_profesional_auxiliar INT,
	direccion VARCHAR(100),
    PRIMARY KEY (id_direccion),
    CONSTRAINT FOREIGN KEY (id_profesional) REFERENCES profesionales(id_profesional) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_profesional_auxiliar) REFERENCES profesionales_auxiliares(id_profesional_auxiliar) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS titulos(
    id_titulo INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    institucion VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_titulo),
    CONSTRAINT uk_titulos_nombre_institucion UNIQUE (nombre, institucion)
);

CREATE TABLE IF NOT EXISTS tratamientos(
    id_tratamiento INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR (255) NOT NULL,
    duracion INT NOT NULL,
    precio DECIMAL(8,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (id_tratamiento),
    KEY (precio)
);

CREATE TABLE IF NOT EXISTS metodo_pago(
    id_metodo INT NOT NULL UNIQUE AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id_metodo)
);

CREATE TABLE IF NOT EXISTS historia_clinica(
    id_hc INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_paciente INT NOT NULL UNIQUE,
    diagnostico VARCHAR(125),
    antecedentes VARCHAR(255),
    epicrisis VARCHAR(255),
    PRIMARY KEY (id_hc),
    CONSTRAINT FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS turnos(
    id_turno INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_tratamiento INT NOT NULL,
    id_profesional INT NOT NULL,
    fecha DATETIME NOT NULL,
    PRIMARY KEY (id_turno),
    CONSTRAINT FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_profesional) REFERENCES profesionales(id_profesional) ON DELETE CASCADE,
    INDEX(fecha)
);

CREATE TABLE IF NOT EXISTS titulos_profesional(
    id_profesional INT NOT NULL,
    id_titulo INT NOT NULL,
    PRIMARY KEY (id_profesional, id_titulo),
    CONSTRAINT uk_titulos_profesional UNIQUE (id_profesional, id_titulo),
    CONSTRAINT FOREIGN KEY (id_profesional) REFERENCES profesionales(id_profesional) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_titulo) REFERENCES titulos(id_titulo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tratamientos_profesional(
    id_profesional INT NOT NULL AUTO_INCREMENT,
    id_tratamiento INT NOT NULL,
    PRIMARY KEY (id_profesional, id_tratamiento),
    CONSTRAINT uk_tratamientos_profesional UNIQUE (id_profesional, id_tratamiento),
    CONSTRAINT FOREIGN KEY (id_profesional) REFERENCES profesionales(id_profesional) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS factura(
    id_factura INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_tratamiento INT NOT NULL,
    id_metodo INT NOT NULL,
    PRIMARY KEY (id_factura),
    CONSTRAINT FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_metodo) REFERENCES metodo_pago(id_metodo) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pedidos_proveedores(
    id_pedido INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_proveedor INT NOT NULL,
    producto VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(9,2) NOT NULL DEFAULT 0,
    fecha DATETIME,
    PRIMARY KEY (id_pedido),
    CONSTRAINT FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS sesiones(
    id_sesion INT NOT NULL UNIQUE AUTO_INCREMENT,
    id_turno INT NOT NULL,
    id_hc INT NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_sesion),
    CONSTRAINT FOREIGN KEY (id_turno) REFERENCES turnos(id_turno) ON DELETE CASCADE,
    CONSTRAINT FOREIGN KEY (id_hc) REFERENCES historia_clinica(id_hc) ON DELETE CASCADE
);

-- Tablas auxiliares de auditoría.

-- Tabla new_pacientes para trigger after insert en la tabla pacientes
CREATE TABLE IF NOT EXISTS new_pacientes (
id_paciente INT NOT NULL,
usuario VARCHAR(45),
fecha_y_hora DATETIME DEFAULT current_timestamp()
);

-- Tabla update_pacientes para trigger before update en la tabla pacientes
CREATE TABLE IF NOT EXISTS update_pacientes (
    id_paciente INT NOT NULL,
    id_cobertura INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    tipo_documento VARCHAR(3) DEFAULT 'DNI',
    documento VARCHAR(14),
	usuario VARCHAR(45),
	fecha_y_hora DATETIME DEFAULT current_timestamp()
);

-- Tabla delete_pacientes para trigger before delete
CREATE TABLE IF NOT EXISTS delete_pacientes (
id_paciente INT NOT NULL,
usuario VARCHAR(45),
fecha_y_hora DATETIME DEFAULT current_timestamp()
);

-- Tabla new_turnos para trigger after insert en la tabla turnos
CREATE TABLE IF NOT EXISTS new_turnos (
id_turno INT NOT NULL,
usuario VARCHAR(45),
fecha_y_hora DATETIME DEFAULT current_timestamp()
);

-- Tabla update_turnos para trigger before update en la tabla turnos
CREATE TABLE IF NOT EXISTS update_turnos (
    id_turno INT NOT NULL,
    id_paciente INT NOT NULL,
	id_tratamiento INT NOT NULL,
	id_profesional INT NOT NULL,
    fecha DATETIME NOT NULL,
	usuario VARCHAR(45),
	fecha_y_hora DATETIME DEFAULT current_timestamp()
);

-- Tabla delete_turnos para trigger before delete
CREATE TABLE IF NOT EXISTS delete_turnos (
id_turno INT NOT NULL,
usuario VARCHAR(45),
fecha_y_hora DATETIME DEFAULT current_timestamp()
);

-- Tabla new_factura para trigger after insert en la tabla factura
CREATE TABLE IF NOT EXISTS new_factura (
id_factura INT NOT NULL,
id_paciente INT NOT NULL,
id_tratamiento INT NOT NULL,
id_metodo INT NOT NULL,
usuario VARCHAR(45),
fecha_y_hora DATETIME DEFAULT current_timestamp()
);

DELIMITER $$

-- STORED PROCEDURES
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
-- Comprobacion: SELECT * FROM tratamientos;

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
-- ej de uso: CALL sp_generar_factura(0,1,1);
-- Comprobación: SELECT * FROM factura

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
		SET msg = 'todos los parámetros deben ser completados correctamente';
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

-- Funciones

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
-- Ej de uso: SELECT caja_diaria('2023-07-23') AS caja;

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

DROP TRIGGER IF EXISTS tr_add_new_pacientes$$ -- Verificación de que no esté creado el trigger o en su caso se elimine

-- Creación de Trigger AFTER INSTER en la tabla pacientes
-- Descripción: luego de que se produzca la inserción de un paciente, se crea un log en la tabla new_pacients donde se almacena el id del paciente, usuario que lo crea y fecha de la acción
-- Ej de uso:
-- 1) Insertar un registro
-- INSERT INTO consultorio.pacientes (id_cobertura, nombre, apellido, tipo_documento, documento) VALUES (1, 'Jonathan', 'Maineri', 'DNI', '20127458');
-- 2) Comprobar la creación del log
-- SELECT * from new_pacientes;

CREATE TRIGGER 
tr_add_new_pacientes
AFTER INSERT ON consultorio.pacientes
FOR EACH ROW
INSERT INTO new_pacientes (id_paciente,usuario,fecha_y_hora) VALUES
(NEW.id_paciente,USER(),NOW())$$

DROP TRIGGER IF EXISTS tr_update_pacientes$$ -- Verificación de que no esté creado el trigger o en su caso se elimine

-- Creación de Trigger BEFORE UPDATE en la tabla pacientes
-- Descripción: el trigger funciona creando un log  con los datos existentes antes de que se produzca la modificación de un registro, generando así un respaldo en caso de necesitarlo e indicando, fecha y usuario  a cargo de la modificación
-- Ej de uso:
-- 1) modificar un registro
-- UPDATE pacientes SET nombre  = 'Robertino' WHERE id_paciente = 1;
-- 2) Comprobar la creación del log
-- SELECT * from update_pacientes

CREATE TRIGGER 
tr_update_pacientes
before UPDATE ON consultorio.pacientes
FOR EACH ROW
INSERT INTO update_pacientes (id_paciente,id_cobertura, nombre, apellido, tipo_documento, documento, usuario,fecha_y_hora) VALUES
(OLD.id_paciente, OLD.id_cobertura, OLD.nombre, OLD.apellido, OLD.tipo_documento, OLD.documento,USER(),NOW())$$

DROP TRIGGER IF EXISTS tr_delete_pacientes$$ -- Verificación de que no esté creado el trigger o en su caso se elimine

-- Creación de Trigger BEFORE DELETE en la tabla pacientes
-- Descripción: el trigger funciona creando un log de auditoría respecto de una acción crítica como la eliminación de pacientes
-- Ej de uso:
-- 1) eliminar un registro
-- DELETE FROM pacientes WHERE id_paciente = 1;
-- 2) Comprobar la creación del log
-- SELECT * from delete_pacientes

CREATE TRIGGER 
tr_delete_pacientes
before DELETE ON consultorio.pacientes
FOR EACH ROW
INSERT INTO delete_pacientes (id_paciente,usuario,fecha_y_hora) VALUES
(OLD.id_paciente,USER(),NOW())$$


DROP TRIGGER IF EXISTS tr_add_new_turnos$$ -- Verificación de que no esté creado el trigger o en su caso se elimine

-- Creación de Trigger AFTER INSTER en la tabla turnos
-- Descripción: antes de que se produzca la inserción de un turno, se crea un log en la tabla new_turnos donde se almacena la id del turno, usuario que lo crea y fecha de la acción
-- Ej de uso:
-- 1) Insertar un registro
-- INSERT INTO consultorio.turnos (id_turno, id_paciente, id_tratamiento, id_profesional, fecha) VALUES (null, '2', '2', '2', '2023-07-10 15:15:15');
-- 2) Comprobar la creación del log
-- SELECT * from new_turnos;

CREATE TRIGGER 
tr_add_new_turnos
AFTER INSERT ON consultorio.turnos
FOR EACH ROW
INSERT INTO new_turnos (id_turno,usuario,fecha_y_hora) VALUES
(NEW.id_turno,USER(),NOW())$$

DROP TRIGGER IF EXISTS tr_update_turnos$$ -- Verificación de que no esté creado el trigger o en su caso se elimine

-- Creación de Trigger BEFORE UPDATE en la tabla pacientes
-- Descripción: el trigger funciona creando un log  con los datos existentes antes de que se produzca la modificación de un registro, generando así un respaldo en caso de necesitarlo e indicando, fecha y usuario  a cargo de la modificación
-- Ej de uso:
-- 1) modificar un registro
-- UPDATE turnos SET fecha  = '2023-07-23 14:14:15' WHERE id_turno = 3;
-- 2) Comprobar la creación del log
-- SELECT * from update_turnos;

CREATE TRIGGER 
tr_update_turnos
before UPDATE ON consultorio.turnos
FOR EACH ROW
INSERT INTO update_turnos (id_turno, id_paciente, id_tratamiento, id_profesional, fecha, usuario,fecha_y_hora) VALUES
(OLD.id_turno, OLD.id_paciente, OLD.id_tratamiento, OLD.id_profesional, OLD.fecha,USER(),NOW())$$

DROP TRIGGER IF EXISTS tr_delete_turnos$$ -- Verificación de que no esté creado el trigger o en su caso se elimine

-- Creación de Trigger BEFORE DELETE en la tabla turnos
-- Descripción: el trigger funciona creando un log de auditoría respecto de una acción crítica como la eliminación de turnos
-- Ej de uso:
-- 1) eliminar un registro
-- DELETE FROM turnos WHERE id_turno = 2;
-- 2) Comprobar la creación del log
-- SELECT * from delete_turnos

CREATE TRIGGER 
tr_delete_turnos
before DELETE ON consultorio.turnos
FOR EACH ROW
INSERT INTO delete_turnos (id_turno,usuario,fecha_y_hora) VALUES
(OLD.id_turno,USER(),NOW())$$

DROP TRIGGER IF EXISTS tr_add_new_factura$$ -- Verificación de que no esté creado el trigger o en su caso se elimine

-- Creación de AFTER INSERT en la tabla factura
-- Descripción: el trigger funciona creando un log de auditoría respecto de una acción crítica como la creación de 
-- Ej de uso:
-- 1) crear un registro en la tabla factura
-- INSERT INTO factura VALUES(null,5,1,1);
-- 2) Comprobar la creación del log
-- SELECT * from new_factura

CREATE TRIGGER 
tr_add_new_factura
AFTER INSERT ON consultorio.factura
FOR EACH ROW
INSERT INTO new_factura (id_factura,id_paciente,id_tratamiento, id_metodo,usuario, fecha_y_hora) VALUES
(NEW.id_factura, NEW.id_paciente, NEW.id_tratamiento, NEW.id_metodo,USER(),NOW())$$

DELIMITER ;

-- VISTAS

-- TOP_COBERTURAS_VIEW
-- Vista que permite obtener métricas sobre la cantidad de pacientes por cobertura (sin distinguir tipo dentro de la cobertura)
-- ej de uso: select * from top_coberturas_view 
CREATE OR REPLACE VIEW top_coberturas_view AS
(
SELECT c.nombre, COUNT(p.id_paciente) AS cantidad_pacientes
FROM cobertura c
JOIN pacientes p ON c.id_cobertura = p.id_cobertura
GROUP BY c.nombre
ORDER BY cantidad_pacientes DESC
);

-- TOP TRATAMIENTO_VIEW
-- Vista que permite detallar cuales son los tratamientos más realizados
-- ej de uso: SELECT * from top_tratamiento_view 
CREATE OR REPLACE VIEW top_tratamiento_view AS
(
SELECT t.nombre, COUNT(turnos.id_tratamiento) AS cantidad_pacientes
FROM tratamientos t
JOIN turnos ON t.id_tratamiento = turnos.id_tratamiento
GROUP BY t.nombre
ORDER BY cantidad_pacientes DESC
);

-- TURNO_VIEW
-- Vista de información detallada de turnos en orden cronológico
-- Ej de uso: SELECT * FROM turno_view
CREATE OR REPLACE VIEW turno_view AS
(
SELECT 
	id_turno,
    CONCAT(p.nombre, " ", p.apellido) as paciente,
    t.nombre as tratamiento,
    CONCAT(pro.nombre," ",pro.apellido) as profesional,
    fecha
FROM turnos
JOIN pacientes p ON turnos.id_paciente = p.id_paciente
JOIN tratamientos t ON turnos.id_tratamiento = t.id_tratamiento
JOIN profesionales pro ON turnos.id_profesional = pro.id_profesional
)
ORDER BY fecha;

-- PEDIDOS_PROVEEDORES_VIEW
-- Vista de detalle de pedidos a proveedores incluyendo calculo del total del pedido
-- Ordenarlo por el campo total permite identificar los insumos de mayor gasto
-- ej de uso: SELECT * FROM pedidos_proveedores_view
CREATE OR REPLACE VIEW pedidos_proveedores_view AS
(
SELECT 
    pp.id_pedido,
    pv.nombre AS proveedor,
    pp.producto,
    pp.cantidad,
    pp.precio,
    pp.cantidad * pp.precio AS total,
    pp.fecha
FROM pedidos_proveedores pp
JOIN proveedores pv ON pp.id_proveedor = pv.id_proveedor
)
ORDER BY total DESC;

-- PAGOS_VIEW
-- Vista que permite obtener métricas sobre la cantidad de veces que se utiliza cada método de pago
-- ej de uso: SELECT * FROM pagos_view
CREATE OR REPLACE VIEW pagos_view AS
(
SELECT
	m.nombre,
	COUNT(f.id_metodo) AS cantidad_metodo
FROM
	metodo_pago AS m
JOIN factura f ON m.id_metodo = f.id_metodo
GROUP BY m.nombre
ORDER BY cantidad_metodo DESC
);

-- HISTORIA_CLINICA_VIEW
-- Vista que muestra detalles de la historia clínica del paciente ordenado cronológicamente por antiguedad del paciente
-- ej de uso: SELECT * FROM historia_clinica_view where id_paciente = 5
CREATE OR REPLACE VIEW historia_clinica_view AS
(
SELECT 
    hc.id_hc AS id_historia_clinica,
    CONCAT(p.nombre, ' ', p.apellido) AS paciente,
    hc.id_paciente,
    hc.diagnostico,
    hc.antecedentes,
    hc.epicrisis,
    t.nombre AS tratamiento,
    CONCAT("Lic. ", pr.nombre, " ", pr.apellido) AS profesional,
    tu.fecha AS fecha_turno
FROM historia_clinica hc
JOIN pacientes p ON hc.id_paciente = p.id_paciente
JOIN turnos tu ON hc.id_paciente = tu.id_paciente
JOIN tratamientos t ON tu.id_tratamiento = t.id_tratamiento
JOIN profesionales pr ON tu.id_profesional = pr.id_profesional
ORDER BY fecha_turno
);