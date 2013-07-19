DROP TABLE IF EXISTS `AvisoCategorias`;


CREATE TABLE AvisoCategorias
(
	IdAvisoCategoria     INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	DiasPublicacion      INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	PRIMARY KEY (IdAvisoCategoria),
	FOREIGN KEY FX_Conceptos_AvisoCategorias (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;