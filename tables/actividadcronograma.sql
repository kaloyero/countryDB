DROP TABLE IF EXISTS `actividadcronograma`;


CREATE TABLE ActividadCronograma
(
	IdCronograma         INTEGER AUTO_INCREMENT,
	DiaSemana            INTEGER NOT NULL CHECK ( DiaSemana IN (1, 2, 3, 4, 5, 6, 7) ),
	HoraIni              INTEGER NOT NULL CHECK ( HoraIni BETWEEN 0 AND 23 ),
	Duracion             INTEGER NOT NULL,
	IdActividadGrupo     INTEGER NOT NULL,
	PRIMARY KEY (IdCronograma),
	FOREIGN KEY FX_ActividadGrupos_ActividadCronograma (IdActividadGrupo) REFERENCES ActividadGrupos (IdActividadGrupo)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1ActividadCronograma ON ActividadCronograma
(
	DiaSemana,
	HoraIni
);