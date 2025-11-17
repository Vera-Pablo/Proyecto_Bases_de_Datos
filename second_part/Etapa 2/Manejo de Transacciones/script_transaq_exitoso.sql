USE tienda_ropa;
GO

PRINT '--- ESTADO INICIAL ---';
-- Revisamos el DNI el primero usuario (31000001) de la tabla usuario y el producto 5
SELECT TOP 1 dni, nombre_usuario FROM usuario;
SELECT nombre_producto, stock, precio FROM producto WHERE id_producto = 5;
GO

BEGIN TRY
    BEGIN TRANSACTION;
    PRINT 'Transacción iniciada...';

    -- 1. Tarea A: Insertar en Tabla A (ticket)
    -- Usamos el DNI VÁLIDO '31000001'
    INSERT INTO ticket (dni) VALUES (31000001);
    
    DECLARE @NuevoTicketID INT = SCOPE_IDENTITY();
    PRINT 'Paso 1: Ticket ' + CAST(@NuevoTicketID AS VARCHAR) + ' creado para DNI 31000001.';

    -- 2. Tarea B: Insertar en Tabla B (detalle_ticket)
    -- Vendemos 2 'Buzo Hoodie Negro' (ID 5). Precio 9980 c/u = Subtotal 19960
    INSERT INTO detalle_ticket (cantidad, subtotal, id_ticket, id_producto)
    VALUES (2, 19960, @NuevoTicketID, 5);
    PRINT 'Paso 2: Detalle de venta para producto 5 agregado.';

    -- 3. Tarea C: Actualizar Tabla C (producto)
    -- Descontamos el stock
    UPDATE producto
    SET stock = stock - 2
    WHERE id_producto = 5;
    PRINT 'Paso 3: Stock del producto 5 actualizado.';

    COMMIT TRANSACTION;
    PRINT '--- ÉXITO: COMMIT REALIZADO ---';

END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT '--- ERROR: ROLLBACK REALIZADO ---';
    PRINT 'Mensaje de Error: ' + ERROR_MESSAGE();
END CATCH
GO

PRINT '--- ESTADO FINAL (TAREA A) ---';
-- El stock debe ser 63
SELECT nombre_producto, stock FROM producto WHERE id_producto = 5;
GO