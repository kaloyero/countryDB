DROP TABLE IF EXISTS `mascotarazas`;


CREATE TABLE MascotaRazas
(
	IdRaza               INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdEspecie            INTEGER NOT NULL,
	PRIMARY KEY (IdRaza),
	FOREIGN KEY FK_MascotaEspecies_MascotaRazas (IdEspecie) REFERENCES MascotaEspecies (IdEspecie)
) AUTO_INCREMENT = 1;