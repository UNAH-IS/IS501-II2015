--Operaciones matematicas
SELECT first_name, salary, 
      (salary * 0.05) impuesto,
      salary - (salary * 0.05) salario_neto,
      first_name || ' ' || last_name as name
FROM employees;

--Operaciones con cadenas
--Texto en mayuscula y minuscula
SELECT  UPPER(FIRST_NAME) AS NOMBRE_MAYUSCULA, 
        INITCAP(LOWER(FIRST_NAME)) AS NOMBRE_MINUSCULA,
        5 as constante
FROM EMPLOYEES;

SELECT REPLACE(LAST_NAME,'y','i') 
FROM EMPLOYEES
WHERE LAST_NAME = 'Taylor';

UPDATE EMPLOYEES
SET LAST_NAME = REPLACE(LAST_NAME,'y','i')
WHERE LAST_NAME = 'Taylor';


SELECT *
FROM EMPLOYEES
WHERE LAST_NAME = 'Tailor';
