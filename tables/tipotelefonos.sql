DROP TABLE IF EXISTS `tipotelefonos`;


CREATE TABLE TipoTelefonos
(
	IdTipoTelefono       INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoTelefono)
) AUTO_INCREMENT = 1;
