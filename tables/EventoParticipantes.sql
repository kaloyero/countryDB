DROP TABLE IF EXISTS `EventoParticipantes`;

CREATE TABLE EventoParticipantes
(
	IdEventoParticipante INTEGER NOT NULL,
	IdEvento             INTEGER NOT NULL,
	IdIntegrante         INTEGER NOT NULL,
	PRIMARY KEY (IdEventoParticipante),
	FOREIGN KEY FX_Eventos_Inscriptos (IdEvento) REFERENCES Eventos (IdEvento),
	FOREIGN KEY FX_Integrantes_EventosInscriptos (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
);