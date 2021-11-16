-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2021 a las 14:53:14
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_stock`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_depreciacion` ()  BEGIN 
	DECLARE done INT DEFAULT 0;
    DECLARE fecha,actual DATE;
    DECLARE id_product,num INT;
    DECLARE cur_producto CURSOR FOR SELECT 
    id_producto_E,fecha_depreciacion FROM producto_especifico;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN cur_producto;
    
    SET actual = (SELECT Date_format(now(),'%Y-%m-%d'));
    
    read_loop : LOOP
	FETCH cur_producto INTO id_product,fecha;
        IF done = 1 THEN
        LEAVE read_loop;
    	END IF;
    SET num = (fecha - actual);
    SELECT id_product, fecha, actual,num;
    
    IF num <= 0 THEN
    	UPDATE producto_especifico SET alerta = true, enviado = false
        WHERE id_producto_E = id_product;
    ELSE 
    	UPDATE producto_especifico SET alerta = false, enviado = false
        WHERE id_producto_E = id_product;
    END IF;

END LOOP;
    
CLOSE cur_producto;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(10) NOT NULL,
  `codigo_area` varchar(10) NOT NULL,
  `nombre_area` varchar(45) NOT NULL,
  `id_sede` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `codigo_area`, `nombre_area`, `id_sede`) VALUES
(1, '16081', 'Operación Antonio Varas', 1),
(2, '1608198', 'Biblioteca', 1),
(3, '1608199', 'Cetecom', 1),
(4, '1608202', 'Servicios Generales', 1),
(5, '16089', 'Coordinador De Pastoral', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_costo`
--

CREATE TABLE `centro_costo` (
  `codigo_centro_costo` varchar(10) NOT NULL,
  `nombre_centro_costo` varchar(100) NOT NULL,
  `fecha_compra_centro_costo` date DEFAULT NULL,
  `totalGasto_centro_costo` int(11) DEFAULT NULL,
  `id_area` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `centro_costo`
--

INSERT INTO `centro_costo` (`codigo_centro_costo`, `nombre_centro_costo`, `fecha_compra_centro_costo`, `totalGasto_centro_costo`, `id_area`) VALUES
('16081', 'Operación Antonio Varas', '2021-04-17', 150000, 1),
('1608186', 'HR central en sedes', '2021-04-17', 150000, 1),
('1608187', 'Operación DDT', '2021-04-17', 150000, 1),
('1608189', 'Examinaciones Transversales', '2021-04-17', 150000, 1),
('1608198', 'Biblioteca', '2021-04-17', 150000, 1),
('1608199', 'Cetecom', '2021-04-17', 150000, 1),
('1608200', 'Prog. De Ingles en Sede', '2021-04-17', 150000, 1),
('1608207', 'Programa Lenguaje DS', '2021-04-17', 150000, 1),
('1608208', 'Programa Matemática DS', '2021-04-17', 150000, 1),
('1608209', 'Programa Ética DS', '2021-04-17', 150000, 1),
('1608210', 'Pastoral Distr en Sede ', '2021-04-17', 150000, 1),
('1608211', 'Misiones Solid Sedes', '2021-04-17', 150000, 1),
('1608212', 'Misiones Solid Sedes Distr', '2021-04-17', 150000, 1),
('1608215', 'Programa Etica S', '2021-04-17', 150000, 1),
('1608217', 'Seg Accid Alumnos/SPA DS', '2021-04-17', 150000, 1),
('1608601', 'Comunicación Y Difusión', '2021-04-17', 150000, 1),
('1608603', 'Publicidad Central en Sede', '2021-04-17', 150000, 1),
('160871', 'Deportes sedes', '2021-04-17', 150000, 1),
('160872', 'DAE central en sedes', '2021-04-17', 150000, 1),
('160873', 'Deportes DS', '2021-04-17', 150000, 1),
('160874', 'Empleabilidad e Ins Lab Sede', '2021-04-17', 150000, 1),
('160875', 'Empleabilidad e Ins Lab DSs', '2021-04-17', 150000, 1),
('160876', 'Actividades Institucionales en Sedes ', '2021-04-17', 150000, 1),
('16089', 'Coordinador De Pastoral', '2021-04-17', 150000, 1),
('AA102', 'Area Administrativa', '2020-10-14', 50000, 1),
('ADF515', 'Área RR.HH.', '2020-10-21', 100000, 1),
('AF103', 'Area Financiera', '2020-09-09', 50000, 1),
('ARD218', 'Ovalle', '2020-10-19', 500000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE `comuna` (
  `id_comuna` int(10) NOT NULL,
  `nombre_comuna` varchar(50) NOT NULL,
  `id_region` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`id_comuna`, `nombre_comuna`, `id_region`) VALUES
(1, 'Providencia', 7),
(2, 'La Florida', 7),
(3, 'Puente Alto', 7),
(4, 'San Bernardo', 7),
(5, 'Las Condes', 7),
(6, 'San Joaquín', 7),
(7, 'Valparaíso', 6),
(8, 'Viña del Mar', 6),
(9, 'Arauco', 11),
(10, 'Concepción', 11),
(11, 'Villarrica', 12),
(12, 'Santiago', 7),
(13, 'Puerto Montt', 14),
(14, 'Maipú', 7),
(15, 'Melipilla', 7),
(16, 'Huechuraba', 7),
(17, 'Cerrillos', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inventario`
--

CREATE TABLE `detalle_inventario` (
  `id_detalle_inventario` int(10) NOT NULL,
  `cantidad_producto_inventario` int(10) NOT NULL,
  `id_ubicacion` int(10) NOT NULL,
  `id_inventario` int(10) NOT NULL,
  `id_producto_E` int(10) NOT NULL,
  `guia_despacho` varchar(50) NOT NULL,
  `n_compra` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_inventario`
--

INSERT INTO `detalle_inventario` (`id_detalle_inventario`, `cantidad_producto_inventario`, `id_ubicacion`, `id_inventario`, `id_producto_E`, `guia_despacho`, `n_compra`) VALUES
(54, 18, 1, 7, 54, '2', 2),
(55, 18, 1, 7, 55, '2', 2);

--
-- Disparadores `detalle_inventario`
--
DELIMITER $$
CREATE TRIGGER `tr_movimiento_ingreso` AFTER INSERT ON `detalle_inventario` FOR EACH ROW insert into movimiento (`id_ubicacion_nuevo`, `id_producto_e`)VALUES 
 (new.id_ubicacion, new.id_producto_e)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_movimiento_update` BEFORE UPDATE ON `detalle_inventario` FOR EACH ROW INSERT INTO movimiento(`id_ubicacion_original`,  `id_ubicacion_nuevo`, `id_producto_e`)
VALUES(old.id_ubicacion, new.id_ubicacion,  old.`id_producto_e`)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(10) NOT NULL,
  `fecha_inventario` datetime NOT NULL DEFAULT current_timestamp(),
  `descripcion_inventario` varchar(100) NOT NULL,
  `id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id_inventario`, `fecha_inventario`, `descripcion_inventario`, `id_area`) VALUES
(7, '2021-04-21 14:50:04', 'Bodega principal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nombre_menu` varchar(45) NOT NULL,
  `url_menu` varchar(45) NOT NULL,
  `id_menu_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `nombre_menu`, `url_menu`, `id_menu_padre`) VALUES
(0, 'No aplica', '', NULL),
(1, 'No Aplica', '', NULL),
(2, 'Usuario', '', NULL),
(3, 'Agregar Usuario', 'RegistroUsuario.jsp', 2),
(4, 'Listar Usuario', 'ListaUsuario.jsp', 2),
(5, 'Producto', '', NULL),
(6, 'Agregar Producto', 'RegistroProducto.jsp', 5),
(7, 'Listar Productos', 'ListaProducto.jsp', 5),
(8, 'Agregar Producto Especifico', 'RegistrarProductoEsp.jsp', 5),
(9, 'Proveedor', '', NULL),
(10, 'Agregar Proveedor', 'RegistroProveedor.jsp', 9),
(11, 'Lista Proveedores', 'ListaProveedor.jsp', 9),
(12, 'Centro de Costos', '', NULL),
(13, 'Agregar Centro', 'RegistroCentroDeCosto.jsp', 12),
(14, 'Listar Centro de Costos', 'ListaCentroDeCosto.jsp', 12),
(15, 'Carga Masiva de Centro de Costos', 'CargaMasivaCecos.jsp', 12),
(16, 'Sede', '', NULL),
(17, 'Agregar Sede', 'RegistrarSede.jsp', 16),
(18, 'Listar Sede', 'ListaSedes.jsp', 16),
(19, 'Area', '', NULL),
(20, 'Agregar Area', 'RegistrarArea.jsp', 19),
(21, 'Listar Area', 'ListaArea.jsp', 19),
(22, 'Inventario', '', NULL),
(23, 'Agregar Inventario', 'RegistrarInventario.jsp', 22),
(24, 'Listar Inventario', 'ListaInventario.jsp', 22),
(25, 'Tipos de Usuario', '', NULL),
(26, 'Agregar Tipo de Usuario', 'RegistroTipoUsuario.jsp', 25),
(27, 'Listar Tipos de Usuario', 'ListaTipoUsuario.jsp', 25),
(28, 'Menu', '', NULL),
(29, 'Agregar Menu', 'RegistroMenu.jsp', 28),
(30, 'Listar Menu', 'ListaMenu.jsp', 28),
(31, 'Permisos', '', NULL),
(32, 'Agregar Permisos', 'RegistroTipoMenu.jsp', 31),
(33, 'Listar Permisos', 'ListaTipoMenu.jsp', 31),
(45, 'Larvilla', '', NULL),
(47, 'Listar Larvillas', 'ListaLarvilla.jsp', 45),
(48, 'Ubicacion', '', NULL),
(49, 'Agregar Ubicacion', 'RegistroUbicacion.jsp', 48),
(50, 'Lista Ubicacion', 'ListaUbicacion.jsp', 48),
(51, 'Tipo Unidad', '', NULL),
(52, 'Agregar Tipo Unidad', 'RegistrarTipoUnidad.jsp', 51),
(53, 'Listar Tipo Unidad', 'ListaTipoUnidad.jsp', 51),
(54, 'Tipo Producto', '', NULL),
(55, 'Agregar Tipo Producto', 'RegistrarTipoProducto.jsp', 54),
(56, 'Listar Tipo Producto', 'ListaTipoProducto.jsp', 54),
(59, 'Tipo Ubicacion', '', NULL),
(60, 'Agregar Tipo Ubicacion', 'RegistrarTipoUbicacion.jsp', 59),
(61, 'Lista Tipo Ubicacion', 'ListaTipoUbicacion.jsp', 59),
(62, 'Movimiento', '', NULL),
(63, 'Listado de Movimientos', 'listadoMovimiento.jsp', 62),
(64, 'Listado Detalle Inventario', 'ListaDetalleInventario.jsp', 5),
(65, 'CargaMasiva', 'CargaMasivaProducto.jsp', 5),
(66, 'CargaMasivaGenerico', 'CargaMasivaProductoGenerico.jsp', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int(10) NOT NULL,
  `fecha_movimiento` date NOT NULL DEFAULT current_timestamp(),
  `id_ubicacion_original` int(10) DEFAULT NULL,
  `id_ubicacion_nuevo` int(10) NOT NULL,
  `id_producto_e` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_movimiento`, `fecha_movimiento`, `id_ubicacion_original`, `id_ubicacion_nuevo`, `id_producto_e`) VALUES
(39, '2021-05-19', NULL, 1, 54),
(40, '2021-05-19', NULL, 1, 55);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_especifico`
--

CREATE TABLE `producto_especifico` (
  `id_producto_E` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `serial_producto` varchar(50) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_depreciacion` date DEFAULT NULL,
  `alerta` tinyint(1) DEFAULT NULL,
  `enviado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_especifico`
--

INSERT INTO `producto_especifico` (`id_producto_E`, `id_producto`, `serial_producto`, `fecha_creacion`, `fecha_depreciacion`, `alerta`, `enviado`) VALUES
(54, 1, 'J6610', '2021-05-06', '2022-06-25', NULL, NULL),
(55, 1, 'J6610', '2021-05-06', '2022-06-25', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_generico`
--

CREATE TABLE `producto_generico` (
  `id_producto` int(10) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(500) DEFAULT NULL,
  `valor_producto` int(11) NOT NULL,
  `marca_producto` varchar(50) NOT NULL,
  `stock_minimo` int(11) NOT NULL,
  `id_proveedor` int(10) NOT NULL,
  `tipo_producto` tinyint(1) NOT NULL,
  `id_subtipo_producto` int(10) NOT NULL,
  `id_tipo_unidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto_generico`
--

INSERT INTO `producto_generico` (`id_producto`, `nombre_producto`, `descripcion_producto`, `valor_producto`, `marca_producto`, `stock_minimo`, `id_proveedor`, `tipo_producto`, `id_subtipo_producto`, `id_tipo_unidad`) VALUES
(1, 'Jabon', 'Jabon para Baños', 690, 'Le Sancy', 10, 1, 0, 1, 13),
(2, 'Toalla de papel', 'Toalla que absorbe el agua', 690, 'Nova', 10, 1, 0, 1, 13),
(3, 'Alcohol gel', 'Alcohol gel para desinfectar', 690, 'Clinex', 10, 1, 0, 1, 13),
(4, 'Monitor HP 543t', 'Monitor para computador', 77000, 'HP', 1, 1, 1, 2, 13),
(5, 'Teclado HP', 'Teclado en español', 3500, 'HP', 1, 1, 1, 2, 13),
(6, 'Mouse HP', 'Mouse', 3500, 'HP', 1, 1, 1, 2, 13),
(8, 'ULTRABOOK HP ELITEBOOK 840 G3                     ', 'ULTRABOOK HP ELITEBOOK 840 G3                     ', 150000, 'HP', 1, 1, 1, 4, 18),
(9, 'jabon', 'jabon para baÃ±os', 800, 'Loreal', 5, 1, 0, 1, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL,
  `rut_proveedor` varchar(15) NOT NULL,
  `nombre_proveedor` varchar(100) NOT NULL,
  `razonSocial_proveedor` varchar(100) NOT NULL,
  `correo_proveedor` varchar(45) DEFAULT NULL,
  `direccion_proveedor` varchar(45) NOT NULL,
  `fono_proveedor` varchar(15) NOT NULL,
  `id_comuna` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `rut_proveedor`, `nombre_proveedor`, `razonSocial_proveedor`, `correo_proveedor`, `direccion_proveedor`, `fono_proveedor`, `id_comuna`) VALUES
(1, '195655383', 'felipe', 'felipe s.a', 'Santiago@santiago.cl', 'santiagooooo', '45093332', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba`
--

CREATE TABLE `prueba` (
  `rut` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `prueba`
--

INSERT INTO `prueba` (`rut`) VALUES
('admin'),
('19831343-2'),
('informatica'),
('aseo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id_region` int(10) NOT NULL,
  `nombre_region` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id_region`, `nombre_region`) VALUES
(1, 'Región de Arica y Parinacota'),
(2, 'Región de Tarapacá'),
(3, 'Región de Antofagasta'),
(4, 'Región de Atacama'),
(5, 'Región de Coquimbo'),
(6, 'Región de Valparaíso'),
(7, 'Región Metropolitana'),
(8, 'Región del Libertador General Bernardo O´Higgins'),
(9, 'Región del Maule'),
(10, 'Región de Ñuble'),
(11, 'Región del Bío-Bío'),
(12, 'Región de La Araucanía'),
(13, 'Región de Los Ríos'),
(14, 'Región de Los Lagos'),
(15, 'Región de Aysén del General Carlos Ibáñez del Campo'),
(16, 'Región de Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(10) NOT NULL,
  `nombre_sede` varchar(100) NOT NULL,
  `direccion_sede` varchar(200) NOT NULL,
  `id_comuna` int(10) NOT NULL,
  `estado_sede` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id_sede`, `nombre_sede`, `direccion_sede`, `id_comuna`, `estado_sede`) VALUES
(1, 'Sede Antonio Varas', 'Antonio Varas 666, Providencia.', 1, 1),
(2, 'Sede Alameda', ' Av. España 8, Santiago Centro, Metro Estación República (esquina Alameda).', 12, 1),
(4, 'Sede Educación Continua', 'Miguel Claro 337, Providencia, Santiago', 1, 1),
(5, 'Sede Maipú', ' Av. Esquina Blanca 501, Maipú.', 14, 1),
(6, 'Sede Melipilla', 'Serrano 1105, Melipilla.', 15, 1),
(7, 'Sede Padre Alonso de Ovalle', ' Padre Alonso de Ovalle 1586, Santiago Centro', 12, 1),
(8, 'Sede Plaza Norte', 'Calle Nueva 1660, Huechuraba.', 16, 1),
(9, 'Sede Plaza Oeste', 'Av. Américo Vespucio 1501, Mall Plaza Oeste,Cerrillos', 17, 1),
(10, 'Sede Plaza Vespucio', 'Froilán Roa 7107, Mall Plaza Vespucio, La Florida.', 2, 1),
(11, 'Sede Puente Alto', 'Av. Concha y Toro 1340 c/San Carlos, Puente Alto.', 3, 1),
(12, 'Sede San Bernardo', 'Freire 857, San Bernardo.', 4, 1),
(13, 'Sede San Carlos de Apoquindo', 'Camino El Alba 12881, Las Condes.', 5, 1),
(14, 'Sede San Joaquín', 'Av. Vicuña Mackenna 4917, Metro San Joaquín, San Joaquín.', 6, 1),
(15, 'Sede Valparaíso', 'Av. Brasil 2021, esquina Rodríguez, Valparaíso.', 7, 1),
(16, 'Sede Viña del Mar', 'Álvarez 2366, Chorrillos, Viña del Mar.', 8, 1),
(17, 'Campus Arauco', 'Camino a Carampangue N° 1060, Arauco.', 9, 1),
(18, 'Sede San Andrés de Concepción', 'Paicaví 3280 (Sector Rotonda El Trébol), Concepción.', 10, 1),
(19, 'Campus Villarrica', 'Anfión Muñoz 51, Villarrica.', 11, 1),
(20, 'Sede Puerto Montt Egaña', '651, Puerto Montt.', 13, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subtipo_producto`
--

CREATE TABLE `subtipo_producto` (
  `id_subtipo_producto` int(11) NOT NULL,
  `categoria_tipo_producto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subtipo_producto`
--

INSERT INTO `subtipo_producto` (`id_subtipo_producto`, `categoria_tipo_producto`) VALUES
(1, 'Oficina'),
(2, 'Gastronomico'),
(3, 'Ferreteria'),
(4, 'Computacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(10) NOT NULL,
  `descripcion_tipo_documento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_documento`, `descripcion_tipo_documento`) VALUES
(1, 'Factura'),
(2, 'Guía de despacho'),
(3, 'Memorandum interno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_menu`
--

CREATE TABLE `tipo_menu` (
  `id_tipo_menu` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_menu`
--

INSERT INTO `tipo_menu` (`id_tipo_menu`, `id_menu`, `id_tipo_usuario`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1),
(10, 11, 1),
(11, 12, 1),
(12, 13, 1),
(13, 14, 1),
(14, 15, 1),
(15, 16, 1),
(16, 17, 1),
(17, 18, 1),
(18, 19, 1),
(19, 20, 1),
(20, 21, 1),
(21, 22, 1),
(22, 23, 1),
(23, 24, 1),
(24, 25, 1),
(25, 26, 1),
(26, 27, 1),
(27, 28, 1),
(28, 29, 1),
(29, 30, 1),
(30, 31, 1),
(31, 32, 1),
(32, 33, 1),
(33, 48, 1),
(34, 49, 1),
(35, 50, 1),
(36, 51, 1),
(37, 52, 1),
(38, 53, 1),
(39, 54, 1),
(40, 55, 1),
(41, 56, 1),
(42, 59, 1),
(43, 60, 1),
(44, 61, 1),
(45, 5, 2),
(46, 6, 2),
(47, 7, 2),
(48, 8, 2),
(49, 9, 2),
(50, 10, 2),
(53, 62, 1),
(54, 62, 2),
(55, 63, 1),
(56, 63, 2),
(57, 64, 1),
(58, 64, 2),
(59, 65, 1),
(60, 66, 1),
(61, 66, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `id_tipo_movimiento` int(10) NOT NULL,
  `nombre_tipo_movimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`id_tipo_movimiento`, `nombre_tipo_movimiento`) VALUES
(1, 'Ingreso'),
(2, 'Salida'),
(3, 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_unidad`
--

CREATE TABLE `tipo_unidad` (
  `id_tipo_unidad` int(11) NOT NULL,
  `nombre_unidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_unidad`
--

INSERT INTO `tipo_unidad` (`id_tipo_unidad`, `nombre_unidad`) VALUES
(1, 'Kilo'),
(13, 'Litro'),
(14, 'Caja'),
(15, 'Pallet'),
(16, 'Bidón'),
(18, 'Unidad'),
(19, 'Docena'),
(20, '1/2 Docena'),
(21, '1/2 Kilo'),
(22, 'Barril');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `categoria_tipo_usuario` varchar(45) NOT NULL DEFAULT 'Operador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `categoria_tipo_usuario`) VALUES
(1, 'Administrador'),
(2, 'Operador'),
(13, 'Sin Permisos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(10) NOT NULL,
  `codigo_ubicacion` varchar(10) NOT NULL,
  `nombre_ubicacion` varchar(45) DEFAULT NULL,
  `descripcion_ubicacion` varchar(20) NOT NULL,
  `estado_ubicacion` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `codigo_ubicacion`, `nombre_ubicacion`, `descripcion_ubicacion`, `estado_ubicacion`) VALUES
(1, 'B01', 'Bodega 1', 'Bodega principal', 1),
(2, 'LC1', 'Laboratorio de computación 1', 'Laboratorio con comp', 1),
(3, 'LC2', 'Laboratorio de computación 2', 'Laboratorio con comp', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL,
  `rut_usuario` varchar(15) NOT NULL,
  `nombre_usuario` varchar(45) NOT NULL,
  `password_usuario` varchar(45) NOT NULL,
  `ape_paterno_usuario` varchar(45) NOT NULL,
  `ape_materno_usuario` varchar(45) NOT NULL,
  `celular_usuario` varchar(15) NOT NULL,
  `correo_usuario` varchar(45) DEFAULT NULL,
  `direccion_usuario` varchar(45) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `rut_usuario`, `nombre_usuario`, `password_usuario`, `ape_paterno_usuario`, `ape_materno_usuario`, `celular_usuario`, `correo_usuario`, `direccion_usuario`, `id_tipo_usuario`, `id_area`) VALUES
(10, 'admin', 'admin', 'admin', 'admin', 'admin', 'admin', 'ivarasstock@gmail.com', 'admin', 1, 3),
(12, '19831343-2', 'Víctor', '123', 'Guerra', 'Gallardo', '98', 'vguerra06537@gmail.com', 'p', 1, 1),
(13, 'informatica', 'informatica', '1234', 'informatica', 'informatica', 'informatica', 'informatica@gmail.com', 'informatica', 2, 3),
(14, 'aseo', 'aseo', '1234', 'aseo', 'aseo', 'aseo', 'aseo@gmail.com', 'aseo', 2, 1);

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `prueba` AFTER INSERT ON `usuario` FOR EACH ROW insert into prueba VALUES (new.rut_usuario)
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`),
  ADD KEY `fk_Area_Sede_idx` (`id_sede`);

--
-- Indices de la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD PRIMARY KEY (`codigo_centro_costo`),
  ADD KEY `fk_Centro_Costo_Area1` (`id_area`);

--
-- Indices de la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD PRIMARY KEY (`id_comuna`),
  ADD KEY `fk_Comuna_Region` (`id_region`);

--
-- Indices de la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  ADD PRIMARY KEY (`id_detalle_inventario`),
  ADD KEY `fk_Detalle_Inventario_Ubicacion` (`id_ubicacion`),
  ADD KEY `fk_Detalle_Inventario_Inventario` (`id_inventario`),
  ADD KEY `fk_Detalle_Inventario_Producto_especifico` (`id_producto_E`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_area` (`id_area`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `fk_Menu_Menu` (`id_menu_padre`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `fk_Movimiento_Ubicacion` (`id_ubicacion_original`),
  ADD KEY `fk_Movimiento_Ubicacion1` (`id_ubicacion_nuevo`),
  ADD KEY `fk_Movimiento_Especifico` (`id_producto_e`);

--
-- Indices de la tabla `producto_especifico`
--
ALTER TABLE `producto_especifico`
  ADD PRIMARY KEY (`id_producto_E`),
  ADD KEY `fk_Producto_especifico_Producto` (`id_producto`);

--
-- Indices de la tabla `producto_generico`
--
ALTER TABLE `producto_generico`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_Producto_Proveedor` (`id_proveedor`),
  ADD KEY `fk_Producto_Tipo_Producto` (`id_subtipo_producto`),
  ADD KEY `fk_Producto_Tipo_Unidad` (`id_tipo_unidad`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `rut_proveedor` (`rut_proveedor`),
  ADD KEY `fk_Proveedor_Comuna` (`id_comuna`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id_region`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`),
  ADD KEY `fk_Sede_Comuna` (`id_comuna`);

--
-- Indices de la tabla `subtipo_producto`
--
ALTER TABLE `subtipo_producto`
  ADD PRIMARY KEY (`id_subtipo_producto`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  ADD PRIMARY KEY (`id_tipo_menu`),
  ADD KEY `fk_Tipo_Menu_Menu` (`id_menu`),
  ADD KEY `fk_Tipo_Menu_Tipo_Usuario` (`id_tipo_usuario`);

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD PRIMARY KEY (`id_tipo_movimiento`);

--
-- Indices de la tabla `tipo_unidad`
--
ALTER TABLE `tipo_unidad`
  ADD PRIMARY KEY (`id_tipo_unidad`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `rut_usuario` (`rut_usuario`),
  ADD KEY `fk_Usuario_Tipo_Usuario` (`id_tipo_usuario`),
  ADD KEY `id_area` (`id_area`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `comuna`
--
ALTER TABLE `comuna`
  MODIFY `id_comuna` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  MODIFY `id_detalle_inventario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_inventario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id_movimiento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `producto_especifico`
--
ALTER TABLE `producto_especifico`
  MODIFY `id_producto_E` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `producto_generico`
--
ALTER TABLE `producto_generico`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id_region` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id_tipo_documento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  MODIFY `id_tipo_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  MODIFY `id_tipo_movimiento` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `fk_Area_Sede1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `centro_costo`
--
ALTER TABLE `centro_costo`
  ADD CONSTRAINT `fk_Centro_Costo_Area1` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `fk_Comuna_Region1` FOREIGN KEY (`id_region`) REFERENCES `region` (`id_region`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  ADD CONSTRAINT `fk_Detalle_Inventario_Inventario` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id_inventario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Detalle_Inventario_Producto_especifico` FOREIGN KEY (`id_producto_E`) REFERENCES `producto_especifico` (`id_producto_E`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Detalle_Inventario_Ubicacion` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_inventario_area` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_menu` FOREIGN KEY (`id_menu_padre`) REFERENCES `menu` (`id_menu`);

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `FK_movimiento_Especifico` FOREIGN KEY (`id_producto_e`) REFERENCES `producto_especifico` (`id_producto_E`),
  ADD CONSTRAINT `FK_movimiento_ubicacion` FOREIGN KEY (`id_ubicacion_nuevo`) REFERENCES `ubicacion` (`id_ubicacion`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_movimiento_ubicacion1` FOREIGN KEY (`id_ubicacion_original`) REFERENCES `ubicacion` (`id_ubicacion`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto_generico`
--
ALTER TABLE `producto_generico`
  ADD CONSTRAINT `fk_Producto_Proveedor1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Tipo_Producto1` FOREIGN KEY (`id_subtipo_producto`) REFERENCES `subtipo_producto` (`id_subtipo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Producto_Tipo_Unidad1` FOREIGN KEY (`id_tipo_unidad`) REFERENCES `tipo_unidad` (`id_tipo_unidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_Proveedor_Comuna1` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sede`
--
ALTER TABLE `sede`
  ADD CONSTRAINT `fk_Sede_Comuna1` FOREIGN KEY (`id_comuna`) REFERENCES `comuna` (`id_comuna`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_menu`
--
ALTER TABLE `tipo_menu`
  ADD CONSTRAINT `fk_Tipo_Menu_Menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Tipo_Menu_Tipo_Usuario1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Tipo_Usuario1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_area` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
