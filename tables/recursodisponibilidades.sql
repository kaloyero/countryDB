DROP TABLE IF EXISTS `recursodisponibilidades`;


CREATE TABLE RecursoDisponibilidades
(
	IdDisponibilidad     INTEGER AUTO_INCREMENT,
	DiaSemana            INTEGER NOT NULL CHECK ( DiaSemana IN (1, 2, 3, 4, 5, 6, 7) ),
	HoraIni              INTEGER NOT NULL CHECK ( HoraIni BETWEEN 0 AND 23 ),
	HoraFin              INTEGER NOT NULL CHECK ( HoraFin BETWEEN 0 AND 23 ),
	IdRecurso            INTEGER NOT NULL,
	PRIMARY KEY (IdDisponibilidad),
	FOREIGN KEY FK_Recursos_RecursosDisponibilidades (IdRecurso) REFERENCES Recursos (IdRecurso)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1RecursoDisponibilidades ON RecursoDisponibilidades
(
	IdRecurso,
	DiaSemana,
	HoraIni
);