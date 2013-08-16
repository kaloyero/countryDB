DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `IdEmpleado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Puesto` varchar(30) NOT NULL,
  `Legajo` varchar(20) NOT NULL,
  `fechaIngreso` DATE NOT NULL,
  `estado` varchar(20) NOT NULL,
  `IdEmpleadoCategoria` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdPersona` int(11) NOT NULL,
  PRIMARY KEY (`IdEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
