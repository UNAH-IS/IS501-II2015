--Mostrar la cantidad de contrataciones por año
SELECT to_char(hire_date,'YYYY') anio, count(*) cantidad_empleados
FROM EMPLOYEES
GROUP BY to_char(hire_date,'YYYY');

--Mostrar la cantidad de contrataciones por año
SELECT to_char(hire_date,'MON') mes, count(*) cantidad_empleados
FROM EMPLOYEES
GROUP BY to_char(hire_date,'MON');


DROP MATERIALIZED VIEW MVW_TMP;
create materialized view MVW_TMP 
REFRESH ON COMMIT
AS
SELECT a.*,to_char(hire_date, 'DD') dia,
    to_char(hire_date, 'MM') mes,
    to_char(hire_date, 'YYYY') anio
FROM employees a;

execute DBMS_MVIEW.REFRESH('MVW_TMP');