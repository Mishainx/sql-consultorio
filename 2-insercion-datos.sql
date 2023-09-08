-- Script de inserción de datos

USE consultorio;

-- Tabla cobertura
INSERT INTO cobertura (nombre, tipo) VALUES
('OSDE', '210'),
('OSDE', '310'),
('Swiss Medical Group', 'Gold'),
('Swiss Medical Group', 'Platinum'),
('Particular', "Particular");


-- Tabla pacientes
INSERT INTO pacientes (id_cobertura, nombre, apellido, tipo_documento, documento) VALUES
(1, 'Lucía', 'Martínez', 'DNI', '20123456'),
(2, 'Martín', 'González', 'DNI', '30123456'),
(3, 'Sofía', 'Fernández', 'DNI', '40123456'),
(4, 'Mateo', 'López', 'DNI', '50123456'),
(5, 'Valentina', 'Rodríguez', 'DNI', '60123456'),
(1, 'Benjamín', 'Pérez', 'DNI', '70123456'),
(2, 'Isabella', 'Gómez', 'DNI', '80123456'),
(3, 'Thiago', 'Silva', 'DNI', '90123456'),
(4, 'Emma', 'Torres', 'DNI', '10123456'),
(5, 'Oliver', 'García', 'DNI', '11123456'),
(1, 'Mía', 'Martínez', 'DNI', '12123456'),
(2, 'Sebastián', 'López', 'DNI', '13123456'),
(3, 'Lucas', 'Fernández', 'DNI', '14123456'),
(4, 'Valentina', 'González', 'DNI', '15123456'),
(5, 'Alexander', 'Pérez', 'DNI', '16123456'),
(1, 'Renata', 'Rodríguez', 'DNI', '17123456'),
(2, 'Emilia', 'Gómez', 'DNI', '18123456'),
(3, 'Dylan', 'Silva', 'DNI', '19123456'),
(4, 'Mariano', 'Torres', 'DNI', '20123457'),
(5, 'Joaquín', 'García', 'DNI', '21123457');

-- Tabla profesionales
INSERT INTO profesionales (nombre, apellido, tipo_documento, documento, cuit) VALUES
('Juan', 'Gómez', 'DNI', '10123456', '20-10123456-9'),
('María', 'López', 'DNI', '20234567', '20-20234567-5'),
('Carlos', 'Rodríguez', 'DNI', '30345678', '20-30345678-4'),
('Laura', 'Fernández', 'DNI', '40456789', '20-40456789-3'),
('Martín', 'Pérez', 'DNI', '50567890', '20-50567890-2'),
('Ana', 'González', 'DNI', '60678901', '20-60678901-1'),
('José', 'Martínez', 'DNI', '70789012', '20-70789012-0'),
('Sofía', 'García', 'DNI', '80890123', '20-80890123-9'),
('Diego', 'Silva', 'DNI', '90901234', '20-90901234-8'),
('Valentina', 'Torres', 'DNI', '10111223', '20-10111223-7');

-- Tabla auxiliares profesionales
INSERT INTO profesionales_auxiliares (especialidad, nombre, apellido, tipo_documento, documento, cuit) VALUES
('Odontología', 'María', 'Gómez', 'DNI', '10123456', '20-20234567-5'),
('Psicología', 'Carlos', 'Rodríguez', 'DNI', '30345678', '20-40456789-3'),
('Nutrición', 'Laura', 'Fernández', 'DNI', '40456789', '20-50567890-2'),
('Gastroenterología', 'Ana', 'González', 'DNI', '60678901', '20-60678901-1'),
('Fonoaudiología', 'José', 'Martínez', 'DNI', '70789012', '20-70789012-0');

-- Tabla proveedores
INSERT INTO proveedores (rubro, nombre, cuit) VALUES
('Limpieza', 'LimpiezaTotal S.A.', '20-20234567-5'),
('Crema', 'BellezaCrema S.R.L.', '20-40456789-3'),
('Equipos', 'TecnologíaEquipos S.A.', '20-60678901-2'),
('Oficina', 'OficinaPráctica S.R.L.', '20-80890123-4'),
('Limpieza', 'LimpiezaExpress S.A.', '20-10111223-6');

-- Tabla telefonos
INSERT INTO telefonos (id_profesional, id_paciente, id_proveedor, id_profesional_auxiliar, numero) VALUES
    (1, NULL, NULL, NULL, '+5491123456701'),
    (2, NULL, NULL, NULL, '+5491123456702'),
    (3, NULL, NULL, NULL, '+5491123456703'),
    (4, NULL, NULL, NULL, '+5491123456704'),
    (5, NULL, NULL, NULL, '+5491123456705'),
    (6, NULL, NULL, NULL, '+5491123456706'),
    (7, NULL, NULL, NULL, '+5491123456707'),
    (8, NULL, NULL, NULL, '+5491123456708'),
    (9, NULL, NULL, NULL, '+5491123456709'),
    (10, NULL, NULL, NULL, '+5491123456710'),
    (NULL, 1, NULL, NULL, '+5491123456711'),
    (NULL, 2, NULL, NULL, '+5491123456712'),
    (NULL, 3, NULL, NULL, '+5491123456713'),
    (NULL, 4, NULL, NULL, '+5491123456714'),
    (NULL, 5, NULL, NULL, '+5491123456715'),
    (NULL, 6, NULL, NULL, '+5491123456716'),
    (NULL, 7, NULL, NULL, '+5491123456717'),
    (NULL, 8, NULL, NULL, '+5491123456718'),
    (NULL, 9, NULL, NULL, '+5491123456719'),
    (NULL, 10, NULL, NULL, '+5491123456720'),
	(NULL, 11, NULL, NULL, '+5491123456721'),
    (NULL, 12, NULL, NULL, '+5491123456722'),
    (NULL, 13, NULL, NULL, '+5491123456723'),
    (NULL, 14, NULL, NULL, '+5491123456724'),
    (NULL, 15, NULL, NULL, '+5491123456725'),
    (NULL, 16, NULL, NULL, '+5491123456726'),
    (NULL, 17, NULL, NULL, '+5491123456727'),
    (NULL, 18, NULL, NULL, '+5491123456728'),
    (NULL, 19, NULL, NULL, '+5491123456729'),
    (NULL, 20, NULL, NULL, '+5491123456730'),
    (NULL, NULL, 1, NULL, '+5491123456731'),
    (NULL, NULL, 2, NULL, '+5491123456732'),
    (NULL, NULL, 3, NULL, '+5491123456733'),
    (NULL, NULL, 4, NULL, '+5491123456734'),
    (NULL, NULL, 5, NULL, '+549112345635'),
    (NULL, NULL, NULL, 1, '+5491123456736'),
    (NULL, NULL, NULL, 2, '+5491123456737'),
    (NULL, NULL, NULL, 3, '+5491123456738'),
    (NULL, NULL, NULL, 4, '+5491123456739'),
    (NULL, NULL, NULL, 5, '+5491123456740');
    
-- Tabla email
INSERT INTO email (id_profesional, id_paciente, id_proveedor, id_profesional_auxiliar, email) VALUES
    (1, NULL, NULL, NULL, 'juan.gomez@gmail.com'),
    (2, NULL, NULL, NULL, 'maria.lopez@hotmail.com'),
    (3, NULL, NULL, NULL, 'carlos.rodriguez@yahoo.com'),
    (4, NULL, NULL, NULL, 'laura.fernandez@gmail.com'),
    (5, NULL, NULL, NULL, 'martin.perez@hotmail.com'),
    (6, NULL, NULL, NULL, 'ana.gonzalez@yahoo.com'),
    (7, NULL, NULL, NULL, 'jose.martinez@gmail.com'),
    (8, NULL, NULL, NULL, 'sofia.garcia@hotmail.com'),
    (9, NULL, NULL, NULL, 'diego.silva@yahoo.com'),
    (10, NULL, NULL, NULL, 'valentina.torres@gmail.com'),
    (NULL, 1, NULL, NULL, 'lucia.martinez@hotmail.com'),
    (NULL, 2, NULL, NULL, 'martin.gonzalez@yahoo.com'),
    (NULL, 3, NULL, NULL, 'sofia.fernandez@gmail.com'),
    (NULL, 4, NULL, NULL, 'mateo.lopez@hotmail.com'),
    (NULL, 5, NULL, NULL, 'valentina.rodriguez@yahoo.com'),
    (NULL, 6, NULL, NULL, 'benjamin.perez@gmail.com'),
    (NULL, 7, NULL, NULL, 'isabella.gomez@hotmail.com'),
    (NULL, 8, NULL, NULL, 'thiago.silva@yahoo.com'),
    (NULL, 9, NULL, NULL, 'emma.torres@gmail.com'),
    (NULL, 10, NULL, NULL, 'oliver.garcia@hotmail.com'),
    (NULL, 11, NULL, NULL, 'mia.martinez@yahoo.com'),
    (NULL, 12, NULL, NULL, 'sebastian.lopez@gmail.com'),
    (NULL, 13, NULL, NULL, 'lucas.fernandez@hotmail.com'),
    (NULL, 14, NULL, NULL, 'valentina.gonzalez@yahoo.com'),
    (NULL, 15, NULL, NULL, 'alexander.perez@gmail.com'),
    (NULL, 16, NULL, NULL, 'renata.rodriguez@hotmail.com'),
    (NULL, 17, NULL, NULL, 'emilia.gomez@yahoo.com'),
    (NULL, 18, NULL, NULL, 'dylan.silva@gmail.com'),
    (NULL, 19, NULL, NULL, 'mariano.torres@hotmail.com'),
    (NULL, 20, NULL, NULL, 'joaquin.garcia@yahoo.com'),
    (NULL, NULL, 1, NULL, 'limpieza.total@gmail.com'),
    (NULL, NULL, 2, NULL, 'belleza.crema@hotmail.com'),
    (NULL, NULL, 3, NULL, 'tecnologia.equipos@yahoo.com'),
    (NULL, NULL, 4, NULL, 'oficina.practica@gmail.com'),
    (NULL, NULL, 5, NULL, 'limpieza.express@hotmail.com'),
    (NULL, NULL, NULL, 1, 'maria.gomez@gmail.com'),
    (NULL, NULL, NULL, 2, 'carlos.rodriguez@hotmail.com'),
    (NULL, NULL, NULL, 3, 'laura.fernandez@yahoo.com'),
    (NULL, NULL, NULL, 4, 'ana.gonzalez@gmail.com'),
    (NULL, NULL, NULL, 5, 'jose.martinez@hotmail.com');

    
INSERT INTO direccion (id_profesional, id_paciente, id_proveedor, id_profesional_auxiliar, direccion) VALUES
(1, NULL, NULL, NULL, 'Av. Corrientes 123, CABA'),
(2, NULL, NULL, NULL, 'Calle Florida 456, CABA'),
(3, NULL, NULL, NULL, 'Av. Santa Fe 789, CABA'),
(4, NULL, NULL, NULL, 'Calle Maipú 101, CABA'),
(5, NULL, NULL, NULL, 'Av. Rivadavia 234, CABA'),
(6, NULL, NULL, NULL, 'Calle Uruguay 567, CABA'),
(7, NULL, NULL, NULL, 'Av. Corrientes 890, CABA'),
(8, NULL, NULL, NULL, 'Calle Lavalle 1111, CABA'),
(9, NULL, NULL, NULL, 'Av. Santa Fe 1212, CABA'),
(10, NULL, NULL, NULL, 'Calle Florida 1313, CABA'),
(NULL, 1, NULL, NULL, 'Av. Corrientes 555, CABA'),
(NULL, 2, NULL, NULL, 'Calle Lavalle 777, CABA'),
(NULL, 3, NULL, NULL, 'Av. Rivadavia 999, CABA'),
(NULL, 4, NULL, NULL, 'Calle Maipú 222, CABA'),
(NULL, 5, NULL, NULL, 'Av. Santa Fe 444, CABA'),
(NULL, 6, NULL, NULL, 'Calle Florida 666, CABA'),
(NULL, 7, NULL, NULL, 'Av. Corrientes 888, CABA'),
(NULL, 8, NULL, NULL, 'Calle Lavalle 1010, CABA'),
(NULL, 9, NULL, NULL, 'Av. Santa Fe 1212, CABA'),
(NULL, 10, NULL, NULL, 'Calle Maipú 1313, CABA'),
(NULL, 11, NULL, NULL, 'Av. Corrientes 555, CABA'),
(NULL, 12, NULL, NULL, 'Calle Florida 777, CABA'),
(NULL, 13, NULL, NULL, 'Av. Rivadavia 999, CABA'),
(NULL, 14, NULL, NULL, 'Calle Lavalle 222, CABA'),
(NULL, 15, NULL, NULL, 'Av. Santa Fe 444, CABA'),
(NULL, 16, NULL, NULL, 'Calle Maipú 666, CABA'),
(NULL, 17, NULL, NULL, 'Av. Corrientes 888, CABA'),
(NULL, 18, NULL, NULL, 'Calle Florida 1010, CABA'),
(NULL, 19, NULL, NULL, 'Av. Rivadavia 1212, CABA'),
(NULL, 20, NULL, NULL, 'Calle Lavalle 1313, CABA'),
(NULL, NULL, 1, NULL, 'Av. Provincia 123, Gran Buenos Aires'),
(NULL, NULL, 2, NULL, 'Calle Provincia 456, Gran Buenos Aires'),
(NULL, NULL, 3, NULL, 'Av. Provincia 789, Gran Buenos Aires'),
(NULL, NULL, 4, NULL, 'Calle Provincia 101, Gran Buenos Aires'),
(NULL, NULL, 5, NULL, 'Av. Provincia 234, Gran Buenos Aires'),
(NULL, NULL, NULL, 1, 'Calle Gran Buenos Aires 567'),
(NULL, NULL, NULL, 2, 'Av. Gran Buenos Aires 890'),
(NULL, NULL, NULL, 3, 'Calle Gran Buenos Aires 1111'),
(NULL, NULL, NULL, 4, 'Av. Gran Buenos Aires 1212'),
(NULL, NULL, NULL, 5, 'Calle Gran Buenos Aires 1313');

-- Tabla títulos
INSERT INTO consultorio.titulos (nombre, institucion) VALUES
('Licenciado en Kinesiología y Fisiatría', 'UBA'),
('Licenciado en Kinesiología y Fisioterapia', 'UADE'),
('Licenciado en Kinesiología y Fisioterapia', 'USAL'),
('Licenciado en Kinesiología ', 'Barceló'),
('Especialista en Reeducación Postural Global', 'UBA'),
('Especialista en Reeducación Postural Global', 'UADE');

-- Tabla tratamientos
INSERT INTO consultorio.tratamientos (nombre, descripcion, duracion, precio) VALUES
('Rpg', 'Terapia de RPG para el tratamiento de problemas musculares y posturales.', 60, 100.00),
('Osteopatía', 'Terapia osteopática para mejorar la movilidad y aliviar el dolor.', 45, 80.00),
('Acupuntura', 'Tratamiento de acupuntura para el alivio del dolor y el equilibrio energético.', 30, 70.00),
('Kinesiología', 'Tratamiento kinesiológico para la rehabilitación y mejora de la movilidad.', 50, 90.00),
('Drenaje linfático', 'Técnica de drenaje linfático para reducir la retención de líquidos.', 40, 85.00);

-- Tabla métodos de pago
INSERT INTO consultorio.metodo_pago (nombre) VALUES
('Efectivo'),
('Transferencia Bancaria'),
('Mercado pago'),
('Débito');

-- Tabla historia clínica
INSERT INTO consultorio.historia_clinica (id_paciente, diagnostico, antecedentes, epicrisis) VALUES
(1, 'Fractura de tobillo derecho', 'El paciente sufrió una caída mientras practicaba deporte.', 'Se realizó una reducción cerrada y se colocó una férula.'),
(2, 'Esguince de rodilla izquierda', 'El paciente torció su rodilla durante una actividad física.', 'Se aplicó hielo y se recomendó reposo.'),
(3, 'Luxación de hombro', 'El paciente sufrió una caída sobre su brazo extendido.', 'Se realizó una reducción manual y se colocó un cabestrillo.'),
(4, 'Fractura de muñeca derecha', 'El paciente cayó sobre su mano extendida.', 'Se realizó una reducción abierta y se inmovilizó la muñeca.'),
(5, 'Lesión de menisco', 'El paciente sintió un dolor agudo mientras giraba su rodilla.', 'Se recomendó fisioterapia y se evitó actividad física intensa.'),
(6, 'Fractura de clavícula izquierda', 'El paciente cayó de su bicicleta.', 'Se utilizó un cabestrillo para inmovilizar la clavícula fracturada.'),
(7, 'Esguince de tobillo izquierdo', 'El paciente torció su tobillo al caminar en una superficie irregular.', 'Se aplicó hielo y se recomendó reposo y elevación.'),
(8, 'Lesión de ligamento cruzado anterior', 'El paciente sufrió un giro brusco de su rodilla durante un partido de fútbol.', 'Se recomendó cirugía y rehabilitación.'),
(9, 'Fractura de fémur derecho', 'El paciente estuvo involucrado en un accidente automovilístico.', 'Se realizó una cirugía para fijar la fractura.'),
(10, 'Esguince de muñeca izquierda', 'El paciente cayó sobre su mano al tropezar.', 'Se inmovilizó la muñeca con una férula.'),
(11, 'Fractura de clavícula derecha', 'El paciente cayó sobre su hombro durante un juego de rugby.', 'Se utilizó un cabestrillo para inmovilizar la clavícula fracturada.'),
(12, 'Esguince de tobillo derecho', 'El paciente torció su tobillo al pisar un objeto en el suelo.', 'Se aplicó hielo y se recomendó reposo.'),
(13, 'Luxación de codo izquierdo', 'El paciente sufrió una caída sobre su brazo extendido.', 'Se realizó una reducción manual y se inmovilizó el codo.'),
(14, 'Fractura de tibia izquierda', 'El paciente sufrió un golpe directo en su pierna durante un partido de fútbol.', 'Se recomendó cirugía para corregir la fractura.'),
(15, 'Esguince de rodilla derecha', 'El paciente torció su rodilla al bajar escaleras.', 'Se aplicó hielo y se recomendó reposo y elevación.'),
(16, 'Fractura de muñeca izquierda', 'El paciente cayó sobre su mano extendida.', 'Se realizó una reducción abierta y se inmovilizó la muñeca.'),
(17, 'Lesión de menisco', 'El paciente sintió un dolor agudo mientras practicaba deporte.', 'Se recomendó fisioterapia y se evitó actividad física intensa.'),
(18, 'Fractura de tobillo izquierdo', 'El paciente sufrió una caída mientras caminaba en la calle.', 'Se realizó una reducción cerrada y se colocó una férula.'),
(19, 'Esguince de muñeca derecha', 'El paciente torció su muñeca al realizar una actividad física.', 'Se inmovilizó la muñeca con una férula.'),
(20, 'Luxación de hombro', 'El paciente sufrió una caída sobre su brazo extendido.', 'Se realizó una reducción manual y se colocó un cabestrillo.');

-- tabla turnos
INSERT INTO consultorio.turnos (id_paciente, id_tratamiento, id_profesional, fecha) VALUES
(1, 1, 1, '2023-07-23 10:00:00'),
(2, 2, 2, '2023-07-23 11:30:00'),
(3, 3, 3, '2023-07-23 13:00:00'),
(4, 4, 4, '2023-07-23 14:30:00'),
(5, 5, 5, '2023-07-23 16:00:00'),
(6, 1, 6, '2023-07-24 10:00:00'),
(7, 2, 7, '2023-07-24 11:30:00'),
(8, 3, 8, '2023-07-24 13:00:00'),
(9, 4, 9, '2023-07-24 14:30:00'),
(10, 5, 10, '2023-07-24 16:00:00'),
(11, 1, 1, '2023-07-25 10:00:00'),
(12, 2, 2, '2023-07-25 11:30:00'),
(13, 3, 3, '2023-07-25 13:00:00'),
(14, 4, 4, '2023-07-25 14:30:00'),
(15, 5, 5, '2023-07-25 16:00:00'),
(16, 1, 6, '2023-07-26 10:00:00'),
(17, 2, 7, '2023-07-26 11:30:00'),
(18, 3, 8, '2023-07-26 13:00:00'),
(19, 4, 9, '2023-07-26 14:30:00'),
(20, 5, 10, '2023-07-26 16:00:00');

-- tabla títulos_profesional
INSERT INTO consultorio.titulos_profesional (id_profesional, id_titulo) VALUES
(1, 1),
(1,6),
(2,5),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

-- tabla tratamientos_profesional
INSERT INTO consultorio.tratamientos_profesional (id_profesional, id_tratamiento) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 3),
(3, 5),
(4, 1),
(4, 2),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 4),
(6, 5),
(7, 2),
(7, 3),
(7, 4),
(8, 1),
(8, 3),
(8, 5),
(9, 1),
(9, 2),
(9, 4),
(10, 1),
(10, 5);

-- Tabla factura
INSERT INTO consultorio.factura (id_paciente, id_tratamiento, id_metodo) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 1),
(6, 1, 2),
(7, 2, 3),
(8, 3, 4),
(9, 4, 1),
(10, 5, 2),
(11, 1, 3),
(12, 2, 4),
(13, 3, 1),
(14, 4, 2),
(15, 5, 3),
(16, 1, 4),
(17, 2, 1),
(18, 3, 2),
(19, 4, 3),
(20, 5, 4);

-- Tabla pedidos_proveedores
INSERT INTO consultorio.pedidos_proveedores (id_proveedor, producto, cantidad, precio, fecha) VALUES
(1, 'Toallas desinfectantes', 100, 250.00, '2023-07-23 10:00:00'),
(2, 'Mascarillas', 500, 120.00, '2023-07-24 11:30:00'),
(3, 'Batas quirúrgicas', 200, 300.00, '2023-07-25 13:00:00'),
(4, 'Guantes de látex', 1000, 50.00, '2023-07-26 14:30:00'),
(5, 'Alcohol en gel', 300, 80.00, '2023-07-27 16:00:00'),
(1, 'Vendas elásticas', 150, 180.00, '2023-07-28 10:00:00'),
(2, 'Gasas estériles', 300, 90.00, '2023-07-29 11:30:00'),
(3, 'Jeringas descartables', 500, 70.00, '2023-07-30 13:00:00'),
(4, 'Tijeras quirúrgicas', 50, 200.00, '2023-07-31 14:30:00'),
(5, 'Apósitos adhesivos', 200, 100.00, '2023-08-01 16:00:00'),
(1, 'Gasa de algodón', 400, 120.00, '2023-08-02 10:00:00'),
(2, 'Vendas de yeso', 100, 150.00, '2023-08-03 11:30:00'),
(3, 'Apósitos no adhesivos', 300, 80.00, '2023-08-04 13:00:00'),
(4, 'Compresas frías/calientes', 200, 160.00, '2023-08-05 14:30:00'),
(5, 'Termómetros digitales', 50, 70.00, '2023-08-06 16:00:00');

-- Tabla sesiones
INSERT INTO consultorio.sesiones (id_turno, id_hc, descripcion) VALUES
(1, 1, 'Sesión de RPG para tratamiento de fractura de tobillo derecho.'),
(2, 2, 'Sesión de osteopatía para tratamiento de esguince de rodilla izquierda.'),
(3, 3, 'Sesión de acupuntura para alivio del dolor en luxación de hombro.'),
(4, 4, 'Sesión de kinesiología para rehabilitación de fractura de muñeca derecha.'),
(5, 5, 'Sesión de drenaje linfático para reducción de retención de líquidos.'),
(6, 6, 'Sesión de RPG para tratamiento de fractura de clavícula izquierda.'),
(7, 7, 'Sesión de osteopatía para tratamiento de esguince de tobillo izquierdo.'),
(8, 8, 'Sesión de acupuntura para alivio del dolor en lesión de ligamento cruzado anterior.'),
(9, 9, 'Sesión de kinesiología para rehabilitación de fractura de fémur derecho.'),
(10, 10, 'Sesión de drenaje linfático para reducción de retención de líquidos.'),
(11, 11, 'Sesión de RPG para tratamiento de fractura de clavícula derecha.'),
(12, 12, 'Sesión de osteopatía para tratamiento de esguince de tobillo derecho.'),
(13, 13, 'Sesión de acupuntura para alivio del dolor en luxación de codo izquierdo.'),
(14, 14, 'Sesión de kinesiología para rehabilitación de fractura de tibia izquierda.'),
(15, 15, 'Sesión de drenaje linfático para reducción de retención de líquidos.'),
(16, 16, 'Sesión de RPG para tratamiento de fractura de muñeca izquierda.'),
(17, 17, 'Sesión de osteopatía para tratamiento de esguince de rodilla derecha.'),
(18, 18, 'Sesión de acupuntura para alivio del dolor en fractura de tobillo izquierdo.'),
(19, 19, 'Sesión de kinesiología para rehabilitación de fractura de muñeca derecha.'),
(20, 20, 'Sesión de drenaje linfático para reducción de retención de líquidos.');







