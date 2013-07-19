DROP TABLE IF EXISTS `localidades`;

CREATE TABLE Localidades
(
	IdLocalidad          INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdCiudad             INTEGER NOT NULL,
	CodigoPostal         VARCHAR(10) NULL,
	PRIMARY KEY (IdLocalidad),
	FOREIGN KEY FK_Ciudades_Localidades (IdCiudad) REFERENCES Ciudades (IdCiudad)
) AUTO_INCREMENT = 1;
