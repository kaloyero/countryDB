DROP TABLE IF EXISTS `autorizados`;


CREATE TABLE Autorizados
(
	IdAutorizado         INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdUnidad             INTEGER NOT NULL,
	IdPersona            INTEGER NOT NULL,
	IdTipoAutorizado     INTEGER NOT NULL,
	PRIMARY KEY (IdAutorizado),
	FOREIGN KEY FK_Unidades_Autorizados (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_Personas_Autorizados (IdPersona) REFERENCES Personas (IdPersona),
	FOREIGN KEY FK_TipoAutorizados_Autorizados (IdTipoAutorizado) REFERENCES TipoAutorizados (IdTipoAutorizado)
) AUTO_INCREMENT = 1;


CREATE UNIQUE INDEX XAK1Autorizados ON Autorizados
(
	IdUnidad,
	IdPersona,
	FechaIni
);
