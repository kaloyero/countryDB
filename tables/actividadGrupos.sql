DROP TABLE IF EXISTS `ActividadGrupos`;


CREATE TABLE ActividadGrupos
(
	IdActividadGrupo     INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NOT NULL,
	FechaIni             DATE NULL,
	FechaFin             DATE NOT NULL,
	IdActividad          INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	PRIMARY KEY (IdActividadGrupo),
	FOREIGN KEY FX_Actividades_ActividadGrupos (IdActividad) REFERENCES Actividades (IdActividad),
	FOREIGN KEY FX_Conceptos_ActividadGrupos (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;