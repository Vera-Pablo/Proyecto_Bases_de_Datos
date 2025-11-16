/* ============================================================
   FUNCIONES ALMACENADAS: 3 FUNCIONES ALMACENADAS
============================================================ */
USE tienda_ropa;
GO

/* ------------------------------------------------------------
   FUNCIÓN ESCALAR: Obtener el nombre de un producto
   Objetivo: Recibe un ID de producto y devuelve su nombre.
------------------------------------------------------------ */
CREATE FUNCTION Obtener_nombre_producto (
    @id_producto INT  -- Parámetro de entrada
)
RETURNS VARCHAR(150) -- Se especifica el tipo de dato que devolverá
AS
BEGIN
    DECLARE @nombre VARCHAR(150);

    SELECT @nombre = nombre_producto
    FROM producto
    WHERE id_producto = @id_producto;

    RETURN @nombre; -- Devuelve el valor
END
GO 

/* ------------------------------------------------------------
   FUNCIÓN ESCALAR: Calcular el total de un ticket
   Objetivo: Recibe un ID de ticket y devuelve la suma total de sus subtotales en la tabla 'detalle_ticket'.
------------------------------------------------------------ */
CREATE FUNCTION Total_Ticker (
    @id_ticket INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @total DECIMAL(10,2);

    -- Calcula la suma de los subtotales para ese ticket
    SELECT @total = SUM(subtotal)
    FROM detalle_ticket
    WHERE id_ticket = @id_ticket;
    
    -- Si el ticket no tiene detalles (ISNULL), devuelve 0.00
    RETURN ISNULL(@total, 0.00);
END
GO

/* ------------------------------------------------------------
   FUNCIÓN ESCALAR: Obtener el stock actual de un producto
   Objetivo: Recibe un ID de producto y devuelve su stock.
------------------------------------------------------------ */
CREATE FUNCTION Obtener_Stock (
    @id_producto INT
)
RETURNS INT
AS
BEGIN
    DECLARE @stock INT;

    SELECT @stock = stock
    FROM producto
    WHERE id_producto = @id_producto;

    RETURN @stock;
END
GO 

PRINT '>>> Tarea 4 completada. 3 Funciones Almacenadas creadas exitosamente.';
GO