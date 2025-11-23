# Proyecto Bases de Datos I

## 📚 Información del Proyecto

- **Universidad:** Universidad Nacional del Nordeste (UNNE)
- **Facultad:** Facultad de Ciencias Exactas y Naturales y Agrimensura
- **Materia:** Bases de Datos I
- **Profesores:**
  - Lic. Villegas, Darío O.
  - Exp. Cuzziol, Juan J.
  - Lic. Vallejos, Walter O.
  - Lic. Badaracco Numa
- **Alumnos Encargados:**
  - Gariglio, Néstor David
  - González Billordo, Abel Benjamín
  - Silva Zeniquel, Pablo
  - Vera, Pablo Gabriel

---

## 🎯 Objetivo de la Primera Entrega

El objetivo principal de esta primera etapa fue la **descripción del caso de estudio** y la **formalización del modelo de datos**. Esto se logró mediante la elaboración de los siguientes componentes:

- **Descripción del Problema y Objetivos:** Definición del alcance del proyecto, identificación del problema a resolver y establecimiento de objetivos generales y específicos del sistema.
- **Modelo de Datos Relacional:** Diseño del esquema relacional para la base de datos del proyecto *NP (Sistema de Gestión para Tienda de Ropa)*, derivado de un Esquema-Relacional (ER).
- **Diccionario de Datos:** Documentación detallada de las tablas, atributos, tipos de datos, claves primarias/foráneas y restricciones del modelo relacional.

---

## 🚀 Objetivo de la Segunda Entrega (Final)

El objetivo de esta etapa final fue la **implementación práctica y técnica** del modelo en un motor de base de datos (**Microsoft SQL Server**), integrando lógica de negocio y optimización. Se desarrollaron los siguientes componentes:

- **Implementación Física (DDL/DML):** Creación de tablas con restricciones de integridad y carga de lotes de datos de prueba masivos.
- **Programación en Base de Datos:** Desarrollo de **Procedimientos Almacenados** (CRUD) y **Funciones** para encapsular la lógica de negocio.
- **Integridad Transaccional:** Implementación de transacciones ACID (`COMMIT`/`ROLLBACK`) para asegurar la consistencia en el módulo de ventas.
- **Optimización:** Análisis de rendimiento y aplicación de **Índices** (Agrupados, Cobertores y Columnares) para mejorar los tiempos de respuesta.

---

## 📁 Estructura del Proyecto

La organización de los archivos en este repositorio sigue una estructura clara y modular dividida por etapas de entrega:

```text
/Proyecto_Bases_de_Datos/
│
├── first_part/
│   ├── Portada.pdf
│   ├── CapituloI.pdf
│   ├── ER.jpg
│   ├── ER.erdplus 
│   ├── diccionario_de_datos.pdf
│   └── Proyecto_grupo33.pdf
│
├── second_part/
│   ├── scripts/
│   │   ├── Script-NP..sql          (DDL - Estructura)
│   │   ├── LoteDatos-NP.sql        (DML - Datos de prueba)
│   │   ├── np_PA(CRUD).sql         (Procedimientos Almacenados)
│   │   ├── np_FA.sql               (Funciones Almacenadas)
│   │   ├── np_PA_(Update_Delete).sql (Pruebas Lógicas)
│   │   ├── np_PA(LoteDatos).sql    (Pruebas de Rendimiento)
│   │   ├── Script-Venta-Exitosa.sql (Transacción ACID)
│   │   └── Script-Venta-Fallida.sql (Prueba Rollback)
│   │
│   └── Proyecto_BDI_Grupo33_Etapa2_Final.pdf
│
└── README.md
