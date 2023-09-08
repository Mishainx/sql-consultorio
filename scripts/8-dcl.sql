USE mysql;

CREATE USER IF NOT EXISTS 'user1'@'LOCALHOST' IDENTIFIED BY '123'; -- Crea el usuario "user1" y a continuación le setea el password 123
CREATE USER IF NOT EXISTS 'user2'@'LOCALHOST' IDENTIFIED BY '123'; -- Crea el usuario "user2" y a continuación le setea el password 123

GRANT SELECT, UPDATE, INSERT --  Asignación de permisos para visualizar, modificar e insertar al user1
ON *.* -- Rango 
TO 'user1'@'LOCALHOST';
REVOKE DELETE ON *.* FROM 'user1'@'LOCALHOST'; -- Si bien la facultad de borrar no ha sido configurada se setea una revocación de permiso para borrar explícita para garantizar la seguridad y la integridad de tus datos.

GRANT SELECT --  Asignación de permiso para visualizarr al user2
ON *.* 
TO 'user2'@'LOCALHOST';
REVOKE DELETE ON *.* FROM 'user2'@'LOCALHOST';

SELECT * FROM USER; -- Vista para comprobar la creación de los usuarios y sus atribuciones.