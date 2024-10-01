
# Creamos la base de datos en SQLite:

sqlite3 nombre_base_de_datos.db

Antes de importar el archivo CSV, asegúrate de revisar la estructura del archivo (columnas y tipos de datos) y crear la tabla correspondiente en SQLite.

```sql
CREATE TABLE titles (...
```

Importamos los archivos CSV a la tabla "titles"

```sql
.mode csv
.import archivo.csv nombre_tabla
```

Si nos equivocamos un poco en un valor:

```sql
ALTER TABLE titles_temp RENAME TO titles;
```

Si nos equivocamos mucho:

```sql
DROP TABLE titles;
```

<https://www.geeksforgeeks.org/import-a-csv-file-into-an-sqlite-table/>
