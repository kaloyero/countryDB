DROP TABLE IF EXISTS `mascotaespecies`;


CREATE TABLE MascotaEspecies
(
	IdEspecie            INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdEspecie),
	FOREIGN KEY FK_Emprendimientos_MascotaEspecies (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;