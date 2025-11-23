/* ============================================================
   FUNCIONES ALMACENADAS: 3 FUNCIONES ALMACENADAS
============================================================ */
USE tienda_ropa;
GO
-- SET STATISTICS TIME ON;
-- SET STATISTICS IO ON;
-- SET STATISTICS TIME OFF;
-- SET STATISTICS IO OFF;

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

-- SELECT dbo.Obtener_nombre_producto(1) AS NombreEjemplo; -- Prueba rápida de la función

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
   FUNCIÓN ESCALAR GLOBAL
   Objetivo: Calcular la suma total de TODAS las ventas registradas.
   Retorno: Un único valor decimal con el dinero total histórico.
------------------------------------------------------------ */
CREATE FUNCTION Calcular_Total ()
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @gran_total DECIMAL(10,2);

    -- Calcula la suma de la columna subtotal de TODA la tabla
    SELECT @gran_total = SUM(subtotal)
    FROM detalle_ticket;
    
    -- Si la tabla está vacía, devuelve 0.00
    RETURN ISNULL(@gran_total, 0.00);
END
GO

-- SELECT dbo.Calcular_Total() AS TotalVentas; -- Prueba rápida de la función


-- Consulta directa:
-- SELECT ISNULL(SUM(subtotal), 0.00) AS Gran_Total
-- FROM detalle_ticket;



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

SELECT dbo.Obtener_Stock(2) AS StockEjemplo; -- Prueba rápida de la función
PRINT '>>> Tarea 4 completada. 3 Funciones Almacenadas creadas exitosamente.';
GO
--------------------------------------------------------------------------------------

