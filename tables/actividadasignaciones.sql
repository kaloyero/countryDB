DROP TABLE IF EXISTS `actividadasignaciones`;


CREATE TABLE ActividadAsignaciones
(
	IdAsignacion         INTEGER AUTO_INCREMENT,
	IdInstructor         INTEGER NOT NULL,
	IdActividad          INTEGER NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdAsignacion),
	FOREIGN KEY FK_Instructores_ActividadAsignaciones (IdInstructor) REFERENCES Instructores (IdInstructor),
	FOREIGN KEY FK_Actividades_ActividadAsignaciones (IdActividad) REFERENCES Actividades (IdActividad)
) AUTO_INCREMENT = 1;