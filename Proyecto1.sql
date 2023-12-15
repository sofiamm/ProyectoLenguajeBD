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

---------------------------------- FUNCIONES ----------------------------------
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
CREATE OR REPLACE FUNCTION cantidad_empleados
	RETURN NUMBER IS
    total_empleados NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_empleados FROM Empleado;
    RETURN total_empleados;
END cantidad_empleados;
-- Ejemplo:
SELECT cantidad_empleados() AS "Total empleados"
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
CREATE OR REPLACE FUNCTION monto_ultima_factura 
    RETURN VARCHAR2 IS
    factura_monto VARCHAR2(25);
BEGIN
    SELECT Total INTO factura_monto
    FROM Facturacion
    WHERE ROWNUM = 1
    ORDER BY Fecha ASC;

    RETURN factura_monto;
END monto_ultima_factura;
    -- Ejemplo:
SELECT monto_ultima_factura() AS "Total última factura"
    FROM dual;
    
    -- 6. Obtener cantidad de proveedores de una materia prima:
CREATE OR REPLACE FUNCTION cantidad_proveedores
	RETURN NUMBER IS
    total_proveedores NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_proveedores FROM Proveedor;
    RETURN total_proveedores;
END cantidad_proveedores;
-- Ejemplo:
SELECT cantidad_proveedores() AS "Total proveedores"
    FROM dual;
        
    -- 7. Obtener el nombre y el propósito de local por ID
CREATE OR REPLACE FUNCTION info_local(local_id INT)
    RETURN VARCHAR2 IS
       var_local VARCHAR2(100);
BEGIN
       SELECT Nombre || ': ' || Proposito INTO var_local FROM Locales WHERE Id_Local = local_id;
       RETURN var_local;
END info_local;
    -- Ejemplo:
SELECT info_local(1) AS "Local con el id suministrado"
    FROM dual;
    
    -- 8. Cantidad de cantones por ID provincia
CREATE OR REPLACE FUNCTION total_cantones_provincia(provincia_id INT)
    RETURN NUMBER IS
    total_cantones NUMBER;
BEGIN
       SELECT COUNT(*) INTO total_cantones FROM Canton WHERE Id_Provincia = provincia_id;
       RETURN total_cantones;
END total_cantones_provincia;
    -- Ejemplo:
SELECT total_cantones_provincia(1) AS "Cantidad de cantones del id suministrado" -- ID = 1 - San José
    FROM dual;

    -- 9. Obtener cantidad de correos:
CREATE OR REPLACE FUNCTION cantidad_correos
	RETURN NUMBER IS
    total_correos NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_correos FROM EmpleadoCorreo;
    RETURN total_correos;
END cantidad_correos;
-- Ejemplo:
SELECT cantidad_correos() AS "Total correos"
    FROM dual;
    
    -- 10. Obtener correo por ID:
CREATE OR REPLACE FUNCTION correo_nombre(empleado_id INT)
	RETURN VARCHAR2 IS
    empleado_correo VARCHAR2(100);
BEGIN
    SELECT Correo INTO empleado_correo FROM EmpleadoCorreo WHERE Id_Empleado = empleado_id;
    RETURN empleado_correo;
END correo_nombre;
-- Ejemplo:
SELECT correo_nombre(1) AS "Correo del empleado seleccionado"
    FROM dual;
    
    -- 11. Cantidad de empleados activos:
CREATE OR REPLACE FUNCTION cantidad_emplados_activos
	RETURN NUMBER IS
    total_empleados NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_empleados FROM Empleado WHERE Estado = 'Activo';
    RETURN total_empleados;
END cantidad_emplados_activos;
-- Ejemplo:
SELECT cantidad_emplados_activos() AS "Total empleados activos"
    FROM dual;
    
    -- 12. Cantidad de empleados inactivos:
CREATE OR REPLACE FUNCTION cantidad_emplados_inactivos
	RETURN NUMBER IS
    total_empleados NUMBER;
BEGIN
    SELECT COUNT(*) INTO total_empleados FROM Empleado WHERE Estado = 'Inactivo';
    RETURN total_empleados;
END cantidad_emplados_inactivos;
-- Ejemplo:
SELECT cantidad_emplados_inactivos() AS "Total empleados inactivos"
    FROM dual;
    
    --13.Obtener método de pago de la última factura que se realizo:
CREATE OR REPLACE FUNCTION metodo_pago_ultima_factura 
	RETURN VARCHAR2 IS
       ultimafactura VARCHAR2(25);
BEGIN
    SELECT MetodoPago INTO ultimafactura FROM Facturacion WHERE ROWNUM = 1 ORDER BY Fecha DESC;
    RETURN ultimafactura;
END metodo_pago_ultima_factura;
-- Ejemplo:
SELECT metodo_pago_ultima_factura() AS "Método de pago de última factura"
    FROM dual;
    
    --14.Obtener fecha de la última factura que se realizo:
CREATE OR REPLACE FUNCTION fecha_ultima_factura 
	RETURN VARCHAR2 IS
       ultimafactura VARCHAR2(25);
BEGIN
    SELECT Fecha INTO ultimafactura FROM Facturacion WHERE ROWNUM = 1 ORDER BY Fecha DESC;
    RETURN ultimafactura;
END fecha_ultima_factura;
-- Ejemplo:
SELECT fecha_ultima_factura() AS "Método de pago de última factura"
    FROM dual;
    
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
        DBMS_OUTPUT.PUT_LINE(id_emp || ' Nombre: ' || nombre_emp || ' Apellido: ' || apellido_emp || ' Salario: ' || salario_emp);
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
        DBMS_OUTPUT.PUT_LINE(id_cliente || ' Nombre: ' || nombre_cliente || ' Tipo: ' || tipo_cliente);
    END LOOP;
    CLOSE c_clientes;
END;

    -- 3. Obtener información de todos los locales:
DECLARE
    CURSOR c_local IS
        SELECT ID_LOCAL, NOMBRE, PROPOSITO
        FROM LOCALES;
        
    id_local LOCALES.ID_LOCAL%TYPE;
    nombre_local LOCALES.NOMBRE%TYPE;
    proposito_local LOCALES.PROPOSITO%TYPE;
BEGIN
    OPEN c_local;
    DBMS_OUTPUT.PUT_LINE('Datos de los locales:');
    LOOP
        FETCH c_local INTO id_local, nombre_local, proposito_local;
        EXIT WHEN c_local%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_local || '. ' || nombre_local || ' es un local dedicado a ' || proposito_local);
    END LOOP;
    CLOSE c_local;
END;

    -- 4. Obtener información de todos los productos:
DECLARE
    CURSOR c_producto IS
        SELECT ID_PRODUCTO, NOMBRE, PRECIO, DESCRIPCION
        FROM PRODUCTO;
        
    id_producto PRODUCTO.ID_PRODUCTO%TYPE;
    nombre_producto PRODUCTO.NOMBRE%TYPE;
    precio_producto PRODUCTO.PRECIO%TYPE;
    descripcion_producto PRODUCTO.DESCRIPCION%TYPE;
BEGIN
    OPEN c_producto;
    DBMS_OUTPUT.PUT_LINE('Datos de los productos:');
    LOOP
        FETCH c_producto INTO id_producto, nombre_producto, precio_producto, descripcion_producto;
        EXIT WHEN c_producto%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_producto || '. ' || nombre_producto || ': ' || descripcion_producto || ' -  Precio: ' || precio_producto);
    END LOOP;
    CLOSE c_producto;
END;

    -- 5. Obtener información de todas las provincias:
DECLARE
    CURSOR c_provincia IS
        SELECT ID_PROVINCIA, NOMBRE
        FROM PROVINCIA;
        
    id_provincia PROVINCIA.ID_PROVINCIA%TYPE;
    nombre_provincia PROVINCIA.NOMBRE%TYPE;
BEGIN
    OPEN c_provincia;
    DBMS_OUTPUT.PUT_LINE('Provincias:');
    LOOP
        FETCH c_provincia INTO id_provincia, nombre_provincia;
        EXIT WHEN c_provincia%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_provincia || '. ' || nombre_provincia);
    END LOOP;
    CLOSE c_provincia;
END;

    -- 6. Obtener correo de los empleados:
DECLARE
    CURSOR c_correo IS
        SELECT ID_EMPLEADO, CORREO, NOMBRE
        FROM EMPLEADOCORREO JOIN EMPLEADO ON ID_EMPLEADO = ID_EMPLEADO;
        
    id_correo EMPLEADOCORREO.ID_EMPLEADO%TYPE;
    correo EMPLEADOCORREO.CORREO%TYPE;
    nombre EMPLEADO.NOMBRE%TYPE;
BEGIN
    OPEN c_correo;
    DBMS_OUTPUT.PUT_LINE('Correo de empleados:');
    LOOP
        FETCH c_correo INTO id_correo, nombre, correo;
        EXIT WHEN c_correo%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(nombre || ': ' || correo);
    END LOOP;
    CLOSE c_correo;
END;

    -- 7. Obtener lista de materia prima:
DECLARE
    CURSOR c_materia_prima IS
        SELECT ID_MATERIAPRIMA, NOMBRE
        FROM MATERIAPRIMA;
        
    id_materia MATERIAPRIMA.ID_MATERIAPRIMA%TYPE;
    nombre MATERIAPRIMA.NOMBRE%TYPE;
BEGIN
    OPEN c_materia_prima;
    DBMS_OUTPUT.PUT_LINE('Lista de materia prima:');
    LOOP
        FETCH c_materia_prima INTO id_materia, nombre;
        EXIT WHEN c_materia_prima%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_materia || '. ' || nombre);
    END LOOP;
    CLOSE c_materia_prima;
END;

    -- 8. Obtener lista de activos:
DECLARE
    CURSOR c_activos IS
        SELECT ID_ACTIVO, DESCRIPCION
        FROM ACTIVOS;
        
    id_activos ACTIVOS.ID_ACTIVO%TYPE;
    descripcion ACTIVOS.DESCRIPCION%TYPE;
BEGIN
    OPEN c_activos;
    DBMS_OUTPUT.PUT_LINE('Lista de activos:');
    LOOP
        FETCH c_activos INTO id_activos, descripcion;
        EXIT WHEN c_activos%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_activos || '. ' || descripcion);
    END LOOP;
    CLOSE c_activos;
END;

    -- 9. Obtener cantidad de personas por menú:
DECLARE
    CURSOR c_menu IS
        SELECT ID_MENU, PERSONAS
        FROM MENU;
        
    id_menu MENU.ID_MENU%TYPE;
    personas MENU.PERSONAS%TYPE;
BEGIN
    OPEN c_menu;
    DBMS_OUTPUT.PUT_LINE('Lista de personas por menú:');
    LOOP
        FETCH c_menu INTO id_menu, personas;
        EXIT WHEN c_menu%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE('El menú número ' || id_menu || ' es para ' || personas || ' personas');
    END LOOP;
    CLOSE c_menu;
END;

    -- 10. Obtener lista de proveedores:
DECLARE
    CURSOR c_proveedor IS
        SELECT ID_PROVEEDOR, NOMBRE
        FROM PROVEEDOR;
        
    id_proveedor PROVEEDOR.ID_PROVEEDOR%TYPE;
    nombre PROVEEDOR.NOMBRE%TYPE;
BEGIN
    OPEN c_proveedor;
    DBMS_OUTPUT.PUT_LINE('Lista de proveedores:');
    LOOP
        FETCH c_proveedor INTO id_proveedor, nombre;
        EXIT WHEN c_proveedor%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_proveedor || '. ' || nombre);
    END LOOP;
    CLOSE c_proveedor;
END;


    -- 11. Obtener lista de publicaciones:
DECLARE
    CURSOR c_publicaciones IS
        SELECT ID_PUBLICACION, LINK
        FROM PUBLICACIONES;
        
    id_publicacion PUBLICACIONES.ID_PUBLICACION%TYPE;
    link PUBLICACIONES.LINK%TYPE;
BEGIN
    OPEN c_publicaciones;
    DBMS_OUTPUT.PUT_LINE('Lista de publicaciones:');
    LOOP
        FETCH c_publicaciones INTO id_publicacion, link;
        EXIT WHEN c_publicaciones%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_publicacion || '. URL: ' || link);
    END LOOP;
    CLOSE c_publicaciones;
END;

    -- 12. Obtener lista de distrito:
DECLARE
    CURSOR c_distrito IS
        SELECT ID_DISTRITO, NOMBRE
        FROM DISTRITO;
        
    id_distrito DISTRITO.ID_DISTRITO%TYPE;
    nombre DISTRITO.NOMBRE%TYPE;
BEGIN
    OPEN c_distrito;
    DBMS_OUTPUT.PUT_LINE('Lista de distritos:');
    LOOP
        FETCH c_distrito INTO id_distrito, nombre;
        EXIT WHEN c_distrito%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_distrito || '. ' || nombre);
    END LOOP;
    CLOSE c_distrito;
END;

    -- 13. Obtener lista de contacto:
DECLARE
    CURSOR c_contacto IS
        SELECT ID_CONTACTO, NOMBRE
        FROM CONTACTO;
        
    id_contacto CONTACTO.ID_CONTACTO%TYPE;
    nombre CONTACTO.NOMBRE%TYPE;
BEGIN
    OPEN c_contacto;
    DBMS_OUTPUT.PUT_LINE('Lista de contactos:');
    LOOP
        FETCH c_contacto INTO id_contacto, nombre;
        EXIT WHEN c_contacto%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_contacto || '. ' || nombre);
    END LOOP;
    CLOSE c_contacto;
END;

    -- 14. Obtener lista de telefono:
DECLARE
    CURSOR c_telefono IS
        SELECT ID_CONTACTO, TELEFONO
        FROM CONTACTOTELEFONO;
        
    id_contacto CONTACTOTELEFONO.ID_CONTACTO%TYPE;
    telefono CONTACTOTELEFONO.TELEFONO%TYPE;
BEGIN
    OPEN c_telefono;
    DBMS_OUTPUT.PUT_LINE('Lista de distritos:');
    LOOP
        FETCH c_telefono INTO id_contacto, telefono;
        EXIT WHEN c_telefono%NOTFOUND;
        
        -- Puedes realizar operaciones con los datos aquí
        DBMS_OUTPUT.PUT_LINE(id_contacto || '. ' || telefono);
    END LOOP;
    CLOSE c_telefono;
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
       FROM ServicioAgendado
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
    INSERT INTO Empleado 
    VALUES (p_Id_Empleado, p_Nombre, p_Apellido1, p_Apellido2, p_Alias, p_IBAN, p_Salario, p_Estado, p_Password);
END;

    -- 2. Ingresar Cliente
CREATE OR REPLACE PROCEDURE ingresar_cliente(
    p_Id_Cliente INT,
    p_Nombre VARCHAR2,
    p_Tipo VARCHAR2) AS
BEGIN
    INSERT INTO Cliente VALUES (p_Id_Cliente, p_Nombre, p_Tipo);
END;

    -- 3. Ingresar Producto
CREATE OR REPLACE PROCEDURE ingresar_producto(
    p_Id_Producto INT,
    p_Nombre VARCHAR2,
    p_Precio NUMBER,
    p_Descripcion VARCHAR2,
    p_Imagen VARCHAR2) AS
BEGIN
    INSERT INTO Producto VALUES (p_Id_Producto, p_Nombre, p_Precio, p_Descripcion, p_Imagen);
END;

    -- 4. Ingresar Provincia
CREATE OR REPLACE PROCEDURE ingresar_provincia(
    p_Id_Provincia INT,
    p_Nombre VARCHAR2) AS
BEGIN
    INSERT INTO Provincia VALUES (p_Id_Provincia, p_Nombre);
END;

    -- 5. Ingresar Local
CREATE OR REPLACE PROCEDURE ingresar_local(
    p_Id_Local INT,
    p_Nombre VARCHAR2,
    p_Proposito VARCHAR2) AS
BEGIN
    INSERT INTO Locales VALUES (p_Id_Local, p_Nombre, p_Proposito);
END;

    -- 6. Ingresar Factura
CREATE OR REPLACE PROCEDURE ingresar_facturacion(
    p_Num_Factura INT,
    p_Fecha DATE,
    p_MetodoPago VARCHAR2,
    p_Total NUMBER) AS
BEGIN
    INSERT INTO Facturacion VALUES (p_Num_Factura, p_Fecha, p_MetodoPago, p_Total);
END;

    -- 7. Eliminar Empleado
CREATE OR REPLACE PROCEDURE borrar_empleado(
    p_Id_Empleado INT) AS
BEGIN
    DELETE FROM Empleado WHERE Id_Empleado = p_Id_Empleado;
END;

    -- 8. Eliminar Cliente
CREATE OR REPLACE PROCEDURE borrar_cliente(
    p_Id_Cliente INT) AS
BEGIN
    DELETE FROM Cliente WHERE Id_Cliente = p_Id_Cliente;
END;

    -- 9. Eliminar Producto
CREATE OR REPLACE PROCEDURE borrar_producto(
    p_Id_Producto INT) AS
BEGIN
    DELETE FROM Producto WHERE Id_Producto = p_Id_Producto;
END;

    -- 10. Eliminar Provincia
CREATE OR REPLACE PROCEDURE borrar_provincia(
    p_Id_Provincia INT) AS
BEGIN
    DELETE FROM Provincia WHERE Id_Provincia = p_Id_Provincia;
END;

    -- 11. Elimnar Local
CREATE OR REPLACE PROCEDURE borrar_local(
    p_Id_Local INT) AS
BEGIN
    DELETE FROM Locales WHERE Id_Local = p_Id_Local;
END;

    -- 12. Elimnar Facturación
CREATE OR REPLACE PROCEDURE borrar_facturacion(
    p_Num_Factura INT) AS
BEGIN
    DELETE FROM Facturacion WHERE Num_Factura = p_Num_Factura;
END;

    -- 13. Actualizar Empleado
CREATE OR REPLACE PROCEDURE actualizar_empleado(
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
    UPDATE Empleado
    SET
        Nombre = p_Nombre,
        Apellido1 = p_Apellido1,
        Apellido2 = p_Apellido2,
        Alias = p_Alias,
        IBAN = p_IBAN,
        Salario = p_Salario,
        Estado = p_Estado,
        Password = p_Password
    WHERE Id_Empleado = p_Id_Empleado;
END;

    -- 14. Actualizar Cliente
CREATE OR REPLACE PROCEDURE actualizar_cliente(
    p_Id_Cliente INT,
    p_Nombre VARCHAR2,
    p_Tipo VARCHAR2) AS
BEGIN
    UPDATE Cliente
    SET
        Id_Cliente = p_Id_Cliente,
        Nombre = p_Nombre,
        Tipo = p_Tipo
    WHERE Id_Cliente = p_Id_Cliente;
END;

    -- 15. Actualizar Producto
CREATE OR REPLACE PROCEDURE actualizar_producto(
    p_Id_Producto INT,
    p_Nombre VARCHAR2,
    p_Precio NUMBER,
    p_Descripcion VARCHAR2,
    p_Imagen VARCHAR2) AS
BEGIN
    UPDATE Producto
    SET
        Id_Producto = p_Id_Producto,
        Nombre = p_Nombre,
        Precio = p_Precio,
        Descripcion = p_Descripcion,
        Imagen = p_Imagen
    WHERE Id_Producto = p_Id_Producto;
END;

    -- 16. Actualizar Provincia
CREATE OR REPLACE PROCEDURE actualizar_provincia(
    p_Id_Provincia INT,
    p_Nombre VARCHAR2) AS
BEGIN
    UPDATE Provincia
    SET
        Id_Provincia = p_Id_Provincia,
        Nombre = p_Nombre
    WHERE Id_Provincia = p_Id_Provincia;
END;

    -- 17. Actualizar Local
CREATE OR REPLACE PROCEDURE actualizar_local(
    p_Id_Local INT,
    p_Nombre VARCHAR2,
    p_Proposito VARCHAR2) AS
BEGIN
    UPDATE Locales
    SET
        Id_Local = p_Id_Local,
        Nombre = p_Nombre,
        Proposito = p_Proposito
    WHERE Id_Local = p_Id_Local;
END;

    -- 18. Actualizar Factura
CREATE OR REPLACE PROCEDURE actualizar_facturacion(
    p_Num_Factura INT,
    p_Fecha DATE,
    p_MetodoPago VARCHAR2,
    p_Total NUMBER) AS
BEGIN
    UPDATE Facturacion
    SET
        Num_Factura = p_Num_Factura,
        Fecha = p_Fecha,
        MetodoPago = p_MetodoPago,
        Total = p_Total
    WHERE Num_Factura = p_Num_Factura;
END;

    -- 19. Actualizar Estado Empleado
CREATE OR REPLACE PROCEDURE actualizar_estado_empleado(
    p_Id_Empleado INT,
    p_Estado VARCHAR2) AS
BEGIN
    UPDATE Empleado
    SET
        Estado = p_Estado
    WHERE Id_Empleado = p_Id_Empleado;
END;

    -- 20. Actualizar Salario
CREATE OR REPLACE PROCEDURE actualizar_salario_empleado(
    p_Id_Empleado INT,
    p_Salario NUMBER) AS
BEGIN
    UPDATE Empleado
    SET
        Salario = p_Salario
    WHERE Id_Empleado = p_Id_Empleado;
END;

    -- 21. Actualizar Precio Producto
CREATE OR REPLACE PROCEDURE actualizar_precio_producto(
    p_Id_Producto INT,
    p_Precio NUMBER) AS
BEGIN
    UPDATE Producto
    SET
        Id_Producto = p_Id_Producto,
        Precio = p_Precio
    WHERE Id_Producto = p_Id_Producto;
END;
    
    -- 22. Ingresar Imagen
CREATE OR REPLACE PROCEDURE ingresar_correo_contacto(
    p_Id_Contacto INT,
    p_Correo VARCHAR2) AS
BEGIN
    INSERT INTO ContactoCorreo VALUES (p_Id_Contacto, p_Correo);
END;
    -- 23. Eliminar Correo
CREATE OR REPLACE PROCEDURE borrar_correo_contacto(
    p_Id_Contacto INT) AS
BEGIN
    DELETE FROM ContactoCorreo WHERE Id_Contacto = p_Id_Contacto;
END;

    -- 24. Actualizar Correo
CREATE OR REPLACE PROCEDURE actualizar_correo_contacto(
    p_Id_Contacto INT,
    p_Correo VARCHAR2) AS
BEGIN
    UPDATE ContactoCorreo
    SET
        Id_Contacto = p_Id_Contacto,
        Correo = p_Correo
    WHERE Id_Contacto = p_Id_Contacto;
END;