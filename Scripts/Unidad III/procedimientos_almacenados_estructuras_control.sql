set serveroutput on;

declare
 valor NUMBER := 100; 
begin
  IF (valor<=100) THEN
    dbms_output.put_line('El valor es menor o igual que 100');
  ELSE
    dbms_output.put_line('El valor es mayor que 100');
  END IF;
end;



DECLARE
  Num1 NUMBER :=3;
  Num2 NUMBER; -- Como no inicializamos la variable, su valor es NULL
  EsMayor VARCHAR2(15);
BEGIN
  IF Num1 < Num2 THEN
    EsMayor := 'Yes';
  ELSE
    EsMayor := 'No';
  END IF;
  dbms_output.put_line(EsMayor);
END;



DECLARE
  equipo varchar(100);
  ciudad varchar(50):= 'MADRID';
BEGIN
  CASE ciudad
      WHEN 'MADRID' THEN SELECT 'RealMadrid' INTO equipo FROM DUAL;
      WHEN 'BARCELONA' THEN equipo:='FCBarcelona';
      WHEN 'LACORUÑA' THEN equipo:= 'Deportivo de La Coruña';
      ELSE equipo:='SIN EQUIPO';
  END CASE;
  DBMS_OUTPUT.PUT_LINE(equipo);
END;

CREATE TABLE TBL_TMP (
  VALOR NUMBER
);

DECLARE
  i NUMBER:=0;
BEGIN
    LOOP
      i:=i+1;
      --dbms_output.put_line(i);
      INSERT INTO TBL_TMP(VALOR) VALUES (i);
      COMMIT;
      EXIT WHEN i>1000000;
    END LOOP;
    
    EXCEPTION 
    WHEN OTHERS THEN
      dbms_output.put_line('Ocurrio un erro: '||SQLERRM);
END;


truncate table tbl_tmp; --DDL
delete from tbl_tmp; --DML


SELECT count(*) FROM tbl_tmp;


--SELECT * FROM TBL_TMP;

SELECT * FROM TBL_TMP;

BEGIN
  FOR V_Contador IN 1..10 LOOP
  INSERT INTO tbl_tmp (Valor)
  VALUES (V_Contador);
  END LOOP;
END;

set serveroutput on;


BEGIN
    DBMS_OUTPUT.PUT_LINE('Esto es un ejemplo.');
    GOTO Etiqueta_1;
    DBMS_OUTPUT.PUT_LINE('No hace el GOTO.');
    <<Etiqueta_1>>
    DBMS_OUTPUT.PUT_LINE('Entra en el GOTO.');
END;

declare
  
begin
  EXECUTE IMMEDIATE 'DROP TABLE tabla';
  for i in 1..10 loop
    EXECUTE IMMEDIATE 'create table tabla_'||i||'(campo1 varchar2(500))';
  end loop;
end;









SELECT * FROM TABLA;

SELECT * FROM TABLA;