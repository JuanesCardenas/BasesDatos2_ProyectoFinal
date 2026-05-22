/*
SCRIPT
3.4 Núcleo 4: Índices
*/


--===============================
-- 3.4.1 Creación y administración de índices
--===============================
-- a) Índice para optimizar historial de reproducción por perfil
CREATE INDEX IDX_REPRO_PERFIL_FECHA
ON Reproduccion (id_Perfil, fecha_hora_inicio);

/*
    Este índice es útil porque la mayoría de consultas del sistema
    consultan el historial de reproducción de un usuario o perfil ordenado por fecha.
    Además de que la tabla de reproducciones es una de las tablas que más crece
    en este negocio. Es B-Tree por la cardinalidad alta, como id.
*/

SELECT *
FROM Reproduccion
WHERE id_Perfil = 1
ORDER BY fecha_hora_inicio DESC;

-- b) Índice para login y validación de usuarios
CREATE INDEX IDX_USUARIO_EMAIL
ON Usuario (email);

/*
    El email es el identificador más usado para Login y validación de duplicados,
    por lo que reduce el tiempo de validación de registros y la busqueda es
    directa sin hacer el FULL TABLE SCAN. B-Tree por email único.
    Este indice es solo para ver, ya se creó un index automatico porque email es UNIQUE
*/

SELECT *
FROM Usuario
WHERE email = 'g19@mail.com';

-- c) Índice para búsquedas por categoría y año de lanzamiento
CREATE INDEX IDX_CONTENIDO_TIPO_ANIO
ON Contenido (tipo_contenido, fecha_lanzamiento);
/*
    Se utiliza para filtros por tipo de contenido, por ejemplo para
    consultar todas las películas o podcasts, además de poder filtrar
    y ordenar por rangos de fechas, mejorando la eficiencia en el
    filtrado y búsquedas del catálogo. B-Tree por la fecha.
*/

SELECT titulo, fecha_lanzamiento
FROM Contenido
WHERE tipo_contenido = 'PELICULA'
  AND fecha_lanzamiento BETWEEN DATE '2020-01-01' AND DATE '2024-12-31'
ORDER BY fecha_lanzamiento DESC;

-- d) Índice adicional en PAGOS para consultas de historial de pagos por usuario
CREATE INDEX IDX_PAGO_USUARIO_FECHA
ON Pago (id_Usuario, fecha);

/*
    Este índice se usa porque el sistema consulta frecuentemente el historial de
    pagos de un usuario, pagos ordenados por fecha y validación de últimos pagos.
    Con esto se evita recorrer una gran cantidad de datos, ya que la tabla de pagos
    es una de las que más tiende a crecer. B-Tree por la cardinalidad.
*/

SELECT *
FROM Pago
WHERE id_Usuario = 1
ORDER BY fecha DESC;

--===============================
-- 3.4.2 Análisis de rendimiento
--===============================
-- Como vamos a usar un INDEX previo, lo borramos primero
DROP INDEX IDX_CONTENIDO_TIPO_ANIO;

-- Consulta pesada ANTES del INDEX
EXPLAIN PLAN FOR
SELECT *
FROM Contenido
WHERE tipo_contenido = 'PELICULA'
AND fecha_lanzamiento BETWEEN DATE '2024-01-01' AND DATE '2026-12-31'
ORDER BY fecha_lanzamiento DESC;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- Se crea el INDEX, este es igual al del ejercicio 3.4.1.c
CREATE INDEX IDX_CONTENIDO_TIPO_ANIO
ON Contenido (tipo_contenido, fecha_lanzamiento);

-- Misma consulta, DESPUES del INDEX
EXPLAIN PLAN FOR
SELECT *
FROM Contenido
WHERE tipo_contenido = 'PELICULA'
AND fecha_lanzamiento BETWEEN DATE '2024-01-01' AND DATE '2026-12-31'
ORDER BY fecha_lanzamiento DESC;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


-- borrar indices, para pruebas
DROP INDEX IDX_REPRO_PERFIL_FECHA;
DROP INDEX IDX_USUARIO_EMAIL;
DROP INDEX IDX_CONTENIDO_TIPO_ANIO;
DROP INDEX IDX_PAGO_USUARIO_FECHA;