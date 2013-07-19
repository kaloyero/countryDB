DROP TABLE IF EXISTS `liquidaciones`;


CREATE TABLE Liquidaciones
(
	IdLiquidacion        INTEGER AUTO_INCREMENT,
	Numero               VARCHAR(20) NOT NULL,
	Fecha                DATE NOT NULL,
	IdPeriodo            INTEGER NOT NULL,
	Estado               VARCHAR(1) NOT NULL CHECK ( Estado IN ('I', 'C') ),
	FechaVencimiento     DATE NULL,
	PRIMARY KEY (IdLiquidacion),
	FOREIGN KEY FK_PeriodosLiquidaciones (IdPeriodo) REFERENCES Periodos (IdPeriodo)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Liquidaciones ON Liquidaciones
(
	Numero
);