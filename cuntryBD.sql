CREATE DATABASE  IF NOT EXISTS `country` 
USE `country`;

DROP TABLE IF EXISTS `Accesos`;


CREATE TABLE Accesos
(
	IDAcceso            	INTEGER unsigned NOT NULL AUTO_INCREMENT,
	NombreAcceso			VARCHAR(50) NULL,
	IdAccesoGrupo			INTEGER NOT NULL,
	Tag						VARCHAR(50) NULL,
	Descripcion				VARCHAR(120) NULL,
	Estado					VARCHAR(20) NULL,

	PRIMARY KEY (IDAcceso),
	FOREIGN KEY FK_AccesosGrupos_Accesos (IdAccesoGrupo) REFERENCES Localidades (IdAccesoGrupo)

);

DROP TABLE IF EXISTS `AccesosGrupos`;


CREATE TABLE AccesosGrupos
(
	IdAccesoGrupo			INTEGER unsigned NOT NULL AUTO_INCREMENT,
	NombreGrupo			VARCHAR(50) NULL,
	Tag						VARCHAR(50) NULL,
	Descripcion				VARCHAR(120) NULL,
	Estado					VARCHAR(20) NULL,

	PRIMARY KEY (IdAccesoGrupo)

);

DROP TABLE IF EXISTS `actividadasignaciones`;


CREATE TABLE ActividadAsignaciones
(
	IdAsignacion         INTEGER AUTO_INCREMENT,
	IdInstructor         INTEGER NOT NULL,
	IdActividad          INTEGER NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdAsignacion),
	FOREIGN KEY FK_Instructores_ActividadAsignaciones (IdInstructor) REFERENCES Instructores (IdInstructor),
	FOREIGN KEY FK_Actividades_ActividadAsignaciones (IdActividad) REFERENCES Actividades (IdActividad)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `actividadcronograma`;


CREATE TABLE ActividadCronograma
(
	IdCronograma         INTEGER AUTO_INCREMENT,
	DiaSemana            INTEGER NOT NULL CHECK ( DiaSemana IN (1, 2, 3, 4, 5, 6, 7) ),
	HoraIni              INTEGER NOT NULL CHECK ( HoraIni BETWEEN 0 AND 23 ),
	Duracion             INTEGER NOT NULL,
	IdActividadGrupo     INTEGER NOT NULL,
	PRIMARY KEY (IdCronograma),
	FOREIGN KEY FX_ActividadGrupos_ActividadCronograma (IdActividadGrupo) REFERENCES ActividadGrupos (IdActividadGrupo)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1ActividadCronograma ON ActividadCronograma
(
	DiaSemana,
	HoraIni
);

DROP TABLE IF EXISTS `actividades`;


CREATE TABLE Actividades
(
	IdActividad          INTEGER NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	Descripcion          VARCHAR(50) NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdActividad),
	FOREIGN KEY FK_Emprendimientos_Actividades (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
);

DROP TABLE IF EXISTS `ActividadGrupos`;


CREATE TABLE ActividadGrupos
(
	IdActividadGrupo     INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NOT NULL,
	FechaIni             DATE NULL,
	FechaFin             DATE NOT NULL,
	IdActividad          INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	PRIMARY KEY (IdActividadGrupo),
	FOREIGN KEY FX_Actividades_ActividadGrupos (IdActividad) REFERENCES Actividades (IdActividad),
	FOREIGN KEY FX_Conceptos_ActividadGrupos (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `autorizados`;


CREATE TABLE Autorizados
(
	IdAutorizado         INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdUnidad             INTEGER NOT NULL,
	IdPersona            INTEGER NOT NULL,
	IdTipoAutorizado     INTEGER NOT NULL,
	PRIMARY KEY (IdAutorizado),
	FOREIGN KEY FK_Unidades_Autorizados (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_Personas_Autorizados (IdPersona) REFERENCES Personas (IdPersona),
	FOREIGN KEY FK_TipoAutorizados_Autorizados (IdTipoAutorizado) REFERENCES TipoAutorizados (IdTipoAutorizado)
) AUTO_INCREMENT = 1;


CREATE UNIQUE INDEX XAK1Autorizados ON Autorizados
(
	IdUnidad,
	IdPersona,
	FechaIni
);

DROP TABLE IF EXISTS `AvisoCategorias`;


CREATE TABLE AvisoCategorias
(
	IdAvisoCategoria     INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	DiasPublicacion      INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	PRIMARY KEY (IdAvisoCategoria),
	FOREIGN KEY FX_Conceptos_AvisoCategorias (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Avisos`;


CREATE TABLE Avisos
(
	IdAviso              INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Titulo               VARCHAR(50) NOT NULL,
	Encabezado           VARCHAR(100) NULL,
	Cuerpo               VARCHAR(100) NULL,
	Cierre               VARCHAR(100) NULL,
	IdAvisoCategoria     INTEGER NOT NULL,
	IdIntegrante         INTEGER NOT NULL,
	FechaFin             DATE NOT NULL,
	PRIMARY KEY (IdAviso),
	FOREIGN KEY R_115 (IdAvisoCategoria) REFERENCES AvisoCategorias (IdAvisoCategoria),
	FOREIGN KEY FX_Integrantes_Avisos (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `AvisoSuscripcion`;

CREATE TABLE AvisoSuscripcion
(
	IDAvisoSuscripcion   INTEGER AUTO_INCREMENT,
	IdAvisoCategoria     INTEGER NOT NULL,
	IdIntegrante         INTEGER NOT NULL,
	PRIMARY KEY (IDAvisoSuscripcion),
	FOREIGN KEY R_118 (IdAvisoCategoria) REFERENCES AvisoCategorias (IdAvisoCategoria),
	FOREIGN KEY FX_Integrantes_AvisoSuscripcion (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Barrios`;


CREATE TABLE Barrios
(
	IdBarrio             INTEGER AUTO_INCREMENT,
	Codigo               VARCHAR(20) NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdBarrio),
	FOREIGN KEY FK_Emprendimientos_Barrios (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE Ciudades
(
	IdCiudad             INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdProvincia          INTEGER NOT NULL,
	PRIMARY KEY (IdCiudad),
	FOREIGN KEY FK_Provincia_sCiudades (IdProvincia) REFERENCES Provincias (IdProvincia)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `conceptos`;


CREATE TABLE Conceptos
(
	IdConcepto           INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(80) NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdConcepto),
	FOREIGN KEY FK_Emprendimientos_Conceptos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `direcciones`;


CREATE TABLE Direcciones
(
	IdDireccion          INTEGER AUTO_INCREMENT,
	CalleNombre          VARCHAR(100) NOT NULL,
	CalleNumero          VARCHAR(10) NOT NULL,
	Torre                VARCHAR(3) NULL,
	Bloque               VARCHAR(3) NULL,
	Piso                 VARCHAR(3) NULL,
	Departamento         VARCHAR(3) NULL,
	IdPersona            INTEGER NOT NULL,
	IdLocalidad          INTEGER NOT NULL,
	PRIMARY KEY (IdDireccion),
	FOREIGN KEY FK_Personas_Direcciones (IdPersona) REFERENCES Personas (IdPersona),
	FOREIGN KEY FK_Localidades_Direcciones (IdLocalidad) REFERENCES Localidades (IdLocalidad)
) AUTO_INCREMENT = 1;

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

DROP TABLE IF EXISTS `EmpleadoCategorias`;


CREATE TABLE EmpleadoCategorias
(
	IdCategoria     INTEGER AUTO_INCREMENT,
	Nombre          VARCHAR(50) NOT NULL,
	
	PRIMARY KEY (IdCategoria)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `emprendimientos`;

CREATE TABLE Emprendimientos
(
	Nombre               VARCHAR(50) NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	IdEmprendimiento     INTEGER AUTO_INCREMENT,
	IdLocalidad          INTEGER NOT NULL,
	PRIMARY KEY (IdEmprendimiento),
	FOREIGN KEY FK_Localidades_Emprendimientos (IdLocalidad) REFERENCES Localidades (IdLocalidad)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `EventoParticipantes`;

CREATE TABLE EventoParticipantes
(
	IdEventoParticipante INTEGER NOT NULL,
	IdEvento             INTEGER NOT NULL,
	IdIntegrante         INTEGER NOT NULL,
	PRIMARY KEY (IdEventoParticipante),
	FOREIGN KEY FX_Eventos_Inscriptos (IdEvento) REFERENCES Eventos (IdEvento),
	FOREIGN KEY FX_Integrantes_EventosInscriptos (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
);

DROP TABLE IF EXISTS `Eventos`;


CREATE TABLE Eventos
(
	IdEvento             INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Descripcion          VARCHAR(100) NOT NULL,
	Nombre 		         VARCHAR(80) NOT NULL,
	Cupo                 INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	IdIntegrante         INTEGER NULL,
	HoraIni              INTEGER NOT NULL,
	Duracion              INTEGER NOT NULL,
	PRIMARY KEY (IdEvento),
	FOREIGN KEY R_108 (IdConcepto) REFERENCES Conceptos (IdConcepto),
	FOREIGN KEY FX_Integrantes_Eventos (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;

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

DROP TABLE IF EXISTS `instructores`;


CREATE TABLE Instructores
(
	IdInstructor         INTEGER AUTO_INCREMENT,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdPersona            INTEGER NOT NULL,
	estado  		varchar(1) NOT NULL,
	PRIMARY KEY (IdInstructor),
	FOREIGN KEY FK_Personas_Instructores (IdPersona) REFERENCES Personas (IdPersona)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `integranteactividades`;


CREATE TABLE IntegranteActividades
(
	IdIntegranteActividad INTEGER AUTO_INCREMENT,
	IdIntegrante         INTEGER NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdActividadGrupo     INTEGER NOT NULL,
	PRIMARY KEY (IdIntegranteActividad),
	FOREIGN KEY FK_Integrantes_IntegranteActividades (IdIntegrante) REFERENCES Integrantes (IdIntegrante),
	FOREIGN KEY FX_ActividadGrupos_IntegranteActividades (IdActividadGrupo) REFERENCES ActividadGrupos (IdActividadGrupo)
) AUTO_INCREMENT = 1;


DROP TABLE IF EXISTS `integrantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integrantes` (
  `IdIntegrante` 	int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` 			varchar(2) NOT NULL,
  `IdPersona` 		int(11) NOT NULL,
  `IdUnidad` 		int(11) NOT NULL,
  `estado`  		varchar(1) NOT NULL,
  `IdUsuario`  		int(11) NOT NULL,
  PRIMARY KEY (`IdIntegrante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `liquidacioncargos`;


CREATE TABLE LiquidacionCargos
(
	IdCargo              INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	Importe              NUMERIC(10,2) NOT NULL,
	Modo                 VARCHAR(1) NOT NULL CHECK ( Modo IN ('A', 'M') ),
	IdLiquidacion        INTEGER NOT NULL,
	IdUnidad             INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	IdInfraccion         INTEGER NULL,
	IdUnidadConceptos    INTEGER NOT NULL,
	IdIntegranteActividad INTEGER NOT NULL,
	IdReserva            INTEGER NOT NULL,
	IdEventoParticipante INTEGER NOT NULL,
	PRIMARY KEY (IdCargo),
	FOREIGN KEY FK_Liquidaciones_LiquidacionCargos (IdLiquidacion) REFERENCES Liquidaciones (IdLiquidacion),
	FOREIGN KEY FK_Unidades_LiquidacionCargos (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_Conceptos_LiquidacionCargos (IdConcepto) REFERENCES Conceptos (IdConcepto),
	FOREIGN KEY FK_Infracciones_LiquidacionCargos (IdInfraccion) REFERENCES Infracciones (IdInfraccion),
	FOREIGN KEY FK_UnidadConceptos_LiquidacionCargos (IdUnidadConceptos) REFERENCES UnidadConceptos (IdUnidadConceptos),
	FOREIGN KEY FK_IntegranteActividades_LiquidacionCargos (IdIntegranteActividad) REFERENCES IntegranteActividades (IdIntegranteActividad),
	FOREIGN KEY FK_RecursoReservas_LiquidacionCargos (IdReserva) REFERENCES RecursoReservas (IdReserva),
	FOREIGN KEY FX_EventosParticipantes_LiquidacionCargos (IdEventoParticipante) REFERENCES EventoParticipantes (IdEventoParticipante)
) AUTO_INCREMENT = 1;


CREATE UNIQUE INDEX XAK1LiquidacionCargos ON LiquidacionCargos
(
	IdLiquidacion,
	IdConcepto,
	IdUnidad,
	IdInfraccion,
	IdUnidadConceptos,
	IdIntegranteActividad,
	IdReserva,
	Fecha
);

DROP TABLE IF EXISTS `liquidaciones`;


CREATE TABLE Liquidaciones
(
	IdLiquidacion        INTEGER AUTO_INCREMENT,
	Numero               VARCHAR(20) NOT NULL,
	Fecha                DATE NOT NULL,
	IdPeriodo            INTEGER NOT NULL,
	Estado               VARCHAR(1) NOT NULL CHECK ( Estado IN ('I', 'C') ),
	FechaVencimiento     DATE NULL,
	PRIMARY KEY (IdLiquidacion),
	FOREIGN KEY FK_PeriodosLiquidaciones (IdPeriodo) REFERENCES Periodos (IdPeriodo)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Liquidaciones ON Liquidaciones
(
	Numero
);

DROP TABLE IF EXISTS `localidades`;

CREATE TABLE Localidades
(
	IdLocalidad          INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdCiudad             INTEGER NOT NULL,
	CodigoPostal         VARCHAR(10) NULL,
	PRIMARY KEY (IdLocalidad),
	FOREIGN KEY FK_Ciudades_Localidades (IdCiudad) REFERENCES Ciudades (IdCiudad)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `mascotaespecies`;


CREATE TABLE MascotaEspecies
(
	IdEspecie            INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdEspecie),
	FOREIGN KEY FK_Emprendimientos_MascotaEspecies (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `mascotarazas`;


CREATE TABLE MascotaRazas
(
	IdRaza               INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdEspecie            INTEGER NOT NULL,
	PRIMARY KEY (IdRaza),
	FOREIGN KEY FK_MascotaEspecies_MascotaRazas (IdEspecie) REFERENCES MascotaEspecies (IdEspecie)
) AUTO_INCREMENT = 1;

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

DROP TABLE IF EXISTS `mensajeCategorias`;


CREATE TABLE Integrantes
(
	IdIntegrante         INTEGER AUTO_INCREMENT,
	Tipo                 VARCHAR(2) NOT NULL CHECK ( Tipo IN ('PP', 'PS', 'IP', 'IS') ),
	IdPersona            INTEGER NOT NULL,
	IdUnidad             INTEGER NOT NULL,
	PRIMARY KEY (IdIntegrante),
	FOREIGN KEY FK_Personas_Integrantes (IdPersona) REFERENCES Personas (IdPersona),
	FOREIGN KEY FK_Unidades_Integrantes (IdUnidad) REFERENCES Unidades (IdUnidad)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1Integrantes ON Integrantes
(
	IdUnidad,
	IdPersona,
	Tipo
);


DROP TABLE IF EXISTS `MensajeDetalles`;

CREATE TABLE MensajeDetalles
(
	IdMensajeDetalle     INTEGER AUTO_INCREMENT,
	Mensaje              LONGBLOB NOT NULL,
	IdMensaje            INTEGER NULL,
	Fecha                DATE NOT NULL,
	ModoMensaje          VARCHAR(1) NOT NULL,
	IdPersona         INTEGER NOT NULL,	
	PRIMARY KEY (IdMensajeDetalle),
	FOREIGN KEY R_101 (IdMensaje) REFERENCES Mensajes (IdMensaje)
) AUTO_INCREMENT = 1;

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

DROP TABLE IF EXISTS `noticiaAdjuntos`;


CREATE TABLE NoticiaAdjuntos
(
	IdNoticiaAdjunto     INTEGER AUTO_INCREMENT,
	IdNoticia            INTEGER NULL,
	Adjunto              VARCHAR(100) NOT NULL,
	PRIMARY KEY (IdNoticiaAdjunto),
	FOREIGN KEY R_94 (IdNoticia) REFERENCES Noticias (IdNoticia)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `noticiaCategorias`;


CREATE TABLE NoticiaCategorias
(
	IdCategoria          INTEGER AUTO_INCREMENT,
	Descripcion          VARCHAR(50) NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdCategoria)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `noticias`;


CREATE TABLE Noticias
(
	IdNoticia            INTEGER AUTO_INCREMENT,
	Titulo               VARCHAR(50) NOT NULL,
	Texto                MEDIUMBLOB NOT NULL,
	IdCategoria          INTEGER NULL,
	Fecha                DATE NOT NULL,
	PublicaDesde         DATE NOT NULL,
	PublicaHasta         DATE NULL,
	Estado               VARCHAR(1) NOT NULL,
	PRIMARY KEY (IdNoticia),
	FOREIGN KEY R_93 (IdCategoria) REFERENCES NoticiaCategorias (IdCategoria)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `noticiaSuscripciones`;


CREATE TABLE NoticiaSuscripciones
(
	IdNoticiaSuscripcion INTEGER AUTO_INCREMENT,
	IdCategoria          INTEGER NULL,
	IdIntegrante         INTEGER NULL,
	PRIMARY KEY (IdNoticiaSuscripcion),
	FOREIGN KEY R_97 (IdCategoria) REFERENCES NoticiaCategorias (IdCategoria),
	FOREIGN KEY R_99 (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `noticiaValoraciones`;


CREATE TABLE NoticiaValoraciones
(
	IdNoticiaValoracion  INTEGER AUTO_INCREMENT,
	IdNoticia            INTEGER NULL,
	Valoracion           INTEGER NOT NULL,
	IdIntegrante         INTEGER NULL,
	PRIMARY KEY (IdNoticiaValoracion),
	FOREIGN KEY R_95 (IdNoticia) REFERENCES Noticias (IdNoticia),
	FOREIGN KEY R_100 (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;

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

DROP TABLE IF EXISTS `periodos`;


CREATE TABLE Periodos
(
	IdPeriodo            INTEGER AUTO_INCREMENT,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	Descripcion          VARCHAR(80) NULL,
	Estado               VARCHAR(1) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdPeriodo),
	FOREIGN KEY FK_Emprendimientos_Periodos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Periodos ON Periodos
(
	IdEmprendimiento,
	FechaIni,
	FechaFin
);

DROP TABLE IF EXISTS `personas`;


CREATE TABLE Personas
(
	Apellido             VARCHAR(50) NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	FechaNacimiento      DATE NULL,
	Sexo                 VARCHAR(1) NULL,
	NroDocumento         VARCHAR(10) NULL,
	Tipo				 VARCHAR(1) NULL,
	DireccionEmail       VARCHAR(50) NULL,
	IdPersona            INTEGER AUTO_INCREMENT,
	IdTipoDocumento      INTEGER NULL,
	PRIMARY KEY (IdPersona),
	FOREIGN KEY FK_TipoDdocumentos_Personas (IdTipoDocumento) REFERENCES TipoDocumentos (IdTipoDocumento)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1Personas ON Personas
(
	IdTipoDocumento,
	NroDocumento
);

DROP TABLE IF EXISTS `provincias`;

CREATE TABLE Provincias
(
	IdProvincia          INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	CodigoISO            VARCHAR(1) NULL,
	PRIMARY KEY (IdProvincia)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1Provincias ON Provincias
(
	CodigoISO
);

DROP TABLE IF EXISTS `recursodisponibilidades`;


CREATE TABLE RecursoDisponibilidades
(
	IdDisponibilidad     INTEGER AUTO_INCREMENT,
	DiaSemana            INTEGER NOT NULL CHECK ( DiaSemana IN (1, 2, 3, 4, 5, 6, 7) ),
	HoraIni              INTEGER NOT NULL CHECK ( HoraIni BETWEEN 0 AND 23 ),
	HoraFin              INTEGER NOT NULL CHECK ( HoraFin BETWEEN 0 AND 23 ),
	IdRecurso            INTEGER NOT NULL,
	PRIMARY KEY (IdDisponibilidad),
	FOREIGN KEY FK_Recursos_RecursosDisponibilidades (IdRecurso) REFERENCES Recursos (IdRecurso)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1RecursoDisponibilidades ON RecursoDisponibilidades
(
	IdRecurso,
	DiaSemana,
	HoraIni
);

DROP TABLE IF EXISTS `recursoexcepciones`;


CREATE TABLE RecursoExcepciones
(
	IdExcepcion          INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	HoraIni              INTEGER NOT NULL CHECK ( HoraIni BETWEEN 0 AND 23 ),
	Duracion             INTEGER NOT NULL,
	IdRecurso            INTEGER NOT NULL,
	PRIMARY KEY (IdExcepcion),
	FOREIGN KEY FK_Recursos_Excepciones (IdRecurso) REFERENCES Recursos (IdRecurso)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1RecursoExcepciones ON RecursoExcepciones
(
	IdRecurso,
	Fecha,
	HoraIni
);

DROP TABLE IF EXISTS `recursoreservas`;


CREATE TABLE RecursoReservas
(
	IdReserva            INTEGER AUTO_INCREMENT,
	Fecha                DATE NOT NULL,
	IdRecurso            INTEGER NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	HoraIni              INTEGER NOT NULL,
	Duracion             INTEGER NOT NULL,
	IdEvento             INTEGER NOT NULL,
	IdIntegrante         INTEGER NOT NULL,
	PRIMARY KEY (IdReserva),
	FOREIGN KEY FK_Recursos_RecursoReservas (IdRecurso) REFERENCES Recursos (IdRecurso),
	FOREIGN KEY FX_Eventos_RecursosReservas (IdEvento) REFERENCES Eventos (IdEvento),
	FOREIGN KEY FX_Integrantes_RecursoReservas (IdIntegrante) REFERENCES Integrantes (IdIntegrante)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `recursos`;

CREATE TABLE Recursos
(
	IdRecurso            INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	Descripcion          VARCHAR(80) NULL,
	IdTipoRecurso        INTEGER NOT NULL,
	IdConcepto           INTEGER NULL,
	MaxTiempoReserva     INTEGER NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdRecurso),
	FOREIGN KEY FK_TipoRecursos_Recursos (IdTipoRecurso) REFERENCES TipoRecursos (IdTipoRecurso),
	FOREIGN KEY FK_Conceptos_Recursos (IdConcepto) REFERENCES Conceptos (IdConcepto),
	FOREIGN KEY FK_Emprendimientos_Recursos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Sector`;


CREATE TABLE Sector
(
	IdSector             INTEGER AUTO_INCREMENT,
	Codigo               VARCHAR(20) NOT NULL,
	Nombre               VARCHAR(50) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdSector),
	FOREIGN KEY FK_Emprendimientos_Sector (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tarifas`;


CREATE TABLE Tarifas
(
	IdTarifa             INTEGER AUTO_INCREMENT,
	Importe              NUMERIC(10,2) NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	IdConcepto           INTEGER NOT NULL,
	PRIMARY KEY (IdTarifa),
	FOREIGN KEY FK_Conceptos_Tarifas (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `telefonos`;


CREATE TABLE Telefonos
(
	IdTelefono           INTEGER AUTO_INCREMENT,
	CodigoPais           VARCHAR(5) NULL,
	CodigoArea           VARCHAR(5) NULL,
	Prefijo              VARCHAR(5) NULL,
	Numero               VARCHAR(10) NULL,
	IdTipoTelefono       INTEGER NOT NULL,
	IdPersona            INTEGER NOT NULL,
	PRIMARY KEY (IdTelefono),
	FOREIGN KEY FK_TipoTelefonos_Telefonos (IdTipoTelefono) REFERENCES TipoTelefonos (IdTipoTelefono),
	FOREIGN KEY FK_Personas_Telefonos (IdPersona) REFERENCES Personas (IdPersona)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tipoautorizados`;


CREATE TABLE TipoAutorizados
(
	IdTipoAutorizado     INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoAutorizado)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tipodocumentos`;


CREATE TABLE TipoDocumentos
(
	IdTipoDocumento      INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoDocumento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tipoinfracciones`;


CREATE TABLE TipoInfracciones
(
	IdTipoInfraccion     INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdTipoInfraccion),
	FOREIGN KEY FK_Conceptos_TipoInfraccion (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tipopagos`;


CREATE TABLE TipoPagos
(
	IdTipoPago           INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoPago)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tiporecursos`;


CREATE TABLE TipoRecursos
(
	IdTipoRecurso        INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(35) NOT NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdTipoRecurso),
	FOREIGN KEY FK_Emprendimientos_TipoRecursos (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tipotelefonos`;


CREATE TABLE TipoTelefonos
(
	IdTipoTelefono       INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoTelefono)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `TipoVacunas`;


CREATE TABLE TipoVacunas
(
	IdTipoVacuna         INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	VigenciaMeses        INTEGER NOT NULL,
	Obligatoria          VARCHAR(1) NOT NULL,
	IdEspecie            INTEGER NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	PRIMARY KEY (IdTipoVacuna),
	FOREIGN KEY FK_MascotaEspecies_TipoVacunas (IdEspecie) REFERENCES MascotaEspecies (IdEspecie),
	FOREIGN KEY FK_Emprendimientos_TipoVacunas (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `tipovehiculos`;


CREATE TABLE TipoVehiculos
(
	IdTipoVehiculo       INTEGER AUTO_INCREMENT,
	Nombre               VARCHAR(50) NOT NULL,
	PRIMARY KEY (IdTipoVehiculo)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `unidadconceptos`;


CREATE TABLE UnidadConceptos
(
	IdUnidadConceptos    INTEGER AUTO_INCREMENT,
	IdUnidad             INTEGER NOT NULL,
	IdConcepto           INTEGER NOT NULL,
	FechaIni             DATE NOT NULL,
	FechaFin             DATE NULL,
	PRIMARY KEY (IdUnidadConceptos),
	FOREIGN KEY FK_Unidades_UnidadConceptos (IdUnidad) REFERENCES Unidades (IdUnidad),
	FOREIGN KEY FK_Conceptos_UnidadConceptos (IdConcepto) REFERENCES Conceptos (IdConcepto)
) AUTO_INCREMENT = 1;



CREATE UNIQUE INDEX XAK1UnidadConceptos ON UnidadConceptos
(
	IdUnidad,
	IdConcepto
);

DROP TABLE IF EXISTS `unidades`;

CREATE TABLE Unidades
(
	IdUnidad             INTEGER AUTO_INCREMENT,
	Codigo               VARCHAR(20) NULL,
	Descripcion          VARCHAR(80) NULL,
	IdEmprendimiento     INTEGER NOT NULL,
	IdBarrio             INTEGER NOT NULL,
	IdSector             INTEGER NOT NULL,
	PRIMARY KEY (IdUnidad),
	FOREIGN KEY FK_Emprendimientos_Unidades (IdEmprendimiento) REFERENCES Emprendimientos (IdEmprendimiento),
	FOREIGN KEY FK_Barrios_Unidades (IdBarrio) REFERENCES Barrios (IdBarrio),
	FOREIGN KEY FK_Sector_Uniodades (IdSector) REFERENCES Sector (IdSector)
) AUTO_INCREMENT = 1;

CREATE UNIQUE INDEX XAK1Unidades ON Unidades
(
	Codigo
);

DROP TABLE IF EXISTS `UsuarioAccesos`;


CREATE TABLE UsuarioAccesos
(
	Id				INTEGER AUTO_INCREMENT,
	IdUsuario     	INTEGER NOT NULL,
	IdAcceso     	INTEGER NOT NULL,
	
	PRIMARY KEY (Id)
) AUTO_INCREMENT = 1;

DROP TABLE IF EXISTS `Usuarios`;


CREATE TABLE Usuarios
(
	IdUsuario            	int(11) unsigned NOT NULL AUTO_INCREMENT,
	Descripcion          	VARCHAR(50) NULL,
	ClaveAccesoEncriptada 	VARCHAR(100) NOT NULL,
	ActivoDesde          	DATE NOT NULL,
	ActivoHasta          	DATE NULL,
	NombreUsuario           VARCHAR(20) NULL,
	ResetPass				VARCHAR(1) not NULL,
	Estado					VARCHAR(10) not NULL,
	PRIMARY KEY (IDUsuario)
);

CREATE UNIQUE INDEX XAK1Usuarios ON Usuarios
(
	Nombre
);

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

