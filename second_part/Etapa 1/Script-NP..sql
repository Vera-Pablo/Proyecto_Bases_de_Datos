-- ============================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS "tienda_ropa"
-- ============================================

--CREATE DATABASE tienda_ropa;
--USE tienda_ropa;

-- ============================================
-- TABLA: categoria
-- ============================================
CREATE TABLE categoria (
  id_categoria INT CONSTRAINT pk_categoria PRIMARY KEY IDENTITY(1,1),
  nombre_categoria VARCHAR(150) NOT NULL,
  CONSTRAINT uq_categoria_nombre UNIQUE (nombre_categoria)
);

-- ============================================
-- TABLA: proveedor
-- ============================================
CREATE TABLE proveedor (
  id_proveedor INT CONSTRAINT pk_proveedor PRIMARY KEY IDENTITY(1,1),
  nombre_proveedor VARCHAR(150) NOT NULL,
  email VARCHAR(150) NOT NULL,
  telefono VARCHAR(50) NOT NULL,
  CONSTRAINT uq_proveedor_email UNIQUE (email),
  CONSTRAINT uq_proveedor_telefono UNIQUE (telefono)
);

-- ============================================
-- TABLA: producto
-- ============================================
CREATE TABLE producto (
  id_producto INT CONSTRAINT pk_producto PRIMARY KEY IDENTITY(1,1),
  nombre_producto VARCHAR(150) NOT NULL,
  precio DECIMAL(10,2) CHECK (precio > 0),
  stock INT CHECK (stock >= 0),
  id_categoria INT NOT NULL,
  id_proveedor INT NOT NULL,
  CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
  CONSTRAINT fk_producto_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- ============================================
-- TABLA: rol
-- ============================================
CREATE TABLE rol (
  id_rol INT CONSTRAINT pk_rol PRIMARY KEY IDENTITY(1,1),
  nombre_rol VARCHAR(50) NOT NULL,
  CONSTRAINT uq_rol_nombre UNIQUE (nombre_rol)
);

-- ============================================
-- TABLA: usuario
-- ============================================
CREATE TABLE usuario (
  dni INT CONSTRAINT pk_usuario PRIMARY KEY,
  nombre_usuario VARCHAR(250) NOT NULL,
  email VARCHAR(150) NOT NULL,
  clave VARCHAR(100) NOT NULL,
  id_rol INT NOT NULL,
  CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES rol(id_rol),
  CONSTRAINT uq_usuario_email UNIQUE (email),
  CONSTRAINT uq_usuario_clave UNIQUE (clave)
);

-- ============================================
-- TABLA: ticket
-- ============================================
CREATE TABLE ticket (
  id_ticket INT CONSTRAINT pk_ticket PRIMARY KEY IDENTITY(1,1),
  fecha DATE DEFAULT GETDATE(),
  dni INT NOT NULL,
  CONSTRAINT fk_ticket_usuario FOREIGN KEY (dni) REFERENCES usuario(dni)
);

-- ============================================
-- TABLA: detalle_ticket
-- ============================================
CREATE TABLE detalle_ticket (
  id_detalle INT CONSTRAINT pk_detalle_ticket PRIMARY KEY IDENTITY(1,1),
  cantidad INT CHECK (cantidad > 0),
  subtotal DECIMAL(10,2) CHECK (subtotal >= 0),
  id_ticket INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT fk_detalle_ticket FOREIGN KEY (id_ticket) REFERENCES ticket(id_ticket),
  CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- ============================================
-- TABLA: tipo_pago
-- ============================================
CREATE TABLE tipo_pago (
  id_tipo_pago INT CONSTRAINT pk_tipo_pago PRIMARY KEY IDENTITY(1,1),
  nombre_pago VARCHAR(50) NOT NULL,
  CONSTRAINT uq_tipo_pago_nombre UNIQUE (nombre_pago)
);

-- ============================================
-- TABLA: pago
-- ============================================
CREATE TABLE pago (
  id_pago INT CONSTRAINT pk_pago PRIMARY KEY IDENTITY(1,1),
  monto DECIMAL(10,2) CHECK (monto >= 0),
  id_ticket INT NOT NULL UNIQUE,
  id_tipo_pago INT NOT NULL,
  CONSTRAINT fk_pago_ticket FOREIGN KEY (id_ticket) REFERENCES ticket(id_ticket),
  CONSTRAINT fk_pago_tipo FOREIGN KEY (id_tipo_pago) REFERENCES tipo_pago(id_tipo_pago)
);
