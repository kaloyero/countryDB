DROP TABLE IF EXISTS `telefonos`;


CREATE TABLE Telefonos
(
	IdTelefono           INTEGER AUTO_INCREMENT,
	CodigoPais           VARCHAR(5) NULL,
	CodigoArea           VARCHAR(5) NULL,
	Prefijo              VARCHAR(5) NULL,
	Numero               VARCHAR(10) NULL,
	IdTipoTelefono       INTEGER NOT NULL,
	IdPersona            INTEGER NOT NULL,
	PRIMARY KEY (IdTelefono),
	FOREIGN KEY FK_TipoTelefonos_Telefonos (IdTipoTelefono) REFERENCES TipoTelefonos (IdTipoTelefono),
	FOREIGN KEY FK_Personas_Telefonos (IdPersona) REFERENCES Personas (IdPersona)
) AUTO_INCREMENT = 1;
