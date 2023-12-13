-- Script para creacion de usuario en SQL Plus

Create user Proyecto_Adm IDENTIFIED BY Password1;

GRANT DBA TO Proyecto_Adm;

--Para recrear todo el schema

/*
alter session set "_ORACLE_SCRIPT"=true;
drop user proyecto_adm cascade;
create user Proyecto_adm identified by Password1;
grant dba to proyecto_adm;
*/

-- Crear las tablas iniciales

CREATE TABLE Activos (Id_Activo INT NOT NULL, Descripcion varchar2(100), Id_Local INT);

CREATE TABLE Canton(Id_Provincia INT NOT NULL, Id_Canton INT NOT NULL, Nombre varchar2(20));

CREATE TABLE Cliente(Id_Cliente INT NOT NULL, Nombre varchar2(30), Tipo varchar2(20));

CREATE TABLE Contacto(Id_Contacto INT NOT NULL, Nombre varchar2(30), Apellido1 varchar2(30), Apellido2 varchar2(30), Cedula varchar2(9));

CREATE TABLE Distrito(Id_Provincia INT NOT NULL, Id_Canton INT NOT NULL, Id_Distrito INT NOT NULL, Nombre varchar2(20));

CREATE TABLE Empleado(Id_Empleado INT NOT NULL, Nombre varchar2(30), Apellido1 varchar2(30), Apellido2 varchar2(30), Alias varchar2(30), IBAN varchar2(30), Salario NUMBER(10,2), Estado Varchar2(15), Password varchar2(30));

CREATE TABLE Facturacion(Num_Factura INT NOT NULL, Fecha DATE, MetodoPago Varchar2(20), Total NUMBER(15,2));

CREATE TABLE Locales (Id_Local INT NOT NULL, Nombre varchar2(30), Proposito varchar2(30));

CREATE TABLE MateriaPrima(Id_MateriaPrima INT NOT NULL, Nombre varchar2(30), Reservas varchar2(30), UnidadDeMedicion Varchar2(4), Marca varchar2(30), CostoPorUnidad NUMBER(10,2));

CREATE TABLE Menu(Id_Menu INT NOT NULL, Precio NUMBER(10,2), Personas INT);

CREATE TABLE Producto(Id_Producto INT NOT NULL, Nombre varchar2(30), Precio NUMBER(10,2), Descripcion varchar2(100), Imagen varchar2(40));

CREATE TABLE Proveedor(Id_Proveedor INT NOT NULL, Nombre varchar2(30));

CREATE TABLE Provincia(Id_Provincia INT NOT NULL, Nombre varchar2(20));

CREATE TABLE Publicaciones(Id_Publicacion INT NOT NULL, Link Varchar2(50), Cod_Servicio INT NOT NULL, Fecha DATE);

CREATE TABLE Puesto (Id_Puesto INT NOT NULL, Nombre varchar2(30), SalarioMin NUMBER(10,2) NOT NULL, SalarioMax NUMBER(10,2) NOT NULL);

CREATE TABLE ServicioAgendado(Cod_Servicio INT NOT NULL, FechaHora TIMESTAMP, PersonasAAtender INT);

CREATE TABLE ClienteContacto(Id_Cliente INT NOT NULL, Id_Contacto INT NOT NULL);

CREATE TABLE ClienteDireccion(Id_Direccion INT NOT NULL, Id_Cliente INT NOT NULL, Id_Provincia INT NOT NULL, Id_Canton INT NOT NULL, Id_Distrito INT NOT NULL, Indicaciones varchar2(200));

CREATE TABLE ContactoCorreo(Id_Contacto INT NOT NULL, Correo varchar2(30));

CREATE TABLE ContactoTelefono(Id_Contacto INT NOT NULL, Telefono Varchar2(8));

CREATE TABLE EmpleadoCorreo (Id_Empleado INT NOT NULL, Correo varchar2(20));

CREATE TABLE EmpleadoPuesto (Id_Empleado INT NOT NULL, Id_Puesto INT NOT NULL);

CREATE TABLE FacturaDetalle(Num_Factura INT NOT NULL, Id_Menu INT NOT NULL, Cantidad INT, Subtotal NUMBER(15,2), Total NUMBER(15,2));

CREATE TABLE FacturaServicio(Num_Factura INT NOT NULL, Cod_Servicio INT NOT NULL);

CREATE TABLE LocalUbicacion(Id_Local INT NOT NULL, Id_Provincia INT NOT NULL, Id_Canton INT NOT NULL, Id_Distrito INT NOT NULL, Indicaciones varchar(100));

CREATE TABLE MateriaPrimaLocal(Id_MateriaPrima INT NOT NULL, Id_Local INT NOT NULL);

CREATE TABLE MateriaPrimaProveedor(Id_MateriaPrima INT NOT NULL, Id_Proveedor INT NOT NULL, Precio NUMBER(10,2));

CREATE TABLE MenuDesglose(Id_Menu INT NOT NULL, Id_Producto INT NOT NULL, Precio NUMBER(10,2), Personas INT);

CREATE TABLE ProductoMateriaPrima(Id_Producto INT NOT NULL, Id_MateriaPrima INT NOT NULL, CantidadMateriaPrima INT);

CREATE TABLE ServicioCliente(Cod_Servicio INT NOT NULL, Id_Cliente INT NOT NULL);

CREATE TABLE ServicioEmpleados(Cod_Servicio INT NOT NULL, Id_Empleado INT NOT NULL);

CREATE TABLE ServicioMenu(Cod_Servicio INT NOT NULL, Id_Menu INT NOT NULL);

CREATE TABLE Transporte(Cod_Servicio INT NOT NULL, Id_Activo INT NOT NULL);

-- Primary keys iniciales

ALTER TABLE Menu ADD CONSTRAINT PK_Id_Menul PRIMARY KEY (Id_Menu);

ALTER TABLE producto ADD CONSTRAINT PK_Id_Producto PRIMARY KEY (Id_Producto);

ALTER TABLE Activos ADD CONSTRAINT PK_Id_Activo PRIMARY KEY (Id_Activo);

ALTER TABLE ServicioAgendado ADD CONSTRAINT PK_Cod_Servicio PRIMARY KEY (Cod_Servicio);

ALTER TABLE Facturacion ADD CONSTRAINT PK_Num_Factura PRIMARY KEY (Num_Factura);

ALTER TABLE Cliente ADD CONSTRAINT PK_Id_Cliente PRIMARY KEY (Id_Cliente);

ALTER TABLE Contacto ADD CONSTRAINT PK_Id_Contacto PRIMARY KEY (Id_Contacto);

ALTER TABLE Proveedor ADD CONSTRAINT PK_Id_Proveedor PRIMARY KEY (Id_Proveedor);

ALTER TABLE Locales ADD CONSTRAINT PK_Id_Local PRIMARY KEY (Id_Local);

ALTER TABLE Empleado ADD CONSTRAINT PK_Id_Empleados PRIMARY KEY (Id_Empleado);

ALTER TABLE Puesto ADD CONSTRAINT PK_Id_Puesto PRIMARY KEY (Id_Puesto);

ALTER TABLE provincia ADD CONSTRAINT PK_Id_Provincia PRIMARY KEY (Id_Provincia);

ALTER TABLE Canton ADD CONSTRAINT PK_Id_Provincia_Id_Canton PRIMARY KEY (Id_Provincia, Id_Canton);

ALTER TABLE Distrito ADD CONSTRAINT PK_Id_Provincia_Id_Canton_Id_Distrito PRIMARY KEY (Id_Provincia, Id_Canton, Id_Distrito);

ALTER TABLE Publicaciones ADD CONSTRAINT PK_Id_Publicacion PRIMARY KEY (Id_Publicacion);

ALTER TABLE MateriaPrima ADD CONSTRAINT PK_Id_MateriaPrima PRIMARY KEY (Id_MateriaPrima);

-- Foreign keys

ALTER TABLE EmpleadoCorreo ADD CONSTRAINT FK_Id_Empleado_Id_Empleado FOREIGN KEY (Id_Empleado) REFERENCES Empleado (Id_Empleado);

ALTER TABLE EmpleadoPuesto ADD CONSTRAINT FK_Id_Empleado FOREIGN KEY (Id_Empleado) REFERENCES Empleado (Id_Empleado);

ALTER TABLE EmpleadoPuesto ADD CONSTRAINT FK_Id_Puesto FOREIGN KEY (Id_Puesto) REFERENCES Puesto (Id_Puesto);

ALTER TABLE ACTIVOS ADD CONSTRAINT FK_Id_Local FOREIGN KEY (Id_Local) REFERENCES Locales (Id_Local);

ALTER TABLE ContactoTelefono ADD CONSTRAINT FK_Id_Contacto FOREIGN KEY (Id_Contacto) REFERENCES Contacto (Id_Contacto);

ALTER TABLE ContactoCorreo ADD CONSTRAINT FK_Id_Contactos FOREIGN KEY (Id_Contacto) REFERENCES Contacto (Id_Contacto);

ALTER TABLE Transporte ADD CONSTRAINT FK_Cod_Servicio FOREIGN KEY (Cod_Servicio) REFERENCES ServicioAgendado (Cod_Servicio);

ALTER TABLE transporte ADD CONSTRAINT FK_Id_Activo Foreign key (Id_Activo) REFERENCES Activos (Id_Activo);

ALTER TABLE ServicioEmpleados ADD CONSTRAINT FK_Cod_ServicioS FOREIGN KEY (Cod_Servicio) REFERENCES ServicioAgendado (Cod_Servicio);

ALTER TABLE ServicioEmpleados ADD CONSTRAINT FK_Id_Empleados FOREIGN KEY (Id_Empleado) REFERENCES empleado (Id_Empleado);

ALTER TABLE PUBLICACIONES ADD CONSTRAINT FK_Cod_ServicioSS FOREIGN KEY (Cod_Servicio) REFERENCES SERVICIOAGENDADO (Cod_Servicio);

ALTER TABLE SERVICIOMENU ADD CONSTRAINT FK_CODSERVI FOREIGN KEY (Cod_Servicio) REFERENCES SERVICIOAGENDADO (Cod_Servicio);

ALTER TABLE SERVICIOCLIENTE ADD CONSTRAINT FK_CODSERVIC FOREIGN KEY (Cod_Servicio) REFERENCES SERVICIOAGENDADO (Cod_Servicio);

ALTER TABLE SERVICIOCLIENTE ADD CONSTRAINT FK_IDCLIENT FOREIGN KEY (Id_Cliente) REFERENCES cliente (Id_Cliente);

ALTER TABLE CLIENTECONTACTO ADD CONSTRAINT FK_IDCLIEN FOREIGN KEY (Id_Cliente) REFERENCES CLIENTE (Id_Cliente);

ALTER TABLE CLIENTECONTACTO ADD CONSTRAINT FK_IDCONTACT FOREIGN KEY (Id_Contacto) REFERENCES CONTACTO (Id_Contacto);

ALTER TABLE FACTURASERVICIO ADD CONSTRAINT FK_Num_Factura FOREIGN KEY (Num_Factura) REFERENCES FACTURACION (Num_Factura);

ALTER TABLE FACTURASERVICIO ADD CONSTRAINT FK_CODSERVIIC FOREIGN KEY (Cod_Servicio) REFERENCES SERVICIOAGENDADO (Cod_Servicio);

ALTER TABLE CLIENTEDIRECCION ADD CONSTRAINT FK_IDCLI FOREIGN KEY (Id_Cliente) REFERENCES CLIENTE (Id_Cliente);

ALTER TABLE CLIENTEDIRECCION ADD CONSTRAINT FK_Id_Distrito FOREIGN KEY (Id_Provincia, Id_Canton, Id_Distrito) REFERENCES distrito (Id_Provincia, Id_Canton, Id_Distrito);

ALTER TABLE FACTURADETALLE ADD CONSTRAINT FK_Num_FacturaS FOREIGN KEY (Num_Factura) REFERENCES FACTURACION (Num_Factura);

ALTER TABLE FACTURADETALLE ADD CONSTRAINT FK_MENU FOREIGN KEY (Id_Menu) REFERENCES MENU (Id_Menu);

ALTER TABLE CANTON ADD CONSTRAINT FK_PRVINCIA FOREIGN KEY (Id_Provincia) REFERENCES PROVINCIA (Id_Provincia);

ALTER TABLE DISTRITO ADD CONSTRAINT FK_DISTRITO FOREIGN KEY (Id_Provincia) REFERENCES PROVINCIA (Id_Provincia);

ALTER TABLE DISTRITO ADD CONSTRAINT FK_CANTON_PROVINCIA FOREIGN KEY (Id_Canton,Id_Provincia) REFERENCES CANTON (Id_Canton,Id_Provincia);

ALTER TABLE PRODUCTOMATERIAPRIMA ADD CONSTRAINT FK_IDPRODUCT FOREIGN KEY (Id_Producto) REFERENCES PRODUCTO (Id_Producto);

ALTER TABLE PRODUCTOMATERIAPRIMA ADD CONSTRAINT FK_Id_MateriaPrima FOREIGN KEY (Id_MateriaPrima) REFERENCES MATERIAPRIMA (Id_MateriaPrima);

ALTER TABLE LOCALUBICACION ADD CONSTRAINT FK_Id_Locals FOREIGN KEY (Id_Local) REFERENCES locales (Id_Local);

ALTER TABLE MATERIAPRIMAPROVEEDOR ADD CONSTRAINT fk_idmateriapri FOREIGN KEY (Id_MateriaPrima) REFERENCES materiaprima (Id_MateriaPrima);

ALTER TABLE MATERIAPRIMAPROVEEDOR ADD CONSTRAINT fk_provee FOREIGN KEY (Id_Proveedor) REFERENCES proveedor (Id_Proveedor);

ALTER TABLE MATERIAPRIMALOCAL ADD CONSTRAINT FK_IDMATERIPRIMA FOREIGN KEY (Id_MateriaPrima) REFERENCES MATERIAPRIMA (Id_MateriaPrima);

ALTER TABLE MATERIAPRIMALOCAL ADD CONSTRAINT FK_IDLOCA FOREIGN KEY (Id_Local) REFERENCES LOCALES (Id_Local);

-- Los primary keys que quedan

ALTER TABLE ProductoMateriaPrima ADD CONSTRAINT PK_Id_Producto_Id_MateriaPrima PRIMARY KEY (Id_Producto, Id_MateriaPrima);

ALTER TABLE EmpleadoCorreo ADD CONSTRAINT PK_Id_Empleado PRIMARY KEY (Id_Empleado);

ALTER TABLE EmpleadoPuesto ADD CONSTRAINT PK_Id_Empleado_Id_Puesto PRIMARY KEY (Id_Empleado, Id_Puesto);

ALTER TABLE ContactoTelefono ADD CONSTRAINT PK_IdCpntacto PRIMARY KEY (Id_Contacto, Telefono);

ALTER TABLE ContactoCorreo ADD CONSTRAINT PK_Id_Contacto_Correo PRIMARY KEY (Id_Contacto, Correo);

ALTER TABLE Transporte ADD CONSTRAINT PK_Cod_Servicio_Id_Activo PRIMARY KEY (Cod_Servicio, Id_Activo);

ALTER TABLE ServicioEmpleados ADD CONSTRAINT PK_condServicio_Id_Empleado PRIMARY KEY (Cod_Servicio, Id_Empleado);

ALTER TABLE serviciomenu ADD CONSTRAINT PK_Cod_Servicio_Id_Menu PRIMARY KEY (Cod_Servicio, Id_Menu);

ALTER TABLE ServicioCLiente ADD CONSTRAINT PK_Cod_Servicio_Id_Cliente PRIMARY KEY (Cod_Servicio, Id_Cliente);

ALTER TABLE ClienteContacto ADD CONSTRAINT PK_Id_Cliente_Id_Contacto PRIMARY KEY (Id_Cliente, Id_Contacto);

ALTER TABLE MenuDesglose ADD CONSTRAINT PK_Id_Menu_Id_Producto PRIMARY KEY (Id_Menu, Id_Producto);

ALTER TABLE FacturaServicio ADD CONSTRAINT PK_Num_Factura_Cod_Servicio PRIMARY KEY (Num_Factura, Cod_Servicio);

ALTER TABLE ClienteDireccion ADD CONSTRAINT PK_Id_Direccion_Id_Cliente PRIMARY KEY (Id_Direccion, Id_Cliente);

ALTER TABLE FacturaDetalle ADD CONSTRAINT PK_Num_Factura_Id_Menu PRIMARY KEY (Num_Factura, Id_Menu);

ALTER TABLE LocalUbicacion ADD CONSTRAINT PK_Id_Localu PRIMARY KEY (Id_Local);

ALTER TABLE MateriaPrimaProveedor ADD CONSTRAINT PK_Id_MateriaPrima_Id_Proveedor PRIMARY KEY (Id_MateriaPrima, Id_Proveedor);

ALTER TABLE MateriaPrimaLocal ADD CONSTRAINT PK_Id_MateriaPrima_Id_Local PRIMARY KEY (Id_MateriaPrima, Id_Local);

-- Crear la tabla de auditoria para las tablas Activos, Clientes, ServicioEmpleados,  MateriaPrima

CREATE TABLE AudClientes (Id_Cliente INT NOT NULL, Nombre varchar2(30), Tipo varchar2(20), tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));

CREATE TABLE AudActivos (Id_Activo INT NOT NULL, Descripcion varchar2(100), Id_Local INT, tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));

CREATE TABLE AudServicioEmpleados (Cod_Servicio INT NOT NULL, Id_Empleado INT NOT NULL, tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));

CREATE TABLE AudMateriaPrima (Id_MateriaPrima INT NOT NULL, Nombre varchar2(30), Reservas varchar2(30), UnidadDeMedicion Varchar2(4), Marca varchar2(30), CostoPorUnidad NUMBER(6,2), tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));

-- Triggers para primary keys
-- Sequence
CREATE SEQUENCE sec_activos START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_activos
BEFORE INSERT ON Activos
FOR EACH ROW
BEGIN
    :NEW.Id_Activo := sec_activos.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_cliente START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_cliente
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
    :NEW.Id_Cliente := sec_cliente.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_contacto START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_contacto
BEFORE INSERT ON Contacto
FOR EACH ROW
BEGIN
    :NEW.Id_Contacto := sec_contacto.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_empleado START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_empleado
BEFORE INSERT ON Empleado
FOR EACH ROW
BEGIN
    :NEW.Id_Empleado := sec_empleado.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_facturacion START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_facturacion
BEFORE INSERT ON Facturacion
FOR EACH ROW
BEGIN
    :NEW.Num_Factura := sec_facturacion.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_locales START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_locales
BEFORE INSERT ON Locales
FOR EACH ROW
BEGIN
    :NEW.Id_Local := sec_locales.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_materia_prima START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_materia_prima
BEFORE INSERT ON MateriaPrima
FOR EACH ROW
BEGIN
    :NEW.Id_MateriaPrima := sec_materia_prima.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_menu START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_menu
BEFORE INSERT ON Menu
FOR EACH ROW
BEGIN
    :NEW.Id_Menu := sec_menu.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_producto START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_producto
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    :NEW.Id_Producto := sec_producto.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_proveedor START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_proveedor
BEFORE INSERT ON Proveedor
FOR EACH ROW
BEGIN
    :NEW.Id_Proveedor := sec_proveedor.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_publicaciones START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_publicaciones
BEFORE INSERT ON Publicaciones
FOR EACH ROW
BEGIN
    :NEW.Id_Publicacion := sec_publicaciones.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_puesto START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_puesto
BEFORE INSERT ON Puesto
FOR EACH ROW
BEGIN
    :NEW.Id_Puesto := sec_puesto.NEXTVAL;
END;

-- Sequence
CREATE SEQUENCE sec_servicio_agendado START WITH 1;

-- Trigger
CREATE OR REPLACE TRIGGER tr_insert_servicio_agendado
BEFORE INSERT ON ServicioAgendado
FOR EACH ROW
BEGIN
    :NEW.Cod_Servicio := sec_servicio_agendado.NEXTVAL;
END;

-- Crear los triggers para las tablas de auditorias
CREATE OR REPLACE TRIGGER TGR_INSERT_AUDACTIVOS
BEFORE INSERT ON ACTIVOS
FOR EACH ROW
BEGIN
INSERT INTO AudActivos (Id_Activo, DESCRIPCION, Id_Local, tipoMovimiento, fechaMovimiento, usuariomovimiento)
VALUES (:new.Id_Activo, :new.descripcion, :new.Id_Local, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDACTIVOS
BEFORE DELETE ON ACTIVOS
FOR EACH ROW
BEGIN
INSERT INTO AudActivos (Id_Activo, DESCRIPCION, Id_Local, tipoMovimiento, fechaMovimiento, usuariomovimiento)
VALUES (:old.Id_Activo, :old.descripcion, :old.Id_Local, 'ELIMINADO', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_INSERT_AUDClientes
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
INSERT INTO AudClientes (Id_Cliente, Nombre, Tipo, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:new.Id_Cliente, :new.nombre, :new.tipo, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDClientes
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
INSERT INTO AudClientes (Id_Cliente, Nombre, Tipo, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:old.Id_Cliente, :old.nombre, :old.tipo, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_INSERT_AUDServicioEmpleados
BEFORE INSERT ON ServicioEmpleados
FOR EACH ROW
BEGIN
INSERT INTO AUDServicioEmpleados (Cod_Servicio, Id_Empleado, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:new.Cod_Servicio, :new.Id_Empleado, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDServicioEmpleados
BEFORE DELETE ON ServicioEmpleados
FOR EACH ROW
BEGIN
INSERT INTO AUDServicioEmpleados (Cod_Servicio, Id_Empleado, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:old.Cod_Servicio, :old.Id_Empleado, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_INSERT_AUDMateriaPrima
BEFORE INSERT ON MateriaPrima
FOR EACH ROW
BEGIN
INSERT INTO AUDMateriaPrima (Id_MateriaPrima, Nombre, Reservas, UnidadDeMedicion, Marca, CostoPorUnidad, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:new.Id_MateriaPrima, :new.Nombre, :new.Reservas, :new.unidaddemedicion, :new.marca, :new.costoporunidad, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDMateriaPrima
BEFORE DELETE ON MateriaPrima
FOR EACH ROW
BEGIN
INSERT INTO AUDMateriaPrima (Id_MateriaPrima, Nombre, Reservas, UnidadDeMedicion, Marca, CostoPorUnidad, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:old.Id_MateriaPrima, :old.Nombre, :old.Reservas, :old.unidaddemedicion, :old.marca, :old.costoporunidad, 'Insercion', SYSDATE, user);
END;


-- FUNCIONES --
    --1.Obtener el salario promedio de los empleados:
CREATE OR REPLACE FUNCTION promedio_salario 
	RETURN NUMBER IS
    salario_promedio NUMBER;
BEGIN
    SELECT AVG(SALARIO) INTO salario_promedio FROM Empleado;
    RETURN salario_promedio;
END promedio_salario;
-- Ejemplo:
SELECT promedio_salario() AS "Promedio de salarios"
    FROM dual;
    
   --2.Cantidad de empleados:
CREATE OR REPLACE FUNCTION cantidad_emplados
	RETURN NUMBER IS
    total_empleados NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_empleados FROM Empleado;
    RETURN total_empleados;
END cantidad_emplados;
-- Ejemplo:
SELECT cantidad_emplados() AS "Total empleados"
    FROM dual;
    
   --3.Cantidad de clientes:
CREATE OR REPLACE FUNCTION cantidad_clientes
	RETURN NUMBER IS
    total_clientes NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_clientes FROM Empleado;
    RETURN total_clientes;
END cantidad_clientes;
-- Ejemplo:
SELECT cantidad_clientes() AS "Total clientes"
    FROM dual;
    
     --4.Cantidad de locales:
CREATE OR REPLACE FUNCTION cantidad_locales
	RETURN NUMBER IS
    total_locales NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_locales FROM Locales;
    RETURN total_locales;
END cantidad_locales;
-- Ejemplo:
SELECT cantidad_locales() AS "Total locales"
    FROM dual;
    
    --5.Ver monto de la última factura:
CREATE OR REPLACE FUNCTION ultima_factura 
RETURN VARCHAR2 IS
    factura_monto VARCHAR2(25);
BEGIN
    SELECT Total INTO factura_monto
    FROM Facturacion
    WHERE ROWNUM = 1
    ORDER BY Fecha ASC;

    RETURN factura_monto;
END ultima_factura;
    -- Ejemplo:
SELECT ultima_factura() AS "Total última factura"
    FROM dual;
    
    --------------REVISAR-------------------
    -- 5. Lista de productos de un menu: Este tiene un error a la hora de correrlo, ya le hice los cambios de la tabla menu
    CREATE OR REPLACE FUNCTION ListaProdMenu(Id_Menu INT)
    RETURN SYS_REFCURSOR
    IS
       CursorList SYS_REFCURSOR;
    BEGIN
       OPEN CursorList FOR
          SELECT p.Nombre, p.Precio
          FROM Producto p
          JOIN Menu m ON p.Id_Producto = m.Id_Producto
          WHERE m.Id_Menu = Id_Menu;
    
       RETURN CursorList;
    END;
    -- Ejemplo:
    SELECT ListaProdMenu(1) AS "Lista de productos"
    FROM dual;
    
    -- 6. Obtener proveedores de una materia prima:
    CREATE OR REPLACE FUNCTION ProveedorMateriaPrima(Id_MateriaPrima INT)
    RETURN SYS_REFCURSOR
    IS
       CursorList SYS_REFCURSOR;
    BEGIN
       OPEN CursorList FOR
          SELECT pr.Nombre, mp.Precio
          FROM MateriaPrimaProveedor mp
          JOIN Proveedor pr ON mp.Id_Proveedor = pr.Id_Proveedor
          WHERE mp.Id_MateriaPrima = Id_MateriaPrima;
    
       RETURN CursorList;
    END;
    -- Ejemplo:
    SELECT ProveedorMateriaPrima(1) AS "Lista de productos"
    FROM dual;
        
    -- 7. Obtener el nombre y el propósito de local por ID: ERROR
    CREATE OR REPLACE FUNCTION InfoLocal(Id_Local INT)
    RETURN VARCHAR2
    IS
       InfoLocal VARCHAR2(100);
    BEGIN
       SELECT Nombre || ': ' || Proposito
       INTO InfoLocal
       FROM Locales
       WHERE Id_Local = Id_Local;
    
       RETURN InfoLocal;
    END;
    -- Ejemplo:
    SELECT InfoLocal(1) AS "Lista de productos"
    FROM dual;
    
    -- 8. Lista de Clientes con Detalles de Direcciï¿½n: este otro tambien tiene un error
    CREATE OR REPLACE FUNCTION clientes_direccion
          SELECT c.*, dt.*
          FROM Cliente c
          JOIN ClienteDireccion cd ON c.Id_Cliente = cd.Id_Cliente
          JOIN Provincia p ON cd.Id_Provincia = p.Id_Provincia
          JOIN Canton cn ON cd.Id_Canton = cn.Id_Canton
          JOIN Distrito dt ON cd.Id_Distrito = dt.Id_Distrito;
    
       RETURN CursorList;
    END;

--------------------------------- CURSORES ---------------------------------
    --1.Obtener información de todos los empleados:
DECLARE
    CURSOR c_empleados IS
        SELECT ID_EMPLEADO, NOMBRE, APELLIDO1, SALARIO
        FROM EMPLEADO;
        
    id_emp EMPLEADO.ID_EMPLEADO%TYPE;
    nombre_emp EMPLEADO.NOMBRE%TYPE;
    apellido_emp EMPLEADO.APELLIDO1%TYPE;
    salario_emp EMPLEADO.SALARIO%TYPE;
BEGIN
    OPEN c_empleados;
    DBMS_OUTPUT.PUT_LINE('Información de todos los empleados:');
    LOOP
        FETCH c_empleados INTO id_emp, nombre_emp, apellido_emp, salario_emp;
        EXIT WHEN c_empleados%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE('ID: ' || id_emp || ' Nombre: ' || nombre_emp || ' Apellido: ' || apellido_emp || ' Salario: ' || salario_emp);
    END LOOP;
    CLOSE c_empleados;
END;

    -- 2. Obtener información de todos los clientes:
DECLARE
    CURSOR c_clientes IS
        SELECT ID_CLIENTE, NOMBRE, TIPO
        FROM CLIENTE;
        
    id_cliente CLIENTE.ID_CLIENTE%TYPE;
    nombre_cliente CLIENTE.NOMBRE%TYPE;
    tipo_cliente CLIENTE.TIPO%TYPE;
BEGIN
    OPEN c_clientes;
    DBMS_OUTPUT.PUT_LINE('Información de todos los clientes:');
    LOOP
        FETCH c_clientes INTO id_cliente, nombre_cliente, tipo_cliente;
        EXIT WHEN c_clientes%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE('ID: ' || id_cliente || ' Nombre: ' || nombre_cliente || ' Tipo: ' || tipo_cliente);
    END LOOP;
    CLOSE c_clientes;
END;

--------------------------------- VISTAS ---------------------------------
    -- 1. Vista de Empleados Activos:
    CREATE OR REPLACE VIEW empleados_activos AS
       SELECT *
       FROM Empleado
       WHERE Estado = 'Activo';
       -- Llamar a la vista:
        SELECT * FROM empleados_activos;

    -- 2. Vista de Servicios Agendados hoy:
    CREATE OR REPLACE VIEW servicios_agendados AS
       SELECT *
       FROM ServicioAgendados
       WHERE TRUNC(FechaHora) = TRUNC(SYSDATE);
        -- Llamar a la vista:
        SELECT * FROM servicios_agendados;
       
    -- 3. Vista de nombres de clientes
    CREATE OR REPLACE VIEW nombres_clientes AS
       SELECT Nombre
       FROM Cliente;
       -- Llamar a la vista:
        SELECT * FROM nombres_clientes;
        
         -- 4. Vista de clientes VIP:
    CREATE OR REPLACE VIEW clientes_vip AS
       SELECT *
       FROM Cliente
       WHERE Tipo = 'VIP';
       -- Llamar a la vista:
        SELECT * FROM clientes_vip;

       -- 5. Vista de Empleados con el Puesto:
    CREATE OR REPLACE VIEW empleados_puestos AS
       SELECT e.Nombre, e.Apellido1, e.Apellido2, p.Nombre AS NombrePuesto, p.SalarioMin, p.SalarioMax
       FROM Empleado e
       JOIN EmpleadoPuesto ep ON e.Id_Empleado = ep.Id_Empleado
       JOIN Puesto p ON ep.Id_Puesto = p.Id_Puesto;
       -- Llamar a la vista:
        SELECT * FROM empleados_puestos;
        
         -- 6. Vista de Detalles Productos:
    CREATE OR REPLACE VIEW nombre_productos AS
       SELECT Nombre
       FROM Producto;
       -- Llamar a la vista:
        SELECT * FROM nombre_productos;
        
        -- 7. Vista de Detalles Productos:
    CREATE OR REPLACE VIEW nombre_proveedor AS
       SELECT Nombre
       FROM proveedor;
       -- Llamar a la vista:
        SELECT * FROM nombre_proveedor;
        
        -- 8. Vista de Provincias:
    CREATE OR REPLACE VIEW info_provincias AS
       SELECT *
       FROM Provincia;
       -- Llamar a la vista:
        SELECT * FROM info_provincias;
        
        -- 9. Vista de Cantones por provincia:
    CREATE OR REPLACE VIEW canton_por_provincia AS
       SELECT Nombre
       FROM canton
       WHERE id_provincia = 1; -- cambiar id_provincia según se necesite
       -- Llamar a la vista:
        SELECT * FROM canton_por_provincia;
        
         -- 10. Vista de Locales y descripción:
    CREATE OR REPLACE VIEW proposito_local AS
       SELECT Nombre, Proposito
       FROM Locales;
       -- Llamar a la vista:
        SELECT * FROM proposito_local;

---------------------- PROCEDIMIENTOS ALMACENADOS --------------------------
-- Verificar la tabla de Empleado ya que tiene un fallo****
-- 1. Ingresar Empleado
CREATE OR REPLACE PROCEDURE ingresar_empleado(
    p_Id_Empleado INT,
    p_Nombre VARCHAR2,
    p_Apellido1 VARCHAR2,
    p_Apellido2 VARCHAR2,
    p_Alias VARCHAR2,
    p_IBAN VARCHAR2,
    p_Salario NUMBER,
    p_Estado VARCHAR2,
    p_Password VARCHAR2) AS
BEGIN
    INSERT INTO Empleado (Id_Empleado, Nombre, Apellido1, Apellido2, Alias, IBAN, Salario, Estado, "Password")
    VALUES (p_Id_Empleado, p_Nombre, p_Apellido1, p_Apellido2, p_Alias, p_IBAN, p_Salario, p_Estado, p_Password);
END;

    -- 2. Ingresar Cliente
CREATE PROCEDURE ingresar_cliente(
    p_Id_Cliente INT,
    p_Nombre VARCHAR2,
    p_Tipo VARCHAR2) AS
BEGIN
    INSERT INTO Cliente VALUES (p_Id_Cliente, p_Nombre, p_Tipo);
END;

    -- 3. Ingresar Producto
CREATE PROCEDURE ingresar_producto(
    p_Id_Producto INT,
    p_Nombre VARCHAR2,
    p_Precio NUMBER,
    p_Descripcion VARCHAR2,
    p_Imagen VARCHAR2) AS
BEGIN
    INSERT INTO Producto VALUES (p_Id_Producto, p_Nombre, p_Precio, p_Descripcion, p_Imagen);
END;

    -- 4. Ingresar Provincia
CREATE PROCEDURE ingresar_provincia(
    p_Id_Provincia INT,
    p_Nombre VARCHAR2) AS
BEGIN
    INSERT INTO Provincia VALUES (p_Id_Provincia, p_Nombre);
END;

    -- 5. Ingresar Local
CREATE PROCEDURE ingresar_local(
    p_Id_Local INT,
    p_Nombre VARCHAR2,
    p_Proposito VARCHAR2) AS
BEGIN
    INSERT INTO Locales VALUES (p_Id_Local, p_Nombre, p_Proposito);
END;

    -- 6. Ingresar Factura
CREATE PROCEDURE ingresar_facturacion(
    p_Num_Factura INT,
    p_Fecha DATE,
    p_MetodoPago VARCHAR2,
    p_Total NUMBER) AS
BEGIN
    INSERT INTO Facturacion VALUES (p_Num_Factura, p_Fecha, p_MetodoPago, p_Total);
END;

    -- 7. Eliminar Empleado
CREATE PROCEDURE borrar_empleado(
    p_Id_Empleado INT) AS
BEGIN
    DELETE FROM Empleado WHERE Id_Empleado = p_Id_Empleado;
END;

    -- 8. Eliminar Cliente
CREATE PROCEDURE borrar_cliente(
    p_Id_Cliente INT) AS
BEGIN
    DELETE FROM Cliente WHERE Id_Cliente = p_Id_Cliente;
END;

    -- 9. Eliminar Producto
CREATE PROCEDURE borrar_producto(
    p_Id_Producto INT) AS
BEGIN
    DELETE FROM Producto WHERE Id_Producto = p_Id_Producto;
END;

    -- 10. Eliminar Provincia
CREATE PROCEDURE borrar_provincia(
    p_Id_Provincia INT) AS
BEGIN
    DELETE FROM Provincia WHERE Id_Provincia = p_Id_Provincia;
END;

    -- 11. Elimnar Local
CREATE PROCEDURE borrar_local(
    p_Id_Local INT) AS
BEGIN
    DELETE FROM Locales WHERE Id_Local = p_Id_Local;
END;

    -- 12. Elimnar Facturación
CREATE PROCEDURE borrar_facturacion(
    p_Num_Factura INT) AS
BEGIN
    DELETE FROM Facturacion WHERE Num_Factura = p_Num_Factura;
END;