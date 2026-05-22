/*
SCRIPT
3.2 Núcleo 2: PL/SQL — Procedimientos almacenados y disparadores
*/


--===============================
-- 3.2.1 Cursores
--===============================
-- a) Cursor usuarios con suscripcion vencida
-- Activamos salida por consola para poder ver los resultados
SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_morosos IS
        SELECT 
            u.nombre,
            u.email,
            pl.nombre AS plan,
            pl.precio_mes,
            -- TRUNC para eliminar decimales
            -- Calculamos los dias de mora restando la fecha actual menos el ultimo pago
            TRUNC(SYSDATE - u.fecha_ultimo_pago) AS dias_mora,
            -- Convertimos los dias en meses, dividiendo entre 30
            TRUNC((SYSDATE - u.fecha_ultimo_pago) / 30) AS meses_mora
        FROM Usuario u
        JOIN Plan pl ON u.id_Plan = pl.id_Plan
        WHERE u.fecha_ultimo_pago IS NOT NULL
          -- Filtramos solo los que deben más de 30 dias
          AND SYSDATE - u.fecha_ultimo_pago > 30;

    -- Variable tipo fila para guardar cada registro del cursor
    v_registro cur_morosos%ROWTYPE;
    
    -- Variable para guardar deuda por fila
    v_deuda NUMBER;

BEGIN
    -- Abrir el cursor
    OPEN cur_morosos;
    LOOP
        -- Se trae fila por fila del cursor
        FETCH cur_morosos INTO v_registro;
        -- Salir si no hay registros
        EXIT WHEN cur_morosos%NOTFOUND;
        -- Calculo de deuda
        v_deuda := v_registro.precio_mes * v_registro.meses_mora;

        DBMS_OUTPUT.PUT_LINE(
            'Usuario: ' || v_registro.nombre ||
            ' | Email: ' || v_registro.email ||
            ' | Plan: ' || v_registro.plan ||
            ' | Dias mora: ' || v_registro.dias_mora ||
            ' | Meses mora: ' || v_registro.meses_mora ||
            ' | Deuda: ' || v_deuda
        );   
    END LOOP;
    -- Cerrar el cursor
    CLOSE cur_morosos;
END;
/

-- b) Cursor actualizar popularidad de contenido
-- Activamos salida por consola para poder ver los resultados
SET SERVEROUTPUT ON;

DECLARE
    -- Cursor que recorre todos los contenidos
    CURSOR cur_contenido IS
        SELECT id_Contenido, titulo
        FROM Contenido;

    -- Variables para guardar los datos de cada fila del cursor
    v_id_contenido Contenido.id_Contenido%TYPE;
    v_titulo Contenido.titulo%TYPE;

    -- Variable para guardar el total de reproducciones completas
    v_total_completas NUMBER;
    
BEGIN
    -- Abrir el cursor
    OPEN cur_contenido;
    LOOP
        -- Se trae fila por fila del cursor
        FETCH cur_contenido INTO v_id_contenido, v_titulo;
        -- Salir cuando no haya más registros
        EXIT WHEN cur_contenido%NOTFOUND;

        -- Contar reproducciones completas, avance >= 90%
        SELECT COUNT(*)
        INTO v_total_completas
        FROM Reproduccion
        WHERE id_Contenido = v_id_contenido
          AND porcentaje_avance >= 90;

        -- Actualizar la popularidad del contenido con ese total
        UPDATE Contenido
        SET popularidad = v_total_completas
        WHERE id_Contenido = v_id_contenido;

        -- Mostrar resultado en consola
        DBMS_OUTPUT.PUT_LINE(
            'Contenido: ' || v_titulo ||
            ' | ID: ' || v_id_contenido ||
            ' | Reproducciones completas: ' || v_total_completas
        );
    END LOOP;
    -- Cerrar el cursor
    CLOSE cur_contenido;
    -- Guardar los cambios en la base de datos
    COMMIT;
END;
/

--===============================
-- 3.2.2 Procedimientos almacenados
--===============================
-- a) SP_REGISTRAR_USUARIO
CREATE OR REPLACE PROCEDURE SP_REGISTRAR_USUARIO (
    -- Parametros que recibe, datos del usuario
    p_nombre IN VARCHAR2,
    p_email IN VARCHAR2,
    p_telefono IN VARCHAR2,
    p_fecha_nacimiento IN DATE,
    p_id_plan IN INTEGER,
    p_id_ciudad IN INTEGER
)
IS
    -- Variable para validar si el email ya existe
    v_count NUMBER;
    -- Variables para generar IDs nuevos
    v_id_usuario NUMBER;
    v_id_perfil NUMBER;
    v_id_pago NUMBER;
    -- Excepcion personalizada para email duplicado
    e_email_duplicado EXCEPTION;

BEGIN
    -- Validar email
    SELECT COUNT(*)
    INTO v_count
    FROM Usuario
    WHERE email = p_email;

    -- Si ya existe, lanzamos error
    IF v_count > 0 THEN
        RAISE e_email_duplicado;
    END IF;

    -- Generamos IDs manualmente usando MAX + 1
    -- NVL para evitar null si la tabla esta vacia
    SELECT NVL(MAX(id_Usuario),0)+1 INTO v_id_usuario FROM Usuario;
    SELECT NVL(MAX(id_Perfil),0)+1 INTO v_id_perfil FROM Perfil;
    SELECT NVL(MAX(id_Pago),0)+1 INTO v_id_pago FROM Pago;

    -- Insertamos el usuario con los datos recibidos
    INSERT INTO Usuario (
        id_Usuario, nombre, email, telefono,
        fecha_nacimiento, fecha_registro,
        fecha_ultimo_pago, estado_cuenta,
        id_Plan, id_Ciudad, referido_activo
    )
    VALUES (
        v_id_usuario, p_nombre, p_email, p_telefono,
        p_fecha_nacimiento, SYSDATE, -- fecha actual
        SYSDATE,
        'ACTIVO',
        p_id_plan, p_id_ciudad, 'N'
    );
    -- Insertamos un perfil por defecto para el usuario
    INSERT INTO Perfil (
        id_Perfil, nombre, tipo, id_Usuario
    )
    VALUES (
        v_id_perfil, 'Principal', 'ADULTO', v_id_usuario
    );
    -- Insertamos el pago inicial del usuario
    INSERT INTO Pago (
        id_Pago, fecha, monto, metodo, estado, id_Usuario
    )
    VALUES (
        v_id_pago, SYSDATE,
        -- Subconsulta para obtener el precio del plan
        (SELECT precio_mes FROM Plan WHERE id_Plan = p_id_Plan),
        'TARJETA', 'PAGADO', v_id_usuario
    );
    -- Guardamos todos los cambios
    COMMIT;
    
EXCEPTION
    -- Error si el email ya existe
    WHEN e_email_duplicado THEN
        RAISE_APPLICATION_ERROR(-20001, 'El email ya existe');
    -- Error si no encuentra el plan (subconsulta)
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'El plan de suscripción no existe');
    -- Cualquier otro error
    WHEN OTHERS THEN
        -- Deshacemos los cambios
        ROLLBACK;
        RAISE;
END;
/

-- Prueba
BEGIN
    SP_REGISTRAR_USUARIO(
        p_nombre => 'Juan Perez',
        p_email => 'juan@test.com',
        p_telefono => '123456789',
        p_fecha_nacimiento => DATE '2000-05-10',
        p_id_plan => 1,
        p_id_ciudad => 1
    );
END;
/

SELECT * 
FROM Usuario 
WHERE email = 'juan@test.com';

SELECT *
FROM Perfil
WHERE id_Usuario = (
    SELECT id_Usuario FROM Usuario WHERE email = 'juan@test.com'
);

SELECT *
FROM Pago
WHERE id_Usuario = (
    SELECT id_Usuario FROM Usuario WHERE email = 'juan@test.com'
);

-- Prueba error (Email ya existente)
BEGIN
    SP_REGISTRAR_USUARIO(
        'Juan Perez',
        'juan@test.com',
        '123456789',
        DATE '2000-05-10',
        1,
        1
    );
END;
/

-- b) SP_CAMBIAR_PLAN
CREATE OR REPLACE PROCEDURE SP_CAMBIAR_PLAN (
    -- Parametros que recibe
    p_id_usuario INTEGER,
    p_nuevo_plan INTEGER
)
IS
    -- Variable para contar los perfiles actuales del usuario
    v_perfiles NUMBER;
    -- Variable para guardar el maximo de pantallas del nuevo plan
    v_max_pantallas NUMBER;
    -- Excepcion personalizada si se exceden los perfiles
    e_exceso_perfiles EXCEPTION;

BEGIN
    -- Contar cuantos perfiles tiene el usuario
    SELECT COUNT(*)
    INTO v_perfiles
    FROM Perfil
    WHERE id_Usuario = p_id_usuario;

    -- Obtener el limite de pantallas del nuevo plan
    SELECT max_pantallas
    INTO v_max_pantallas
    FROM Plan
    WHERE id_Plan = p_nuevo_plan;

    -- Validamos que al cambiar de plan no exceda el limite de perfiles
    IF v_perfiles > v_max_pantallas THEN
        RAISE e_exceso_perfiles;
    END IF;

    -- Actualizamos el plan del usuario
    UPDATE Usuario
    SET id_Plan = p_nuevo_plan
    WHERE id_Usuario = p_id_usuario;

    -- Guardamos los cambios
    COMMIT;
    
EXCEPTION
    -- Error si tiene más perfiles de los permitidos
    WHEN e_exceso_perfiles THEN
        RAISE_APPLICATION_ERROR(-20003,
        'Excede el número de perfiles permitidos para este plan');
    -- Error si el plan no existe
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20004,
        'El plan no existe');
    -- Cualquier otro error
    WHEN OTHERS THEN
        -- Deshacemos cambios
        ROLLBACK;
        RAISE;
END;
/

-- Prueba
SELECT id_Usuario, id_Plan
FROM Usuario
WHERE id_Usuario = 1; -- El plan del usuario es 1

BEGIN
    SP_CAMBIAR_PLAN(
        p_id_usuario => 1,
        p_nuevo_plan => 2 -- Cambia el plan del usuario
    );
END;
/

SELECT id_Usuario, id_Plan
FROM Usuario
WHERE id_Usuario = 1; -- El plan debe ser 2 ahora

-- c) SP_REPORTE_CONSUMO
CREATE OR REPLACE PROCEDURE SP_REPORTE_CONSUMO (
    -- Parametros que recibe
    p_id_usuario IN INTEGER,
    p_fecha_inicio IN DATE,
    p_fecha_fin IN DATE
)
IS
    -- Variable para guardar el nombre del usuario
    v_nombre_usuario Usuario.nombre%TYPE;

BEGIN
    -- Obtenemos el nombre del usuario
    SELECT nombre 
    INTO v_nombre_usuario
    FROM Usuario
    WHERE id_Usuario = p_id_usuario;

    -- Mostramos encabezado del reporte
    DBMS_OUTPUT.PUT_LINE(
        'Usuario: ' || v_nombre_usuario ||
        ' | Periodo: ' || TO_CHAR(p_fecha_inicio,'DD-MM-YYYY') ||
        ' a ' || TO_CHAR(p_fecha_fin,'DD-MM-YYYY')
    );

    DBMS_OUTPUT.PUT_LINE('----------------------------------------');

    -- Cursor FOR implicito para recorrer el consumo por perfil y categoria
    FOR reg IN (
        SELECT 
            pe.nombre AS perfil,
            cc.nombre AS categoria,
            COUNT(r.id_Reproduccion) AS total_reproducciones,
            -- Sumamos los minutos consumidos
            SUM(
                CASE 
                    -- Solo calculamos si la reproduccion tiene fecha de fin
                    WHEN r.fecha_hora_fin IS NOT NULL 
                    -- Convertimos la diferencia de fechas a minutos (dias * 24 * 60)
                    THEN (r.fecha_hora_fin - r.fecha_hora_inicio)*24*60
                    ELSE 0
                END
            ) AS minutos_consumidos
        FROM Reproduccion r
        JOIN Perfil pe ON r.id_Perfil = pe.id_Perfil
        JOIN Contenido c ON r.id_Contenido = c.id_Contenido
        JOIN ContenidoClasificacion cc 
            ON c.id_ContenidoClasificacion = cc.id_ContenidoClasificacion
        -- Filtramos por usuario
        WHERE pe.id_Usuario = p_id_usuario
        -- Filtramos por rango de fechas
          AND r.fecha_hora_inicio BETWEEN p_fecha_inicio AND p_fecha_fin
        GROUP BY pe.nombre, cc.nombre
        ORDER BY pe.nombre
    )
    LOOP
        -- Mostramos los resultados por cada grupo
        DBMS_OUTPUT.PUT_LINE(
            'Perfil: ' || reg.perfil ||
            ' | Categoria: ' || reg.categoria ||
            ' | Reproducciones: ' || reg.total_reproducciones ||
            ' | Minutos: ' || ROUND(reg.minutos_consumidos,2)
        );
    END LOOP;
END;
/

-- Prueba
SET SERVEROUTPUT ON;

BEGIN
    SP_REPORTE_CONSUMO(
        p_id_usuario => 16,
        p_fecha_inicio => DATE '2024-01-01',
        p_fecha_fin => SYSDATE
    );
END;
/

--===============================
-- 3.2.3 Funciones
--===============================
-- a) FN_CALCULAR_MONTO
CREATE OR REPLACE FUNCTION FN_CALCULAR_MONTO (
    -- Parametros
    p_id_usuario INTEGER
) RETURN NUMBER
IS
    -- Variables
    v_precio Plan.precio_mes%TYPE;
    v_fecha_registro Usuario.fecha_registro%TYPE;
    v_meses NUMBER;
    v_monto NUMBER;
BEGIN
    -- Obtener datos
    SELECT pl.precio_mes, u.fecha_registro
    INTO v_precio, v_fecha_registro
    FROM Usuario u
    JOIN Plan pl ON u.id_Plan = pl.id_Plan
    WHERE u.id_Usuario = p_id_usuario;

    -- Calcular antigüedad en meses
    v_meses := MONTHS_BETWEEN(SYSDATE, v_fecha_registro);

    -- Aplicar descuento
    IF v_meses > 24 THEN
        v_monto := v_precio * 0.85;
    ELSIF v_meses > 12 THEN
        v_monto := v_precio * 0.90;
    ELSE
        v_monto := v_precio;
    END IF;

    RETURN ROUND(v_monto,2);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

-- Prueba
SELECT FN_CALCULAR_MONTO(1) AS monto FROM dual;


-- b) FN_CONTENIDO_RECOMENDADO
CREATE OR REPLACE FUNCTION FN_CONTENIDO_RECOMENDADO (
    -- Parametro
    p_id_perfil IN INTEGER
) RETURN VARCHAR2
IS
    -- Variable de titulo
    v_titulo Contenido.titulo%TYPE;
BEGIN
    -- Buscamos un contenido recomendado segun el genero más visto por el perfil
    SELECT c.titulo
    INTO v_titulo
    FROM Contenido c
    JOIN ContenidoGenero cg ON c.id_Contenido = cg.id_Contenido
    WHERE cg.id_Genero = (
        -- Subconsulta para obtener el genero más visto
        SELECT id_Genero
        FROM (
            SELECT cg.id_Genero, COUNT(*) AS total
            FROM Reproduccion r
            JOIN ContenidoGenero cg 
                ON r.id_Contenido = cg.id_Contenido
            WHERE r.id_Perfil = p_id_perfil
            GROUP BY cg.id_Genero
            -- Ordenamos más visto primero
            ORDER BY total DESC
        )
        -- Tomamos el primero, el mayor
        WHERE ROWNUM = 1
    )
    -- Excluimos contenidos que ya vio el perfil
    AND c.id_Contenido NOT IN (
        SELECT r.id_Contenido
        FROM Reproduccion r
        WHERE r.id_Perfil = p_id_perfil
    )
    AND ROWNUM = 1; -- solo uno recomendado

    RETURN v_titulo;

EXCEPTION
    -- Si no hay datos
    WHEN NO_DATA_FOUND THEN
        RETURN 'No hay recomendación disponible';
END;
/

-- Prueba
SELECT FN_CONTENIDO_RECOMENDADO(6) FROM dual;


--===============================
-- 3.2.4 Excepciones
--===============================
-- Están en los procedimientos almacenados SP_REGISTRAR_USUARIO y SP_CAMBIAR_PLAN

--===============================
-- 3.2.5 Disparadores
--===============================
-- a) Trigger REPRODUCCION
-- Se ejecuta antes de insertar una reproduccion, por cada fila insertada
CREATE OR REPLACE TRIGGER TRG_REPRODUCCION_ACTIVA
BEFORE INSERT ON Reproduccion
FOR EACH ROW
DECLARE
    -- Variable del estado de la cuenta
    v_estado Usuario.estado_cuenta%TYPE;
BEGIN
    SELECT u.estado_cuenta
    INTO v_estado
    FROM Usuario u
    JOIN Perfil p ON u.id_Usuario = p.id_Usuario
    -- Usamos :NEW para acceder al perfil que se quiere insertar
    WHERE p.id_Perfil = :NEW.id_Perfil;

    -- Si no está activa la cuenta, se lanza error y no se permite la inserción
    IF v_estado <> 'ACTIVO' THEN
        RAISE_APPLICATION_ERROR(-20010, 'El usuario no tiene cuenta activa');
    END IF;

EXCEPTION
    -- Si no existe el perfil o el usuario
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20011, 'Perfil o usuario no existe');
END;
/

-- Prueba
-- Crear usuario inactivo
INSERT INTO Usuario (id_Usuario, nombre, email, estado_cuenta, id_Plan)
VALUES (999, 'Test', 'test@test.com', 'INACTIVO', 1);

-- Crear perfil
INSERT INTO Perfil (id_Perfil, nombre, tipo, id_Usuario)
VALUES (999, 'TestPerfil', 'ADULTO', 999);

-- Intentar reproducir (No deja)
INSERT INTO Reproduccion (
    id_Reproduccion, fecha_hora_inicio, dispositivo,
    porcentaje_avance, id_Contenido, id_Perfil
)
VALUES (999, SYSDATE, 'PC', 80, 1, 999);

-- Ahora con usuario ACTIVO (ya deja)
UPDATE Usuario SET estado_cuenta = 'ACTIVO' WHERE id_Usuario = 999;

INSERT INTO Reproduccion VALUES (
    1000, SYSDATE, SYSDATE, 'PC', 80, 1, 999, NULL
);


-- b) Trigger PERFIL
-- Se ejecuta antes de insertar un perfil, por cada fila
CREATE OR REPLACE TRIGGER TRG_LIMITE_PERFILES
BEFORE INSERT ON Perfil
FOR EACH ROW
DECLARE
    -- Variable para contar perfiles actuales del usuario
    v_total_perfiles NUMBER;
    -- Variable para guardar el máximo permitido según plan
    v_max_perfiles NUMBER;
    -- Variable para guardar el plan del usuario
    v_plan NUMBER;
BEGIN
    -- Contar perfiles actuales
    SELECT COUNT(*)
    INTO v_total_perfiles
    FROM Perfil
    WHERE id_Usuario = :NEW.id_Usuario;

    -- obtener plan del usuario
    SELECT id_Plan
    INTO v_plan
    FROM Usuario
    WHERE id_Usuario = :NEW.id_Usuario;

    -- asignar máximo según plan. Esto es basado en lo que dice el TRIGGER. Ver documento Proyecto_Final_Estudiante.PDF
    IF v_plan = 1 THEN
        v_max_perfiles := 2; -- Básico
    ELSIF v_plan = 2 THEN
        v_max_perfiles := 3; -- Estándar
    ELSIF v_plan = 3 THEN
        v_max_perfiles := 5; -- Premium
    ELSE
        -- Si el plan no es válido
        RAISE_APPLICATION_ERROR(-20021, 'Plan no válido');
    END IF;

    -- Validar que no exceda el límite de perfiles. Si excede, bloquea la inserción
    IF v_total_perfiles + 1 > v_max_perfiles THEN
        RAISE_APPLICATION_ERROR(-20020,
        'Excede el número máximo de perfiles para el plan');
    END IF;

END;
/

-- Prueba
-- Usuario con plan básico (max 2 perfiles)
INSERT INTO Usuario (id_Usuario, nombre, email, estado_cuenta, id_Plan)
VALUES (1001, 'Test2', 'test2@test.com', 'ACTIVO', 1);

-- Insertar perfiles hasta el límite
INSERT INTO Perfil VALUES (1001, 'P1', NULL, 'ADULTO', 1001);
INSERT INTO Perfil VALUES (1002, 'P2', NULL, 'ADULTO', 1001);

-- Este debería fallar, solo se pueden 2 perfiles en el basico
INSERT INTO Perfil VALUES (1003, 'P3', NULL, 'ADULTO', 1001);


-- c) Trigger CALIFICACION
-- Se ejecuta antes de insertar una calificación, por fila
CREATE OR REPLACE TRIGGER TRG_VALIDAR_CALIFICACION
BEFORE INSERT ON Calificacion
FOR EACH ROW
DECLARE
    -- Variable para guardar el porcentaje máximo de avance
    v_avance NUMBER;
BEGIN
    SELECT MAX(porcentaje_avance) -- Por si hay múltiples reproducciones del
                                  -- perfil y el contenido.
    INTO v_avance
    FROM Reproduccion
    -- Usamos los valores que se quieren insertar
    WHERE id_Perfil = :NEW.id_Perfil
      AND id_Contenido = :NEW.id_Contenido;

    -- Validar que haya visto al menos el 50%, si no, se bloquea la inserción
    IF v_avance IS NULL OR v_avance < 50 THEN
        RAISE_APPLICATION_ERROR(-20030,
        'Debe haber visto al menos el 50% del contenido para calificar');
    END IF;

END;
/

-- Prueba
-- Insertar reproducción con 30% visto
INSERT INTO Reproduccion VALUES (
    3000, SYSDATE, SYSDATE, 'PC', 30, 1, 1001, NULL
);

-- Intentar calificar (Debe fallar)
INSERT INTO Calificacion VALUES (
    999, 1001, 1, 5, 'Muy buena', SYSDATE
);

-- d) Trigger PAGOS
-- Se ejecuta después de insertar un pago
CREATE OR REPLACE TRIGGER TRG_ACTIVAR_USUARIO
AFTER INSERT ON Pago
BEGIN
    -- Actualizar el estado del usuario a ACTIVO
    UPDATE Usuario u
    SET u.estado_cuenta = 'ACTIVO',
        -- Actualizar la fecha del último pago
        u.fecha_ultimo_pago = SYSDATE
    WHERE u.id_Usuario IN (
        -- Obtener usuarios que tienen pagos en estado PAGADO
        -- Como es a nivel de sentencia, se hace asi
        SELECT DISTINCT id_Usuario
        FROM Pago
        WHERE estado = 'PAGADO'
    );
END;
/

-- Antes (INACTIVO)
UPDATE Usuario SET estado_cuenta = 'INACTIVO' WHERE id_Usuario = 1001;
SELECT estado_cuenta FROM Usuario WHERE id_Usuario = 1001;

-- Insertar pago
INSERT INTO Pago VALUES (
    999, SYSDATE, 100, 'TARJETA', 'PAGADO', 1001
);

-- Después (Debe salir ACTIVO y la fecha)
SELECT estado_cuenta, fecha_ultimo_pago 
FROM Usuario
WHERE id_Usuario = 1001;


-- e) Trigger CONTROL INFANTIL
-- Se ejecuta antes de insertar una reproducción, por cada fila insertada
-- Valida que los perfiles infantiles solo puedan ver contenido permitido
CREATE OR REPLACE TRIGGER TRG_CONTROL_INFANTIL
BEFORE INSERT ON Reproduccion
FOR EACH ROW
DECLARE
    -- Variable para guardar el tipo de perfil (ADULTO o INFANTIL)
    v_tipo_perfil VARCHAR2(50);
    -- Variable para guardar la clasificación del contenido (TP, +7, +13, +18, etc.)
    v_clasificacion VARCHAR2(50);
BEGIN
    -- Obtenemos el tipo de perfil que intenta reproducir contenido
    SELECT p.tipo
    INTO v_tipo_perfil
    FROM Perfil p
    -- Usamos :NEW para acceder al perfil de la nueva reproducción
    WHERE p.id_Perfil = :NEW.id_Perfil;

    -- Obtenemos la clasificación del contenido que se quiere reproducir
    SELECT cc.nombre
    INTO v_clasificacion
    FROM Contenido c
    JOIN ContenidoClasificacion cc 
        ON c.id_ContenidoClasificacion = cc.id_ContenidoClasificacion
    -- Usamos :NEW para acceder al contenido de la nueva reproducción
    WHERE c.id_Contenido = :NEW.id_Contenido;

    -- Si el perfil es infantil, se valida la restricción de contenido
    IF v_tipo_perfil = 'INFANTIL' THEN
        -- Si la clasificación NO está dentro de las permitidas, se lanza error
        IF v_clasificacion NOT IN ('TP', '+7', '+13') THEN
            RAISE_APPLICATION_ERROR(-20020,'El perfil infantil no puede reproducir este contenido');
        END IF;
    END IF;

EXCEPTION
    -- Si no existe el perfil o el contenido en la base de datos
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20021,'Perfil o contenido no existe');
END;
/

-- Prueba, NO lo permite, el contenido es +18
INSERT INTO Reproduccion VALUES (10000,TO_DATE('2025-01-19 16:30:00','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-01-19 18:05:00','YYYY-MM-DD HH24:MI:SS'),'tablet',95,9,9,3);