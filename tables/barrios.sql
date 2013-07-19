DROP TABLE IF EXISTS `Barrios`;


CREATE TABLE Barrios
(
	IdBarrio             INTEGER AUTO_INCREMENT,
	Codigo               VARCHAR(20) NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdBarrio),
	FOREIGN KEY FK_Emprendimientos_Barrios (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;