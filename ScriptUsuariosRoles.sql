/*
SCRIPT
3.5 Núcleo 5: Administración de acceso a BD
*/


--===============================
-- 3.5.1 Esquema de usuarios y roles
--===============================
-- Rol Admin
-- Tiene permisos de CRUD de todas las tablas, crear y eliminar usuarios y ejecutar procesos
CREATE ROLE ROL_ADMIN;

-- Permiso para conectarse
GRANT CREATE SESSION TO ROL_ADMIN;

GRANT SELECT, INSERT, UPDATE, DELETE ON Ciudad TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON ContenidoClasificacion TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Genero TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Plan TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Departamento TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Empleado TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Usuario TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Contenido TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Temporada TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Episodio TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Perfil TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Pago TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON PerfilFavoritos TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Calificacion TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reproduccion TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON Reporte TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON ContenidoAsociado TO ROL_ADMIN;
GRANT SELECT, INSERT, UPDATE, DELETE ON ContenidoGenero TO ROL_ADMIN;

GRANT SELECT ON MV_Contenido_Popular TO ROL_ADMIN;
GRANT SELECT ON MV_Ingresos_Mensuales TO ROL_ADMIN;

GRANT EXECUTE ON SP_REGISTRAR_USUARIO TO ROL_ADMIN;
GRANT EXECUTE ON SP_CAMBIAR_PLAN TO ROL_ADMIN;
GRANT EXECUTE ON SP_REPORTE_CONSUMO TO ROL_ADMIN;

GRANT CREATE USER TO ROL_ADMIN;
GRANT ALTER USER TO ROL_ADMIN;
GRANT DROP USER TO ROL_ADMIN;


-- Rol Analista
/*
    Este puede hacer SELECT en todas las tablas, ver las vistas materializadas
    y ejecutar SP_REPORTE_CONSUMO.
*/
CREATE ROLE ROL_ANALISTA;

GRANT CREATE SESSION TO ROL_ANALISTA;

GRANT SELECT ON Ciudad TO ROL_ANALISTA;
GRANT SELECT ON Usuario TO ROL_ANALISTA;
GRANT SELECT ON Plan TO ROL_ANALISTA;
GRANT SELECT ON Contenido TO ROL_ANALISTA;
GRANT SELECT ON Reproduccion TO ROL_ANALISTA;
GRANT SELECT ON Pago TO ROL_ANALISTA;
GRANT SELECT ON Perfil TO ROL_ANALISTA;
GRANT SELECT ON Calificacion TO ROL_ANALISTA;
GRANT SELECT ON Genero TO ROL_ANALISTA;
GRANT SELECT ON ContenidoGenero TO ROL_ANALISTA;
GRANT SELECT ON ContenidoClasificacion TO ROL_ANALISTA;
GRANT SELECT ON Temporada TO ROL_ANALISTA;
GRANT SELECT ON Episodio TO ROL_ANALISTA;
GRANT SELECT ON Reporte TO ROL_ANALISTA;

GRANT SELECT ON MV_Contenido_Popular TO ROL_ANALISTA;
GRANT SELECT ON MV_Ingresos_Mensuales TO ROL_ANALISTA;

GRANT EXECUTE ON SP_REPORTE_CONSUMO TO ROL_ANALISTA;

-- Rol Soporte
-- Este puede realizar SELECT, INSERT y UPDATE en Pago, además de realizar el procedimiento de SP_CAMBIAR_PLAN:
CREATE ROLE ROL_SOPORTE;

GRANT CREATE SESSION TO ROL_SOPORTE;

GRANT SELECT ON Usuario TO ROL_SOPORTE;
GRANT SELECT ON Perfil TO ROL_SOPORTE;
GRANT SELECT ON Pago TO ROL_SOPORTE;
GRANT SELECT ON Plan TO ROL_SOPORTE;

GRANT INSERT, UPDATE ON Pago TO ROL_SOPORTE;

GRANT EXECUTE ON SP_CAMBIAR_PLAN TO ROL_SOPORTE;

-- Rol Contenido
/*
    Este puede hacer CRUD con las tablas de Contenido, Temporada, Episodio y Género,
    además de SELECT en Reproducciones y Calificaciones.
*/
CREATE ROLE ROL_CONTENIDO;

GRANT CREATE SESSION TO ROL_CONTENIDO;

GRANT SELECT, INSERT, UPDATE, DELETE ON Contenido TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON Temporada TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON Episodio TO ROL_CONTENIDO;
GRANT SELECT, INSERT, UPDATE, DELETE ON Genero TO ROL_CONTENIDO;

GRANT SELECT ON Reproduccion TO ROL_CONTENIDO;
GRANT SELECT ON Calificacion TO ROL_CONTENIDO;


--===============================
-- 3.5.2 Implementación
--===============================
-- a) Crear usuarios por Rol
CREATE USER administrador IDENTIFIED BY admin123;
CREATE USER analista IDENTIFIED BY analista123;
CREATE USER soporte IDENTIFIED BY soporte123;
CREATE USER contenido IDENTIFIED BY contenido123;

-- b) Asignar privilegios (Roles)
GRANT ROL_ADMIN TO administrador;
GRANT ROL_ANALISTA TO analista;
GRANT ROL_SOPORTE TO soporte;
GRANT ROL_CONTENIDO TO contenido;

-- c) Probar acciones permitidas y no permitidas
----
-- Analista
----
-- Permitido
SELECT * FROM quindioflix.Usuario;

-- No permitido
INSERT INTO quindioflix.Usuario VALUES (100, 'Test', 'test@test.com', NULL, NULL, SYSDATE, NULL, 'ACTIVO', NULL, NULL, NULL, 'N');


----
-- Soporte
----
-- Permitido
BEGIN
    quindioflix.SP_CAMBIAR_PLAN(
        p_id_usuario => 1,
        p_nuevo_plan => 2
    );
END;
/

-- No permitido
DELETE FROM quindioflix.Pago WHERE id_Pago = 1;

----
-- Contenido
----
-- Permitido
UPDATE quindioflix.Episodio
SET nombre = 'Episodio Piloto - Editado'
WHERE id_episodio = 1;

-- No permitido
SELECT * FROM quindioflix.Usuario;

------------------
-- PROFILE
CREATE PROFILE PERFIL_SEGURIDAD LIMIT
    SESSIONS_PER_USER 2 -- Max sesiones concurrentes
    IDLE_TIME 5 -- Max tiempo inactividad en minutos
    FAILED_LOGIN_ATTEMPTS 3 -- Max intentos fallidos, si no se bloquea
    PASSWORD_LOCK_TIME 1; -- Se desbloquea en 1 dia
    
ALTER USER analista PROFILE PERFIL_SEGURIDAD;
ALTER USER soporte PROFILE PERFIL_SEGURIDAD;

/*
    Se creó un perfil de seguridad que limita el número de sesiones concurrentes,
    el tiempo de inactividad y los intentos fallidos de autenticación, fortaleciendo
    la seguridad del sistema y previniendo accesos indebidos.
*/



-- borrar (para pruebas)
DROP USER administrador CASCADE;
DROP USER analista CASCADE;
DROP USER soporte CASCADE;
DROP USER contenido CASCADE;

DROP ROLE ROL_ADMIN;
DROP ROLE ROL_ANALISTA;
DROP ROLE ROL_SOPORTE;
DROP ROLE ROL_CONTENIDO;

DROP PROFILE PERFIL_SEGURIDAD CASCADE;