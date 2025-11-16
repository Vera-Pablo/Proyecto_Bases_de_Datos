/* ============================================================
   SCRIPT POR BLOQUES - CARGA LOTE (Moda unisex, rango Normal)
   Ejecutar en orden: 1 -> 9
   Cada bloque maneja su propio SET IDENTITY_INSERT ON/OFF
   
   INSTRUCCIONES DE EJECUCIÓN

    ****Conectate a la DB tienda_ropa: USE tienda_ropa;

    ****Ejecuta los bloques en el orden numerico (1 -> 9). Cada bloque esta separado por GO.

    ****Si necesitas ejecutar sólo hasta un punto y verificar, paras y examinas resultados antes de continuar.

    ****No ejecutes dos bloques de insercion con IDENTITY_INSERT ... ON simultaneamente (el script ya lo maneja).
   ============================================================ */

USE tienda_ropa;
GO

/* ------------------------------------------------------------
   BLOQUE 1: CATEGORIAS (30) - Tabla con IDENTITY
   ------------------------------------------------------------ */
SET IDENTITY_INSERT categoria ON;
INSERT INTO categoria (id_categoria, nombre_categoria)
VALUES
(1,'Remeras'),(2,'Camisas'),(3,'Pantalones'),(4,'Shorts'),(5,'Buzos'),
(6,'Camperas'),(7,'Abrigos'),(8,'Vestidos'),(9,'Faldas'),(10,'Ropa interior'),
(11,'Medias'),(12,'Sombreros'),(13,'Bufandas'),(14,'Guantes'),(15,'Calzado deportivo'),
(16,'Zapatos formales'),(17,'Bolsos'),(18,'Cinturones'),(19,'Accesorios'),(20,'Trajes de baño'),
(21,'Ropa deportiva'),(22,'Ropa de invierno'),(23,'Ropa de verano'),(24,'Outlet'),(25,'Denim'),
(26,'Niños - Bebés'),(27,'Niños - Niñas'),(28,'Niños - Varones'),(29,'Sastrería'),(30,'Edición limitada');
SET IDENTITY_INSERT categoria OFF;
GO

/* ------------------------------------------------------------
   BLOQUE 2: PROVEEDORES (50) - Tabla con IDENTITY
   Nombres "realistas" inventados, emails y teléfonos únicos.
   ------------------------------------------------------------ */
SET IDENTITY_INSERT proveedor ON;
INSERT INTO proveedor (id_proveedor, nombre_proveedor, email, telefono)
VALUES
(1,'Textil Norte','contacto@textilnorte.com','115000001'),
(2,'Distribuciones Sol','ventas@dsol.com.ar','115000002'),
(3,'Lanas & Cía','info@lanasycia.com','115000003'),
(4,'Atelier Sur','ventas@ateliersur.com','115000004'),
(5,'Importex SA','contacto@importex.com','115000005'),
(6,'Fábrica Urbana','pedidos@fabricaurbana.com','115000006'),
(7,'Hilo Fino','ventas@hilofino.com','115000007'),
(8,'Confecciones Delta','info@conedelta.com','115000008'),
(9,'Distribuciones Río','ventas@distririo.com','115000009'),
(10,'Moda Integral','contacto@modaintegral.com','115000010'),
(11,'Alfa Textil','ventas@alfatextil.com','115000011'),
(12,'Beta Proveedores','info@betaprov.com','115000012'),
(13,'Gamma Supply','contacto@gammasupply.com','115000013'),
(14,'Omega Textiles','ventas@omegatextiles.com','115000014'),
(15,'Linea Urbana','info@lineaurb.com','115000015'),
(16,'Costa Textil','contacto@costatextil.com','115000016'),
(17,'Sur & Norte S.A.','ventas@synd.com','115000017'),
(18,'Telas Modernas','info@telasmodernas.com','115000018'),
(19,'Confección Express','pedidos@confexpress.com','115000019'),
(20,'Proveedor 20','ventas20@proveedores.com','115000020'),
(21,'Proveedor 21','ventas21@proveedores.com','115000021'),
(22,'Proveedor 22','ventas22@proveedores.com','115000022'),
(23,'Proveedor 23','ventas23@proveedores.com','115000023'),
(24,'Proveedor 24','ventas24@proveedores.com','115000024'),
(25,'Proveedor 25','ventas25@proveedores.com','115000025'),
(26,'Proveedor 26','ventas26@proveedores.com','115000026'),
(27,'Proveedor 27','ventas27@proveedores.com','115000027'),
(28,'Proveedor 28','ventas28@proveedores.com','115000028'),
(29,'Proveedor 29','ventas29@proveedores.com','115000029'),
(30,'Proveedor 30','ventas30@proveedores.com','115000030'),
(31,'Proveedor 31','ventas31@proveedores.com','115000031'),
(32,'Proveedor 32','ventas32@proveedores.com','115000032'),
(33,'Proveedor 33','ventas33@proveedores.com','115000033'),
(34,'Proveedor 34','ventas34@proveedores.com','115000034'),
(35,'Proveedor 35','ventas35@proveedores.com','115000035'),
(36,'Proveedor 36','ventas36@proveedores.com','115000036'),
(37,'Proveedor 37','ventas37@proveedores.com','115000037'),
(38,'Proveedor 38','ventas38@proveedores.com','115000038'),
(39,'Proveedor 39','ventas39@proveedores.com','115000039'),
(40,'Proveedor 40','ventas40@proveedores.com','115000040'),
(41,'Proveedor 41','ventas41@proveedores.com','115000041'),
(42,'Proveedor 42','ventas42@proveedores.com','115000042'),
(43,'Proveedor 43','ventas43@proveedores.com','115000043'),
(44,'Proveedor 44','ventas44@proveedores.com','115000044'),
(45,'Proveedor 45','ventas45@proveedores.com','115000045'),
(46,'Proveedor 46','ventas46@proveedores.com','115000046'),
(47,'Proveedor 47','ventas47@proveedores.com','115000047'),
(48,'Proveedor 48','ventas48@proveedores.com','115000048'),
(49,'Proveedor 49','ventas49@proveedores.com','115000049'),
(50,'Proveedor 50','ventas50@proveedores.com','115000050');
SET IDENTITY_INSERT proveedor OFF;
GO

/* ------------------------------------------------------------
   BLOQUE 3: ROLES (15) - Tabla con IDENTITY
   ------------------------------------------------------------ */
SET IDENTITY_INSERT rol ON;
INSERT INTO rol (id_rol, nombre_rol)
VALUES
(1,'Administrador'),(2,'Cajero'),(3,'Vendedor'),(4,'Stockista'),(5,'Gerente'),
(6,'RRHH'),(7,'Soporte IT'),(8,'Marketing'),(9,'Analista'),(10,'Compras'),
(11,'Contabilidad'),(12,'Diseño'),(13,'Logística'),(14,'Auditor'),(15,'Práctica');
SET IDENTITY_INSERT rol OFF;
GO

/* ------------------------------------------------------------
   BLOQUE 4: TIPO_PAGO (5) - Tabla con IDENTITY
   ------------------------------------------------------------ */
SET IDENTITY_INSERT tipo_pago ON;
INSERT INTO tipo_pago (id_tipo_pago, nombre_pago)
VALUES
(1,'Efectivo'),(2,'Tarjeta Crédito'),(3,'Tarjeta Débito'),(4,'Transferencia'),(5,'QR / Wallet');
SET IDENTITY_INSERT tipo_pago OFF;
GO

/* ------------------------------------------------------------
   BLOQUE 5: PRODUCTOS (100) - Tabla con IDENTITY
   - Nombres por categoría (sin usar CONCAT con 1 arg)
   - Precios en rango aproximado 8.000..60.000 (fórmula)
   - stock realista 0..120
   ------------------------------------------------------------ */
SET IDENTITY_INSERT producto ON;

;WITH nums AS (
  SELECT TOP (100) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
  FROM sys.all_objects
)
INSERT INTO producto (id_producto, nombre_producto, precio, stock, id_categoria, id_proveedor)
SELECT
  n AS id_producto,
  -- CASE que devuelve literales o CONCAT con >=2 args cuando corresponde
  CASE ((n-1) % 30) + 1
    WHEN 1 THEN CASE WHEN n % 2 = 0 THEN 'Remera Básica Blanca' ELSE 'Remera Básica Negra' END
    WHEN 2 THEN CASE WHEN n % 3 = 0 THEN 'Camisa Oxford Celeste' WHEN n % 3 = 1 THEN 'Camisa Oxford Blanca' ELSE 'Camisa Oxford Azul' END
    WHEN 3 THEN CASE WHEN n % 2 = 0 THEN 'Jean Slim Azul' ELSE 'Jean Slim Negro' END
    WHEN 4 THEN CASE WHEN n % 2 = 0 THEN 'Short Lino Caqui' ELSE 'Short Lino Negro' END
    WHEN 5 THEN CASE WHEN n % 2 = 0 THEN 'Buzo Hoodie Gris' ELSE 'Buzo Hoodie Negro' END
    WHEN 6 THEN CASE WHEN n % 2 = 0 THEN 'Campera Softshell Negra' ELSE 'Campera Softshell Verde' END
    WHEN 7 THEN CASE WHEN n % 2 = 0 THEN 'Abrigo Lana Largo Camel' ELSE 'Abrigo Lana Largo Gris' END
    WHEN 8 THEN CASE WHEN n % 2 = 0 THEN 'Vestido Midi Rojo' ELSE 'Vestido Midi Verde' END
    WHEN 9 THEN CASE WHEN n % 2 = 0 THEN 'Falda Tableada Negra' ELSE 'Falda Tableada Azul' END
    WHEN 10 THEN 'Pack 3 Boxers'
    WHEN 11 THEN 'Medias Deportivas 3P'
    WHEN 12 THEN 'Gorro Punto'
    WHEN 13 THEN 'Bufanda Oversize'
    WHEN 14 THEN 'Guantes Térmicos'
    WHEN 15 THEN CONCAT('Zapatillas Urban ', CAST(n AS VARCHAR(5)))
    WHEN 16 THEN CONCAT('Zapato Formal Caballero ', CAST(n AS VARCHAR(5)))
    WHEN 17 THEN 'Cartera Tote'
    WHEN 18 THEN 'Cinturón Cuero'
    WHEN 19 THEN 'Llavero Metal'
    WHEN 20 THEN 'Malla de Baño'
    WHEN 21 THEN 'Remera Dry Fit'
    WHEN 22 THEN 'Camperón Invierno'
    WHEN 23 THEN 'Short Verano'
    WHEN 24 THEN 'Remera Outlet'
    WHEN 25 THEN 'Jean Relaxed'
    WHEN 26 THEN 'Body Bebé'
    WHEN 27 THEN 'Vestido Niña'
    WHEN 28 THEN 'Pantalón Niño'
    WHEN 29 THEN 'Saco Sastrería'
    WHEN 30 THEN 'Edición Limitada - Polo'
    ELSE CONCAT('Producto ', CAST(n AS VARCHAR(5)))
  END AS nombre_producto,
  -- Precio: fórmula para dispersión dentro 8000..60000
  CAST( (8000 + ((n * 271) % 52001) + ((n % 7) * 125)) AS DECIMAL(10,2)) AS precio,
  ((n * 13) % 121) AS stock,
  ((n-1) % 30) + 1 AS id_categoria,
  ((n * 3 - 1) % 50) + 1 AS id_proveedor
FROM nums;

SET IDENTITY_INSERT producto OFF;
GO

/* ------------------------------------------------------------
   BLOQUE 6: USUARIOS (100) - dni PK (no identity)
   - Nombres y apellidos plausibles, claves únicas
   ------------------------------------------------------------ */
;WITH names AS (
  SELECT TOP (100)
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n,
    CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 6 = 1 THEN 'Sofía'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 6 = 2 THEN 'Mateo'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 6 = 3 THEN 'Valentina'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 6 = 4 THEN 'Lucas'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 6 = 5 THEN 'Martina'
         ELSE 'Santiago' END AS nombre,
    CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 8 = 1 THEN 'González'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 8 = 2 THEN 'Rodríguez'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 8 = 3 THEN 'López'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 8 = 4 THEN 'Martínez'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 8 = 5 THEN 'Pérez'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 8 = 6 THEN 'Gómez'
         WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 8 = 7 THEN 'Sosa'
         ELSE 'Ruiz' END AS apellido
  FROM sys.all_objects
)
INSERT INTO usuario (dni, nombre_usuario, email, clave, id_rol)
SELECT
  31000000 + n AS dni,
  CONCAT(nombre, ' ', apellido) AS nombre_usuario,
  LOWER(CONCAT(LEFT(nombre,1), apellido, n, '@mail.com')) AS email,
  CONCAT('Pwd', RIGHT('000' + CAST(n AS VARCHAR(3)),3), '!') AS clave,
  ((n-1) % 15) + 1 AS id_rol
FROM names;
GO

/* ------------------------------------------------------------
   BLOQUE 7: TICKETS (100) - Tabla con IDENTITY
   - Fechas explícitas y variadas entre 2023-2025
   ------------------------------------------------------------ */
SET IDENTITY_INSERT ticket ON;

;WITH nums AS (
  SELECT TOP (100) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
  FROM sys.all_objects
),
dates AS (
  SELECT n,
         CASE WHEN n <= 35 THEN 2023 WHEN n <= 80 THEN 2024 ELSE 2025 END AS y,
         ((n-1) % 12) + 1 AS m,
         ((n * 5 - 3) % 28) + 1 AS d
  FROM nums
)
INSERT INTO ticket (id_ticket, fecha, dni)
SELECT
  n AS id_ticket,
  DATEFROMPARTS(d.y, d.m, d.d) AS fecha,
  31000000 + n AS dni
FROM dates d
ORDER BY d.n;

SET IDENTITY_INSERT ticket OFF;
GO

/* ------------------------------------------------------------
   BLOQUE 8: DETALLE_TICKET (250) - Tabla con IDENTITY
   - subtotal = cantidad * producto.precio (se calcula con JOIN)
   - Se generan 250 filas distribuidas entre tickets 1..100
   ------------------------------------------------------------ */
SET IDENTITY_INSERT detalle_ticket ON;

;WITH nums AS (
  SELECT TOP (250) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
  FROM sys.all_objects
),
detail_prep AS (
  SELECT
    n,
    ((n-1) % 100) + 1 AS id_ticket,
    (( (n * 11 - 7) % 100) + 1) AS id_producto,
    (( (n * 3 - 1) % 4) + 1) AS cantidad
  FROM nums
)
INSERT INTO detalle_ticket (id_detalle, cantidad, subtotal, id_ticket, id_producto)
SELECT
  dp.n AS id_detalle,
  dp.cantidad,
  -- subtotal calculado con el precio actual del producto; ROUND opcional para exactitud
  CAST( dp.cantidad * p.precio AS DECIMAL(10,2) ) AS subtotal,
  dp.id_ticket,
  dp.id_producto
FROM detail_prep dp
INNER JOIN producto p ON p.id_producto = dp.id_producto
ORDER BY dp.n;

SET IDENTITY_INSERT detalle_ticket OFF;
GO

/* ------------------------------------------------------------
   BLOQUE 9: PAGOS (100) - Tabla con IDENTITY
   - Un pago por ticket; monto = SUM(subtotal) por ticket.
   - Si un ticket no tiene detalle, monto = 0.00 (se inserta 0.00)
   ------------------------------------------------------------ */
SET IDENTITY_INSERT pago ON;

INSERT INTO pago (id_pago, monto, id_ticket, id_tipo_pago)
SELECT
  t.id_ticket AS id_pago,
  CAST(ISNULL(SUM(dt.subtotal), 0) AS DECIMAL(10,2)) AS monto,
  t.id_ticket,
  ((t.id_ticket - 1) % 5) + 1 AS id_tipo_pago
FROM ticket t
LEFT JOIN detalle_ticket dt ON dt.id_ticket = t.id_ticket
GROUP BY t.id_ticket
ORDER BY t.id_ticket;

SET IDENTITY_INSERT pago OFF;
GO

/* ============================================================
   FIN DE CARGA DE DATOS
   ============================================================ */

