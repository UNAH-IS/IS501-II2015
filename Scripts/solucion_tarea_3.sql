select * from tbl_sucursal;

select * from tbl_facturas;

--Solucion inciso 1
SELECT upper(B.nombre_sucursal) as nombre_sucursal,
      sum(A.cantidad) as cantidad_productos
FROM tbl_facturas A
INNER JOIN tbl_sucursal B
ON (A.codigo_sucursal = b.codigo_sucursal)
GROUP BY upper(B.nombre_sucursal);


SELECT upper(B.nombre_sucursal) as nombre_sucursal,
      sum(C.cantidad) as cantidad_productos
FROM tbl_facturas A
INNER JOIN tbl_sucursal B
ON (A.codigo_sucursal = b.codigo_sucursal)
INNER JOIN TBL_PRODUCTOS_X_FACTURA c
ON (A.codigo_factura = c.codigo_factura)
GROUP BY upper(B.nombre_sucursal);


--Inciso 2
SELECT e.categoria, 
      to_char(a.fecha,'MONTH') as nombre_mes, 
      to_char(a.fecha,'MM') as numero_mes, 
      b.nombre_sucursal,
      sum(a.cantidad) as cantidad_total, 
      sum(a.total_neto) as total_neto
FROM tbl_facturas a
INNER JOIN tbl_sucursal b
ON (a.codigo_sucursal = b.codigo_sucursal)
INNER JOIN TBL_PRODUCTOS_X_FACTURA c
ON (a.codigo_factura = c.codigo_factura)
INNER JOIN tbl_productos d
ON (c.codigo_producto = d.codigo_producto)
INNER JOIN tbl_categorias e
ON (d.codigo_categoria = e.codigo_categoria)
GROUP BY e.categoria, 
      to_char(a.fecha,'MONTH'), 
      to_char(a.fecha,'MM'), 
      b.nombre_sucursal;



--Inciso 3
--Solucion 1
SELECT * 
FROM tbl_facturas
WHERE cantidad > 3;

--Solucion 2
SELECT a.codigo_factura,
      sum(b.cantidad) as cantidad_total
FROM tbl_facturas a
INNER JOIN  TBL_PRODUCTOS_X_FACTURA b
ON (a.codigo_factura = b.codigo_factura)
group by a.codigo_factura
HAVING sum(b.cantidad) > 3;



