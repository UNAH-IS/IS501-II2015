--Hola Mundo, Bloque anonimo
SET SERVEROUTPUT ON;

declare
  --Declaracion de variables, constantes y cursores.
  mensaje VARCHAR2(400) := 'Hola ';
  mensaje2 VARCHAR2(400);
begin
  mensaje := MENSAJE || 'Juan';
  --Restriccion: Solo tiene que ser un solo registro
  SELECT 'Nice to meet you'  INTO mensaje2 FROM DUAL;
  dbms_output.put_line(mensaje);
  dbms_output.put_line(mensaje2);
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line('Ocurrio un error');
end;


--Procedimiento almacenado con nombre:


CREATE OR REPLACE PROCEDURE SP_HOLA_MUNDO(P_NOMBRE VARCHAR2) AS
  --Declaracion de variables, constantes y cursores.
  mensaje VARCHAR2(400) := 'Hola ';
begin
  mensaje := mensaje || P_NOMBRE;
  dbms_output.put_line(mensaje);
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line('Ocurrio un error');
end;


CREATE OR REPLACE PROCEDURE SP_HOLA_MUNDO(P_NOMBRE VARCHAR2) AS
BEGIN
  NULL;
END;


--3 formas de ejecutar un procedimiento almacenado
--Con execute
execute SP_HOLA_MUNDO('Maria');
--Con call
call SP_HOLA_MUNDO('Maria');

--Dentro de un bloque anonimo
begin
  SP_HOLA_MUNDO('Maria');
end;