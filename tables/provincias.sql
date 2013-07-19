DROP TABLE IF EXISTS `provincias`;

CREATE TABLE Provincias
(
	IdProvincia          INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	CodigoISO            VARCHAR(1) NULL,
	PRIMARY KEY (IdProvincia)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1Provincias ON Provincias
(
	CodigoISO
);
