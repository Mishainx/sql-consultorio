USE consultorio;

DELIMITER $$

START TRANSACTION$$

DELETE FROM pacientes
WHERE id_paciente <5$$
ROLLBACK$$ -- Sentencia rollback para deshacer los cambios
-- COMMIT$$ -- Senetncia commit para concretar el cambio

-- SELECT * FROM pacientes para comprobar si impactaron los cambios o no

START TRANSACTION $$
INSERT INTO consultorio.turnos (id_paciente, id_tratamiento, id_profesional, fecha) VALUES
(5, 1, 5, '2023-07-23 16:00:00'),
(6, 3, 6, '2023-07-23 17:30:00'),
(7, 2, 7, '2023-07-24 10:00:00'),
(8, 1, 8, '2023-07-24 11:30:00')$$
SAVEPOINT lote_1$$

INSERT INTO consultorio.turnos (id_paciente, id_tratamiento, id_profesional, fecha) VALUES
(9, 2, 9, '2023-07-24 13:00:00'),
(10, 3, 10, '2023-07-24 14:30:00'),
(11, 4, 1, '2023-07-25 10:00:00'),
(12, 5, 2, '2023-07-25 11:30:00')$$

SAVEPOINT lote_2$$

RELEASE SAVEPOINT lote_1$$
-- ROLLBACK TO lote_1$$
ROLLBACK$$
-- COMMIT$$

SELECT * FROM turnos$$

DELIMITER ;

