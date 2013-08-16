DROP TABLE IF EXISTS `instructores`;


CREATE TABLE Instructores
(
	IdInstructor         INTEGER AUTO_INCREMENT,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdPersona            INTEGER NOT NULL,
	estado  		varchar(1) NOT NULL,
	PRIMARY KEY (IdInstructor),
	FOREIGN KEY FK_Personas_Instructores (IdPersona) REFERENCES Personas (IdPersona)
) AUTO_INCREMENT = 1;
