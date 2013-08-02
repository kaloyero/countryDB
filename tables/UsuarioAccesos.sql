DROP TABLE IF EXISTS `UsuarioAccesos`;


CREATE TABLE UsuarioAccesos
(
	IdUsuario     INTEGER NOT NULL,
	IdAcceso     INTEGER NOT NULL,
	
	PRIMARY KEY (IdUsuario,IdAcceso)
) AUTO_INCREMENT = 1;