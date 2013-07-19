DROP TABLE IF EXISTS `recursoexcepciones`;


CREATE TABLE RecursoExcepciones
(
	IdExcepcion          INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	HoraIni              INTEGER NOT NULL CHECK ( HoraIni BETWEEN 0 AND 23 ),
	Duracion             INTEGER NOT NULL,
	IdRecurso            INTEGER NOT NULL,
	PRIMARY KEY (IdExcepcion),
	FOREIGN KEY FK_Recursos_Excepciones (IdRecurso) REFERENCES Recursos (IdRecurso)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1RecursoExcepciones ON RecursoExcepciones
(
	IdRecurso,
	Fecha,
	HoraIni
);
