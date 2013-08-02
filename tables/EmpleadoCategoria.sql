DROP TABLE IF EXISTS `EmpleadoCategorias`;


CREATE TABLE EmpleadoCategorias
(
	IdCategoria     INTEGER AUTO_INCREMENT,
	Nombre          VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (IdCategoria)
) AUTO_INCREMENT = 1;