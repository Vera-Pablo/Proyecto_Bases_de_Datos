/* ============================================================
   PROYECTO: Evaluación de Índice Columnstore en SQL Server
   AUTORES: Equipo 33
   OBJETIVO:
      - Crear tabla grande (1.000.000 de filas)
      - Crear índice columnstore
      - Comparar rendimiento con rowstore
   BASE DE DATOS: tienda_ropa_bis
   ============================================================ */

USE tienda_ropa;
GO


/* ============================================================
   PASO 1 — Crear tabla grande "ventas_big"
   ------------------------------------------------------------
   Tabla diseñada sin FKs para evitar inconsistencias.
   Contendrá 1 millón de registros basados en la tabla producto.
   ============================================================ */

IF OBJECT_ID('ventas_big') IS NOT NULL
    DROP TABLE ventas_big;
GO

CREATE TABLE ventas_big (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL
);
GO


/* ============================================================
   PASO 2 — Insertar 1.000.000 de registros reales
   ------------------------------------------------------------
   Cada registro:
       - Toma id_producto de 1..100
       - Toma precio_unitario del producto real
       - Genera una cantidad 1..5
       - Genera fecha distribuida en el último año
   ============================================================ */

;WITH gen AS (
    SELECT TOP (1000000)
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects a
    CROSS JOIN sys.all_objects b
)
INSERT INTO ventas_big (id_producto, cantidad, precio_unitario, fecha_venta)
SELECT
    ((n % 100) + 1) AS id_producto,         
    ((n % 5) + 1) AS cantidad,             
    (SELECT precio FROM producto 
     WHERE id_producto = ((n % 100) + 1)),
    DATEADD(DAY, -(n % 365), GETDATE())    
FROM gen;
GO


/* ============================================================
   PASO 3 — Crear tabla copia "ventas_big_rowstore"
   ------------------------------------------------------------
   Esta tabla NO tendrá índices columnstore.
   Sirve como versión "rowstore" para comparación.
   ============================================================ */

IF OBJECT_ID('ventas_big_rowstore') IS NOT NULL
    DROP TABLE ventas_big_rowstore;
GO

SELECT *
INTO ventas_big_rowstore
FROM ventas_big;
GO


/* ============================================================
   PASO 4 — Crear índice COLUMNSTORE NO AGRUPADO
   ------------------------------------------------------------
   No reemplaza el clustered index original (PK).
   Acelera consultas analíticas sin modificar estructura base.
   ============================================================ */

IF EXISTS (SELECT 1 FROM sys.indexes 
           WHERE name = 'idx_ncc_ventas_big')
    DROP INDEX idx_ncc_ventas_big ON ventas_big;
GO

CREATE NONCLUSTERED COLUMNSTORE INDEX idx_ncc_ventas_big
ON ventas_big (id_producto, cantidad, precio_unitario, fecha_venta);
GO


/* ============================================================
   PASO 5 — Activar estadísticas de rendimiento
   ------------------------------------------------------------
   IO = lecturas
   TIME = CPU + tiempo total
   ============================================================ */

SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO


/* ============================================================
   PASO 6 — PRUEBA 1:
            Agrupación por id_producto
   ------------------------------------------------------------
   Mide lectura masiva + agregación.
   ============================================================ */

PRINT '=== PRUEBA 1: GROUP BY id_producto — ROWSTORE ===';
SELECT id_producto, SUM(cantidad)
FROM ventas_big_rowstore
GROUP BY id_producto;
GO

PRINT '=== PRUEBA 1: GROUP BY id_producto — COLUMNSTORE ===';
SELECT id_producto, SUM(cantidad)
FROM ventas_big
GROUP BY id_producto;
GO


/* ============================================================
   PASO 7 — PRUEBA 2:
            Filtro por fecha (rango grande)
   ------------------------------------------------------------
   Evalúa segment elimination.
   ============================================================ */

PRINT '=== PRUEBA 2: Filtro fecha — ROWSTORE ===';
SELECT *
FROM ventas_big_rowstore
WHERE fecha_venta >= '2024-01-01';
GO

PRINT '=== PRUEBA 2: Filtro fecha — COLUMNSTORE ===';
SELECT *
FROM ventas_big
WHERE fecha_venta >= '2024-01-01';
GO


/* ============================================================
   PASO 8 — PRUEBA 3:
            Agregación + Filtro simultáneo
   ------------------------------------------------------------
   Mide cálculo masivo + selectividad.
   ============================================================ */

PRINT '=== PRUEBA 3: Agregados + rango — ROWSTORE ===';
SELECT fecha_venta, SUM(precio_unitario * cantidad)
FROM ventas_big_rowstore
WHERE id_producto BETWEEN 10 AND 50
GROUP BY fecha_venta;
GO

PRINT '=== PRUEBA 3: Agregados + rango — COLUMNSTORE ===';
SELECT fecha_venta, SUM(precio_unitario * cantidad)
FROM ventas_big
WHERE id_producto BETWEEN 10 AND 50
GROUP BY fecha_venta;
GO


/* ============================================================
   PASO 9 — Consulta de validación (opcional)
   ------------------------------------------------------------
   Verifica que existan los 1.000.000 de registros.
   ============================================================ */

PRINT '=== Conteo total en ventas_big ===';
SELECT COUNT(*) AS total_filas FROM ventas_big;
GO


/* ============================================================
   PASO 10 — Limpieza (opcional)
   ------------------------------------------------------------
   Solo ejecutar si se desea limpiar todo.
   ============================================================ */

-- DROP TABLE ventas_big_rowstore;
-- DROP INDEX idx_ncc_ventas_big ON ventas_big;
-- DROP TABLE ventas_big;
-- GO

