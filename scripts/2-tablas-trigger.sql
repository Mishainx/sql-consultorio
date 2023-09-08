-- Script de creación de tablas para realizar logs de acciones en la DB
USE consultorio;

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