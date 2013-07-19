DROP TABLE IF EXISTS `noticiaAdjuntos`;


CREATE TABLE NoticiaAdjuntos
(
	IdNoticiaAdjunto     INTEGER AUTO_INCREMENT,
	IdNoticia            INTEGER NULL,
	Adjunto              VARCHAR(100) NOT NULL,
	PRIMARY KEY (IdNoticiaAdjunto),
	FOREIGN KEY R_94 (IdNoticia) REFERENCES Noticias (IdNoticia)
) AUTO_INCREMENT = 1;
