CREATE TABLE Destinatario
(
correo VARCHAR(127),
nombre VARCHAR(127),
grado_academico VARCHAR(31) NULL,
PRIMARY KEY(correo)
)

CREATE TABLE Estado
(
id_estado numeric(10) IDENTITY,
nombre VARCHAR(15),
PRIMARY KEY(id_estado)
)

CREATE TABLE Notificacion
(
id_notificacion numeric(10) IDENTITY,
folio VARCHAR(15),
situacion VARCHAR(511),
accion_requerida VARCHAR(511),
asunto VARCHAR(127),
fecha DATE,
estatus numeric(10) references Estado(id_estado),
PRIMARY KEY(id_notificacion)
)

CREATE TABLE Destinatario_Notificacion
(
id_notificacion numeric(10) references Notificacion(id_notificacion),
correo VARCHAR(127) references Destinatario(correo),
tipo_relacion VARCHAR(15),
PRIMARY KEY(id_notificacion, correo)
)

CREATE TABLE Rol
(
id_rol numeric(10) IDENTITY,
nombre VARCHAR(15),
PRIMARY KEY(id_rol)
)

CREATE TABLE Grupos_de_control
(
nombre VARCHAR(127),
tipo VARCHAR(15),
id_rol numeric(10) references Rol(id_rol),
PRIMARY KEY(nombre)
)

CREATE TABLE Bitacora
(
id numeric(10) IDENTITY, 
usuario VARCHAR(15),
accion VARCHAR(511),
argumentos VARCHAR(511),
resultado VARCHAR(511),
fecha DATETIME,
PRIMARY KEY(id)
)

CREATE TABLE Plantilla
(
nombre VARCHAR(127),
contenido VARBINARY(8000),
PRIMARY KEY(nombre)
)