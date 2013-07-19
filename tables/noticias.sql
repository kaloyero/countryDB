DROP TABLE IF EXISTS `noticias`;


CREATE TABLE Noticias
(
	IdNoticia            INTEGER AUTO_INCREMENT,
	Titulo               VARCHAR(50) NOT NULL,
	Texto                MEDIUMBLOB NOT NULL,
	IdCategoria          INTEGER NULL,
	Fecha                DATE NOT NULL,
	PublicaDesde         DATE NOT NULL,
	PublicaHasta         DATE NULL,
	Estado               VARCHAR(1) NOT NULL,
	PRIMARY KEY (IdNoticia),
	FOREIGN KEY R_93 (IdCategoria) REFERENCES NoticiaCategorias (IdCategoria)
) AUTO_INCREMENT = 1;
