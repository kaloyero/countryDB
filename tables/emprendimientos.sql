DROP TABLE IF EXISTS `emprendimientos`;

CREATE TABLE Emprendimientos
(
	Nombre               VARCHAR(50) NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	IdEmprendimiento     INTEGER AUTO_INCREMENT,
	IdLocalidad          INTEGER NOT NULL,
	PRIMARY KEY (IdEmprendimiento),
	FOREIGN KEY FK_Localidades_Emprendimientos (IdLocalidad) REFERENCES Localidades (IdLocalidad)
) AUTO_INCREMENT = 1;