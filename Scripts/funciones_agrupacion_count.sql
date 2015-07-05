SELECT *
FROM EMPLOYEES
ORDER BY FIRST_NAME desc, LAST_NAME;

SELECT department_id, COUNT(*) AS CANTIDAD_EMPLEADOS
FROM EMPLOYEES
GROUP BY department_id
HAVING COUNT(*) >10;




--Para filtrar registros por un campo que se crea a partir de
-- una funcion de agregacion no se puede utilizar where,
-- se debe utilizar having.
-- Ademas, en la sentencia having no se puede hacer referencia
-- al campo agregado mediante un alias, se tiene que escribir
-- directamente la funcion de agregacion.

SELECT LAST_NAME,COUNT(*) AS CANTIDAD
FROM EMPLOYEES
GROUP BY LAST_NAME
HAVING COUNT(*) = 2
ORDER BY CANTIDAD;

--Si se envia un campo en la funcion count y tiene valores nulos,
-- esto no los cuenta
SELECT COUNT(MANAGER_ID)
FROM EMPLOYEES;

SELECT COUNT(121231)
FROM EMPLOYEES;

---Mostrar empleados por departamento y que no muestre
--Registros en los que el departamento sea nulo
SELECT b.DEPARTMENT_NAME, count(*) CANTIDAD_EMPLEADOS
FROM EMPLOYEES a
LEFT JOIN DEPARTMENTS b
on (a.DEPARTMENT_ID = b.DEPARTMENT_ID)
WHERE b.DEPARTMENT_NAME is not null
group by b.DEPARTMENT_NAME
order by CANTIDAD_EMPLEADOS DESC;


--Mostrar cantidad de empleados por departamento y por puesto.
--Filtrar cuando la cantidad de empleados por puesto y depto sean mayores a 1
SELECT B.DEPARTMENT_NAME, C.JOB_TITLE, COUNT (*) CANTIDAD_EMPLEADOS
FROM EMPLOYEES A
LEFT JOIN DEPARTMENTS B
ON (A.DEPARTMENT_ID = B.DEPARTMENT_ID)
LEFT JOIN JOBS C
ON (A.JOB_ID = C.JOB_ID)
GROUP BY B.DEPARTMENT_NAME, C.JOB_TITLE
HAVING COUNT(*) > 1
ORDER BY B.DEPARTMENT_NAME, C.JOB_TITLE, CANTIDAD_EMPLEADOS;



