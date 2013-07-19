DROP TABLE IF EXISTS `Usuarios`;


CREATE TABLE Usuarios
(
	IDUsuario            INTEGER NOT NULL,
	Descripcion          VARCHAR(50) NULL,
	ClaveAccesoEncriptada VARCHAR(100) NOT NULL,
	ActivoDesde          DATE NOT NULL,
	ActivoHasta          DATE NULL,
	Nombre               VARCHAR(20) NULL,
	DireccionEmail       VARCHAR(20) NULL,
	IdIntegrante         INTEGER NOT NULL,
	PRIMARY KEY (IDUsuario),
	FOREIGN KEY FX_Integrantes_Usuarios (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
);



CREATE UNIQUE INDEX XAK1Usuarios ON Usuarios
(
	Nombre
);
