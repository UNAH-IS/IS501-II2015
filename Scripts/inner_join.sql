SELECT *
FROM EMPLOYEES;

SELECT A.first_name||' '||A.last_name as empleado,
      b.first_name||' '||b.last_name as jefe
FROM EMPLOYEES A --EMPLEADOS
INNER JOIN EMPLOYEES B --JEFES
ON (A.MANAGER_ID = B.EMPLOYEE_ID);

SELECT A.first_name||' '||A.last_name as empleado,
      b.first_name||' '||b.last_name as jefe
FROM EMPLOYEES A, --EMPLEADOS
      EMPLOYEES B --JEFES
WHERE A.MANAGER_ID = B.EMPLOYEE_ID;


SELECT A.first_name||' '||A.last_name as empleado,
      B.first_name||' '||B.last_name as jefe,
      C.first_name||' '||C.last_name as super_jefe
FROM EMPLOYEES A --EMPLEADOS
INNER JOIN EMPLOYEES B --JEFES
ON (A.MANAGER_ID = B.EMPLOYEE_ID)
INNER JOIN EMPLOYEES C --SUPER JEFES
ON (B.MANAGER_ID = C.EMPLOYEE_ID);

