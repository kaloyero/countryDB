DROP TABLE IF EXISTS `noticiaValoraciones`;


CREATE TABLE NoticiaValoraciones
(
	IdNoticiaValoracion  INTEGER AUTO_INCREMENT,
	IdNoticia            INTEGER NULL,
	Valoracion           INTEGER NOT NULL,
	IdIntegrante         INTEGER NULL,
	PRIMARY KEY (IdNoticiaValoracion),
	FOREIGN KEY R_95 (IdNoticia) REFERENCES Noticias (IdNoticia),
	FOREIGN KEY R_100 (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;