DROP TABLE IF EXISTS `pagos`;


CREATE TABLE Pagos
(
	IdPago               INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Referencia           VARCHAR(80) NOT NULL,
	Importe              NUMERIC(10,2) NOT NULL,
	IdUnidad             INTEGER NOT NULL,
	IdTipoPago           INTEGER NOT NULL,
	PRIMARY KEY (IdPago),
	FOREIGN KEY FK_Unidades_Pagos (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_TipoPago_Pagos (IdTipoPago) REFERENCES TipoPagos (IdTipoPago)
) AUTO_INCREMENT = 1;


CREATE UNIQUE INDEX XAK1Pagos ON Pagos
(
	IdUnidad,
	Referencia
);