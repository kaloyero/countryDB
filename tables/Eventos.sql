DROP TABLE IF EXISTS `Eventos`;


CREATE TABLE Eventos
(
	IdEvento             INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Descripcion          VARCHAR(100) NOT NULL,
	Cupo                 INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	IdIntegrante         INTEGER NULL,
	HoraIni              INTEGER NOT NULL,
	Duracion              INTEGER NOT NULL,
	PRIMARY KEY (IdEvento),
	FOREIGN KEY R_108 (IdConcepto) REFERENCES Conceptos (IdConcepto),
	FOREIGN KEY FX_Integrantes_Eventos (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;