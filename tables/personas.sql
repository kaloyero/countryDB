DROP TABLE IF EXISTS `personas`;


CREATE TABLE Personas
(
	Apellido             VARCHAR(50) NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	FechaNacimiento      DATE NULL,
	Sexo                 VARCHAR(1) NULL,
	NroDocumento         VARCHAR(10) NULL,
	Tipo				 VARCHAR(1) NULL,
	DireccionEmail       VARCHAR(50) NULL,
	IdPersona            INTEGER AUTO_INCREMENT,
	IdTipoDocumento      INTEGER NULL,
	PRIMARY KEY (IdPersona),
	FOREIGN KEY FK_TipoDdocumentos_Personas (IdTipoDocumento) REFERENCES TipoDocumentos (IdTipoDocumento)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Personas ON Personas
(
	IdTipoDocumento,
	NroDocumento
);
