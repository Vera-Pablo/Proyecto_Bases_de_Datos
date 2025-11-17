USE tienda_ropa;
GO

DECLARE @DniValido INT = 31000001; -- <--- (Usamos el mismo usuario del caso de exito)
DECLARE @ProductoID_Ok INT = 5;     -- (Usamos producto 5 'Buzo Hoodie Negro')
DECLARE @ProductoID_Falla INT = 9999; -- (Producto inexistente para forzar error)
-- -----------------------------------------------

PRINT '--- ESTADO INICIAL ---';
SELECT dni, nombre_usuario FROM usuario WHERE dni = @DniValido;
SELECT nombre_producto, stock FROM producto WHERE id_producto = @ProductoID_Ok;
SELECT COUNT(*) AS 'Total de Tickets ANTES' FROM ticket;

BEGIN TRY
    BEGIN TRANSACTION;
    PRINT 'Transacción iniciada...';

    -- 1. Tarea A: Insertar en Tabla A (ticket) (Este paso FUNCIONA)
    INSERT INTO ticket (dni) VALUES (@DniValido);
    DECLARE @NuevoTicketID INT = SCOPE_IDENTITY();
    PRINT 'Paso 1: Ticket ' + CAST(@NuevoTicketID AS VARCHAR) + ' creado para DNI ' + CAST(@DniValido AS VARCHAR);

    -- 2. Tarea B: Insertar en Tabla B (Este paso FUNCIONA)
    INSERT INTO detalle_ticket (cantidad, subtotal, id_ticket, id_producto)
    VALUES (1, 1500.00, @NuevoTicketID, @ProductoID_Ok);
    PRINT 'Paso 2: Detalle de venta (producto OK) agregado.';

    -- 3. Tarea B (continuación): Insertar producto FANTASMA (Este paso FALLA)
    PRINT 'Paso 3: Intentando agregar producto inexistente (ID ' + CAST(@ProductoID_Falla AS VARCHAR) + ')...';
    INSERT INTO detalle_ticket (cantidad, subtotal, id_ticket, id_producto)
    VALUES (1, 100.00, @NuevoTicketID, @ProductoID_Falla); -- ¡ERROR DE FK!

    -- 4. Tarea C: Actualizar Tabla C (Esta línea NUNCA se ejecuta)
    UPDATE producto SET stock = stock - 1 WHERE id_producto = @ProductoID_Ok;
    PRINT 'Paso 4: Stock actualizado (NO DEBERÍA LLEGAR AQUÍ).';

    COMMIT TRANSACTION;

END TRY
BEGIN CATCH
    -- 5. El error del Paso 3 nos envía directamente aquí
    ROLLBACK TRANSACTION;
    PRINT '--- ERROR DETECTADO: ROLLBACK REALIZADO ---';
    PRINT 'Mensaje de Error: ' + ERROR_MESSAGE();
END CATCH

PRINT '--- ESTADO FINAL (SIN CAMBIOS) ---';
SELECT nombre_producto, stock FROM producto WHERE id_producto = @ProductoID_Ok;
SELECT COUNT(*) AS 'Total de Tickets DESPUÉS' FROM ticket;