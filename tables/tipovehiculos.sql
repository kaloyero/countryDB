DROP TABLE IF EXISTS `tipovehiculos`;


CREATE TABLE TipoVehiculos
(
	IdTipoVehiculo       INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoVehiculo)
) AUTO_INCREMENT = 1;