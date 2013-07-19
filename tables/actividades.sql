DROP TABLE IF EXISTS `actividades`;


CREATE TABLE Actividades
(
	IdActividad          INTEGER NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	Descripcion          VARCHAR(50) NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdActividad),
	FOREIGN KEY FK_Emprendimientos_Actividades (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
);
