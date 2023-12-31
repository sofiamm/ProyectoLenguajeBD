-- Script para creacion de usuario en SQL Plus

Create user Proyecto_Adm IDENTIFIED BY Password1;

GRANT DBA TO Proyecto_Adm;


-- Crear las tablas iniciales

CREATE TABLE Activos (IdActivo INT NOT NULL, Descripcion varchar2(100), IdLocal INT);

CREATE TABLE EmpleadoCorreo (IdEmpleado INT NOT NULL, Correo varchar2(20));

CREATE TABLE EmpleadoPuesto (IdEmpleado INT NOT NULL, IdPuesto INT NOT NULL);

CREATE TABLE Puesto (IdPuesto INT NOT NULL, Nombre varchar2(30), SalarioMin NUMBER(6,2) NOT NULL, SalarioMax NUMBER(6,2) NOT NULL);

CREATE TABLE Empleado(IdEmpleado INT NOT NULL, Nombre varchar2(30), Apellido1 varchar2(30), Apellido2 varchar2(30), Alias varchar2(30), IBAN varchar2(30), Salario NUMBER(6,2), Estado Varchar2(15), Password varchar2(30));

CREATE TABLE Transporte(codServicio INT NOT NULL, IdActivo INT NOT NULL);

CREATE TABLE ServicioEmpleados(codServicio INT NOT NULL, IdEmpleado INT NOT NULL);

CREATE TABLE Publicaciones(IdPublicacion INT NOT NULL, Link Varchar2(50), codServicio INT NOT NULL, Fecha DATE);

CREATE TABLE ContactoTelefono(IdContacto INT NOT NULL, Telefono Varchar2(8));

CREATE TABLE ContactoCorreo(IdContacto INT NOT NULL, Correo varchar2(30));

CREATE TABLE Contacto(IdContacto INT NOT NULL, Nombre varchar2(30), Apellido1 varchar2(30), Apellido2 varchar2(30), Cedula varchar2(9));

CREATE TABLE ServicioMenu(codServicio INT NOT NULL, IdMenu INT NOT NULL);

CREATE TABLE ServicioAgendados(codServicio INT NOT NULL, FechaHora TIMESTAMP, PersonasAAtender INT);

CREATE TABLE ServicioCliente(codServicio INT NOT NULL, IdCliente INT NOT NULL);

CREATE TABLE Cliente(IdCliente INT NOT NULL, Nombre varchar2(30), Tipo varchar2(20));

CREATE TABLE ClienteContacto(IdCliente INT NOT NULL, IdContacto INT NOT NULL);

CREATE TABLE MenuDesglose(IdMenu INT NOT NULL, IdProducto INT NOT NULL, Precio NUMBER(6,2), Personas INT);

CREATE TABLE Menu(IdMenu INT NOT NULL, Precio NUMBER(6,2), Personas INT);

CREATE TABLE FacturaServicio(numFactura INT NOT NULL, codServicio INT NOT NULL);

CREATE TABLE ClienteDireccion(IdDireccion INT NOT NULL, IdCliente INT NOT NULL, IdProvincia INT NOT NULL, IdCanton INT NOT NULL, IdDistrito INT NOT NULL, Indicaciones varchar2(200));

CREATE TABLE FacturaDetalle(numFactura INT NOT NULL, IdMenu INT NOT NULL, Cantidad INT, Subtotal NUMBER(6,2), Total NUMBER(6,2));

CREATE TABLE Facturacion(numFactura INT NOT NULL, Fecha DATE, MetodoPago Varchar2(20), Total NUMBER(6,2));

CREATE TABLE Provincia(IdProvincia INT NOT NULL, Nombre varchar2(20));

CREATE TABLE Canton(IdProvincia INT NOT NULL, IdCanton INT NOT NULL, Nombre varchar2(20));

CREATE TABLE Distrito(IdProvincia INT NOT NULL, IdCanton INT NOT NULL, IdDistrito INT NOT NULL, Nombre varchar2(20));

CREATE TABLE Producto(IdProducto INT NOT NULL, Nombre varchar2(30), Precio NUMBER(6,2), Descripcion varchar2(100), Imagen varchar2(40));

CREATE TABLE ProductoMateriaPrima(IdProducto INT NOT NULL, IdMateriaPrima INT NOT NULL, CantidadMateriaPrima INT);

CREATE TABLE MateriaPrima(IdMateriaPrima INT NOT NULL, Nombre varchar2(30), Reservas varchar2(30), UnidadDeMedicion Varchar2(4), Marca varchar2(30), CostoPorUnidad NUMBER(6,2));

CREATE TABLE Locales (IdLocal INT NOT NULL, Nombre varchar2(30), Proposito varchar2(30));

CREATE TABLE LocalUbicacion(IdLocal INT NOT NULL, IdProvincia INT NOT NULL, IdCanton INT NOT NULL, IdDistrito INT NOT NULL, Indicaciones varchar(100));

CREATE TABLE Proveedor(IdProveedor INT NOT NULL, Nombre varchar2(30));

CREATE TABLE MateriaPrimaProveedor(IdMateriaPrima INT NOT NULL, IdProveedor INT NOT NULL, Precio NUMBER(6,2));

CREATE TABLE MateriaPrimaLocal(IdMateriaPrima INT NOT NULL, IdLocal INT NOT NULL);

-- Primary keys iniciales

ALTER TABLE Menu ADD CONSTRAINT PK_IdMenul PRIMARY KEY (IdMenu);

ALTER TABLE ProductoMateriaPrima ADD CONSTRAINT PK_IdProducto_idMateriaPrima PRIMARY KEY (IdProducto, IdMateriaPrima);

ALTER TABLE producto ADD CONSTRAINT PK_Idproducto PRIMARY KEY (IdProducto);

ALTER TABLE Activos ADD CONSTRAINT PK_IdActivo PRIMARY KEY (IdActivo);

ALTER TABLE ServicioAgendados ADD CONSTRAINT PK_codServicio PRIMARY KEY (CodServicio);

ALTER TABLE Facturacion ADD CONSTRAINT PK_numfactura PRIMARY KEY (numfactura);

ALTER TABLE Cliente ADD CONSTRAINT PK_IdCliente PRIMARY KEY (IdCliente);

ALTER TABLE Contacto ADD CONSTRAINT PK_Idcontacto PRIMARY KEY (Idcontacto);

ALTER TABLE Proveedor ADD CONSTRAINT PK_IdProveedor PRIMARY KEY (IdProveedor);

ALTER TABLE Locales ADD CONSTRAINT PK_Idlocal PRIMARY KEY (Idlocal);

ALTER TABLE Empleado ADD CONSTRAINT PK_IdEmpleados PRIMARY KEY (IdEmpleado);

ALTER TABLE Puesto ADD CONSTRAINT PK_IdPuesto PRIMARY KEY (IdPuesto);

ALTER TABLE provincia ADD CONSTRAINT PK_Idprovincia PRIMARY KEY (IdProvincia);

ALTER TABLE Canton ADD CONSTRAINT PK_IdProvincia_IdCanton PRIMARY KEY (IdProvincia, IdCanton);

ALTER TABLE Distrito ADD CONSTRAINT PK_IdProvincia_IdCanton_IdDistrito PRIMARY KEY (IdProvincia, IdCanton, IdDistrito);

ALTER TABLE Publicaciones ADD CONSTRAINT PK_Idpublicacion PRIMARY KEY (Idpublicacion);

-- Foreign keys

ALTER TABLE EmpleadoCorreo ADD CONSTRAINT FK_IdEmpleado_IdEmpleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado (IdEmpleado);

ALTER TABLE EmpleadoPuesto ADD CONSTRAINT FK_IdEmpleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado (IdEmpleado);

ALTER TABLE EmpleadoPuesto ADD CONSTRAINT FK_IdPuesto FOREIGN KEY (Idpuesto) REFERENCES Puesto (IdPuesto);

ALTER TABLE ACTIVOS ADD CONSTRAINT FK_IDLOCAL FOREIGN KEY (IDLocal) REFERENCES Locales (IdLocal);

ALTER TABLE ContactoTelefono ADD CONSTRAINT FK_IDcontacto FOREIGN KEY (IdContacto) REFERENCES Contacto (IdContacto);

ALTER TABLE ContactoCorreo ADD CONSTRAINT FK_IdContactos FOREIGN KEY (IdContacto) REFERENCES Contacto (IdContacto);

ALTER TABLE Transporte ADD CONSTRAINT FK_codservicio FOREIGN KEY (CodServicio) REFERENCES ServicioAgendados (codservicio);

ALTER TABLE transporte ADD CONSTRAINT FK_idActivo Foreign key (idactivo) REFERENCES Activos (idactivo);

ALTER TABLE ServicioEmpleados ADD CONSTRAINT FK_CODSERVICIOS FOREIGN KEY (codservicio) REFERENCES ServicioAgendados (codservicio);

ALTER TABLE ServicioEmpleados ADD CONSTRAINT FK_idempleados FOREIGN KEY (idempleado) REFERENCES empleado (IDempleado);

ALTER TABLE PUBLICACIONES ADD CONSTRAINT FK_codservicioSS FOREIGN KEY (CODSERVICIO) REFERENCES SERVICIOAGENDADOS (CODSERVICIO);

ALTER TABLE SERVICIOMENU ADD CONSTRAINT FK_CODSERVI FOREIGN KEY (CODSERVICIO) REFERENCES SERVICIOAGENDADOS (CODSERVICIO);

ALTER TABLE SERVICIOCLIENTE ADD CONSTRAINT FK_CODSERVIC FOREIGN KEY (CODSERVICIO) REFERENCES SERVICIOAGENDADOS (CODSERVICIO);

ALTER TABLE SERVICIOCLIENTE ADD CONSTRAINT FK_IDCLIENT FOREIGN KEY (idcliente) REFERENCES cliente (idcliente);

ALTER TABLE CLIENTECONTACTO ADD CONSTRAINT FK_IDCLIEN FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE);

ALTER TABLE CLIENTECONTACTO ADD CONSTRAINT FK_IDCONTACT FOREIGN KEY (IDCONTACTO) REFERENCES CONTACTO (IDCONTACTO);

ALTER TABLE FACTURASERVICIO ADD CONSTRAINT FK_NUMFACTURA FOREIGN KEY (NUMFACTURA) REFERENCES FACTURACION (NUMFACTURA);

ALTER TABLE FACTURASERVICIO ADD CONSTRAINT FK_CODSERVIIC FOREIGN KEY (CODSERVICIO) REFERENCES SERVICIOAGENDADOS (CODSERVICIO);

ALTER TABLE CLIENTEDIRECCION ADD CONSTRAINT FK_IDCLI FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE);

ALTER TABLE CLIENTEDIRECCION ADD CONSTRAINT FK_IDdistrito FOREIGN KEY (idprovincia, idcanton, IDdistrito) REFERENCES distrito (idprovincia, idcanton, IDdistrito); -- aqui hay un problema por el tipo de primary key doble o triple

ALTER TABLE FACTURADETALLE ADD CONSTRAINT FK_NUMFACTURAS FOREIGN KEY (NUMFACTURA) REFERENCES FACTURACION (NUMFACTURA);

ALTER TABLE FACTURADETALLE ADD CONSTRAINT FK_MENU FOREIGN KEY (IDMENU) REFERENCES MENU (IDMENU);

ALTER TABLE CANTON ADD CONSTRAINT FK_PRVINCIA FOREIGN KEY (IDPROVINCIA) REFERENCES PROVINCIA (IDPROVINCIA);

ALTER TABLE DISTRITO ADD CONSTRAINT FK_DISTRITO FOREIGN KEY (IDPROVINCIA) REFERENCES PROVINCIA (IDPROVINCIA);

ALTER TABLE DISTRITO ADD CONSTRAINT FK_CANTON FOREIGN KEY (IDCANTON) REFERENCES CANTON (IDCANTON);

ALTER TABLE PRODUCTOMATERIAPRIMA ADD CONSTRAINT FK_IDPRODUCT FOREIGN KEY (IDPRODUCTO) REFERENCES PRODUCTO (IDPRODUCTO);

ALTER TABLE PRODUCTOMATERIAPRIMA ADD CONSTRAINT FK_IDMATERIAPRIMA FOREIGN KEY (IDMATERIAPRIMA) REFERENCES MATERIAPRIMA (IDMATERIAPRIMA);

ALTER TABLE LOCALUBICACION ADD CONSTRAINT FK_idLOCALs FOREIGN KEY (idlocal) REFERENCES locales (idlocal);

ALTER TABLE MATERIAPRIMAPROVEEDOR ADD CONSTRAINT fk_idmateriapri FOREIGN KEY (idmateriaprima) REFERENCES materiaprima (idmateriaprima);

ALTER TABLE MATERIAPRIMAPROVEEDOR ADD CONSTRAINT fk_provee FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor);

ALTER TABLE MATERIAPRIMALOCAL ADD CONSTRAINT FK_IDMATERIPRIMA FOREIGN KEY (IDMATERIAPRIMA) REFERENCES MATERIAPRIMA (idmateriaprima);

ALTER TABLE MATERIAPRIMALOCAL ADD CONSTRAINT FK_IDLOCA FOREIGN KEY (IDLOCAL) REFERENCES LOCALES (IDLOCAL);

-- Los primary keys que quedan

ALTER TABLE EmpleadoCorreo ADD CONSTRAINT PK_IdEmpleado PRIMARY KEY (IdEmpleado);

ALTER TABLE EmpleadoPuesto ADD CONSTRAINT PK_IdEmpleado_IdPuesto PRIMARY KEY (IdEmpleado, IdPuesto);

ALTER TABLE ContactoTelefono ADD CONSTRAINT PK_IdCpntacto PRIMARY KEY (IdContacto, Telefono);

ALTER TABLE ContactoCorreo ADD CONSTRAINT PK_IdContacto_Correo PRIMARY KEY (IdContacto, Correo);

ALTER TABLE Transporte ADD CONSTRAINT PK_codservicio_idactivo PRIMARY KEY (codServicio, IdActivo);

ALTER TABLE ServicioEmpleados ADD CONSTRAINT PK_condServicio_IdEmpleado PRIMARY KEY (codservicio, idempleado);

ALTER TABLE serviciomenu ADD CONSTRAINT PK_codservicio_idmenu PRIMARY KEY (codservicio, idmenu);

ALTER TABLE ServicioCLiente ADD CONSTRAINT PK_codservicio_idcliente PRIMARY KEY (codservicio, idcliente);

ALTER TABLE ClienteContacto ADD CONSTRAINT PK_Idcliente_idcontacto PRIMARY KEY (IdCliente, IdContacto);

ALTER TABLE MenuDesglose ADD CONSTRAINT PK_Idmenu_idproducto PRIMARY KEY (IdMenu, IdProducto);

ALTER TABLE FacturaServicio ADD CONSTRAINT PK_numFactura_codservicio PRIMARY KEY (Numfactura, codservicio);

ALTER TABLE ClienteDireccion ADD CONSTRAINT PK_Iddireccion_idcliente PRIMARY KEY (IdDireccion, IdCliente);

ALTER TABLE FacturaDetalle ADD CONSTRAINT PK_numfactura_idmenu PRIMARY KEY (numfactura, idmenu);

ALTER TABLE MateriaPrima ADD CONSTRAINT PK_IdMateriaPrima PRIMARY KEY (IdMateriaPrima);

ALTER TABLE LocalUbicacion ADD CONSTRAINT PK_Idlocalu PRIMARY KEY (IdLocal);

ALTER TABLE MateriaPrimaProveedor ADD CONSTRAINT PK_IdMateriaPrima_IdProveedor PRIMARY KEY (IdMateriaPrima, IdProveedor);

ALTER TABLE MateriaPrimaLocal ADD CONSTRAINT PK_IdMateriaPrima_idlocal PRIMARY KEY (IdMateriaPrima, IdLocal);


-- Crear la tabla de auditoria para las tablas Activos, Clientes, ServicioEmpleados,  MateriaPrima

CREATE TABLE AudClientes (IdCliente INT NOT NULL, Nombre varchar2(30), Tipo varchar2(20), tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));

CREATE TABLE AudActivos (IdActivo INT NOT NULL, Descripcion varchar2(100), IdLocal INT, tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));

CREATE TABLE AudServicioEmpleados (codServicio INT NOT NULL, IdEmpleado INT NOT NULL, tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));

CREATE TABLE AudMateriaPrima (IdMateriaPrima INT NOT NULL, Nombre varchar2(30), Reservas varchar2(30), UnidadDeMedicion Varchar2(4), Marca varchar2(30), CostoPorUnidad NUMBER(6,2), tipoMovimiento varchar2(20), FechaMovimiento DATE, UsuarioMovimiento VARCHAR2(30));


-- Crear los triggers para las tablas de auditorias

CREATE OR REPLACE TRIGGER TGR_INSERT_AUDACTIVOS
BEFORE INSERT ON ACTIVOS
FOR EACH ROW
BEGIN
INSERT INTO AudActivos (IdActivo, DESCRIPCION, IDLOCAL, tipoMovimiento, fechaMovimiento, usuariomovimiento)
VALUES (:new.IdActivo, :new.descripcion, :new.idlocal, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDACTIVOS
BEFORE DELETE ON ACTIVOS
FOR EACH ROW
BEGIN
INSERT INTO AudActivos (IdActivo, DESCRIPCION, IDLOCAL, tipoMovimiento, fechaMovimiento, usuariomovimiento)
VALUES (:old.IdActivo, :old.descripcion, :old.idlocal, 'ELIMINADO', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_INSERT_AUDClientes
BEFORE INSERT ON Cliente
FOR EACH ROW
BEGIN
INSERT INTO AudClientes (IdCliente, Nombre, Tipo, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:new.Idcliente, :new.nombre, :new.tipo, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDClientes
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
INSERT INTO AudClientes (IdCliente, Nombre, Tipo, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:old.Idcliente, :old.nombre, :old.tipo, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_INSERT_AUDServicioEmpleados
BEFORE INSERT ON ServicioEmpleados
FOR EACH ROW
BEGIN
INSERT INTO AUDServicioEmpleados (codServicio, IdEmpleado, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:new.CodServicio, :new.IdEmpleado, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDServicioEmpleados
BEFORE DELETE ON ServicioEmpleados
FOR EACH ROW
BEGIN
INSERT INTO AUDServicioEmpleados (codServicio, IdEmpleado, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:old.CodServicio, :old.IdEmpleado, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_INSERT_AUDMateriaPrima
BEFORE INSERT ON MateriaPrima
FOR EACH ROW
BEGIN
INSERT INTO AUDMateriaPrima (IdMateriaPrima, Nombre, Reservas, UnidadDeMedicion, Marca, CostoPorUnidad, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:new.IdMateriaPrima, :new.Nombre, :new.Reservas, :new.unidaddemedicion, :new.marca, :new.costoporunidad, 'Insercion', SYSDATE, user);
END;

CREATE OR REPLACE TRIGGER TGR_DELETE_AUDMateriaPrima
BEFORE DELETE ON MateriaPrima
FOR EACH ROW
BEGIN
INSERT INTO AUDMateriaPrima (IdMateriaPrima, Nombre, Reservas, UnidadDeMedicion, Marca, CostoPorUnidad, tipoMovimiento, FechaMovimiento, UsuarioMovimiento)
VALUES (:old.IdMateriaPrima, :old.Nombre, :old.Reservas, :old.unidaddemedicion, :old.marca, :old.costoporunidad, 'Insercion', SYSDATE, user);
END;


-- FUNCIONES --
    -- 1. Obtener informaci�n de un empleado:
    CREATE OR REPLACE FUNCTION InfoEmpleado(IdEmpleado INT)
    RETURN VARCHAR2
    IS
       InfoEmpleado VARCHAR2(500);
    BEGIN
       SELECT Nombre || ' ' || Apellido1 || ' ' || Apellido2 || ' | AKA: ' || Alias || ' | IBAN: ' || IBAN
       INTO InfoEmpleado
       FROM Empleado
       WHERE IdEmpleado = IdEmpleado;
       RETURN InfoEmpleado;
    END;
    -- Ejemplo:
    INSERT INTO Empleado (IdEmpleado, Nombre, Apellido1, Apellido2, Alias, IBAN, Salario, Estado, Password)
    VALUES (10, 'Juan', 'Perez', 'Gomez', 'JP', 'Mo34', 5000, 'Activo', 'psswd');
    
    SELECT InfoEmpleado(30) AS "Informaci�n del Empleado"
    FROM dual; --Tabla default para ejemplo
    
    -- 2. Lista de empleados por puesto:
    CREATE OR REPLACE FUNCTION ListaEmpleadosPuesto(IdPuesto INT)
    RETURN SYS_REFCURSOR
    IS
       CursorList SYS_REFCURSOR;
    BEGIN
       OPEN CursorList FOR
          SELECT e.Nombre, e.Apellido1, e.Apellido2
          FROM Empleado e
          JOIN EmpleadoPuesto ep ON e.IdEmpleado = ep.IdEmpleado
          WHERE ep.IdPuesto = IdPuesto;
          
       RETURN CursorList;
    END;
    -- Ejemplo:
    INSERT INTO Puesto (IdPuesto, Nombre, SalarioMin, SalarioMax)
    VALUES (1, 'Desarrollador', 5000, 8000);
    
    INSERT INTO EmpleadoPuesto (IdEmpleado, IdPuesto)
    VALUES (10, 1);
    
    INSERT INTO Empleado (IdEmpleado, Nombre, Apellido1, Apellido2, Alias, IBAN, Salario, Estado, Password)
    VALUES (20, 'Sof�a', 'Mora', 'Mu�oz', 'SOF', 'Ra24', 6000, 'Activo', 'contra');
    
    INSERT INTO EmpleadoPuesto (IdEmpleado, IdPuesto)
    VALUES (20, 1);
    
    SELECT ListaEmpleadosPuesto(1) AS "Lista Empleados"
    FROM dual;
    
    -- 3.Calcular el total de una factura:
    CREATE OR REPLACE FUNCTION TotalFactura(NumFactura INT)
    RETURN NUMBER
    IS
       Total NUMBER(6,2);
    BEGIN
       SELECT SUM(fd.Total)
       INTO Total
       FROM FacturaDetalle fd
       WHERE fd.NumFactura = NumFactura;
    
       RETURN Total;
    END;
    -- Ejemplo:
    INSERT INTO Facturacion (numFactura, Fecha, MetodoPago, Total)
    VALUES (1, TO_DATE('2023-11-15', 'YYYY-MM-DD'), 'Tarjeta', 1000.00);
    
    INSERT INTO FacturaDetalle (numFactura, IdMenu, Cantidad, Subtotal, Total)
    VALUES (1, 1, 2, 50.00, 100.00);
    
    INSERT INTO FacturaDetalle (numFactura, IdMenu, Cantidad, Subtotal, Total)
    VALUES (1, 2, 1, 30.00, 30.00);
    
    SELECT TotalFactura(1) AS "Monto total"
    FROM dual;
    
-- 4. Obtener nombre del cliente por la factura:
    CREATE OR REPLACE FUNCTION NomClienteFact(NumFactura INT)
    RETURN VARCHAR2
    IS
       NombreCliente VARCHAR2(100);
    BEGIN
       SELECT c.Nombre
       INTO NombreCliente
       FROM Cliente c
       JOIN ClienteDireccion cd ON c.IdCliente = cd.IdCliente
       JOIN FacturaDetalle fd ON cd.IdDireccion = fd.IdMenu
       WHERE fd.NumFactura = NumFactura;
    
       RETURN NombreCliente;
    END;
    -- Ejemplo:
    INSERT INTO Cliente (IdCliente, Nombre, Tipo)
    VALUES (1, 'Valeria', 'Frecuente');
    
    INSERT INTO Provincia (IdProvincia, Nombre) VALUES (1, 'San Jose');
    
    INSERT INTO Canton (IdProvincia, IdCanton, Nombre) VALUES (1, 1, 'Desamparados');
    
    INSERT INTO Distrito (IdProvincia, IdCanton, IdDistrito, Nombre) VALUES (1, 1, 1, 'San Miguel');

    INSERT INTO ClienteDireccion (IdDireccion, IdCliente, IdProvincia, IdCanton, IdDistrito, Indicaciones)
    VALUES (1, 1, 1, 1, 1, 'Indicaciones adicionales');
    
    INSERT INTO SERVICIOAGENDADOS (CODSERVICIO, FechaHora, PersonasAAtender)
    VALUES (1, SYSTIMESTAMP, 10);

    INSERT INTO FacturaServicio (numFactura, codServicio)
    VALUES (1, 1);
    
    SELECT NomClienteFact(1) AS "Nombre del cliente"
    FROM dual;
    
    -- 5. Lista de productos de un menu: Este tiene un error a la hora de correrlo, ya le hice los cambios de la tabla menu
    CREATE OR REPLACE FUNCTION ListaProdMenu(IdMenu INT)
    RETURN SYS_REFCURSOR
    IS
       CursorList SYS_REFCURSOR;
    BEGIN
       OPEN CursorList FOR
          SELECT p.Nombre, p.Precio
          FROM Producto p
          JOIN Menu m ON p.IdProducto = m.IdProducto
          WHERE m.IdMenu = IdMenu;
    
       RETURN CursorList;
    END;
    -- Ejemplo:
    INSERT INTO Producto (IdProducto, Nombre, Precio, Descripcion, Imagen)
    VALUES (1, 'Hamburguesa', 10.00, 'Torta de carne', 'imagen1.jpg');
    
    INSERT INTO Producto (IdProducto, Nombre, Precio, Descripcion, Imagen)
    VALUES (2, 'Batido', 15.00, 'Sabor de fresa', 'imagen2.jpg');
    
    INSERT INTO Menu (IdMenu, precio, personas)
    VALUES (1, 10.00, 2);
    
    INSERT INTO Menu (IdMenu, precio, personas)
    VALUES (2, 25.00, 1);

    SELECT ListaProdMenu(1) AS "Lista de productos"
    FROM dual;
    
    -- 6. Obtener proveedores de una materia prima:
    CREATE OR REPLACE FUNCTION ProveedorMateriaPrima(IdMateriaPrima INT)
    RETURN SYS_REFCURSOR
    IS
       CursorList SYS_REFCURSOR;
    BEGIN
       OPEN CursorList FOR
          SELECT pr.Nombre, mp.Precio
          FROM MateriaPrimaProveedor mp
          JOIN Proveedor pr ON mp.IdProveedor = pr.IdProveedor
          WHERE mp.IdMateriaPrima = IdMateriaPrima;
    
       RETURN CursorList;
    END;
    -- Ejemplo:
    INSERT INTO Proveedor (IdProveedor, Nombre)
    VALUES (1, 'Charlie');
    
    INSERT INTO Proveedor (IdProveedor, Nombre)
    VALUES (2, 'Pedro');
    
    INSERT INTO MateriaPrima (IdMateriaPrima, Nombre, UnidadDeMedicion)
    VALUES (1, 'Papa', 'Unit');
    
    INSERT INTO MateriaPrimaProveedor (IdMateriaPrima, IdProveedor, Precio)
    VALUES (1, 1, 10.00);
    
    INSERT INTO MateriaPrimaProveedor (IdMateriaPrima, IdProveedor, Precio)
    VALUES (1, 2, 15.00);

    SELECT ProveedorMateriaPrima(1) AS "Lista de productos"
    FROM dual;
        
    -- 7. Obtener el nombre y el prop�sito de local por ID:
    CREATE OR REPLACE FUNCTION InfoLocal(IdLocal INT)
    RETURN VARCHAR2
    IS
       InfoLocal VARCHAR2(100);
    BEGIN
       SELECT Nombre || ': ' || Proposito
       INTO InfoLocal
       FROM Locales
       WHERE IdLocal = IdLocal;
    
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
          JOIN ClienteDireccion cd ON c.IdCliente = cd.IdCliente
          JOIN Provincia p ON cd.IdProvincia = p.IdProvincia
          JOIN Canton cn ON cd.IdCanton = cn.IdCanton
          JOIN Distrito dt ON cd.IdDistrito = dt.IdDistrito;
    
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
       SELECT fd.NumFactura, fd.IdMenu, fd.Cantidad, fd.Subtotal, fd.Total,
              p.Nombre AS NombreProducto
       FROM FacturaDetalle fd
       JOIN Menu m ON fd.IdMenu = m.IdMenu
       JOIN Producto p ON m.IdProducto = p.IdProducto;
       -- Llamar a la vista:
        SELECT * FROM VistaDetallesFactura;

       -- 4. Vista de Empleados con Detalles de Puesto:
    CREATE OR REPLACE VIEW VistaEmpleadosPuesto AS
       SELECT e.*, ep.IdPuesto, p.Nombre AS NombrePuesto, p.SalarioMin, p.SalarioMax
       FROM Empleado e
       JOIN EmpleadoPuesto ep ON e.IdEmpleado = ep.IdEmpleado
       JOIN Puesto p ON ep.IdPuesto = p.IdPuesto;
       -- Llamar a la vista:
        SELECT * FROM VistaEmpleadosPuesto;

--Procedimientos almacenados
--verificar la tabla de Empleado ya que tiene un fallo
CREATE OR REPLACE PROCEDURE IngresarEmpleado(
    p_IdEmpleado INT,
    p_Nombre VARCHAR2,
    p_Apellido1 VARCHAR2,
    p_Apellido2 VARCHAR2,
    p_Alias VARCHAR2,
    p_IBAN VARCHAR2,
    p_Salario NUMBER,
    p_Estado VARCHAR2,
    p_Password VARCHAR2) AS
BEGIN
    INSERT INTO Empleado (IdEmpleado, Nombre, Apellido1, Apellido2, Alias, IBAN, Salario, Estado, "Password")
    VALUES (p_IdEmpleado, p_Nombre, p_Apellido1, p_Apellido2, p_Alias, p_IBAN, p_Salario, p_Estado, p_Password);
END;

CREATE PROCEDURE IngresarCliente(
    p_IdCliente INT,
    p_Nombre VARCHAR2,
    p_Tipo VARCHAR2) AS
BEGIN
    INSERT INTO Cliente VALUES (p_IdCliente, p_Nombre, p_Tipo);
END;

CREATE PROCEDURE IngresarProducto(
    p_IdProducto INT,
    p_Nombre VARCHAR2,
    p_Precio NUMBER,
    p_Descripcion VARCHAR2,
    p_Imagen VARCHAR2) AS
BEGIN
    INSERT INTO Producto VALUES (p_IdProducto, p_Nombre, p_Precio, p_Descripcion, p_Imagen);
END;

CREATE PROCEDURE IngresarProvincia(
    p_IdProvincia INT,
    p_Nombre VARCHAR2) AS
BEGIN
    INSERT INTO Provincia VALUES (p_IdProvincia, p_Nombre);
END;

CREATE PROCEDURE IngresarLocal(
    p_IdLocal INT,
    p_Nombre VARCHAR2,
    p_Proposito VARCHAR2) AS
BEGIN
    INSERT INTO Locales VALUES (p_IdLocal, p_Nombre, p_Proposito);
END;
CREATE PROCEDURE IngresarFacturacion(
    p_NumFactura INT,
    p_Fecha DATE,
    p_MetodoPago VARCHAR2,
    p_Total NUMBER) AS
BEGIN
    INSERT INTO Facturacion VALUES (p_NumFactura, p_Fecha, p_MetodoPago, p_Total);
END;


CREATE PROCEDURE BorrarEmpleado(
    p_IdEmpleado INT) AS
BEGIN
    DELETE FROM Empleado WHERE IdEmpleado = p_IdEmpleado;
END;


CREATE PROCEDURE BorrarCliente(
    p_IdCliente INT) AS
BEGIN
    DELETE FROM Cliente WHERE IdCliente = p_IdCliente;
END;

CREATE PROCEDURE BorrarProducto(
    p_IdProducto INT) AS
BEGIN
    DELETE FROM Producto WHERE IdProducto = p_IdProducto;
END;

CREATE PROCEDURE BorrarProvincia(
    p_IdProvincia INT) AS
BEGIN
    DELETE FROM Provincia WHERE IdProvincia = p_IdProvincia;
END;

CREATE PROCEDURE BorrarLocal(
    p_IdLocal INT) AS
BEGIN
    DELETE FROM Locales WHERE IdLocal = p_IdLocal;
END;

CREATE PROCEDURE BorrarFacturacion(
    p_NumFactura INT) AS
BEGIN
    DELETE FROM Facturacion WHERE NumFactura = p_NumFactura;
END;