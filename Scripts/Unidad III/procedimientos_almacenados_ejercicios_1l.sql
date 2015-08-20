--Ejercicio:
/*
Crear un procedimiento almacenado que haga un backup diario de 
la tabla de facturas. El nombre de cada tabla backup tiene que ser 
TBL_FACTURAS_YYYYMMDD
Mantener un historico de 30 backups (1 por dia)
*/

SELECT SYSDATE - 30 FROM DUAL;

CREATE OR REPLACE PROCEDURE SP_FACTURAS_BACKUP AS
  --Variables
BEGIN
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tbl_facturas_'||TO_CHAR(SYSDATE-30,'YYYYMMDD');
    EXCEPTION 
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error controlado eliminando la tabla de hace 30 dias');
  END;
  BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE tbl_facturas_'||TO_CHAR(SYSDATE,'YYYYMMDD');
    EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Error controlado eliminando la tabla del dia de hoy');
  END;
  EXECUTE IMMEDIATE 
      'CREATE TABLE tbl_facturas_'||TO_CHAR(SYSDATE,'YYYYMMDD')||' AS
          SELECT CODIGO_FACTURA,
            CODIGO_CLIENTE,
            CODIGO_CAJERO,
            CODIGO_SUCURSAL,
            CODIGO_UNIDAD_MEDIDA,
            CANTIDAD,
            TOTAL_NETO,
            FECHA
          FROM TBL_FACTURAS';
          
      EXCEPTION 
      WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || SQLERRM);
END;

select * from tbl_facturas_20150814;

set serveroutput on;

--Formas de ejecutar un procedimiento almacenado:
EXECUTE SP_FACTURAS_BACKUP;
CALL SP_FACTURAS_BACKUP;

BEGIN
  SP_FACTURAS_BACKUP;
END;



SELECT TABLE_NAME 
FROM ALL_TABLES
WHERE OWNER = 'FACTURACION'
AND TABLE_NAME LIKE 'TBL_FACTURAS_%';


drop table tbl_facturas_20150814;

