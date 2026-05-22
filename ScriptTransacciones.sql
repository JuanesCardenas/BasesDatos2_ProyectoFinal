/*
SCRIPT
3.3 Núcleo 3: Transacciones
*/


--===============================
-- 3.3.1 Especificación de transacciones
--===============================
-- a) Transaccion de registro completo
SET SERVEROUTPUT ON;

BEGIN
    -- Estado: ACTIVA

    -- 1. Crear usuario
    INSERT INTO Usuario (
        id_Usuario, nombre, email, telefono,
        fecha_nacimiento, fecha_registro,
        estado_cuenta, id_Plan, id_Ciudad
    ) VALUES (
        2001, 'Ozuna Perez', 'ozuna@test.com', '1112223334',
        DATE '2000-01-01', SYSDATE,
        'ACTIVO', 1, 1
    );

    -- 2. Crear perfil
    INSERT INTO Perfil (
        id_Perfil, nombre, tipo, id_Usuario
    ) VALUES (
        2001, 'Perfil Ozuna', 'ADULTO', 2001
    );

    -- 3. Registrar primer pago
    INSERT INTO Pago (
        id_Pago, fecha, monto, metodo, estado, id_Usuario
    ) VALUES (
        2001, SYSDATE, 20000, 'Tarjeta', 'PAGADO', 2001
    );

    -- Estado: PARCIALMENTE CONFIRMADA

    COMMIT;
    -- Estado: CONFIRMADA

EXCEPTION
    WHEN OTHERS THEN
        -- Estado: FALLIDA
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
        -- Estado: ABORTADA
END;
/

-- Prueba
SELECT * FROM usuario WHERE id_Usuario = 2001;
SELECT * FROM perfil WHERE id_Usuario = 2001;
SELECT * FROM pago WHERE id_Usuario = 2001;


-- b) Transaccion de renovacion mensual
DECLARE
    -- Cursor con FOR LOOP
    CURSOR c_usuarios IS
        SELECT id_Usuario, id_Plan, fecha_ultimo_pago
        FROM Usuario
        WHERE estado_cuenta = 'ACTIVO'
          AND (fecha_ultimo_pago IS NULL 
               OR fecha_ultimo_pago < ADD_MONTHS(SYSDATE, -1));

    v_precio Plan.precio_mes%TYPE;

BEGIN
    -- Estado: ACTIVA
    FOR usuario IN c_usuarios LOOP
        SAVEPOINT sp_usuario;

        BEGIN
            -- Obtener precio de la suscripción
            SELECT precio_mes
            INTO v_precio
            FROM Plan
            WHERE id_Plan = usuario.id_Plan;

            -- Registrar pago
            INSERT INTO Pago (
                id_Pago, fecha, monto, metodo, estado, id_Usuario
            ) VALUES (
                (SELECT MAX(id_Pago)+1 FROM Pago), SYSDATE, v_precio, 'Tarjeta de Crédito', 'PAGADO', usuario.id_Usuario
            );

            -- Actualizar fecha de último pago
            UPDATE Usuario
            SET fecha_ultimo_pago = SYSDATE
            WHERE id_Usuario = usuario.id_Usuario;

            -- Estado: PARCIALMENTE CONFIRMADA (por usuario)
            
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error usuario ' || usuario.id_usuario || ': ' || SQLERRM);
                ROLLBACK TO sp_usuario;
                -- Estado: FALLIDA (solo ese usuario)
        END;

    END LOOP;
    COMMIT;
    -- Estado: CONFIRMADA

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
        -- Estado: ABORTADA
END;
/

-- Prueba
SELECT id_Usuario, id_Plan, fecha_ultimo_pago
    FROM Usuario
    WHERE estado_cuenta = 'ACTIVO'

-- c) Transacción de eliminación de cuenta
DECLARE
    v_id_usuario NUMBER := 2001;
BEGIN
    -- Estado: ACTIVA

    -- Eliminar calificaciones
    DELETE FROM Calificacion
    WHERE id_Perfil IN (
        SELECT id_Perfil
        FROM Perfil
        WHERE id_Usuario = v_id_usuario
    );

    -- Eliminar favoritos
    DELETE FROM PerfilFavoritos
    WHERE id_Perfil IN (
        SELECT id_Perfil FROM Perfil WHERE id_Usuario = v_id_usuario
    );

    -- Eliminar reproducciones
    DELETE FROM Reproduccion
    WHERE id_Perfil IN (
        SELECT id_Perfil FROM Perfil WHERE id_Usuario = v_id_usuario
    );

    -- Eliminar perfiles
    DELETE FROM Perfil
    WHERE id_Usuario = v_id_usuario;

    -- Eliminar pagos
    DELETE FROM Pago
    WHERE id_Usuario = v_id_usuario;

    -- Eliminar usuario
    DELETE FROM Usuario
    WHERE id_Usuario = v_id_usuario;

    -- Estado: PARCIALMENTE CONFIRMADA
    COMMIT;
    -- Estado: CONFIRMADA

EXCEPTION
    WHEN OTHERS THEN
        -- Estado: FALLIDA
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        ROLLBACK;
        -- Estado: ABORTADA
END;
/

-- Prueba
-- Se elimina el Usuario que se creó en la "transacción a)"
SELECT * FROM Usuario WHERE id_Usuario = 2001;

--===============================
-- 3.3.2 Concurrencia de datos
--===============================
-- Escenario de concurrencia: cambio de plan de suscripción

-- PRUEBA 1: SIN SELECT FOR UPDATE
-- SESION 1
UPDATE Usuario
SET id_Plan = 2
WHERE id_Usuario = 1;

-- SESION 2
UPDATE Usuario
SET id_Plan = 3
WHERE id_Usuario = 1;
-- Se bloquea hasta COMMIT de sesion 1

-- PRUEBA 2: CON SELECT FOR UPDATE
-- SESION 1
SELECT id_Usuario, nombre, id_Plan
FROM Usuario
WHERE id_Usuario = 1
FOR UPDATE;

UPDATE Usuario
SET id_Suscripcion = 2
WHERE id_Usuario = 1;

-- SESION 2
SELECT id_Usuario, nombre, id_Plan
FROM Usuario
WHERE id_Usuario = 1
FOR UPDATE;
-- Se bloquea desde el SELECT

-- SESION 1
COMMIT;

-- SESION 2 continúa
UPDATE Usuario
SET id_Plan = 3
WHERE id_Usuario = 1;

COMMIT;

/*
    Oracle maneja la concurrencia mediante bloqueos a nivel de fila.
    Sin SELECT FOR UPDATE, el bloqueo ocurre en el momento de la modificación.
    Con SELECT FOR UPDATE, el bloqueo se realiza desde la lectura,
    permitiendo un control más temprano y seguro de la concurrencia.
*/