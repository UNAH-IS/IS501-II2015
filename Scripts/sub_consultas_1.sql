--Ejemplo sub consulta (En este caso es innecesaria)
SELECT DEPARTMENT_ID,SUM(SALARY)
FROM (
  SELECT DEPARTMENT_ID,FIRST_NAME, LAST_NAME, SALARY
  FROM EMPLOYEES
  WHERE SALARY > 1000
)
GROUP BY DEPARTMENT_ID;

SELECT DEPARTMENT_ID, SUM(SALARY) TOTAL
  FROM EMPLOYEES
  WHERE SALARY > 1000
GROUP BY DEPARTMENT_ID;

--Obtener el empleado mas pobre
SELECT A.*,rownum
FROM (
  SELECT FIRST_NAME|| ' ' ||LAST_NAME AS NAME, 
        SALARY
        --rownum
        --rowid
  FROM EMPLOYEES
  ORDER BY SALARY ASC
) A
WHERE rownum = 1;


SELECT *
FROM (
  SELECT FIRST_NAME|| ' ' ||LAST_NAME AS NAME,
        SALARY,
        (
          SELECT AVG(SALARY)
          FROM EMPLOYEES
        ) AS SALARIO_PROMEDIO
        --Solo se puede poner una subconsulta como un campo
        --Si y solo si retorna un campo.
  FROM EMPLOYEES
)
WHERE SALARY > SALARIO_PROMEDIO;



