DROP TABLE IF EXISTS `conceptos`;


CREATE TABLE Conceptos
(
	IdConcepto           INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(80) NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdConcepto),
	FOREIGN KEY FK_Emprendimientos_Conceptos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;