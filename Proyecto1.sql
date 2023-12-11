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
    -- 1. Obtener informaci�n de un empleado:
    CREATE OR REPLACE FUNCTION InfoEmpleado(Id_Empleado INT)
    RETURN VARCHAR2
    IS
       InfoEmpleado VARCHAR2(500);
    BEGIN
       SELECT Nombre || ' ' || Apellido1 || ' ' || Apellido2 || ' | AKA: ' || Alias || ' | IBAN: ' || IBAN
       INTO InfoEmpleado
       FROM Empleado
       WHERE Id_Empleado = Id_Empleado;
       RETURN InfoEmpleado;
    END;
    -- Ejemplo:
    INSERT INTO Empleado (Id_Empleado, Nombre, Apellido1, Apellido2, Alias, IBAN, Salario, Estado, Password)
    VALUES (10, 'Juan', 'Perez', 'Gomez', 'JP', 'Mo34', 5000, 'Activo', 'psswd');
    
    SELECT InfoEmpleado(30) AS "Informaci�n del Empleado"
    FROM dual; --Tabla default para ejemplo
    
    -- 2. Lista de empleados por puesto:
    CREATE OR REPLACE FUNCTION ListaEmpleadosPuesto(Id_Puesto INT)
    RETURN SYS_REFCURSOR
    IS
       CursorList SYS_REFCURSOR;
    BEGIN
       OPEN CursorList FOR
          SELECT e.Nombre, e.Apellido1, e.Apellido2
          FROM Empleado e
          JOIN EmpleadoPuesto ep ON e.Id_Empleado = ep.Id_Empleado
          WHERE ep.Id_Puesto = Id_Puesto;
          
       RETURN CursorList;
    END;
    -- Ejemplo:
    INSERT INTO Puesto (Id_Puesto, Nombre, SalarioMin, SalarioMax)
    VALUES (1, 'Desarrollador', 5000, 8000);
    
    INSERT INTO EmpleadoPuesto (Id_Empleado, Id_Puesto)
    VALUES (10, 1);
    
    INSERT INTO Empleado (Id_Empleado, Nombre, Apellido1, Apellido2, Alias, IBAN, Salario, Estado, Password)
    VALUES (20, 'Sof�a', 'Mora', 'Mu�oz', 'SOF', 'Ra24', 6000, 'Activo', 'contra');
    
    INSERT INTO EmpleadoPuesto (Id_Empleado, Id_Puesto)
    VALUES (20, 1);
    
    SELECT ListaEmpleadosPuesto(1) AS "Lista Empleados"
    FROM dual;
    
    -- 3.Calcular el total de una factura:
    CREATE OR REPLACE FUNCTION TotalFactura(Num_Factura INT)
    RETURN NUMBER
    IS
       Total NUMBER(6,2);
    BEGIN
       SELECT SUM(fd.Total)
       INTO Total
       FROM FacturaDetalle fd
       WHERE fd.Num_Factura = Num_Factura;
    
       RETURN Total;
    END;
    -- Ejemplo:
    INSERT INTO Facturacion (Num_Factura, Fecha, MetodoPago, Total)
    VALUES (1, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 'Tarjeta', 1000.00);
    
    INSERT INTO FacturaDetalle (Num_Factura, Id_Menu, Cantidad, Subtotal, Total)
    VALUES (1, 1, 2, 50.00, 100.00);
    
    INSERT INTO FacturaDetalle (Num_Factura, Id_Menu, Cantidad, Subtotal, Total)
    VALUES (1, 2, 1, 30.00, 30.00);
    
    SELECT TotalFactura(1) AS "Monto total"
    FROM dual;
    
-- 4. Obtener nombre del cliente por la factura:
    CREATE OR REPLACE FUNCTION NomClienteFact(Num_Factura INT)
    RETURN VARCHAR2
    IS
       NombreCliente VARCHAR2(100);
    BEGIN
       SELECT c.Nombre
       INTO NombreCliente
       FROM Cliente c
       JOIN ClienteDireccion cd ON c.Id_Cliente = cd.Id_Cliente
       JOIN FacturaDetalle fd ON cd.Id_Direccion = fd.Id_Menu
       WHERE fd.Num_Factura = Num_Factura;
    
       RETURN NombreCliente;
    END;
    -- Ejemplo:
    INSERT INTO Cliente (Id_Cliente, Nombre, Tipo)
    VALUES (1, 'Valeria', 'Frecuente');
    
    INSERT INTO Provincia (Id_Provincia, Nombre) VALUES (1, 'San Jose');
    
    INSERT INTO Canton (Id_Provincia, Id_Canton, Nombre) VALUES (1, 1, 'Desamparados');
    
    INSERT INTO Distrito (Id_Provincia, Id_Canton, Id_Distrito, Nombre) VALUES (1, 1, 1, 'San Miguel');

    INSERT INTO ClienteDireccion (Id_Direccion, Id_Cliente, Id_Provincia, Id_Canton, Id_Distrito, Indicaciones)
    VALUES (1, 1, 1, 1, 1, 'Indicaciones adicionales');
    
    INSERT INTO SERVICIOAGENDADOS (Cod_Servicio, FechaHora, PersonasAAtender)
    VALUES (1, SYSTIMESTAMP, 10);

    INSERT INTO FacturaServicio (Num_Factura, Cod_Servicio)
    VALUES (1, 1);
    
    SELECT NomClienteFact(1) AS "Nombre del cliente"
    FROM dual;
    
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
    INSERT INTO Producto (Id_Producto, Nombre, Precio, Descripcion, Imagen)
    VALUES (1, 'Hamburguesa', 10.00, 'Torta de carne', 'imagen1.jpg');
    
    INSERT INTO Producto (Id_Producto, Nombre, Precio, Descripcion, Imagen)
    VALUES (2, 'Batido', 15.00, 'Sabor de fresa', 'imagen2.jpg');
    
    INSERT INTO Menu (Id_Menu, precio, personas)
    VALUES (1, 10.00, 2);
    
    INSERT INTO Menu (Id_Menu, precio, personas)
    VALUES (2, 25.00, 1);

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
    INSERT INTO Proveedor (Id_Proveedor, Nombre)
    VALUES (1, 'Charlie');
    
    INSERT INTO Proveedor (Id_Proveedor, Nombre)
    VALUES (2, 'Pedro');
    
    INSERT INTO MateriaPrima (Id_MateriaPrima, Nombre, UnidadDeMedicion)
    VALUES (1, 'Papa', 'Unit');
    
    INSERT INTO MateriaPrimaProveedor (Id_MateriaPrima, Id_Proveedor, Precio)
    VALUES (1, 1, 10.00);
    
    INSERT INTO MateriaPrimaProveedor (Id_MateriaPrima, Id_Proveedor, Precio)
    VALUES (1, 2, 15.00);

    SELECT ProveedorMateriaPrima(1) AS "Lista de productos"
    FROM dual;
        
    -- 7. Obtener el nombre y el prop�sito de local por ID:
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
    
    -- 8. Lista de Clientes con Detalles de Direcci�n: este otro tambien tiene un error
    CREATE OR REPLACE FUNCTION ListaClientesDireccion
    RETURN SYS_REFCURSOR
    IS
       CursorList SYS_REFCURSOR;
    BEGIN
       OPEN CursorList FOR
          SELECT c.*, d.*
          FROM Cliente c
          JOIN ClienteDireccion cd ON c.Id_Cliente = cd.Id_Cliente
          JOIN Provincia p ON cd.Id_Provincia = p.Id_Provincia
          JOIN Canton cn ON cd.Id_Canton = cn.Id_Canton
          JOIN Distrito dt ON cd.Id_Distrito = dt.Id_Distrito;
    
       RETURN CursorList;
    END;
    
-- VISTAS --
    -- 1. Vista de Empleados Activos:
    CREATE OR REPLACE VIEW VistaEmpleadosActivos AS
       SELECT *
       FROM Empleado
       WHERE Estado = 'Activo';
       -- Llamar a la vista:
        SELECT * FROM VistaEmpleadosActivos;

    -- 2. Vista de Servicios Agendados hoy:
    CREATE OR REPLACE VIEW VistaServiciosAgendados AS
       SELECT *
       FROM ServicioAgendados
       WHERE TRUNC(FechaHora) = TRUNC(SYSDATE);
        -- Llamar a la vista:
        SELECT * FROM VistaServiciosAgendados;
       
    -- 3. Vista de Detalles de Factura con Informaci�n de Producto: este otro tiene un error
    CREATE OR REPLACE VIEW VistaDetallesFactura AS
       SELECT fd.Num_Factura, fd.Id_Menu, fd.Cantidad, fd.Subtotal, fd.Total,
              p.Nombre AS NombreProducto
       FROM FacturaDetalle fd
       JOIN Menu m ON fd.Id_Menu = m.Id_Menu
       JOIN Producto p ON m.Id_Producto = p.Id_Producto;
       -- Llamar a la vista:
        SELECT * FROM VistaDetallesFactura;

       -- 4. Vista de Empleados con Detalles de Puesto:
    CREATE OR REPLACE VIEW VistaEmpleadosPuesto AS
       SELECT e.*, ep.Id_Puesto, p.Nombre AS NombrePuesto, p.SalarioMin, p.SalarioMax
       FROM Empleado e
       JOIN EmpleadoPuesto ep ON e.Id_Empleado = ep.Id_Empleado
       JOIN Puesto p ON ep.Id_Puesto = p.Id_Puesto;
       -- Llamar a la vista:
        SELECT * FROM VistaEmpleadosPuesto;

--Procedimientos almacenados
--verificar la tabla de Empleado ya que tiene un fallo
CREATE OR REPLACE PROCEDURE IngresarEmpleado(
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

CREATE PROCEDURE IngresarCliente(
    p_Id_Cliente INT,
    p_Nombre VARCHAR2,
    p_Tipo VARCHAR2) AS
BEGIN
    INSERT INTO Cliente VALUES (p_Id_Cliente, p_Nombre, p_Tipo);
END;

CREATE PROCEDURE IngresarProducto(
    p_Id_Producto INT,
    p_Nombre VARCHAR2,
    p_Precio NUMBER,
    p_Descripcion VARCHAR2,
    p_Imagen VARCHAR2) AS
BEGIN
    INSERT INTO Producto VALUES (p_Id_Producto, p_Nombre, p_Precio, p_Descripcion, p_Imagen);
END;

CREATE PROCEDURE IngresarProvincia(
    p_Id_Provincia INT,
    p_Nombre VARCHAR2) AS
BEGIN
    INSERT INTO Provincia VALUES (p_Id_Provincia, p_Nombre);
END;

CREATE PROCEDURE IngresarLocal(
    p_Id_Local INT,
    p_Nombre VARCHAR2,
    p_Proposito VARCHAR2) AS
BEGIN
    INSERT INTO Locales VALUES (p_Id_Local, p_Nombre, p_Proposito);
END;
CREATE PROCEDURE IngresarFacturacion(
    p_Num_Factura INT,
    p_Fecha DATE,
    p_MetodoPago VARCHAR2,
    p_Total NUMBER) AS
BEGIN
    INSERT INTO Facturacion VALUES (p_Num_Factura, p_Fecha, p_MetodoPago, p_Total);
END;


CREATE PROCEDURE BorrarEmpleado(
    p_Id_Empleado INT) AS
BEGIN
    DELETE FROM Empleado WHERE Id_Empleado = p_Id_Empleado;
END;


CREATE PROCEDURE BorrarCliente(
    p_Id_Cliente INT) AS
BEGIN
    DELETE FROM Cliente WHERE Id_Cliente = p_Id_Cliente;
END;

CREATE PROCEDURE BorrarProducto(
    p_Id_Producto INT) AS
BEGIN
    DELETE FROM Producto WHERE Id_Producto = p_Id_Producto;
END;

CREATE PROCEDURE BorrarProvincia(
    p_Id_Provincia INT) AS
BEGIN
    DELETE FROM Provincia WHERE Id_Provincia = p_Id_Provincia;
END;

CREATE PROCEDURE BorrarLocal(
    p_Id_Local INT) AS
BEGIN
    DELETE FROM Locales WHERE Id_Local = p_Id_Local;
END;

CREATE PROCEDURE BorrarFacturacion(
    p_Num_Factura INT) AS
BEGIN
    DELETE FROM Facturacion WHERE Num_Factura = p_Num_Factura;
END;