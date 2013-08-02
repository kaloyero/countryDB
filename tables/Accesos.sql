DROP TABLE IF EXISTS `Accesos`;


CREATE TABLE Accesos
(
	IDAcceso            	INTEGER unsigned NOT NULL AUTO_INCREMENT,
	NombreAcceso			VARCHAR(50) NULL,
	IdAccesoGrupo			INTEGER NOT NULL,
	Tag						VARCHAR(50) NULL,
	Descripcion				VARCHAR(120) NULL,
	Estado					VARCHAR(20) NULL,

	PRIMARY KEY (IDAcceso),
	FOREIGN KEY FK_AccesosGrupos_Accesos (IdAccesoGrupo) REFERENCES Localidades (IdAccesoGrupo)

);
