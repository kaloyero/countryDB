DROP TABLE IF EXISTS `Usuarios`;


CREATE TABLE Usuarios
(
	IDUsuario            	INTEGER NOT NULL,
	Descripcion          	VARCHAR(50) NULL,
	ClaveAccesoEncriptada 	VARCHAR(100) NOT NULL,
	ActivoDesde          	DATE NOT NULL,
	ActivoHasta          	DATE NULL,
	NombreUsuario           VARCHAR(20) NULL,
	ResetPass				VARCHAR(1) NULL,
	Estado					VARCHAR(10) NULL,

	PRIMARY KEY (IDUsuario)
);

CREATE UNIQUE INDEX XAK1Usuarios ON Usuarios
(
	Nombre
);
