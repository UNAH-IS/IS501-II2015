--primer subconsulta
SELECT  B.codigo_avion, count(*) cantidad_asientos_ocupados
FROM TBL_FACTURA_DETALLE A
INNER JOIN TBL_ASIENTOS B
ON (A.codigo_asiento = B.codigo_asiento)
GROUP BY B.codigo_avion;

--segunda subconsulta
SELECT codigo_avion, 
      cantidad_asientos AS cantidad_asientos_totales
FROM TBL_AVIONES;


-------------
SELECT A.codigo_avion, 
      (cantidad_asientos_totales-cantidad_asientos_ocupados) AS disponibles
FROM  (
          SELECT  B.codigo_avion, count(*) cantidad_asientos_ocupados
          FROM TBL_FACTURA_DETALLE A
          INNER JOIN TBL_ASIENTOS B
          ON (A.codigo_asiento = B.codigo_asiento)
          GROUP BY B.codigo_avion
      ) A
INNER JOIN 
    (
      SELECT codigo_avion, 
            cantidad_asientos AS cantidad_asientos_totales
      FROM TBL_AVIONES
    ) B
ON (A.codigo_avion = B.codigo_avion);
