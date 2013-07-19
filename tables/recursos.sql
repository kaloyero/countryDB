DROP TABLE IF EXISTS `recursos`;

CREATE TABLE Recursos
(
	IdRecurso            INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	IdTipoRecurso        INTEGER NOT NULL,
	IdConcepto           INTEGER NULL,
	MaxTiempoReserva     INTEGER NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdRecurso),
	FOREIGN KEY FK_TipoRecursos_Recursos (IdTipoRecurso) REFERENCES TipoRecursos (IdTipoRecurso),
	FOREIGN KEY FK_Conceptos_Recursos (IdConcepto) REFERENCES Conceptos (IdConcepto),
	FOREIGN KEY FK_Emprendimientos_Recursos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;
