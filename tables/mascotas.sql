DROP TABLE IF EXISTS `mascotas`;


CREATE TABLE Mascotas
(
	Codigo               VARCHAR(20) NULL,
	Nombre               VARCHAR(50) NULL,
	Sexo                 VARCHAR(1) NULL,
	FechaNacimiento      DATE NULL,
	Tamanio              VARCHAR(1) NULL,
	Color                VARCHAR(20) NULL,
	MarcasDistintivas    VARCHAR(100) NULL,
	IdMascota            INTEGER AUTO_INCREMENT,
	IdRaza               INTEGER NOT NULL,
	IdUnidad             INTEGER NOT NULL,
	PRIMARY KEY (IdMascota),
	FOREIGN KEY FK_MascotaRazas_Mascotas (IdRaza) REFERENCES MascotaRazas (IdRaza),
	FOREIGN KEY FK_Unidades_Mascotas (IdUnidad) REFERENCES Unidades (IdUnidad)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Mascotas ON Mascotas
(
	Codigo
);