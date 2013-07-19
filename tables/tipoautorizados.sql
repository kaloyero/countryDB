DROP TABLE IF EXISTS `tipoautorizados`;


CREATE TABLE TipoAutorizados
(
	IdTipoAutorizado     INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoAutorizado)
) AUTO_INCREMENT = 1;
