DROP TABLE IF EXISTS `vehiculos`;


CREATE TABLE Vehiculos
(
	IdVehiculo           INTEGER AUTO_INCREMENT,
	Codigo               VARCHAR(20) NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	CIlindrada           VARCHAR(10) NULL,
	IdTipoVehiculo       INTEGER NOT NULL,
	IdUnidad             INTEGER NOT NULL,
	Color                VARCHAR(20) NULL,
	PRIMARY KEY (IdVehiculo),
	FOREIGN KEY FK_TipoVehiculos_Vehiculos (IdTipoVehiculo) REFERENCES TipoVehiculos (IdTipoVehiculo),
	FOREIGN KEY FK_Unidades_Vehiculos (IdUnidad) REFERENCES Unidades (IdUnidad)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Vehiculos ON Vehiculos
(
	Codigo
);
