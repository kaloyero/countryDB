DROP TABLE IF EXISTS `unidadconceptos`;


CREATE TABLE UnidadConceptos
(
	IdUnidadConceptos    INTEGER AUTO_INCREMENT,
	IdUnidad             INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdUnidadConceptos),
	FOREIGN KEY FK_Unidades_UnidadConceptos (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_Conceptos_UnidadConceptos (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1UnidadConceptos ON UnidadConceptos
(
	IdUnidad,
	IdConcepto
);
