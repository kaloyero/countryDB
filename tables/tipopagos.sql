DROP TABLE IF EXISTS `tipopagos`;


CREATE TABLE TipoPagos
(
	IdTipoPago           INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoPago)
) AUTO_INCREMENT = 1;
