DROP TABLE IF EXISTS `noticiaSuscripciones`;


CREATE TABLE NoticiaSuscripciones
(
	IdNoticiaSuscripcion INTEGER AUTO_INCREMENT,
	IdCategoria          INTEGER NULL,
	IdIntegrante         INTEGER NULL,
	PRIMARY KEY (IdNoticiaSuscripcion),
	FOREIGN KEY R_97 (IdCategoria) REFERENCES NoticiaCategorias (IdCategoria),
	FOREIGN KEY R_99 (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;
