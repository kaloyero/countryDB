DROP TABLE IF EXISTS `tipoinfracciones`;


CREATE TABLE TipoInfracciones
(
	IdTipoInfraccion     INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdTipoInfraccion),
	FOREIGN KEY FK_Conceptos_TipoInfraccion (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;