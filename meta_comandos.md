# Pasos para crear una sesión en SQLite

## 1. Descargar e Instalar SQLite

  ```powershell
- Visita [https://www.sqlite.org/download.html](https://www.sqlite.org/download.html).
- Descarga los **binaries precompilados** según tu sistema operativo.
- Descomprime los archivos en una carpeta de tu elección.
- Añade la ruta de la carpeta a tu **variable de entorno PATH** (para poder ejecutar `sqlite3` desde cualquier terminal).
- Verifica la instalación ejecutando en la terminal:

  ```
  
  sqlite3 --version

## Crear bases de datos SQLite:

sqlite3 nombre_base_datos.db

## Crear Tablas en la Base de Datos:

CREATE TABLE Movies (
    Id INTEGER PRIMARY KEY,
    Title TEXT,
    Director TEXT,
    Year INTEGER,
    Length_minutes INTEGER
);

## Insertar Datos en las Tablas:

INSERT INTO Movies (Id, Title, Director, Year, Length_minutes) VALUES
(1, 'Toy Story', 'John Lasseter', 1995, 81),
(2, 'A Bug''s Life', 'John Lasseter', 1998, 95);

## Consultar datos:

SELECT * FROM Movies;

## Entrar en la sesion

Entrar en SQL Tools -> editar conexion -> mirar ruta del database file y poner

sqlite3 ruta/al/archivo/base_datos.db

## Salir de la sesión:

.exit

## mostrar tablas de una base de datos

.tables

## estructura sql

.schema

## más comandos?

.help

### Luego empezar con PostgreSQL

## PostgreSQL tiene mejor integración con herramientas utilizadas en el análisis de datos, como Pandas y NumPy en Python
