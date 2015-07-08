select * from tbl_lugares;
select * from tbl_paises;
select * from tbl_regiones;

select a.nombre_lugar,
      b.nombre_pais,
      c.NOMBRE_REGION
from tbl_lugares a
INNER JOIN tbl_paises b
ON (a.codigo_pais = b.codigo_pais)
LEFT JOIN tbl_regiones c 
ON (b.CODIGO_REGION = c.CODIGO_REGION);


select a.nombre_lugar,
      b.codigo_pais,
      b.nombre_pais,
      c.codigo_region,
      c.nombre_region
from tbl_lugares a
LEFT JOIN tbl_paises b
on (a.codigo_pais = b.codigo_pais)
LEFT JOIN tbl_regiones c 
ON (b.CODIGO_REGION = c.CODIGO_REGION);




select * 
from tbl_lugares a
full outer join tbl_paises b
on (a.codigo_pais = b.codigo_pais);
