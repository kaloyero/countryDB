DROP TABLE IF EXISTS `infracciones`;


CREATE TABLE Infracciones
(
	IdInfraccion         INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Numero               VARCHAR(20) NOT NULL,
	Motivo               VARCHAR(80) NOT NULL,
	Importe              NUMERIC(10,2) NULL,
	IdUnidad             INTEGER NOT NULL,
	IdTipoInfraccion     INTEGER NOT NULL,
	IdVehiculo           INTEGER NOT NULL,
	IdMascota            INTEGER NOT NULL,
	Foto                 VARCHAR(80) NULL,
	PRIMARY KEY (IdInfraccion),
	FOREIGN KEY FK_Unidades_Infracciones (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_TipoInfraccion_Infracciones (IdTipoInfraccion) REFERENCES TipoInfracciones (IdTipoInfraccion),
	FOREIGN KEY FK_Vehiculos_Infracciones (IdVehiculo) REFERENCES Vehiculos (IdVehiculo),
	FOREIGN KEY FK_Mascotas_Infracciones (IdMascota) REFERENCES Mascotas (IdMascota)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Infracciones ON Infracciones
(
	Numero
);