--100 * (1 – (Total de ventas del mes anterior/Total de ventas del mes actual));

SELECT 100*(1-(TOTAL_MES_ANTERIOR/TOTAL_MES_ACTUAL)) CRECIMIENTO
FROM (
  SELECT
      (
          SELECT sum(TOTAL_NETO) ventas
          FROM tbl_facturas
          WHERE to_char(fecha, 'YYYYMM') =  '201507'
      ) AS TOTAL_MES_ACTUAL,
      (
          SELECT sum(TOTAL_NETO) ventas
          FROM tbl_facturas
          WHERE to_char(fecha, 'YYYYMM') =  '201506'
      ) AS TOTAL_MES_ANTERIOR
  FROM DUAL
);

SELECT
    100 * (1-
      (
          SELECT sum(TOTAL_NETO) ventas
          FROM tbl_facturas
          WHERE to_char(fecha, 'YYYYMM') =  '201506'
      )/ 
      (
          SELECT sum(TOTAL_NETO) ventas
          FROM tbl_facturas
          WHERE to_char(fecha, 'YYYYMM') =  '201507'
      )
    ) AS CRECIMIENTO    
FROM DUAL;

SELECT 'Hola mundo' AS MENSAJE  FROM DUAL;

SELECT
  CODIGO_FACTURA,
    (
        SELECT sum(TOTAL_NETO) ventas
        FROM tbl_facturas
        WHERE to_char(fecha, 'YYYYMM') =  '201506'
    ),
    (
        SELECT sum(TOTAL_NETO) ventas
        FROM tbl_facturas
        WHERE to_char(fecha, 'YYYYMM') =  '201507'
    )
FROM TBL_FACTURAS;


SELECT 100*(1- (500/200)) RESULTADO
FROM DUAL;



---------------------------------------------------
/*Codigo de factura.
Nombre del cajero
Nombre del Cliente
Sucursal
Administrador de la sucursal
Fecha de la venta
Mes de la venta
Ano de la venta
Producto
Marca
Categoria
Unidad de medida (Abreviatura en minusculas)
Cantidad de productos
Monto de la venta*/

SELECT  A.codigo_factura, B.nombre_cliente, 
        C.nombre_empleado AS nombre_cajero,
        D.nombre_sucursal,
        E.nombre_empleado AS nombre_administrador,
        TO_CHAR(A.FECHA,'DD/MM/YYYY') AS fecha_venta,
        TO_CHAR(A.FECHA,'MONTH') AS mes_venta,
        TO_CHAR(A.FECHA,'YYYY') AS anio_venta,
        F.cantidad,
        G.nombre_producto,
        H.marca,
        I.categoria,
        F.unidad,
        0 AS monto_venta
FROM tbl_facturas A
INNER JOIN tbl_clientes B
ON (A.codigo_cliente = b.codigo_cliente)
INNER JOIN tbl_empleados C
ON (A.codigo_cajero = C.codigo_empleado)
INNER JOIN tbl_sucursal D
ON (A.codigo_sucursal = D.codigo_sucursal)
INNER JOIN tbl_empleados E
ON (D.codigo_administrador = E.codigo_empleado)
INNER JOIN tbl_productos_x_factura F
ON (A.codigo_factura = F.codigo_factura)
INNER JOIN tbl_productos G
ON (F.codigo_producto = G.codigo_producto)
INNER JOIN tbl_marcas H
ON (G.codigo_marca = H.codigo_marca)
INNER JOIN tbl_categorias I
ON (G.codigo_categoria = I.codigo_categoria)
;












