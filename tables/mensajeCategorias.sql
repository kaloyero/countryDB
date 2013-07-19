DROP TABLE IF EXISTS `mensajeCategorias`;


CREATE TABLE Integrantes
(
	IdIntegrante         INTEGER AUTO_INCREMENT,
	Tipo                 VARCHAR(2) NOT NULL CHECK ( Tipo IN ('PP', 'PS', 'IP', 'IS') ),
	IdPersona            INTEGER NOT NULL,
	IdUnidad             INTEGER NOT NULL,
	PRIMARY KEY (IdIntegrante),
	FOREIGN KEY FK_Personas_Integrantes (IdPersona) REFERENCES Personas (IdPersona),
	FOREIGN KEY FK_Unidades_Integrantes (IdUnidad) REFERENCES Unidades (IdUnidad)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1Integrantes ON Integrantes
(
	IdUnidad,
	IdPersona,
	Tipo
);

