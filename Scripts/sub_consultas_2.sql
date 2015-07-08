SELECT * FROM TBL_ALUMNOS;
SELECT * FROM TBL_BECARIOS;


---Obtener alumnos que no son becarios 
--utilizando un cruce
SELECT A.* 
FROM TBL_ALUMNOS A
LEFT JOIN TBL_BECARIOS B
ON (A.CUENTA = B.CUENTA)
WHERE B.CUENTA IS NULL;

SELECT *
FROM TBL_ALUMNOS
WHERE CUENTA NOT IN ('','','');

---Obtener alumnos que no son becarios 
--utilizando una subconsulta y el operador in (not in)
SELECT *
FROM TBL_ALUMNOS
WHERE CUENTA NOT IN
(
  SELECT CUENTA
  FROM TBL_BECARIOS
);
