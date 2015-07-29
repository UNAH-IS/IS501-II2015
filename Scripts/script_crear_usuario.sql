--Crear nuevo usuario(esquema) con el password "PASSWORD" 
CREATE USER FACTURACION
  IDENTIFIED BY "oracle"
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP;
--asignar cuota ilimitada al tablespace por defecto  
ALTER USER FACTURACION QUOTA UNLIMITED ON USERS;

--Asignar privilegios basicos
GRANT create session TO FACTURACION;
GRANT create table TO FACTURACION;
GRANT create view TO FACTURACION;
GRANT create any trigger TO FACTURACION;
GRANT create any procedure TO FACTURACION;
GRANT create sequence TO FACTURACION;
GRANT create synonym TO FACTURACION;