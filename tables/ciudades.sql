DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE Ciudades
(
	IdCiudad             INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdProvincia          INTEGER NOT NULL,
	PRIMARY KEY (IdCiudad),
	FOREIGN KEY FK_Provincia_sCiudades (IdProvincia) REFERENCES Provincias (IdProvincia)
) AUTO_INCREMENT = 1;
