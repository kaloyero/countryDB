DROP TABLE IF EXISTS `liquidacioncargos`;


CREATE TABLE LiquidacionCargos
(
	IdCargo              INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Importe              NUMERIC(10,2) NOT NULL,
	Modo                 VARCHAR(1) NOT NULL CHECK ( Modo IN ('A', 'M') ),
	IdLiquidacion        INTEGER NOT NULL,
	IdUnidad             INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	IdInfraccion         INTEGER NULL,
	IdUnidadConceptos    INTEGER NOT NULL,
	IdIntegranteActividad INTEGER NOT NULL,
	IdReserva            INTEGER NOT NULL,
	IdEventoParticipante INTEGER NOT NULL,
	PRIMARY KEY (IdCargo),
	FOREIGN KEY FK_Liquidaciones_LiquidacionCargos (IdLiquidacion) REFERENCES Liquidaciones (IdLiquidacion),
	FOREIGN KEY FK_Unidades_LiquidacionCargos (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_Conceptos_LiquidacionCargos (IdConcepto) REFERENCES Conceptos (IdConcepto),
	FOREIGN KEY FK_Infracciones_LiquidacionCargos (IdInfraccion) REFERENCES Infracciones (IdInfraccion),
	FOREIGN KEY FK_UnidadConceptos_LiquidacionCargos (IdUnidadConceptos) REFERENCES UnidadConceptos (IdUnidadConceptos),
	FOREIGN KEY FK_IntegranteActividades_LiquidacionCargos (IdIntegranteActividad) REFERENCES IntegranteActividades (IdIntegranteActividad),
	FOREIGN KEY FK_RecursoReservas_LiquidacionCargos (IdReserva) REFERENCES RecursoReservas (IdReserva),
	FOREIGN KEY FX_EventosParticipantes_LiquidacionCargos (IdEventoParticipante) REFERENCES EventoParticipantes (IdEventoParticipante)
) AUTO_INCREMENT = 1;


CREATE UNIQUE INDEX XAK1LiquidacionCargos ON LiquidacionCargos
(
	IdLiquidacion,
	IdConcepto,
	IdUnidad,
	IdInfraccion,
	IdUnidadConceptos,
	IdIntegranteActividad,
	IdReserva,
	Fecha
);