DROP TABLE IF EXISTS `integranteactividades`;


CREATE TABLE IntegranteActividades
(
	IdIntegranteActividad INTEGER AUTO_INCREMENT,
	IdIntegrante         INTEGER NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdActividadGrupo     INTEGER NOT NULL,
	PRIMARY KEY (IdIntegranteActividad),
	FOREIGN KEY FK_Integrantes_IntegranteActividades (IdIntegrante) REFERENCES Integrantes (IdIntegrante),
	FOREIGN KEY FX_ActividadGrupos_IntegranteActividades (IdActividadGrupo) REFERENCES ActividadGrupos (IdActividadGrupo)
) AUTO_INCREMENT = 1;

