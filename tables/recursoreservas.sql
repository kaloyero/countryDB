DROP TABLE IF EXISTS `recursoreservas`;


CREATE TABLE RecursoReservas
(
	IdReserva            INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	IdRecurso            INTEGER NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	HoraIni              INTEGER NOT NULL,
	Duracion             INTEGER NOT NULL,
	IdEvento             INTEGER NOT NULL,
	IdPersona         INTEGER NOT NULL,
	PRIMARY KEY (IdReserva),
	FOREIGN KEY FK_Recursos_RecursoReservas (IdRecurso) REFERENCES Recursos (IdRecurso),
	FOREIGN KEY FX_Eventos_RecursosReservas (IdEvento) REFERENCES Eventos (IdEvento),
	FOREIGN KEY FX_Persona_RecursoReservas (IdPersona) REFERENCES Personas (IdPersona)
) AUTO_INCREMENT = 1;