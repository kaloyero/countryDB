DROP TABLE IF EXISTS `mensajes`;


CREATE TABLE Mensajes
(
	IdMensaje            INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Asunto               VARCHAR(50) NOT NULL,
	FechaCierre          DATE NULL,
	Resolucion           VARCHAR(50) NOT NULL,
	Estado               VARCHAR(1) NOT NULL,
	IdMensajeCategoria   INTEGER NULL,
	IdIntegrante         int(11) not NULL,	
	IdEmpleado         	 int(11) NULL,
	Envio				 VARCHAR(1) NOT NULL,--Este campo dice quien envio el mensaje el administrador o el usuario
	TipoMensaje          VARCHAR(1) NOT NULL,
	PRIMARY KEY (IdMensaje),
	FOREIGN KEY R_102 (IdMensajeCategoria) REFERENCES MensajeCategorias (IdMensajeCategoria),
	FOREIGN KEY R_103 (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;