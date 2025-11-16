/* ============================================================
   PRUEBA DE LOTES PARA COMPARACIÓN DE EFICIENCIA
   Tabla objetivo: [producto]
   Objetivo: Insertar 100 registros con SQL directo (Prueba A) e Insertar 100 registros con PA (Prueba B).
============================================================ */
USE tienda_ropa;
GO

-- 1. LIMPIEZA DE DATOS DE PRUEBA
-- Se eliminan los productos con IDs altos que se insertarán para la prueba. Esto es para reutilizar el script sin tocar los IDs 1-100 originales.
DELETE FROM producto WHERE id_producto > 100;

SELECT COUNT(*) AS productos_cargados FROM producto WHERE id_producto > 100;
GO

--------------------------------------------------------------------------------
-- BLOQUE A: INSERCIÓN CON SQL DIRECTO
--------------------------------------------------------------------------------
-- Estadísticas de rendimiento 
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

-- Inicio del lote de inserción directa (100 sentencias)
-- Reemplaza los comentarios '...' en tu script con estas 100 líneas:
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 1', 10.50, 11, 1, 1);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 2', 11.00, 12, 2, 2);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 3', 11.50, 13, 3, 3);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 4', 12.00, 14, 4, 4);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 5', 12.50, 15, 5, 5);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 6', 13.00, 16, 6, 6);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 7', 13.50, 17, 7, 7);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 8', 14.00, 18, 8, 8);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 9', 14.50, 19, 9, 9);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 10', 15.00, 20, 10, 10);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 11', 15.50, 21, 11, 11);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 12', 16.00, 22, 12, 12);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 13', 16.50, 23, 13, 13);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 14', 17.00, 24, 14, 14);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 15', 17.50, 25, 15, 15);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 16', 18.00, 26, 16, 16);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 17', 18.50, 27, 17, 17);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 18', 19.00, 28, 18, 18);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 19', 19.50, 29, 19, 19);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 20', 20.00, 30, 20, 20);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 21', 20.50, 31, 21, 21);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 22', 21.00, 32, 22, 22);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 23', 21.50, 33, 23, 23);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 24', 22.00, 34, 24, 24);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 25', 22.50, 35, 25, 25);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 26', 23.00, 36, 26, 26);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 27', 23.50, 37, 27, 27);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 28', 24.00, 38, 28, 28);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 29', 24.50, 39, 29, 29);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 30', 25.00, 40, 30, 30);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 31', 25.50, 41, 1, 31);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 32', 26.00, 42, 2, 32);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 33', 26.50, 43, 3, 33);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 34', 27.00, 44, 4, 34);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 35', 27.50, 45, 5, 35);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 36', 28.00, 46, 6, 36);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 37', 28.50, 47, 7, 37);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 38', 29.00, 48, 8, 38);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 39', 29.50, 49, 9, 39);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 40', 30.00, 50, 10, 40);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 41', 30.50, 51, 11, 41);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 42', 31.00, 52, 12, 42);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 43', 31.50, 53, 13, 43);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 44', 32.00, 54, 14, 44);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 45', 32.50, 55, 15, 45);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 46', 33.00, 56, 16, 46);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 47', 33.50, 57, 17, 47);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 48', 34.00, 58, 18, 48);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 49', 34.50, 59, 19, 49);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 50', 35.00, 60, 20, 50);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 51', 35.50, 61, 21, 1);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 52', 36.00, 62, 22, 2);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 53', 36.50, 63, 23, 3);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 54', 37.00, 64, 24, 4);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 55', 37.50, 65, 25, 5);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 56', 38.00, 66, 26, 6);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 57', 38.50, 67, 27, 7);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 58', 39.00, 68, 28, 8);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 59', 39.50, 69, 29, 9);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 60', 40.00, 70, 30, 10);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 61', 40.50, 71, 1, 11);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 62', 41.00, 72, 2, 12);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 63', 41.50, 73, 3, 13);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 64', 42.00, 74, 4, 14);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 65', 42.50, 75, 5, 15);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 66', 43.00, 76, 6, 16);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 67', 43.50, 77, 7, 17);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 68', 44.00, 78, 8, 18);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 69', 44.50, 79, 9, 19);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 70', 45.00, 80, 10, 20);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 71', 45.50, 81, 11, 21);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 72', 46.00, 82, 12, 22);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 73', 46.50, 83, 13, 23);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 74', 47.00, 84, 14, 24);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 75', 47.50, 85, 15, 25);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 76', 48.00, 86, 16, 26);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 77', 48.50, 87, 17, 27);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 78', 49.00, 88, 18, 28);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 79', 49.50, 89, 19, 29);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 80', 50.00, 90, 20, 30);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 81', 50.50, 91, 21, 31);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 82', 51.00, 92, 22, 32);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 83', 51.50, 93, 23, 33);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 84', 52.00, 94, 24, 34);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 85', 52.50, 95, 25, 35);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 86', 53.00, 96, 26, 36);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 87', 53.50, 97, 27, 37);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 88', 54.00, 98, 28, 38);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 89', 54.50, 99, 29, 39);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 90', 55.00, 10, 30, 40);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 91', 55.50, 11, 1, 41);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 92', 56.00, 12, 2, 42);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 93', 56.50, 13, 3, 43);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 94', 57.00, 14, 4, 44);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 95', 57.50, 15, 5, 45);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 96', 58.00, 16, 6, 46);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 97', 58.50, 17, 7, 47);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 98', 59.00, 18, 8, 48);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 99', 59.50, 19, 9, 49);
INSERT INTO producto (nombre_producto, precio, stock, id_categoria, id_proveedor) VALUES ('Prueba Dir 100', 60.00, 20, 10, 50);

-- Deshabilitar estadísticas 
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

--------------------------------------------------------------------------------
-- BLOQUE B: INSERCIÓN CON PROCEDIMIENTO ALMACENADO
--------------------------------------------------------------------------------
-- Estadísticas de rendimiento 
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

DECLARE @i INT = 1;
DECLARE @cat INT;
DECLARE @prov INT;
DECLARE @nombre VARCHAR(150);
DECLARE @precio DECIMAL(10,2);

-- Bucle WHILE para ejecutar el PA 100 veces
WHILE @i <= 100
BEGIN
    -- Generar IDs de FKs que existen (para no fallar)
    SET @cat = ((@i - 1) % 30) + 1; -- Categoria 1 a 30
    SET @prov = ((@i - 1) % 50) + 1; -- Proveedor 1 a 50
    SET @nombre = CONCAT('Prueba PA ', CAST(@i AS VARCHAR(10)))
    SET @precio = 10.00 + (@i * 0.50);

    -- Invocación al Procedimiento Almacenado
    EXECUTE InsertarProducto
        @p_nombre = @nombre,
        @p_precio = @precio,
        @p_stock = 100,
        @p_id_categoria = @cat,
        @p_id_proveedor = @prov;

    SET @i = @i + 1;
END

-- Deshabilitar estadísticas (Fin del Bloque B)
SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

PRINT '>>> Tarea 2 completada. Dos lotes de 100 productos insertados para el análisis de eficiencia.';