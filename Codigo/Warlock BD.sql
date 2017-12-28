-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.2.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para warlock soft
CREATE DATABASE IF NOT EXISTS `warlock soft` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `warlock soft`;

-- Volcando estructura para tabla warlock soft.asociacion
CREATE TABLE IF NOT EXISTS `asociacion` (
  `id_Asociacion` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Logo` longblob DEFAULT NULL,
  PRIMARY KEY (`id_Asociacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id_Comentario` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `id_Estado` int(11) NOT NULL,
  `Texto` varchar(500) NOT NULL,
  PRIMARY KEY (`id_Comentario`),
  KEY `FK__Estadousuario` (`id_Usuario`),
  KEY `FK__estado` (`id_Estado`),
  CONSTRAINT `FK__Estadousuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `FK__estado` FOREIGN KEY (`id_Estado`) REFERENCES `estado` (`id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.conocimiento
CREATE TABLE IF NOT EXISTS `conocimiento` (
  `id_Conocimiento` int(11) NOT NULL,
  `id_Habilidad` int(11) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_Conocimiento`),
  KEY `FK_conocimiento_habilidad` (`id_Habilidad`),
  CONSTRAINT `FK_conocimiento_habilidad` FOREIGN KEY (`id_Habilidad`) REFERENCES `habilidad` (`id_Habilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id_UsuarioC` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `Estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_UsuarioC`),
  KEY `FK1_contacto_usuario` (`id_Usuario`),
  CONSTRAINT `FK1_contacto_usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.detalle_asociacion
CREATE TABLE IF NOT EXISTS `detalle_asociacion` (
  `id_DetalleA` int(11) NOT NULL,
  `id_Asociacion` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `Rol` set('Administrador','Co-administrador','Miembro') NOT NULL,
  PRIMARY KEY (`id_DetalleA`),
  KEY `FK1_DAasociacion` (`id_Asociacion`),
  KEY `FK2_DAusuario` (`id_Usuario`),
  CONSTRAINT `FK1_DAasociacion` FOREIGN KEY (`id_Asociacion`) REFERENCES `asociacion` (`id_Asociacion`),
  CONSTRAINT `FK2_DAusuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.detalle_conocimiento
CREATE TABLE IF NOT EXISTS `detalle_conocimiento` (
  `id_DetalleC` int(11) NOT NULL,
  `id_Conocimiento` int(11) NOT NULL,
  `id_Usuario` int(11) DEFAULT NULL,
  `id_DetalleProy` int(11) DEFAULT NULL,
  `id_DetalleTarea` int(11) DEFAULT NULL,
  `Puntaje` int(11) NOT NULL,
  PRIMARY KEY (`id_DetalleC`),
  KEY `FK1_DCconocimiento` (`id_Conocimiento`),
  KEY `FK2_DCusuario` (`id_Usuario`),
  KEY `FK3_DCdetalleproy` (`id_DetalleProy`),
  KEY `FK4_DCdetalletarea` (`id_DetalleTarea`),
  CONSTRAINT `FK1_DCconocimiento` FOREIGN KEY (`id_Conocimiento`) REFERENCES `conocimiento` (`id_Conocimiento`),
  CONSTRAINT `FK2_DCusuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `FK3_DCdetalleproy` FOREIGN KEY (`id_DetalleProy`) REFERENCES `proyecto` (`id_Proyecto`),
  CONSTRAINT `FK4_DCdetalletarea` FOREIGN KEY (`id_DetalleTarea`) REFERENCES `tarea` (`id_Tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.detalle_proyecto
CREATE TABLE IF NOT EXISTS `detalle_proyecto` (
  `id_DetalleProy` int(11) NOT NULL,
  `id_Usuario` int(11) DEFAULT NULL,
  `id_Proyecto` int(11) DEFAULT NULL,
  `Rol` set('Administrador','Participante') DEFAULT NULL,
  PRIMARY KEY (`id_DetalleProy`),
  KEY `FK1_DPusuario` (`id_Usuario`),
  KEY `FK2_DPproyecto` (`id_Proyecto`),
  CONSTRAINT `FK1_DPusuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `FK2_DPproyecto` FOREIGN KEY (`id_Proyecto`) REFERENCES `proyecto` (`id_Proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.detalle_tarea
CREATE TABLE IF NOT EXISTS `detalle_tarea` (
  `id_DetalleTarea` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `id_Tarea` int(11) NOT NULL,
  `Rol` set('Administrador','Participante') NOT NULL,
  PRIMARY KEY (`id_DetalleTarea`),
  KEY `FK1_DTusuario` (`id_Usuario`),
  KEY `FK2_DTtarea` (`id_Tarea`),
  CONSTRAINT `FK1_DTusuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `FK2_DTtarea` FOREIGN KEY (`id_Tarea`) REFERENCES `tarea` (`id_Tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `id_Estado` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `Texto` varchar(500) NOT NULL,
  PRIMARY KEY (`id_Estado`),
  KEY `FK__usuario` (`id_Usuario`),
  CONSTRAINT `FK__usuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.habilidad
CREATE TABLE IF NOT EXISTS `habilidad` (
  `id_Habilidad` int(11) NOT NULL,
  `Nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_Habilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.inscripcion
CREATE TABLE IF NOT EXISTS `inscripcion` (
  `id_Inscripcion` int(11) NOT NULL,
  `id_Tarea` int(11) DEFAULT NULL,
  `id_Proyecto` int(11) DEFAULT NULL,
  `id_Usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_Inscripcion`),
  KEY `FK__Instarea` (`id_Tarea`),
  KEY `FK2_Insproy` (`id_Proyecto`),
  KEY `FK3_Insusuario` (`id_Usuario`),
  CONSTRAINT `FK2_Insproy` FOREIGN KEY (`id_Proyecto`) REFERENCES `proyecto` (`id_Proyecto`),
  CONSTRAINT `FK3_Insusuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `FK__Instarea` FOREIGN KEY (`id_Tarea`) REFERENCES `tarea` (`id_Tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.karma
CREATE TABLE IF NOT EXISTS `karma` (
  `id_Karma` int(11) NOT NULL,
  `id_Conocimiento` int(11) DEFAULT NULL,
  `TotalPuntos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Karma`),
  KEY `FK__Karmaconocimiento` (`id_Conocimiento`),
  CONSTRAINT `FK__Karmaconocimiento` FOREIGN KEY (`id_Conocimiento`) REFERENCES `conocimiento` (`id_Conocimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.mensaje
CREATE TABLE IF NOT EXISTS `mensaje` (
  `id_Mensaje` int(11) NOT NULL,
  `id_Contacto` int(11) NOT NULL,
  `id_Usuario` int(11) NOT NULL,
  `Texto` varchar(5000) NOT NULL,
  PRIMARY KEY (`id_Mensaje`),
  KEY `FK__Msjcontacto` (`id_Contacto`),
  KEY `FK2_Msjusuario` (`id_Usuario`),
  CONSTRAINT `FK2_Msjusuario` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`),
  CONSTRAINT `FK__Msjcontacto` FOREIGN KEY (`id_Contacto`) REFERENCES `contacto` (`id_UsuarioC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.pago
CREATE TABLE IF NOT EXISTS `pago` (
  `id_Pago` int(11) NOT NULL,
  `id_DetalleProy` int(11) DEFAULT NULL,
  `id_DetalleTarea` int(11) DEFAULT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`id_Pago`),
  KEY `FK1_Pdetalleproy` (`id_DetalleProy`),
  KEY `FK2_Pdetalletarea` (`id_DetalleTarea`),
  CONSTRAINT `FK1_Pdetalleproy` FOREIGN KEY (`id_DetalleProy`) REFERENCES `proyecto` (`id_Proyecto`),
  CONSTRAINT `FK2_Pdetalletarea` FOREIGN KEY (`id_DetalleTarea`) REFERENCES `tarea` (`id_Tarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.proyecto
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id_Proyecto` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Fin` date NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Pago` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.tarea
CREATE TABLE IF NOT EXISTS `tarea` (
  `id_Tarea` int(11) NOT NULL,
  `id_Proyecto` int(11) DEFAULT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Fecha_InicioT` date NOT NULL,
  `HabilidadRequerida` varchar(500) NOT NULL,
  `Pago` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Tarea`),
  KEY `FK_tarea_proyecto` (`id_Proyecto`),
  CONSTRAINT `FK_tarea_proyecto` FOREIGN KEY (`id_Proyecto`) REFERENCES `proyecto` (`id_Proyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla warlock soft.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_Usuario` int(11) NOT NULL,
  `Nombre` varchar(500) NOT NULL,
  `Nom_Usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `Fecha_Nac` date NOT NULL,
  PRIMARY KEY (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
