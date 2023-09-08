-- Script de creación triggers

USE consultorio;

DELIMITER $$

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
-- UPDATE turnos SET fecha  = '' WHERE id_paciente = 1;
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

CREATE TRIGGER 
tr_add_new_factura
AFTER INSERT ON consultorio.factura
FOR EACH ROW
INSERT INTO new_factura (id_factura,id_paciente,id_tratamiento, id_metodo,usuario, fecha_y_hora) VALUES
(NEW.id_factura, NEW.id_paciente, NEW.id_tratamiento, NEW.id_metodo,USER(),NOW())$$
DELIMITER ;
