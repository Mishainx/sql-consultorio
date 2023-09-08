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
