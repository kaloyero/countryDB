DROP TABLE IF EXISTS `periodos`;


CREATE TABLE Periodos
(
	IdPeriodo            INTEGER AUTO_INCREMENT,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	Descripcion          VARCHAR(80) NULL,
	Estado               VARCHAR(1) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdPeriodo),
	FOREIGN KEY FK_Emprendimientos_Periodos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Periodos ON Periodos
(
	IdEmprendimiento,
	FechaIni,
	FechaFin
);
