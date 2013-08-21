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
	IdPersona         INTEGER NOT NULL,
	FechaFin             DATE NOT NULL,
	PRIMARY KEY (IdAviso),
	FOREIGN KEY R_115 (IdAvisoCategoria) REFERENCES AvisoCategorias (IdAvisoCategoria),
	FOREIGN KEY FX_Persona_Avisos (IdPersona) REFERENCES Personas (IdPersona)
) AUTO_INCREMENT = 1;