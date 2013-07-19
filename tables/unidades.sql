DROP TABLE IF EXISTS `unidades`;

CREATE TABLE Unidades
(
	IdUnidad             INTEGER AUTO_INCREMENT,
	Codigo               VARCHAR(20) NULL,
	Descripcion          VARCHAR(80) NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	IdBarrio             INTEGER NOT NULL,
	IdSector             INTEGER NOT NULL,
	PRIMARY KEY (IdUnidad),
	FOREIGN KEY FK_Emprendimientos_Unidades (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento),
	FOREIGN KEY FK_Barrios_Unidades (IdBarrio) REFERENCES Barrios (IdBarrio),
	FOREIGN KEY FK_Sector_Uniodades (IdSector) REFERENCES Sector (IdSector)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1Unidades ON Unidades
(
	Codigo
);
