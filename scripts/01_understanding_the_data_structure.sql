/*
===============================================================================
Database Exploration
===============================================================================
Purpose:
    - Understand what data exists and what one row represents.

Table Used:
    - INFORMATION_SCHEMA.TABLES
    - INFORMATION_SCHEMA.COLUMNS
===============================================================================
*/

-- What tables and schemas exist in the database ?
SELECT
    TABLE_CATALOG,
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES

-- Search any primary keys
SELECT 
    SCHEMA_NAME(t.schema_id) AS 'schema_name',
    t.name AS 'table_name',
    COL_NAME(ic.OBJECT_ID, ic.column_id) AS 'column_name',
    i.name AS pk_name
FROM sys.tables t
INNER JOIN sys.indexes i ON t.object_id = i.object_id
INNER JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
WHERE t.name = 'gold.dim_customers' AND i.is_primary_key = 1
ORDER BY ic.key_ordinal;

-- What is the data type of each column ?
SELECT 
   TABLE_NAME,
   COLUMN_NAME,
   IS_NULLABLE,
   DATA_TYPE,
   CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS;
