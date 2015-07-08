--Mostrar los datos de los empleados y el salario promedio,
--la desventaja de esta subconsulta es que se ejecuta por
--cada registro del resultado, en este caso se ejecuta 107 veces
SELECT FIRST_NAME|| ' ' ||LAST_NAME AS NAME,
        SALARY,
        (
          SELECT AVG(SALARY)
          FROM EMPLOYEES
        ) AS SALARIO_PROMEDIO
        --Solo se puede poner una subconsulta como un campo
        --Si y solo si retorna un campo.
FROM EMPLOYEES;


--A continuacion se muestra una consulta que utiliza 
--un producto cartesiano con subconsultas
--esta solucion es mucho mas eficiente que la anterior
SELECT FIRST_NAME|| ' ' ||LAST_NAME AS NAME,
      SALARY,
      B.SALARIO_PROMEDIO
FROM EMPLOYEES A,
  (
    SELECT AVG(SALARY) SALARIO_PROMEDIO
    FROM EMPLOYEES
  ) B
;

/*
Obtener el salario total por departamento
y el salario promedio por departamento
(para el salario promedio utilizar una subconsulta)
*/

SELECT department_id, sum(salary),avg(salary)
FROM EMPLOYEES
group by department_id
order by department_id;


--Esta consulta muestra el mismo resultado, pero utilizando subconsultas
--En si la mejor opcion seria la anterior, pero solo es para ejemplificar
--que se pueden utilizar subconsultas como tablas y luego cruzarlas
SELECT A.department_id, salario_promedio, salario_total
FROM (
  SELECT department_id, sum(salary) as salario_total
  FROM EMPLOYEES
  group by department_id
) A
INNER JOIN 
(
  SELECT department_id, avg(salary) as salario_promedio
  FROM EMPLOYEES
  group by department_id
) B
ON (A.department_id = B.department_id)
order by department_id;;


