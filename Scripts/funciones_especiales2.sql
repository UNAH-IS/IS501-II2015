--Cantidad de caracteres
SELECT email, LENGTH(EMAIL) AS cantidad_caracteres
FROM EMPLOYEES
where LENGTH(EMAIL)>5;


acabrio;

SELECT *
FROM EMPLOYEES
where lower(email) = lower('acabrio');

--Buscar informacion
SELECT *
FROM EMPLOYEES
where email LIKE '%'||UPPER(trim('  Ar  '))||'%';



--Obtener una subcadena
SELECT phone_number, substr(phone_number,1,3) primeros_tres_digitos
FROM employees;
