DROP TABLE IF EXISTS `tarifas`;


CREATE TABLE Tarifas
(
	IdTarifa             INTEGER AUTO_INCREMENT,
	Importe              NUMERIC(10,2) NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdConcepto           INTEGER NOT NULL,
	PRIMARY KEY (IdTarifa),
	FOREIGN KEY FK_Conceptos_Tarifas (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;