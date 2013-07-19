CREATE TABLE MascotaVacunas
(
	IdVacuna             INTEGER AUTO_INCREMENT,
	FechaCertificado     DATE NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	IdMascota            INTEGER NOT NULL,
	IdTipoVacuna         INTEGER NOT NULL,
	PRIMARY KEY (IdVacuna),
	FOREIGN KEY FK_MascotasMascota_Vacunas (IdMascota) REFERENCES Mascotas (IdMascota),
	FOREIGN KEY FK_TipoVacunas_MascotaVacunas (IdTipoVacuna) REFERENCES TipoVacunas (IdTipoVacuna)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1MascotaVacunas ON MascotaVacunas
(
	FechaCertificado
);
