/*
SCRIPT
3.1 Núcleo 1: Consultas avanzadas y almacenamiento
*/


--===============================
-- 3.1.1 Consultas parametrizadas
--===============================
-- a) Top 10 contenido más reproducido por ciudad
-- Usamos DEFINE para definir la variable ciudad como una que tengamos, en este caso Cali
DEFINE ciudad_nombre = 'Cali';

SELECT *
FROM (
    -- Con la subconsulta, primero ordenamos y luego limitamos al top 10
    SELECT c.titulo,
           COUNT(r.id_Reproduccion) AS total_reproducciones
    FROM Reproduccion r
    JOIN Perfil p ON r.id_Perfil = p.id_Perfil
    JOIN Usuario u ON p.id_Usuario = u.id_Usuario
    JOIN Ciudad ci ON u.id_Ciudad = ci.id_Ciudad
    JOIN Contenido c ON r.id_Contenido = c.id_Contenido
    WHERE ci.nombre = '&ciudad_nombre' -- Variable definida arriba
    GROUP BY c.titulo
    ORDER BY total_reproducciones DESC
)
WHERE ROWNUM <= 10;

-- b) Ingresos por plan en mes y año
-- Definimos el mes y el año del que queremos ver ingresos con DEFINE
DEFINE mes = 4;
DEFINE anio = 2026;

SELECT pl.nombre AS plan,
       SUM(p.monto) AS total_ingresos
FROM Pago p
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Plan pl ON u.id_Plan = pl.id_Plan
-- Uso de las variables. EXTRACT para obtener la parte especifica de la fecha
WHERE EXTRACT(MONTH FROM p.fecha) = &mes
  AND EXTRACT(YEAR FROM p.fecha) = &anio
GROUP BY pl.nombre
ORDER BY total_ingresos DESC;

-- c) Calificación promedio por categoría según género
-- Usamos DEFINE para definir el genero
DEFINE genero_nombre = 'Acción';

SELECT cc.nombre AS categoria,
       ROUND(AVG(ca.estrellas),2) AS promedio_calificacion
FROM Calificacion ca
JOIN Contenido co ON ca.id_Contenido = co.id_Contenido
JOIN ContenidoClasificacion cc ON co.id_ContenidoClasificacion = cc.id_ContenidoClasificacion
JOIN ContenidoGenero cg ON co.id_Contenido = cg.id_Contenido
JOIN Genero g ON cg.id_Genero = g.id_Genero
WHERE g.nombre = '&genero_nombre' -- Variable de genero
GROUP BY cc.nombre
ORDER BY promedio_calificacion DESC;

--===============================
-- 3.1.2 Tablas de referencias cruzadas — PIVOT y UNPIVOT
--===============================
-- a) Usuarios activos por ciudad y plan
SELECT *
FROM (
    -- Consulta para ver usuarios activos, mostrando ciudades y planes
    SELECT ci.nombre AS ciudad,
           pl.nombre AS plan
    FROM Usuario u
    JOIN Ciudad ci ON u.id_Ciudad = ci.id_Ciudad
    JOIN Plan pl ON u.id_Plan = pl.id_Plan
    WHERE u.estado_cuenta = 'ACTIVO'
)
PIVOT (
    -- Con el PIVOT, los planes ahora son columnas y las ciudades las filas
    COUNT(plan)
    FOR plan IN 
        ('Basico' AS BASICO,
        'Estandar' AS ESTANDAR,
        'Premium' AS PREMIUM)
)
ORDER BY ciudad;

-- b) Reproducciones por categoría y dispositivo
SELECT *
FROM (
    -- Consulta para ver categorias y dispositivos de las reproducciones
    SELECT cc.nombre AS categoria,
           r.dispositivo
    FROM Reproduccion r
    JOIN Contenido c ON r.id_Contenido = c.id_Contenido
    JOIN ContenidoClasificacion cc ON c.id_ContenidoClasificacion = cc.id_ContenidoClasificacion
)
PIVOT (
    -- Con PIVOT, las categorias son las filas y las columnas los dispositivos
    COUNT(dispositivo)
    FOR dispositivo IN
            ('celular' AS CELULAR,
            'tablet' AS TABLET,
            'TV' AS TV,
            'PC' AS COMPUTADOR)
)
ORDER BY categoria;

-- c) Convertir el pivot anterior a filas
SELECT categoria,
       dispositivo,
       total
FROM (
    -- Consulta para ver categorias y dispositivos de las reproducciones
    SELECT *
    FROM (
        SELECT cc.nombre AS categoria,
               r.dispositivo
        FROM Reproduccion r
        JOIN Contenido c ON r.id_Contenido = c.id_Contenido
        JOIN ContenidoClasificacion cc ON c.id_ContenidoClasificacion = cc.id_ContenidoClasificacion
    )
    PIVOT (
        -- Con PIVOT, las categorias son las filas y las columnas los dispositivos
        COUNT(dispositivo)
            FOR dispositivo IN
                ('celular' AS CELULAR,
                'tablet' AS TABLET,
                'TV' AS TV,
                'PC' AS COMPUTADOR)
    )
)
-- El UNPIVOT vuelve a poner por categorias y dispositivos, ahora con la columna de total
-- por cada combinacion
UNPIVOT (
    total FOR dispositivo IN (
        CELULAR,
        TABLET,
        TV,
        COMPUTADOR
    )
);


-- d) UNPIVOT meses, reproducciones por mes en 2025
-- NVL por si un mes no tiene reproducciones, sea 0 el total
SELECT mes, NVL(total,0) AS total_reproducciones
FROM (
    SELECT *
    FROM (
        -- Subconsulta para extraer los numeros de los meses
        SELECT 
            EXTRACT(MONTH FROM fecha_hora_inicio) AS mes_num
        FROM Reproduccion
        WHERE EXTRACT(YEAR FROM fecha_hora_inicio) = 2025
    )
    -- Con el PIVOT, los meses son las columnas
    PIVOT (
        COUNT(*) 
        FOR mes_num IN (
            1 AS enero,
            2 AS febrero,
            3 AS marzo,
            4 AS abril,
            5 AS mayo,
            6 AS junio,
            7 AS julio,
            8 AS agosto,
            9 AS septiembre,
            10 AS octubre,
            11 AS noviembre,
            12 AS diciembre
        )
    )
)
-- Se hace UNPIVOT para convertir los meses a filas
UNPIVOT (
    total FOR mes IN (
        enero AS 'ENERO',
        febrero AS 'FEBRERO',
        marzo AS 'MARZO',
        abril AS 'ABRIL',
        mayo AS 'MAYO',
        junio AS 'JUNIO',
        julio AS 'JULIO',
        agosto AS 'AGOSTO',
        septiembre AS 'SEPTIEMBRE',
        octubre AS 'OCTUBRE',
        noviembre AS 'NOVIEMBRE',
        diciembre AS 'DICIEMBRE'
    )
)
-- Que quede ordenado por mes
ORDER BY 
    CASE mes
        WHEN 'ENERO' THEN 1
        WHEN 'FEBRERO' THEN 2
        WHEN 'MARZO' THEN 3
        WHEN 'ABRIL' THEN 4
        WHEN 'MAYO' THEN 5
        WHEN 'JUNIO' THEN 6
        WHEN 'JULIO' THEN 7
        WHEN 'AGOSTO' THEN 8
        WHEN 'SEPTIEMBRE' THEN 9
        WHEN 'OCTUBRE' THEN 10
        WHEN 'NOVIEMBRE' THEN 11
        WHEN 'DICIEMBRE' THEN 12
END;


--===============================
-- 3.1.3 Funciones avanzadas del GROUP BY
--===============================
-- a) ROLLUP ingresos por ciudad y plan
SELECT 
    ci.nombre AS ciudad,
    pl.nombre AS plan,
    SUM(p.monto) AS total_ingresos
FROM Pago p
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Ciudad ci ON u.id_Ciudad = ci.id_Ciudad
JOIN Plan pl ON u.id_Plan = pl.id_Plan
-- ROLLUP para ver detalle de ciudad y plan, luego subtotales por ciudad
-- finalmente, total general
GROUP BY ROLLUP (ci.nombre, pl.nombre)
ORDER BY ci.nombre, pl.nombre;

-- b) CUBE reproducciones por categoria y dispositivo
SELECT 
    cc.nombre AS categoria,
    r.dispositivo,
    COUNT(*) AS total_reproducciones
FROM Reproduccion r
JOIN Contenido c ON r.id_Contenido = c.id_Contenido
JOIN ContenidoClasificacion cc 
    ON c.id_ContenidoClasificacion = cc.id_ContenidoClasificacion
-- CUBE para ver todas las combinaciones totales, subtotales por categoria y por
-- dispositivo, y total general
GROUP BY CUBE (cc.nombre, r.dispositivo)
ORDER BY cc.nombre, r.dispositivo;

-- c) GROUPING para etiquetas legibles
SELECT 
    -- GROUPING, para indicar los subtotales y total.
    -- Si es 0, es un dato, no valor de grupo.
    -- Si es 1, es un subtotal/total
    CASE 
        WHEN GROUPING(ci.nombre) = 1 THEN 'TOTAL GENERAL'
        ELSE ci.nombre
    END AS ciudad,
    
    CASE 
        WHEN GROUPING(pl.nombre) = 1 THEN 'SUBTOTAL'
        ELSE pl.nombre
    END AS plan,
    
    SUM(p.monto) AS total_ingresos
FROM Pago p
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Ciudad ci ON u.id_Ciudad = ci.id_Ciudad
JOIN Plan pl ON u.id_Plan = pl.id_Plan
GROUP BY ROLLUP (ci.nombre, pl.nombre)
ORDER BY ciudad, plan;

-- d) GROUPING SETS totales sin detalle cruzado
SELECT 
    ci.nombre AS ciudad,
    cc.nombre AS categoria,
    COUNT(*) AS total
FROM Reproduccion r
JOIN Perfil p ON r.id_Perfil = p.id_Perfil
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Ciudad ci ON u.id_Ciudad = ci.id_Ciudad
JOIN Contenido c ON r.id_Contenido = c.id_Contenido
JOIN ContenidoClasificacion cc 
    ON c.id_ContenidoClasificacion = cc.id_ContenidoClasificacion
-- No muestra los detalles cruzados, porque solo definimos lo que agrupamos
GROUP BY GROUPING SETS (
    (ci.nombre), -- total por ciudad
    (cc.nombre) -- total por categoria
)
ORDER BY ciudad, categoria;

--===============================
-- 3.1.4 Vistas materializadas
--===============================
-- a) Vista materializada: reproducciones y calificacion promedio
-- Limpieza
DROP MATERIALIZED VIEW MV_Contenido_Popular;

-- Creamos la vista. Se llena al crearla. Vuelve a calcular todo cuando uno lo quiera
CREATE MATERIALIZED VIEW MV_Contenido_Popular
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
-- Calcula el total de reproducciones y calificacion promedio por contenido
SELECT
    c.id_Contenido,
    c.titulo,
    COUNT(r.id_Reproduccion) AS total_reproducciones,
    ROUND(AVG(ca.estrellas),2) AS promedio_calificacion
FROM Contenido c
-- Hacemos LEFT JOIN para tener todos los contenidos, asi no tengan reproducciones
LEFT JOIN Reproduccion r
    ON c.id_Contenido = r.id_Contenido
LEFT JOIN Calificacion ca
    ON c.id_Contenido = ca.id_Contenido
GROUP BY c.id_Contenido, c.titulo;

-- Reporte contenido más popular
SELECT *
FROM MV_Contenido_Popular
ORDER BY total_reproducciones DESC;


-- b) Vista materializada: ingresos mensuales
-- Limpieza
DROP MATERIALIZED VIEW MV_Ingresos_Mensuales;

-- Creamos la vista. Se llena al crearla. Vuelve a calcular todo cuando uno lo quiera
CREATE MATERIALIZED VIEW MV_Ingresos_Mensuales
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
AS
-- Con esta consulta, calculamos los ingresos mensuales por plan y ciudad
-- Obtenemos el total de ingresos por cada combinacion de ciudad, plan, año y mes
SELECT 
    ci.nombre AS ciudad,
    pl.nombre AS plan,
    EXTRACT(YEAR FROM p.fecha) AS anio,
    EXTRACT(MONTH FROM p.fecha) AS mes,
    SUM(p.monto) AS total_ingresos
FROM Pago p
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Ciudad ci ON u.id_Ciudad = ci.id_Ciudad
JOIN Plan pl ON u.id_Plan = pl.id_Plan
WHERE p.estado = 'PAGADO'
GROUP BY 
    ci.nombre,
    pl.nombre,
    EXTRACT(YEAR FROM p.fecha),
    EXTRACT(MONTH FROM p.fecha);
    
-- Reporte financiero mensual
SELECT *
FROM MV_Ingresos_Mensuales
ORDER BY anio, mes, ciudad;


--===============================
-- 3.1.5 Fragmentación de tablas — tablespaces y datafiles
--===============================
/*
    Este ya se creó en el Script de Creación.
    Aqui se prueba que funciona el particionamiento, porque
    no salen todas en una.
*/
SELECT COUNT(*) AS total_2024
FROM Reproduccion
PARTITION (repro_2024);

SELECT COUNT(*) AS total_2025
FROM Reproduccion
PARTITION (repro_2025);

SELECT COUNT(*) AS total_2026
FROM Reproduccion
PARTITION (repro_2026);


--===============================
-- Reportes que solicita Quindioflix
--===============================
-- 1. CONSUMO POR CIUDAD
SELECT c.nombre AS ciudad,
       COUNT(r.id_Reproduccion) AS total_reproducciones
FROM Reproduccion r
JOIN Perfil p ON r.id_Perfil = p.id_Perfil
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Ciudad c ON u.id_Ciudad = c.id_Ciudad
GROUP BY c.nombre
ORDER BY total_reproducciones DESC;

-- 2. CONSUMO POR TIPO DE CONTENIDO
SELECT con.tipo_contenido,
       COUNT(r.id_Reproduccion) AS total
FROM Reproduccion r
JOIN Contenido con ON r.id_Contenido = con.id_Contenido
GROUP BY con.tipo_contenido
ORDER BY total DESC;

-- 3. CONSUMO POR GÉNERO
SELECT g.nombre AS genero,
       COUNT(r.id_Reproduccion) AS total
FROM Reproduccion r
JOIN ContenidoGenero cg ON r.id_Contenido = cg.id_Contenido
JOIN Genero g ON cg.id_Genero = g.id_Genero
GROUP BY g.nombre
ORDER BY total DESC;

-- 4. CONSUMO POR DISPOSITIVO
SELECT dispositivo,
       COUNT(*) AS total
FROM Reproduccion
GROUP BY dispositivo
ORDER BY total DESC;

-- 5. CONSUMO POR PLAN
SELECT pl.nombre AS plan,
       COUNT(r.id_Reproduccion) AS total
FROM Reproduccion r
JOIN Perfil p ON r.id_Perfil = p.id_Perfil
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Plan pl ON u.id_Plan = pl.id_Plan
GROUP BY pl.nombre
ORDER BY total DESC;

-- 6. CONSUMO POR PERÍODO (mensual)
-- Usamos TO_CHAR para que muestre año y mes en la misma columna
SELECT TO_CHAR(fecha_hora_inicio, 'YYYY-MM') AS periodo,
       COUNT(*) AS total
FROM Reproduccion
GROUP BY TO_CHAR(fecha_hora_inicio, 'YYYY-MM')
ORDER BY periodo;

-- 7. INGRESOS POR CIUDAD
SELECT c.nombre AS ciudad,
       SUM(p.monto) AS ingresos
FROM Pago p
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Ciudad c ON u.id_Ciudad = c.id_Ciudad
WHERE p.estado = 'PAGADO'
GROUP BY c.nombre
ORDER BY ingresos DESC;

-- 8. INGRESOS POR PLAN
SELECT pl.nombre AS plan,
       SUM(p.monto) AS ingresos
FROM Pago p
JOIN Usuario u ON p.id_Usuario = u.id_Usuario
JOIN Plan pl ON u.id_Plan = pl.id_Plan
WHERE p.estado = 'PAGADO'
GROUP BY pl.nombre
ORDER BY ingresos DESC;

-- 9. RENDIMIENTO: CONTENIDO POR EMPLEADO
SELECT e.nombre,
       COUNT(c.id_Contenido) AS contenidos_publicados
FROM Empleado e
-- LEFT JOIN para obtener todos los empleados, asi no publiquen nada
LEFT JOIN Contenido c ON e.id_Empleado = c.id_Empleado
GROUP BY e.nombre
ORDER BY contenidos_publicados DESC;

-- 10. RENDIMIENTO: REPORTES RESUELTOS
SELECT e.nombre,
       COUNT(r.id_Reporte) AS reportes_resueltos
FROM Empleado e
JOIN Reporte r ON e.id_Empleado = r.id_Empleado
WHERE r.estado = 'CERRADO'
GROUP BY e.nombre
ORDER BY reportes_resueltos DESC;