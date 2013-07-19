DROP TABLE IF EXISTS `Sector`;


CREATE TABLE Sector
(
	IdSector             INTEGER AUTO_INCREMENT,
	Codigo               VARCHAR(20) NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdSector),
	FOREIGN KEY FK_Emprendimientos_Sector (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;
