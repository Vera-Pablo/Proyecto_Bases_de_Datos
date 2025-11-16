/* ============================================================
   PROCEDIMIENTOS ALMACENADAS 3 PROCEDIMIENTOS ALMACENADOS (CRUD)
   Tabla objetivo: [producto]
============================================================ */
USE tienda_ropa;
GO

/* ------------------------------------------------------------
   PROCEDIMIENTO PARA INSERTAR (CREATE)
   Objetivo: Crear un nuevo producto en la tabla.
------------------------------------------------------------ */
CREATE PROCEDURE InsertarProducto (
    -- Parámetros de entrada
    @p_nombre VARCHAR(150),
    @p_precio DECIMAL (10,2),
    @p_stock INT,
    @p_id_categoria INT,
    @p_id_proveedor INT
)
AS
BEGIN
    SET NOCOUNT ON; -- Evita que se muestren los mensajes de "filas afectadas"
    -- Validación básica 
    IF @p_precio <= 0 OR @p_stock < 0
    BEGIN
        -- Devuelve un error si los valores no son válidos
        RAISERROR('El precio y el stock deben ser valores positivos.', 16, 1);
        RETURN;
    END

    -- Validación para las FK existan (categoria)
    IF NOT EXISTS (SELECT 1 FROM categoria WHERE id_categoria = @p_id_categoria)
    BEGIN
        RAISERROR('El ID de Categoría no es válido.', 16, 1);
        RETURN;
    END

    -- Validación para las FK existan (proveedor)
    IF NOT EXISTS (SELECT 1 FROM proveedor WHERE id_proveedor = @p_id_proveedor)
    BEGIN
        RAISERROR('El ID de Categoría no es válido.', 16, 1);
        RETURN;
    END
    -- La operación de inserción
    INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor)
    VALUES (@p_nombre, @p_precio, @p_stock, @p_id_categoria, @p_id_proveedor);
END;
GO 

/* ------------------------------------------------------------
   PROCEDIMIENTO ALMACENADO PARA MODIFICAR (UPDATE)
   Objetivo: Actualizar el precio y stock de un producto existente.
------------------------------------------------------------ */
CREATE PROCEDURE ModificarProducto (
    -- Parámetros de entrada
    @p_id_producto INT,
    @p_precio DECIMAL(10,2),
    @p_stock INT
)
AS
BEGIN
    SET NOCOUNT ON;
    -- Validación: Asegurar que el producto exista
    IF NOT EXISTS (SELECT 1 FROM producto WHERE id_producto = @p_id_producto)
    BEGIN
        RAISERROR('El producto ID no existe.', 16, 1);
        RETURN;
    END

    -- Validación: Nuevos valores
    IF @p_precio <= 0 OR @p_stock < 0
    BEGIN
        RAISERROR('El nuevo precio y stock deben ser valores positivos.', 16, 1);
        RETURN;
    END

    -- Operación de actualización
    UPDATE producto
    SET 
        precio = @p_precio,
        stock = @p_stock
    WHERE 
        id_producto = @p_id_producto;
END
GO

/* ------------------------------------------------------------
   PROCEDIMIENTO ALMACENADOS PARA BORRAR (DELETE)
   Objetivo: Eliminar un producto por su ID.
------------------------------------------------------------ */
CREATE PROCEDURE BorrarProducto (
    -- Parámetro de entrada
    @p_id_producto INT
)
AS
BEGIN
    SET NOCOUNT ON;
    -- Validación CRÍTICA: No se puede borrar un producto si tiene ventas. (Para proteger la integridad referencial de 'detalle_ticket')
    IF EXISTS (SELECT 1 FROM detalle_ticket WHERE id_producto = @p_id_producto)
    BEGIN
        RAISERROR('No se puede eliminar el producto, ya tiene ventas asociadas.', 16, 1);
        RETURN;
    END

    -- La operación de borrado
    DELETE FROM producto
    WHERE id_producto = @p_id_producto;
END
GO 

PRINT '>>> Procedimientos CRUD (Insertar, Modificar, Borrar) para [producto] creados exitosamente.';