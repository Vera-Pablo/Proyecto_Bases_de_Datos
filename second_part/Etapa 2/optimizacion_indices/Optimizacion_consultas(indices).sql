/* ============================================================
   PROYECTO: Optimización de Consultas (Índices)
   AUTOR: Abel (Equipo 33)
   BASE DE DATOS: tienda_ropa
   OBJETIVO:
     1. Demostrar mejora en LECTURA (Heap vs Clustered vs Covering).
     2. Demostrar penalización en ESCRITURA (Insert Cost).
   ============================================================ */

USE tienda_ropa;
GO

SET NOCOUNT ON;

/* ============================================================
   PASO 1: Preparación y Carga Masiva (1 Millón de Registros)
   ============================================================ */
IF OBJECT_ID('gasto_big') IS NOT NULL DROP TABLE gasto_big;

CREATE TABLE gasto_big (
    id_gasto INT IDENTITY(1,1),
    periodo INT,
    fecha_pago DATE,
    tipo_gasto_id INT,
    importe DECIMAL(10,2)
);
GO

PRINT '--- INICIANDO CARGA MASIVA (1.000.000 REGISTROS) ---';
-- Usamos técnica Set-Based para carga ultra rápida
INSERT INTO gasto_big (periodo, fecha_pago, tipo_gasto_id, importe)
SELECT TOP 1000000
    (ABS(CHECKSUM(NEWID())) % 12) + 1,
    DATEADD(DAY, (ABS(CHECKSUM(NEWID())) % 3650) * -1, GETDATE()), -- Últimos 10 años
    (ABS(CHECKSUM(NEWID())) % 5) + 1,
    (ABS(CHECKSUM(NEWID())) % 10000) + 500
FROM sys.all_objects a CROSS JOIN sys.all_objects b;

PRINT 'Carga completada.';
GO

/* Activamos estadísticas para medir el rendimiento real */
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

/* ============================================================
   PRUEBA DE LECTURA 1: SIN ÍNDICES (HEAP)
   ============================================================ */
PRINT ' ';
PRINT '=== ESCENARIO A: Búsqueda en HEAP (Table Scan) ===';
-- Limpiamos caché para que la prueba sea real
CHECKPOINT; DBCC DROPCLEANBUFFERS; 

SELECT importe, periodo, tipo_gasto_id
FROM gasto_big
WHERE fecha_pago BETWEEN '2017-01-01' AND '2017-01-31';
GO

/* ============================================================
   PRUEBA DE LECTURA 2: ÍNDICE AGRUPADO (CLUSTERED)
   ============================================================ */
PRINT ' ';
PRINT '>>> Creando Índice Agrupado en fecha_pago...';
CREATE CLUSTERED INDEX CX_fecha ON gasto_big(fecha_pago);
GO

PRINT '=== ESCENARIO B: Búsqueda con CLUSTERED INDEX ===';
CHECKPOINT; DBCC DROPCLEANBUFFERS;

SELECT importe, periodo, tipo_gasto_id
FROM gasto_big
WHERE fecha_pago BETWEEN '2017-01-01' AND '2017-01-31';
GO

/* ============================================================
   PRUEBA DE LECTURA 3: ÍNDICE COBERTOR (COVERING INDEX)
   ------------------------------------------------------------
   Esta es la técnica avanzada: Incluimos las columnas que
   pide el SELECT para evitar ir a la tabla (Key Lookup).
   ============================================================ */
PRINT ' ';
PRINT '>>> Optimizando: Creando Índice Cobertor (INCLUDE)...';
-- Primero volvemos a poner el Clustered en el ID (lo normal)
DROP INDEX CX_fecha ON gasto_big;
CREATE CLUSTERED INDEX PK_gasto_big ON gasto_big(id_gasto);

-- Creamos el índice optimizado
CREATE NONCLUSTERED INDEX IX_Covering_Fecha
ON gasto_big(fecha_pago)
INCLUDE (importe, periodo, tipo_gasto_id);
GO

PRINT '=== ESCENARIO C: Búsqueda con COVERING INDEX ===';
CHECKPOINT; DBCC DROPCLEANBUFFERS;

SELECT importe, periodo, tipo_gasto_id
FROM gasto_big
WHERE fecha_pago BETWEEN '2017-01-01' AND '2017-01-31';
GO

/* ============================================================
   PRUEBA 4: EL COSTO DE LOS ÍNDICES (PENALIZACIÓN EN INSERT)
   ------------------------------------------------------------
   Demostración de la desventaja teórica: Inserción lenta.
   ============================================================ */
PRINT ' ';
PRINT '=== PRUEBA DE ESCRITURA: Impacto en INSERT ===';

-- Tabla temporal SIN índices
SELECT TOP 0 * INTO #SinIndices FROM gasto_big;
-- Tabla temporal CON índices
SELECT TOP 0 * INTO #ConIndices FROM gasto_big;
CREATE CLUSTERED INDEX CX_Temp ON #ConIndices(fecha_pago);
CREATE NONCLUSTERED INDEX IX_Temp ON #ConIndices(tipo_gasto_id);

SET STATISTICS TIME ON;
PRINT '> Insertando 20.000 filas en tabla SIN índices...';
INSERT INTO #SinIndices 
SELECT TOP 20000 periodo, fecha_pago, tipo_gasto_id, importe FROM gasto_big;

PRINT '> Insertando 20.000 filas en tabla CON índices...';
INSERT INTO #ConIndices 
SELECT TOP 20000 periodo, fecha_pago, tipo_gasto_id, importe FROM gasto_big;
SET STATISTICS TIME OFF;
GO

/* Limpieza */
SET STATISTICS IO OFF;
-- DROP TABLE gasto_big; DROP TABLE #SinIndices; DROP TABLE #ConIndices;