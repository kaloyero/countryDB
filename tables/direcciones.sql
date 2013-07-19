DROP TABLE IF EXISTS `direcciones`;


CREATE TABLE Direcciones
(
	IdDireccion          INTEGER AUTO_INCREMENT,
	CalleNombre          VARCHAR(100) NOT NULL,
	CalleNumero          VARCHAR(10) NOT NULL,
	Torre                VARCHAR(3) NULL,
	Bloque               VARCHAR(3) NULL,
	Piso                 VARCHAR(3) NULL,
	Departamento         VARCHAR(3) NULL,
	IdPersona            INTEGER NOT NULL,
	IdLocalidad          INTEGER NOT NULL,
	PRIMARY KEY (IdDireccion),
	FOREIGN KEY FK_Personas_Direcciones (IdPersona) REFERENCES Personas (IdPersona),
	FOREIGN KEY FK_Localidades_Direcciones (IdLocalidad) REFERENCES Localidades (IdLocalidad)
) AUTO_INCREMENT = 1;
