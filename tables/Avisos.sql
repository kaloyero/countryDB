DROP TABLE IF EXISTS `Avisos`;


CREATE TABLE Avisos
(
	IdAviso              INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Titulo               VARCHAR(50) NOT NULL,
	Encabezado           VARCHAR(100) NULL,
	Cuerpo               VARCHAR(100) NULL,
	Cierre               VARCHAR(100) NULL,
	IdAvisoCategoria     INTEGER NOT NULL,
	IdIntegrante         INTEGER NOT NULL,
	FechaFin             DATE NOT NULL,
	PRIMARY KEY (IdAviso),
	FOREIGN KEY R_115 (IdAvisoCategoria) REFERENCES AvisoCategorias (IdAvisoCategoria),
	FOREIGN KEY FX_Integrantes_Avisos (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;