--Crear nuevo usuario(esquema) con el password "PASSWORD" 
CREATE USER NOMBRE_USUARIO
  IDENTIFIED BY "PASSWORD"
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP;
--asignar cuota ilimitada al tablespace por defecto  
ALTER USER NOMBRE_USUARIO QUOTA UNLIMITED ON USERS;

--Asignar privilegios basicos
GRANT create session TO NOMBRE_USUARIO;
GRANT create table TO NOMBRE_USUARIO;
GRANT create view TO NOMBRE_USUARIO;
GRANT create any trigger TO NOMBRE_USUARIO;
GRANT create any procedure TO NOMBRE_USUARIO;
GRANT create sequence TO NOMBRE_USUARIO;
GRANT create synonym TO NOMBRE_USUARIO;