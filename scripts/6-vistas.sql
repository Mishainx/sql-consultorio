-- Script de creación de vistas

USE consultorio;

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

-- Vista que muestra detalles de la historia clínica del paciente ordenado cronológicamente por antiguedad del paciente
-- ej de uso: SELECT * FROM historia_clinica_view where id_paciente = 1
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





