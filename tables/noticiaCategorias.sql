DROP TABLE IF EXISTS `noticiaCategorias`;


CREATE TABLE NoticiaCategorias
(
	IdCategoria          INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdCategoria)
) AUTO_INCREMENT = 1;