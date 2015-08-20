SET SERVEROUTPUT ON;

--Uso de un cursor explicito con nombre en un LOOP
declare
  CURSOR v_cursor_productos IS
    SELECT CODIGO_PRODUCTO, NOMBRE_PRODUCTO 
    FROM TBL_PRODUCTOS;
    
  V_CODIGO_PRODUCTO INTEGER;
  V_NOMBRE_PRODUCTO VARCHAR2(500);
begin
  OPEN v_cursor_productos;
    LOOP
      FETCH v_cursor_productos INTO V_CODIGO_PRODUCTO, V_NOMBRE_PRODUCTO;
      EXIT WHEN v_cursor_productos%notfound;
      DBMS_OUTPUT.PUT_LINE('NOMBRE PRODUCTO: '||V_NOMBRE_PRODUCTO);
    END LOOP;
  CLOSE v_cursor_productos;
END;

--Cursor explicito con nombre, utilizando un while
DECLARE
  CURSOR v_cursor_productos IS
    SELECT CODIGO_PRODUCTO, NOMBRE_PRODUCTO 
    FROM TBL_PRODUCTOS;
    
  V_CODIGO_PRODUCTO INTEGER;
  V_NOMBRE_PRODUCTO VARCHAR2(500);
begin
  OPEN v_cursor_productos;
    WHILE v_cursor_productos%found LOOP
      FETCH v_cursor_productos INTO V_CODIGO_PRODUCTO, V_NOMBRE_PRODUCTO;
      DBMS_OUTPUT.PUT_LINE('NOMBRE PRODUCTO: '||V_NOMBRE_PRODUCTO);
    END LOOP;
  CLOSE v_cursor_productos;
END;

--Cursor explicito con nombre utilizando un FOR
DECLARE
  CURSOR v_cursor_productos IS
    SELECT CODIGO_PRODUCTO, NOMBRE_PRODUCTO 
    FROM TBL_PRODUCTOS;
begin
    FOR registro IN v_cursor_productos LOOP
      DBMS_OUTPUT.PUT_LINE('NOMBRE PRODUCTO: '||registro.NOMBRE_PRODUCTO);
    END LOOP;
  CLOSE v_cursor_productos;
END;


--Cursor explicito anonimo, obligatorio utilizar un FOR

DECLARE 
  cantidad_registros integer :=0;
begin
    FOR registro IN (
        SELECT CODIGO_PRODUCTO, NOMBRE_PRODUCTO 
        FROM TBL_PRODUCTOS
    ) LOOP
      cantidad_registros:= cantidad_registros + 1;
      --DBMS_OUTPUT.PUT_LINE('NOMBRE PRODUCTO: '||registro.NOMBRE_PRODUCTO);
    END LOOP;
    dbms_output.put_line(cantidad_registros);
END;

