DROP TABLE IF EXISTS `AccesosGrupos`;


CREATE TABLE AccesosGrupos
(
	IdAccesoGrupo			INTEGER unsigned NOT NULL AUTO_INCREMENT,
	NombreGrupo			VARCHAR(50) NULL,
	Tag						VARCHAR(50) NULL,
	Descripcion				VARCHAR(120) NULL,
	Estado					VARCHAR(20) NULL,

	PRIMARY KEY (IdAccesoGrupo)

);
