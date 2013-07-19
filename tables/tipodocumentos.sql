DROP TABLE IF EXISTS `tipodocumentos`;


CREATE TABLE TipoDocumentos
(
	IdTipoDocumento      INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoDocumento)
) AUTO_INCREMENT = 1;
