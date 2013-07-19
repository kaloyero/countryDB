DROP TABLE IF EXISTS `tiporecursos`;


CREATE TABLE TipoRecursos
(
	IdTipoRecurso        INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(35) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdTipoRecurso),
	FOREIGN KEY FK_Emprendimientos_TipoRecursos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;
