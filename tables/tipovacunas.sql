DROP TABLE IF EXISTS `TipoVacunas`;


CREATE TABLE TipoVacunas
(
	IdTipoVacuna         INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	VigenciaMeses        INTEGER NOT NULL,
	Obligatoria          VARCHAR(1) NOT NULL,
	IdEspecie            INTEGER NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdTipoVacuna),
	FOREIGN KEY FK_MascotaEspecies_TipoVacunas (IdEspecie) REFERENCES MascotaEspecies (IdEspecie),
	FOREIGN KEY FK_Emprendimientos_TipoVacunas (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;
