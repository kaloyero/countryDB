CREATE TABLE MensajeDetalles
(
	IdMensajeDetalle     INTEGER AUTO_INCREMENT,
	Mensaje              LONGBLOB NOT NULL,
	IdMensaje            INTEGER NULL,
	Fecha                DATE NOT NULL,
	ModoMensaje          VARCHAR(1) NOT NULL,
	PRIMARY KEY (IdMensajeDetalle),
	FOREIGN KEY R_101 (IdMensaje) REFERENCES Mensajes (IdMensaje)
) AUTO_INCREMENT = 1;