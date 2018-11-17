-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.5118
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para paebd
DROP DATABASE IF EXISTS `paebd`;
CREATE DATABASE IF NOT EXISTS `paebd` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `paebd`;

-- Volcando estructura para tabla paebd.alimento
DROP TABLE IF EXISTS `alimento`;
CREATE TABLE IF NOT EXISTS `alimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area_evaluada` int(11) NOT NULL,
  `id_alimento_registrado` int(11) NOT NULL,
  `marca` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `sn_aprobacion_gsan` bit(1) DEFAULT NULL,
  `sn_cumple_marca_comercial` bit(1) DEFAULT NULL,
  `sn_cumple_etiquetado` bit(1) DEFAULT NULL,
  `sn_cumple_empaque` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_area_evaluada_alimento` (`id_area_evaluada`),
  KEY `fk_alimento_registrado` (`id_alimento_registrado`),
  CONSTRAINT `fk_alimento_registrado` FOREIGN KEY (`id_alimento_registrado`) REFERENCES `alimento_registrado` (`id`),
  CONSTRAINT `fk_area_evaluada_alimento` FOREIGN KEY (`id_area_evaluada`) REFERENCES `area_evaluada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.alimento: ~0 rows (aproximadamente)
DELETE FROM `alimento`;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.alimento_registrado
DROP TABLE IF EXISTS `alimento_registrado`;
CREATE TABLE IF NOT EXISTS `alimento_registrado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.alimento_registrado: ~26 rows (aproximadamente)
DELETE FROM `alimento_registrado`;
/*!40000 ALTER TABLE `alimento_registrado` DISABLE KEYS */;
INSERT INTO `alimento_registrado` (`id`, `nombre`) VALUES
	(1, 'Aceite vegetal'),
	(2, 'Arepa de maíz de 45 gr'),
	(3, 'Arroz'),
	(4, 'Avena en hojuelas'),
	(5, 'Azúcar refinada'),
	(6, 'Bebida láctea a base de yogurt'),
	(7, 'Bocadillo'),
	(8, 'Café en grano'),
	(9, 'Carne de cerdo, semigorda'),
	(10, 'Carne de res, magra'),
	(11, 'Cereal de maíz en hojuelas azucarado enriquecido con vitaminas y minerales'),
	(12, 'Chocolate en pasta'),
	(13, 'Crema de leche'),
	(14, 'Fríjol cargamanto'),
	(15, 'Galleta de sal'),
	(16, 'Galleta de sal con sabor a mantequilla o queso'),
	(17, 'Harina de trigo fortificada'),
	(18, 'Huevo tipo A'),
	(19, 'Leche en polvo entera de vaca'),
	(20, 'Mermelada'),
	(21, 'Pan tajado (2 tajadas)'),
	(22, 'Panela'),
	(23, 'Polvo de bizcocho'),
	(24, 'Queso blanco o campesino'),
	(25, 'Sal yodada'),
	(26, 'Margarina suave de mesa');
/*!40000 ALTER TABLE `alimento_registrado` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.anexo
DROP TABLE IF EXISTS `anexo`;
CREATE TABLE IF NOT EXISTS `anexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area_evaluada` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `foto` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_area_evaluada_anexos` (`id_area_evaluada`),
  CONSTRAINT `fk_area_evaluada_anexos` FOREIGN KEY (`id_area_evaluada`) REFERENCES `area_evaluada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.anexo: ~0 rows (aproximadamente)
DELETE FROM `anexo`;
/*!40000 ALTER TABLE `anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `anexo` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.area_evaluada
DROP TABLE IF EXISTS `area_evaluada`;
CREATE TABLE IF NOT EXISTS `area_evaluada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id_encabezado_logis_entrega` int(11) DEFAULT NULL,
  `id_encabezado_bodega` int(11) DEFAULT NULL,
  `id_encabezado_inst_educativa` int(11) DEFAULT NULL,
  `id_encabezado_transporte` int(11) DEFAULT NULL,
  `comentario` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `file_path` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encabezado_logis_entrega` (`id_encabezado_logis_entrega`),
  KEY `fk_encabezado_bodega` (`id_encabezado_bodega`),
  KEY `fk_encabezado_inst_educativa` (`id_encabezado_inst_educativa`),
  KEY `fk_encabezado_transporte` (`id_encabezado_transporte`),
  CONSTRAINT `fk_encabezado_bodega` FOREIGN KEY (`id_encabezado_bodega`) REFERENCES `encabezado_bodega` (`id`),
  CONSTRAINT `fk_encabezado_inst_educativa` FOREIGN KEY (`id_encabezado_inst_educativa`) REFERENCES `encabezado_inst_educativa` (`id`),
  CONSTRAINT `fk_encabezado_logis_entrega` FOREIGN KEY (`id_encabezado_logis_entrega`) REFERENCES `encabezado_logistica_entrega` (`id`),
  CONSTRAINT `fk_encabezado_transporte` FOREIGN KEY (`id_encabezado_transporte`) REFERENCES `encabezado_transporte` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.area_evaluada: ~0 rows (aproximadamente)
DELETE FROM `area_evaluada`;
/*!40000 ALTER TABLE `area_evaluada` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_evaluada` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.aspecto_evaluado
DROP TABLE IF EXISTS `aspecto_evaluado`;
CREATE TABLE IF NOT EXISTS `aspecto_evaluado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area_evaluada` int(11) NOT NULL,
  `nombre` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `total_items_cumple` int(11) DEFAULT NULL,
  `total_items_no_cumple` int(11) DEFAULT NULL,
  `porcentaje_cumplimiento` decimal(5,2) DEFAULT NULL,
  `total_items_no_aplica` int(11) DEFAULT NULL,
  `total_items_no_observa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_area_evaluada` (`id_area_evaluada`),
  CONSTRAINT `fk_area_evaluada` FOREIGN KEY (`id_area_evaluada`) REFERENCES `area_evaluada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.aspecto_evaluado: ~0 rows (aproximadamente)
DELETE FROM `aspecto_evaluado`;
/*!40000 ALTER TABLE `aspecto_evaluado` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspecto_evaluado` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.configuracion
DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE IF NOT EXISTS `configuracion` (
  `nombre` varchar(30) NOT NULL,
  `valor` varchar(30) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla paebd.configuracion: ~2 rows (aproximadamente)
DELETE FROM `configuracion`;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` (`nombre`, `valor`) VALUES
	('path', 'online'),
	('unidad', 'D');
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.encabezado_bodega
DROP TABLE IF EXISTS `encabezado_bodega`;
CREATE TABLE IF NOT EXISTS `encabezado_bodega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_subregion` int(11) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `modelo_operacion` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nombre_proveedor` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `identificacion_proveedor` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `producto_suministra` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `tipo_modalidad` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `telefono_proveedor` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `direccion_proveedor` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `fecha_visita` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `hora_visita` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `recibe_visita` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `realiza_visita` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `identificacion_recibe_visita` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `identificacion_realiza_visita` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `email_proveedor` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipio_bodega` (`id_municipio`),
  KEY `fk_subregion_bodega` (`id_subregion`),
  CONSTRAINT `fk_municipio_bodega` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `fk_subregion_bodega` FOREIGN KEY (`id_subregion`) REFERENCES `subregion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.encabezado_bodega: ~0 rows (aproximadamente)
DELETE FROM `encabezado_bodega`;
/*!40000 ALTER TABLE `encabezado_bodega` DISABLE KEYS */;
/*!40000 ALTER TABLE `encabezado_bodega` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.encabezado_inst_educativa
DROP TABLE IF EXISTS `encabezado_inst_educativa`;
CREATE TABLE IF NOT EXISTS `encabezado_inst_educativa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_subregion` int(11) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `corregimiento` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `fecha_visita` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `barrio_o_vereda` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `modelo_operacion` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `nombre_inst_educativa` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `nombre_sede_educativa` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `codigo_dane` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nombre_rector` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `telefono_rector` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `docente_encargado_programa` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `telefono_docente_encargado` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nombre_manipulador_alimento` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `telefono_manipulador_alimento` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `profesional_realiza_visita` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `cargo_profesional_visita` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `niños_matri_primaria` int(6) DEFAULT NULL,
  `niños_atiende_restaurante` int(6) DEFAULT NULL,
  `sn_minuta_mejorada` bit(1) DEFAULT NULL,
  `modalidad_atencion` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `cupos_atendidos_governacion` int(6) DEFAULT NULL,
  `escolares_matri_secundaria` int(6) DEFAULT NULL,
  `indigenas` int(6) DEFAULT NULL,
  `desplazados` int(6) DEFAULT NULL,
  `discapacitados` int(6) DEFAULT NULL,
  `sn_cobertura_poblacion_pae` bit(1) DEFAULT NULL,
  `sn_existe_cobro_participacion` bit(1) DEFAULT NULL,
  `valor_cobro_participacion` int(20) DEFAULT NULL,
  `cupos_atendidos_municipio` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipio_inst_educativa` (`id_municipio`),
  KEY `fk_subregion_inst_educativa` (`id_subregion`),
  CONSTRAINT `fk_municipio_inst_educativa` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `fk_subregion_inst_educativa` FOREIGN KEY (`id_subregion`) REFERENCES `subregion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.encabezado_inst_educativa: ~0 rows (aproximadamente)
DELETE FROM `encabezado_inst_educativa`;
/*!40000 ALTER TABLE `encabezado_inst_educativa` DISABLE KEYS */;
/*!40000 ALTER TABLE `encabezado_inst_educativa` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.encabezado_logistica_entrega
DROP TABLE IF EXISTS `encabezado_logistica_entrega`;
CREATE TABLE IF NOT EXISTS `encabezado_logistica_entrega` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_subregion` int(11) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `operador` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `sn_proveedor_local` bit(1) DEFAULT NULL,
  `nombre_proveedor` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `identificacion_proveedor` varchar(60) COLLATE utf8_bin DEFAULT NULL,
  `telefono_proveedor` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `direccion_proveedor` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `fecha_entrega` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `hora_inicio` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `hora_final` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `responsable_entrega` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `responsable_recepcion` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `semanas_entregadas` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `dias_entregados` int(11) DEFAULT NULL,
  `desde` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `hasta` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipio` (`id_municipio`),
  KEY `fk_subregion` (`id_subregion`),
  CONSTRAINT `fk_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `fk_subregion` FOREIGN KEY (`id_subregion`) REFERENCES `subregion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.encabezado_logistica_entrega: ~0 rows (aproximadamente)
DELETE FROM `encabezado_logistica_entrega`;
/*!40000 ALTER TABLE `encabezado_logistica_entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `encabezado_logistica_entrega` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.encabezado_transporte
DROP TABLE IF EXISTS `encabezado_transporte`;
CREATE TABLE IF NOT EXISTS `encabezado_transporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_visita` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_subregion` int(11) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `operador` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `nombre_proveedor` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `alimento_provee` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `telefono_proveedor` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `direccion_proveedor` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `transporte_cabecera_municipal` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `transporte_unidad_aplicativa` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipio_transporte` (`id_municipio`),
  KEY `fk_subregion_transporte` (`id_subregion`),
  CONSTRAINT `fk_municipio_transporte` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`),
  CONSTRAINT `fk_subregion_transporte` FOREIGN KEY (`id_subregion`) REFERENCES `subregion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.encabezado_transporte: ~0 rows (aproximadamente)
DELETE FROM `encabezado_transporte`;
/*!40000 ALTER TABLE `encabezado_transporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `encabezado_transporte` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.estado_pregunta
DROP TABLE IF EXISTS `estado_pregunta`;
CREATE TABLE IF NOT EXISTS `estado_pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.estado_pregunta: ~4 rows (aproximadamente)
DELETE FROM `estado_pregunta`;
/*!40000 ALTER TABLE `estado_pregunta` DISABLE KEYS */;
INSERT INTO `estado_pregunta` (`id`, `descripcion`) VALUES
	(1, 'Cumple'),
	(2, 'No Cumple'),
	(3, 'No Aplica'),
	(4, 'No Observa');
/*!40000 ALTER TABLE `estado_pregunta` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.item_evaluado
DROP TABLE IF EXISTS `item_evaluado`;
CREATE TABLE IF NOT EXISTS `item_evaluado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_aspecto_evaluado` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL,
  `id_estado_pregunta` int(1) DEFAULT NULL,
  `observaciones` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pregunta` (`id_pregunta`),
  KEY `fk_estado_pregunta` (`id_estado_pregunta`),
  KEY `fk_aspecto_eval_item` (`id_aspecto_evaluado`),
  CONSTRAINT `fk_aspecto_eval_item` FOREIGN KEY (`id_aspecto_evaluado`) REFERENCES `aspecto_evaluado` (`id`),
  CONSTRAINT `fk_estado_pregunta` FOREIGN KEY (`id_estado_pregunta`) REFERENCES `estado_pregunta` (`id`),
  CONSTRAINT `fk_pregunta` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.item_evaluado: ~0 rows (aproximadamente)
DELETE FROM `item_evaluado`;
/*!40000 ALTER TABLE `item_evaluado` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_evaluado` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.municipio
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE IF NOT EXISTS `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `id_subregion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_subregion` (`id_subregion`),
  CONSTRAINT `fk_id_subregion` FOREIGN KEY (`id_subregion`) REFERENCES `subregion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla paebd.municipio: ~125 rows (aproximadamente)
DELETE FROM `municipio`;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` (`id`, `nombre`, `codigo`, `id_subregion`) VALUES
	(1, 'Caucasia', NULL, 1),
	(2, 'Cáceres', NULL, 1),
	(3, 'El bagre', NULL, 1),
	(4, 'Nechí', NULL, 1),
	(5, 'Tarazá', NULL, 1),
	(6, 'Zaragoza', NULL, 1),
	(7, 'Caracolí', NULL, 2),
	(8, 'Maceo', NULL, 2),
	(9, 'Puerto Berrío', NULL, 2),
	(10, 'Puerto Nare', NULL, 2),
	(11, 'Puert Triunfo', NULL, 2),
	(12, 'Yondó', NULL, 2),
	(13, 'Angostura', NULL, 3),
	(14, 'Belimira', NULL, 3),
	(15, 'Briceño', NULL, 3),
	(16, 'Campamento', NULL, 3),
	(17, 'Carolina del Príncipe', NULL, 3),
	(18, 'Donmatías', NULL, 3),
	(19, 'Entrerríos', NULL, 3),
	(20, 'Gómez Plata', NULL, 3),
	(21, 'Guadalupe', NULL, 3),
	(22, 'Ituango', NULL, 3),
	(23, 'San Andrés de Cuerquía', NULL, 3),
	(24, 'San José de la Montaña', NULL, 3),
	(25, 'San Pedro de los milagros', NULL, 3),
	(26, 'Santa Rosa de Osos ', NULL, 3),
	(27, 'Toledo', NULL, 3),
	(28, 'Valdivia', NULL, 3),
	(29, 'Yamural', NULL, 3),
	(30, 'Abriaquí', NULL, 4),
	(31, 'Anzá', NULL, 4),
	(32, 'Armenia', NULL, 4),
	(33, 'Buritacá', NULL, 4),
	(34, 'Cañasgordas', NULL, 4),
	(35, 'Dabeiba', NULL, 4),
	(36, 'Ebejicó', NULL, 4),
	(37, 'Frontino', NULL, 4),
	(38, 'Giraldo', NULL, 4),
	(39, 'Heliconia', NULL, 4),
	(40, 'Liborina', NULL, 4),
	(41, 'Olaya', NULL, 4),
	(42, 'Peque', NULL, 4),
	(43, 'Sabanalarga', NULL, 4),
	(44, 'San Jerónimo', NULL, 4),
	(45, 'Santa Fé de Antioquia', NULL, 4),
	(46, 'Uramita', NULL, 4),
	(47, 'Sopetrán', NULL, 4),
	(48, 'Caicedo', NULL, 4),
	(49, 'Amagá', NULL, 5),
	(50, 'Andes', NULL, 5),
	(51, 'Angelópolis', NULL, 5),
	(52, 'Betania', NULL, 5),
	(53, 'Betulia', NULL, 5),
	(54, 'Caramanta', NULL, 5),
	(55, 'Ciudad Bolívar', NULL, 5),
	(56, 'Concordia', NULL, 5),
	(57, 'Fredonia', NULL, 5),
	(58, 'Hispania', NULL, 5),
	(59, 'Jardín', NULL, 5),
	(60, 'Jericó', NULL, 5),
	(61, 'La pintada', NULL, 5),
	(62, 'Montebello', NULL, 5),
	(63, 'Pueblorrico', NULL, 5),
	(64, 'Salgar', NULL, 5),
	(65, 'Santa Bárbara', NULL, 5),
	(66, 'Támesis', NULL, 5),
	(67, 'Tarso', NULL, 5),
	(68, 'Titiribí', NULL, 5),
	(69, 'Urrao', NULL, 5),
	(70, 'Valparaíso', NULL, 5),
	(71, 'Venecia', NULL, 5),
	(72, 'Apartadó', NULL, 6),
	(73, 'Arboletes', NULL, 6),
	(74, 'Carepa', NULL, 6),
	(75, 'Chigorodó', NULL, 6),
	(76, 'Murindó', NULL, 6),
	(77, 'Mutatá', NULL, 6),
	(78, 'Necoclí', NULL, 6),
	(79, 'San Juan de Urabá', NULL, 6),
	(80, 'San Pedro de Urabá', NULL, 6),
	(81, 'Turbo', NULL, 6),
	(82, 'Vigía del Fuerte', NULL, 6),
	(83, 'Amalfi', NULL, 7),
	(84, 'Anorí', NULL, 7),
	(85, 'Cisneros', NULL, 7),
	(86, 'Remedios', NULL, 7),
	(87, 'San Roque', NULL, 7),
	(88, 'Santo Domingo', NULL, 7),
	(89, 'Segovia', NULL, 7),
	(90, 'Vegachí', NULL, 7),
	(91, 'Yalí', NULL, 7),
	(92, 'Yolombó', NULL, 7),
	(93, 'Abejorral', NULL, 8),
	(94, 'Alejandría', NULL, 8),
	(95, 'Argelia', NULL, 8),
	(96, 'Cocorná', NULL, 8),
	(97, 'Concepción', NULL, 8),
	(98, 'El Carmen de Viboral', NULL, 8),
	(99, 'El Peñol', NULL, 8),
	(100, 'El Retiro', NULL, 8),
	(101, 'El Santuario', NULL, 8),
	(102, 'Granada', NULL, 8),
	(103, 'Guarne', NULL, 8),
	(104, 'Guatapé', NULL, 8),
	(105, 'La Ceja', NULL, 8),
	(106, 'La Unión', NULL, 8),
	(107, 'Marinilla', NULL, 8),
	(108, 'Nariño', NULL, 8),
	(109, 'Rionegro', NULL, 8),
	(110, 'San Carlos', NULL, 8),
	(111, 'San Francisco', NULL, 8),
	(112, 'San Luis', NULL, 8),
	(113, 'San Rafael', NULL, 8),
	(114, 'San Vicente', NULL, 8),
	(115, 'Sonsón', NULL, 8),
	(116, 'Barbosa', NULL, 9),
	(117, 'Bello', NULL, 9),
	(118, 'Caldas', NULL, 9),
	(119, 'Copacabana', NULL, 9),
	(120, 'Envigado', NULL, 9),
	(121, 'Girardota', NULL, 9),
	(122, 'Itagui', NULL, 9),
	(123, 'La Estrella', NULL, 9),
	(124, 'Medellín', NULL, 9),
	(125, 'Sabaneta', NULL, 9);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.pregunta
DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE IF NOT EXISTS `pregunta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla paebd.pregunta: ~96 rows (aproximadamente)
DELETE FROM `pregunta`;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` (`id`, `descripcion`) VALUES
	(1, 'Se entrega en la fecha y hora concertada con el operador/proveedor.'),
	(2, 'Cumplen con las cantidades solicitadas de cada producto según lista de entrega de víveres.'),
	(3, 'Cumplen con las unidades de medida de cada producto según lista de entrega de víveres.'),
	(4, 'La calidad de los alimentos es buena, en cuanto a color, olor, textura (apariencia física).'),
	(5, 'Los productos se organizan en paquetes según programación y acta de víveres para cada unidad aplicativa.'),
	(6, 'El almacenamiento de los productos permite la conservación y calidad de los mismos.'),
	(7, 'Los productos recibidos cumplen las marcas autorizadas por la GSAN y/o Municipio.'),
	(8, 'El producto devuelto o faltante se repone antes de las 24 horas siguientes a la entrega para no afectar la Programación'),
	(9, 'Los alrededores se conservarán en perfecto estado de aseo, libres de focos de descontaminacnión.'),
	(10, 'La edificación está diseñada y construida de manera que proteja los ambientes e impida la entrada de polvo, lluvia, suciedades u otros contaminantes, así como del ingreso y refugio de plagas animales domésticos.'),
	(11, 'Los pisos están construidos con materiales resistentes, no porosos, impermeables, no absorbentes, no deslizantes y con acabados libres de grietas o defectos que dificulten la limpieza, desinfección y manteminiento sanitario.'),
	(12, 'Las paredes son de material resistente,impermeables, no absorbentes y son de facíl limpieza y desinfección.'),
	(13, 'Los techos están diseñados y construidos de manera que se evite la acumulación de suciedad y además facilitan la limpieza y el mantenimiento.'),
	(14, 'Las ventanas y otras aberturas en las paredes están construidas para evitar la acumulacion de polvo y están provistas con malla anti insectos de fácil limpieza y mantenimiento.'),
	(15, 'Las puertas son resistentes, de fácil limpieza y mantenimiento y sus aberturas entre las puertas exteriores y los pisos no son mayores del 1 cm.'),
	(16, 'Cuenta con adecuada y suficiente iluminacion natural y/o artificial.'),
	(17, 'Las lámparas y accesorios ubicados por encima de las materias primas, insumos y productos están protegidas para evitar la contaminacion en caso de ruptura.'),
	(18, 'Poseen sistema de ventilación directa o indirecta, las aberturas para circulacion del aire están protegidas con mallas fácilmente removibles para su limpieza y mantenimiento.'),
	(19, 'Las instalaciones se mantienen limpias y en buenas condiciones higiénicas.'),
	(20, 'El personal manipulador de alimentos cuenta con certificado de capacitacion BPM.'),
	(21, 'El personal manipulador de alimentos cuenta con certificación médica y análisis de laboratorio.'),
	(22, 'El personal manipulador no utiliza joyas, aretes, anillos, etc.'),
	(23, 'Cuenta con concepto favorable y se encuentra vigente.'),
	(24, 'Cuenta con plan de saneamiento básico: plan de limpieza y desnfección, plan de control de plagas y adecuado manejo de desechos sólidos.'),
	(25, 'Se evidencia registros de los programas de saneamiento básico.'),
	(26, 'Cuenta con avisos alucivos a las BPM.'),
	(27, 'Cuenta con listado de marcas aprobadas actualizadas por el programa.'),
	(28, 'Las cantidades de víveres despachados corresponde a los cupos y días a atender por cada Unidad de Servicio.'),
	(29, 'Los productos registrados cuentan con registro sanitario e invima.'),
	(30, 'Los productos suministrados cumplen con las normas de rotulado.'),
	(31, 'Los productos suministrados se entregan en su empaque y envase original.'),
	(32, 'Se cuenta con soportes de la visita mensual por parte del operador para verificación del cumplimiento del derecho 3075 de 1997, formato ESC_05_operadores_proveedores.'),
	(33, 'Copia del plan de mejoramiento, en caso que la evaluación no sea satisfactoria y su respectivo seguimiento. (Generado por el municipio o interventoría u operador)'),
	(34, 'Se evidencian actas de visita o acompañamiento por parte del operador durante la entrega de viveres.'),
	(35, 'El transporte se realiza en condiciones tales que excluye la contaminación y/o la proliferación de microorganismos y protege contra la alteración del alimento o los daños del envase.'),
	(36, 'Los alimentos y materias primas que por su naturaleza requieran mantenerse refrigerados o congelados son transportados y distribuidos bajo condiciones que aseguren y garanticen el mantenimiento el mantenimiento de las condiciones de refrigeración o congelación hasta su destino final.'),
	(37, 'Los vehículos que posean sistemas de refrigeración o congelación, son sometidos a revisión periódica, con el fin de que su funcionamiento garantice las temperaturas requeridas para la buena conservación de los alimentos y contarán con indicadores y sistemas de registro de estas temperaturas.'),
	(38, 'Se revisan los vehículos antes de cargar los alimentos, con el fin de asegurar que se encuentren en buenas condiciones sanitarias.'),
	(39, 'Los vehículos son adecuados para el fin perseguido y fabricados con materiales tales que permitan una limpieza fácil y completa.'),
	(40, 'Se evidencian elementos para evitar el contacto de los alimentos directamente con el piso del vehículo.'),
	(41, 'Se transportan conjuntamente en un mismo vehículo alimentos y materias primas con sustancias peligrosas y otras que por  su naturaleza representen riesgo  de contaminación del alimento.'),
	(42, 'Los vehículos transportadores de alimentos llevan en su exterior en forma claramente visible la leyenda: Transporte de Alimentos.'),
	(43, 'Se da cumplimiento a la minuta patrón y ciclo de minutas empleadas por el operador del programa.'),
	(44, 'El restaurante escolar cuenta con la minuta actualizada del Programa.'),
	(45, 'La minuta se encuentra publicada en un lugar visible del restaurante escolar.'),
	(46, 'Existe un control diario sobre las raciones entregadas a los beneficiarios del servicio en el establecimiento educativo. (Formato control de ración servida en físico).'),
	(47, 'El Formato de Control de raciones se encuentra debidamente diligenciado.'),
	(48, 'La cantidad de los alimentos está acorde con el acta de entrega de víveres.'),
	(49, 'Existen avisos que refuercen las normas de BPM, en el restaurante escolar orientados a los docentes, escolares y manipuladoras de alimentos.'),
	(50, 'En la Institución Educativa se evidencia conformación y acciones de Comité Institucional del PAE (Acta conformación, Reuniones, etc.)'),
	(51, 'El restaurante escolar se encuentra aislado de focos de insalubridad que representen riesgos potenciales para la contaminación de los alimentos.'),
	(52, 'Se evidencia la presencia de animales en el área del restaurante escolar.'),
	(53, 'El restaurante escolar cuenta con agua potable.'),
	(54, 'Frente a la ausencia de agua potable se cuenta con plan de contingencia para la preparación de bebidas (jugos, avenas).'),
	(55, 'Los residuos sólidos generados son ubicados de manera tal que no representen riesgo de contaminación al alimento, a los ambientes o superficies de potencial contacto con este y son removidos frecuentemente del área de preparación.'),
	(56, 'Hay avisos que recuerden a las personas la necesidad de lavarse las manos después de ir al baño, antes de comer, al cambiar de actividad y antes de preparar los alimentos.'),
	(57, 'Las ventanas y aberturas poseen mallas anti-insectos y permite ventilar el lugar. (Diagnóstico Resolución 2674/2013).'),
	(58, 'La Institución Educativa cuenta con comedor escolar.'),
	(59, 'El servicio del Programa de Alimentación Escolar se presta por turnos'),
	(60, 'Dentro de la unidad de Servicio no se evidencian unidades sanitarias'),
	(61, 'La unidad aplicativa cuenta con suficientes equipos (fogón, nevera, licuadora) para la producción de los alimentos y están en buen estado.'),
	(62, 'La unidad aplicativa cuenta con suficientes utensilios (olla, vasijas, cucharas mezcladores, etc) para la producción de los alimentos en material sanitario resistente al uso y a la corrosión.'),
	(63, 'La Unidad Aplicativa cuenta con mesas, sillas y menaje (plato, vaso o pocillo, cucharas) suficientes para la atención de los niños y las niñas participantes del PAE.'),
	(64, 'Las superficies en contacto directo con el alimento poseen acabado liso, no poroso, no absorbente, libres de grietas o irregularidades que puedan atrapar partículas de alimentos o microrganismos que afectan la inocuidad de los alimentos.'),
	(65, 'Las materias primas se someten a limpieza con agua potable u otro medio adecuado de ser requerido y, si le aplica, a la descontaminación previa a la etapa de preparación.'),
	(66, 'El almacenamiento de los alimentos refrigerados se realiza a temperaturas	entre 0°C a 4°C y se llevan registros.'),
	(67, 'El almacenamiento de alimentos congelados se realiza a temperaturas de -18°C y se llevan registros.'),
	(68, 'Los alimentos se almacenan en condiciones que garantizan la calidad e inocuidad de estos, en recipientes de material sanitario, sobre estibas, en óptimas condiciones de higiene.'),
	(69, 'Los productos que se encuentran empacados y rotulados, cumplen con la normatividad sanitaria vigente. Resolución 5109/2005.'),
	(70, 'Los productos se encuentran dentro de su vida útil, con fecha de vencimiento vigente y son aptos para el consumo.'),
	(71, 'Las operaciones de preparación se realizan en forma secuencial y continua para que no se produzcan retrasos indebidos que permitan el crecimiento de microorganismos y contribuyan a otros tipos de deterioro o contaminación de alimento.'),
	(72, 'Los procedimientos mecánicos de manufactura, tales como, lavar, pelar, cortar, clasificar, desmenuzar, extraer, batir, secar, entre otros, se realizan de manera tal que se protejan los alimentos y las materias primas de la contaminación.'),
	(73, 'Se evidencian utensilios, superficies u otros, en material de vidrio que puedan ocasionar riesgo de contaminación a los alimentos por ruptura.'),
	(74, 'Se lleva un control de entradas y salidas, Kárdex y rotación de productos - PEPS.'),
	(75, 'Se evidencian alimentos no conformes, que no estén debidamente separados e identificados.'),
	(76, 'Se conserva la temperatura de los alimentos, según características de los mismos, hasta el momento de la distribución.'),
	(77, 'Durante el proceso de distribución de alimentos se toman medidas para la protección de los mismos.'),
	(78, 'Se evidencia un Plan de Saneamiento en la Institución. (físico).'),
	(79, 'El Plan de Saneamiento cuenta con los cuatro programas básicos (limpieza y desinfección, manejo de residuos sólidos, control de plagas y vectores y Abastecimiento de Aguas).'),
	(80, 'Se registran las diferentes acciones relacionadas en el plan de saneamiento (procedimientos, periodicidad, responsable).'),
	(81, 'Se cuenta con los insumos necesarios para realizar los procedimientos de limpieza y desinfección.'),
	(82, 'Los plaguicidas, detergentes, desinfectantes y otras sustancias peligrosas se encuentran almacenados en áreas independientes con separación física y están debidamente identificadas.'),
	(83, 'La institución cuenta con acta de inspección sanitaria por parte de la entidad competente.'),
	(84, ' El personal manipulador de alimentos dispone de certificados de salud vigente.'),
	(85, 'El personal manipulador de alimentos dispone de certificados de manipulación de alimentos vigente.'),
	(86, 'El personal manipulador de alimentos utiliza la vestimenta adecuada (delantal, calzado tapado, tapa bocas, gorro).'),
	(87, 'El personal manipulador no usa aretes, argollas, joyas u otros accesorios.'),
	(88, 'El personal Manipulador conoce como se realizan los procesos de Limpieza y Desinfección (Cantidad Desinfectante, Periodicidad).'),
	(89, 'El docente responsable conoce el número de cupos asignados a la unidad aplicativa'),
	(90, 'El docente responsable conoce la cantidad de alimentos que le debe llegar en cada entrega.'),
	(91, 'El docente responsable conoce la calidad de los alimentos que le debe llegar (marcas, gramaje, presentación).'),
	(92, 'El docente responsable conoce los procedimientos para la realización para el reporte de anomalías e inconsistencias.'),
	(93, 'Cuando se presentan inconsistencias en la entrega de víveres el docente realiza reclamos.'),
	(94, 'Los productos enviados por el proveedor cumplen con las especificaciones de calidad.'),
	(95, 'Los productos enviados por el proveedor cumplen con las especificaciones de cantidad.'),
	(96, 'Se realiza una entrega oportuna por parte del operador que permita dar cumplimiento al ciclo de menú.');
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.responsable
DROP TABLE IF EXISTS `responsable`;
CREATE TABLE IF NOT EXISTS `responsable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_area_evaluada` int(11) DEFAULT NULL,
  `nombre` varchar(70) COLLATE utf8_bin DEFAULT NULL,
  `documento_identidad` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `cargo` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `telefono` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `firma` mediumblob,
  PRIMARY KEY (`id`),
  KEY `fk_area_evaluada_responsable` (`id_area_evaluada`),
  CONSTRAINT `fk_area_evaluada_responsable` FOREIGN KEY (`id_area_evaluada`) REFERENCES `area_evaluada` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.responsable: ~0 rows (aproximadamente)
DELETE FROM `responsable`;
/*!40000 ALTER TABLE `responsable` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsable` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.subregion
DROP TABLE IF EXISTS `subregion`;
CREATE TABLE IF NOT EXISTS `subregion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Volcando datos para la tabla paebd.subregion: ~9 rows (aproximadamente)
DELETE FROM `subregion`;
/*!40000 ALTER TABLE `subregion` DISABLE KEYS */;
INSERT INTO `subregion` (`id`, `nombre`) VALUES
	(1, 'Bajo Cauca'),
	(2, 'Magdalena Medio'),
	(3, 'Norte'),
	(4, 'Occidente'),
	(5, 'Suroeste'),
	(6, 'Urabá'),
	(7, 'Nordeste'),
	(8, 'Oriente'),
	(9, 'Valle de Aburra');
/*!40000 ALTER TABLE `subregion` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla paebd.users: ~2 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
	('alex', '123456', 1),
	('edward', '123456', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla paebd.user_roles
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla paebd.user_roles: ~3 rows (aproximadamente)
DELETE FROM `user_roles`;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
	(2, 'edward', 'ROLE_ADMIN'),
	(3, 'alex', 'ROLE_USER'),
	(1, 'edward', 'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
