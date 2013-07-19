DROP TABLE IF EXISTS `AvisoSuscripcion`;

CREATE TABLE AvisoSuscripcion
(
	IDAvisoSuscripcion   INTEGER AUTO_INCREMENT,
	IdAvisoCategoria     INTEGER NOT NULL,
	IdIntegrante         INTEGER NOT NULL,
	PRIMARY KEY (IDAvisoSuscripcion),
	FOREIGN KEY R_118 (IdAvisoCategoria) REFERENCES AvisoCategorias (IdAvisoCategoria),
	FOREIGN KEY FX_Integrantes_AvisoSuscripcion (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;