/* ============================================================
   TEMA 1: PRUEBA DE UPDATE Y DELETE CON PAs
   Objetivo: Invocar los PAs ModificarProducto y BorrarProducto sobre los registros insertados.
============================================================ */
USE tienda_ropa;
GO

PRINT '--- PRUEBA DE UPDATE Y DELETE ---';
GO

--------------------------------------------------------------------------------
-- BLOQUE C: PRUEBA DE MODIFICACIÓN (UPDATE)
--------------------------------------------------------------------------------
PRINT '--- Probamos ModificarProducto ---';

DECLARE @ID_Modificar INT;
DECLARE @NuevoPrecio DECIMAL(10,2) = 9999.99;
DECLARE @NuevoStock INT = 777;

-- Buscamos el ID del producto 'Prueba PA 5'
SET @ID_Modificar = (SELECT id_producto FROM producto WHERE nombre_producto = 'Prueba PA 5');

IF @ID_Modificar IS NOT NULL
BEGIN
    PRINT '-> ANTES de Modificar (ID: ' + CAST(@ID_Modificar AS VARCHAR) + '):';
    SELECT id_producto, nombre_producto, precio, stock 
    FROM producto 
    WHERE id_producto = @ID_Modificar;

    -- Ejecutamos el PA de Modificación
    EXECUTE ModificarProducto
        @p_id_producto = @ID_Modificar,
        @p_precio = @NuevoPrecio,
        @p_stock = @NuevoStock;

    PRINT '-> DESPUÉS de Modificar:';
    SELECT id_producto, nombre_producto, precio, stock 
    FROM producto 
    WHERE id_producto = @ID_Modificar;
    PRINT '... Modificación completada.';
END
ELSE
BEGIN
    PRINT 'No se encontró el producto ''Prueba PA 5'' para modificar.';
END
GO

--------------------------------------------------------------------------------
-- BLOQUE D: PRUEBA DE BORRADO (DELETE)
--------------------------------------------------------------------------------
PRINT '--- Probamos BorrarProducto ---';

DECLARE @ID_Borrar INT;

-- Buscamos el ID del producto 'Prueba PA 10'
SET @ID_Borrar = (SELECT id_producto FROM producto WHERE nombre_producto = 'Prueba PA 10');

IF @ID_Borrar IS NOT NULL
BEGIN
    PRINT '-> ANTES de Borrar (ID: ' + CAST(@ID_Borrar AS VARCHAR) + '):';
    SELECT id_producto, nombre_producto, precio, stock 
    FROM producto 
    WHERE id_producto = @ID_Borrar;

    -- Ejecutamos el PA de Borrado
    EXECUTE BorrarProducto
        @p_id_producto = @ID_Borrar;

    PRINT '-> DESPUÉS de Borrar (debería estar vacío):';
    SELECT id_producto, nombre_producto, precio, stock 
    FROM producto 
    WHERE id_producto = @ID_Borrar;
    PRINT '... Borrado completado.';
END
ELSE
BEGIN
    PRINT 'No se encontró el producto ''Prueba PA 10'' para borrar.';
END
GO
