/*
SCRIPT
Creacion de Tablespaces y Tablas
*/


------------------------------------------
-- ELIMINAR TABLAS Y TABLESPACES ANTES DE EMPEZAR
-- Solo para empezar de cero
------------------------------------------
DROP TABLE ContenidoGenero CASCADE CONSTRAINTS;
DROP TABLE ContenidoAsociado CASCADE CONSTRAINTS;
DROP TABLE Reporte CASCADE CONSTRAINTS;
DROP TABLE Reproduccion CASCADE CONSTRAINTS;
DROP TABLE Calificacion CASCADE CONSTRAINTS;
DROP TABLE PerfilFavoritos CASCADE CONSTRAINTS;
DROP TABLE Pago CASCADE CONSTRAINTS;
DROP TABLE Perfil CASCADE CONSTRAINTS;
DROP TABLE Episodio CASCADE CONSTRAINTS;
DROP TABLE Temporada CASCADE CONSTRAINTS;
DROP TABLE Contenido CASCADE CONSTRAINTS;
DROP TABLE Usuario CASCADE CONSTRAINTS;
DROP TABLE Empleado CASCADE CONSTRAINTS;
DROP TABLE Departamento CASCADE CONSTRAINTS;
DROP TABLE Plan CASCADE CONSTRAINTS;
DROP TABLE Genero CASCADE CONSTRAINTS;
DROP TABLE ContenidoClasificacion CASCADE CONSTRAINTS;
DROP TABLE Ciudad CASCADE CONSTRAINTS;

DROP TABLESPACE TS_REPRO_2026 INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
DROP TABLESPACE TS_REPRO_2025 INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
DROP TABLESPACE TS_REPRO_2024 INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
DROP TABLESPACE TS_TRANSACCIONAL INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
DROP TABLESPACE TS_ADMIN INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;
DROP TABLESPACE TS_CORE INCLUDING CONTENTS AND DATAFILES CASCADE CONSTRAINTS;

-----------------------------------------
-- 1. CREACIÓN DE TABLESPACES
------------------------------------------

-- Tablespace para datos principales (catálogos y entidades base)
CREATE TABLESPACE TS_CORE
DATAFILE 'ts_core.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

-- Tablespace para datos transaccionales (alto volumen)
CREATE TABLESPACE TS_TRANSACCIONAL
DATAFILE 'ts_transaccional.dbf'
SIZE 200M
AUTOEXTEND ON NEXT 20M MAXSIZE 1G;

-- Tablespace administrativo (empleados y estructura interna)
CREATE TABLESPACE TS_ADMIN
DATAFILE 'ts_admin.dbf'
SIZE 50M
AUTOEXTEND ON NEXT 5M MAXSIZE 200M;

-- Tablespaces para partición por año de reproducciones
CREATE TABLESPACE TS_REPRO_2024
DATAFILE 'ts_repro_2024.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

CREATE TABLESPACE TS_REPRO_2025
DATAFILE 'ts_repro_2025.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

CREATE TABLESPACE TS_REPRO_2026
DATAFILE 'ts_repro_2026.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 500M;

---------------------------------
-- 2. TABLAS BASE (TS_CORE)
---------------------------------
CREATE TABLE Ciudad (
    id_Ciudad INTEGER PRIMARY KEY,
    nombre VARCHAR2(50)
)TABLESPACE TS_CORE;

CREATE TABLE ContenidoClasificacion (
    id_ContenidoClasificacion INTEGER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
)TABLESPACE TS_CORE;

CREATE TABLE Genero (
    id_Genero INTEGER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
)TABLESPACE TS_CORE;

CREATE TABLE Plan (
    id_Plan INTEGER PRIMARY KEY,
    nombre VARCHAR2(50),
    max_pantallas INTEGER,
    calidad VARCHAR2(50),
    precio_mes NUMBER(10,2)
)TABLESPACE TS_CORE;

---------------------------------
-- 3. TABLAS EMPLEADOS Y USUARIOS
---------------------------------
-- Departamento en TS_ADMIN
CREATE TABLE Departamento (
    id_Departamento INTEGER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    id_Jefe INTEGER
) TABLESPACE TS_ADMIN;

-- Empleado en TS_ADMIN
CREATE TABLE Empleado (
    id_Empleado INTEGER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) UNIQUE,
    id_Departamento INTEGER,
    id_Supervisor INTEGER
) TABLESPACE TS_ADMIN;

-- Usuario en TS_CORE
CREATE TABLE Usuario (
    id_Usuario INTEGER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) UNIQUE,
    telefono VARCHAR2(20),
    fecha_nacimiento DATE,
    fecha_registro DATE,
    fecha_ultimo_pago DATE,
    estado_cuenta VARCHAR2(20) DEFAULT 'INACTIVO' CHECK (estado_cuenta IN ('ACTIVO','INACTIVO')),
    id_Plan INTEGER,
    id_Ciudad INTEGER,
    id_Referido INTEGER,
    referido_activo CHAR(1) CHECK (referido_activo IN ('S','N'))
) TABLESPACE TS_CORE;

---------------------------------
-- 4. CONTENIDO Y RELACIONADOS (TS_CORE)
---------------------------------
CREATE TABLE Contenido (
    id_Contenido INTEGER PRIMARY KEY,
    titulo VARCHAR2(50) NOT NULL,
    tipo_contenido VARCHAR2(20) CHECK (tipo_contenido IN ('PELICULA','SERIE','DOCUMENTAL','MUSICA','PODCAST')),
    fecha_lanzamiento DATE,
    duracion INTEGER,
    sinopsis VARCHAR2(300),
    fecha_agregado DATE,
    popularidad INTEGER DEFAULT 0,
    id_ContenidoClasificacion INTEGER,
    es_original CHAR(1) CHECK (es_original IN ('S','N')),
    id_Empleado INTEGER
)TABLESPACE TS_CORE;

CREATE TABLE Temporada (
    id_Temporada INTEGER PRIMARY KEY,
    nombre VARCHAR2(50),
    id_Contenido INTEGER
)TABLESPACE TS_CORE;

CREATE TABLE Episodio (
    id_Episodio INTEGER PRIMARY KEY,
    nombre VARCHAR2(50),
    id_Temporada INTEGER
)TABLESPACE TS_CORE;

---------------------------------
-- 5. PERFIL, PAGO, REPORTE (TS_TRANSACCIONAL)
---------------------------------
CREATE TABLE Perfil (
    id_Perfil INTEGER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL,
    avatar VARCHAR2(100),
    tipo VARCHAR2(50) NOT NULL CHECK (tipo IN ('ADULTO','INFANTIL')),
    id_Usuario INTEGER
)TABLESPACE TS_TRANSACCIONAL;

CREATE TABLE Pago (
    id_Pago INTEGER PRIMARY KEY,
    fecha DATE,
    monto NUMBER(10,2) NOT NULL,
    metodo VARCHAR2(50),
    estado VARCHAR2(50) CHECK (estado IN ('PAGADO','PENDIENTE','FALLIDO')),
    id_Usuario INTEGER
)TABLESPACE TS_TRANSACCIONAL;

CREATE TABLE PerfilFavoritos (
    id_Perfil INTEGER,
    id_Contenido INTEGER,
    PRIMARY KEY (id_Perfil, id_Contenido)
)TABLESPACE TS_TRANSACCIONAL;

CREATE TABLE Calificacion (
    id_Calificacion INTEGER PRIMARY KEY,
    id_Perfil INTEGER,
    id_Contenido INTEGER,
    estrellas INTEGER CHECK (estrellas BETWEEN 1 AND 5),
    resena VARCHAR2(300),
    fecha DATE
) TABLESPACE TS_TRANSACCIONAL;

------------------------------------------------
-- 6. TABLA REPRODUCCION PARTICIONADA
------------------------------------------------
/*
Fragmentación por rango de fechas.
Cada año se almacena en un tablespace distinto.
*/

CREATE TABLE Reproduccion (
    id_Reproduccion INTEGER,
    fecha_hora_inicio DATE NOT NULL,
    fecha_hora_fin DATE,
    dispositivo VARCHAR2(50),
    porcentaje_avance INTEGER,
    id_Contenido INTEGER,
    id_Perfil INTEGER,
    id_Episodio INTEGER,
    PRIMARY KEY (id_Reproduccion)
)
PARTITION BY RANGE (fecha_hora_inicio)
(
    PARTITION repro_2024 VALUES LESS THAN (DATE '2025-01-01')
    TABLESPACE TS_REPRO_2024,

    PARTITION repro_2025 VALUES LESS THAN (DATE '2026-01-01')
    TABLESPACE TS_REPRO_2025,
    
    PARTITION repro_2026 VALUES LESS THAN (DATE '2027-01-01')
    TABLESPACE TS_REPRO_2026
);

--------------------------------
-- 7. OTRAS TABLAS
--------------------------------
CREATE TABLE Reporte (
    id_Reporte INTEGER PRIMARY KEY,
    descripcion VARCHAR2(300),
    estado VARCHAR2(20),
    fecha DATE,
    resolucion DATE,
    id_Contenido INTEGER,
    id_Usuario INTEGER,
    id_Empleado INTEGER
)TABLESPACE TS_TRANSACCIONAL;

CREATE TABLE ContenidoAsociado (
    id_Original INTEGER,
    id_Asociado INTEGER,
    tipo_relacion VARCHAR2(20),
    PRIMARY KEY (id_Original, id_Asociado)
)TABLESPACE TS_CORE;

CREATE TABLE ContenidoGenero (
    id_Contenido INTEGER,
    id_Genero INTEGER,
    PRIMARY KEY (id_Contenido, id_Genero)
) TABLESPACE TS_CORE;

---------------------------------
-- 8. FOREIGN KEYS
---------------------------------

-- Usuario
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Plan
FOREIGN KEY (id_Plan) REFERENCES Plan(id_Plan);

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Ciudad
FOREIGN KEY (id_Ciudad) REFERENCES Ciudad(id_Ciudad);

ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_Referido
FOREIGN KEY (id_Referido) REFERENCES Usuario(id_Usuario);

-- Empleado
ALTER TABLE Empleado ADD CONSTRAINT FK_Empleado_Departamento
FOREIGN KEY (id_Departamento) REFERENCES Departamento(id_Departamento);

ALTER TABLE Empleado ADD CONSTRAINT FK_Empleado_Jefe
FOREIGN KEY (id_Supervisor) REFERENCES Empleado(id_Empleado);

-- Departamento
ALTER TABLE Departamento ADD CONSTRAINT FK_Departamento_Jefe
FOREIGN KEY (id_Jefe) REFERENCES Empleado(id_Empleado);

-- Contenido
ALTER TABLE Contenido ADD CONSTRAINT FK_Contenido_Clasificacion
FOREIGN KEY (id_ContenidoClasificacion) REFERENCES ContenidoClasificacion(id_ContenidoClasificacion);

ALTER TABLE Contenido ADD CONSTRAINT FK_Contenido_Empleado
FOREIGN KEY (id_Empleado) REFERENCES Empleado(id_Empleado);

-- Temporada / Episodio
ALTER TABLE Temporada ADD CONSTRAINT FK_Temporada_Contenido
FOREIGN KEY (id_Contenido) REFERENCES Contenido(id_Contenido);

ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_Temporada
FOREIGN KEY (id_Temporada) REFERENCES Temporada(id_Temporada);

-- Perfil / Pago
ALTER TABLE Perfil ADD CONSTRAINT FK_Perfil_Usuario
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario);

ALTER TABLE Pago ADD CONSTRAINT FK_Pago_Usuario
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario);

-- Favoritos
ALTER TABLE PerfilFavoritos ADD CONSTRAINT FK_Fav_Perfil
FOREIGN KEY (id_Perfil) REFERENCES Perfil(id_Perfil);

ALTER TABLE PerfilFavoritos ADD CONSTRAINT FK_Fav_Contenido
FOREIGN KEY (id_Contenido) REFERENCES Contenido(id_Contenido);

-- Reproduccion
ALTER TABLE Reproduccion ADD CONSTRAINT FK_Repro_Contenido
FOREIGN KEY (id_Contenido) REFERENCES Contenido(id_Contenido);

ALTER TABLE Reproduccion ADD CONSTRAINT FK_Repro_Perfil
FOREIGN KEY (id_Perfil) REFERENCES Perfil(id_Perfil);

ALTER TABLE Reproduccion ADD CONSTRAINT FK_Repro_Episodio
FOREIGN KEY (id_Episodio) REFERENCES Episodio(id_Episodio);

-- Reporte
ALTER TABLE Reporte ADD CONSTRAINT FK_Reporte_Contenido
FOREIGN KEY (id_Contenido) REFERENCES Contenido(id_Contenido);

ALTER TABLE Reporte ADD CONSTRAINT FK_Reporte_Usuario
FOREIGN KEY (id_Usuario) REFERENCES Usuario(id_Usuario);

ALTER TABLE Reporte ADD CONSTRAINT FK_Reporte_Empleado
FOREIGN KEY (id_Empleado) REFERENCES Empleado(id_Empleado);

-- Contenido asociado
ALTER TABLE ContenidoAsociado ADD CONSTRAINT FK_Asociado_Original
FOREIGN KEY (id_Original) REFERENCES Contenido(id_Contenido);

ALTER TABLE ContenidoAsociado ADD CONSTRAINT FK_Asociado_Secundario
FOREIGN KEY (id_Asociado) REFERENCES Contenido(id_Contenido);

-- Calificacion
ALTER TABLE Calificacion ADD CONSTRAINT FK_Cal_Perfil
FOREIGN KEY (id_Perfil) REFERENCES Perfil(id_Perfil);

ALTER TABLE Calificacion ADD CONSTRAINT FK_Cal_Contenido
FOREIGN KEY (id_Contenido) REFERENCES Contenido(id_Contenido);

-- ContenidoGenero
ALTER TABLE ContenidoGenero ADD CONSTRAINT FK_CG_Contenido
FOREIGN KEY (id_Contenido) REFERENCES Contenido(id_Contenido);

ALTER TABLE ContenidoGenero ADD CONSTRAINT FK_CG_Genero
FOREIGN KEY (id_Genero) REFERENCES Genero(id_Genero);

COMMIT;