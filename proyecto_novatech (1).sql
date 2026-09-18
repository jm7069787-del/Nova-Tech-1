-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2026 a las 02:59:23
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_novatech`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(100) NOT NULL,
  `id_ssn` int(9) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `estado_carrito` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_ssn`, `fecha_creacion`, `estado_carrito`) VALUES
(291, 536789012, '2026-09-06', 'Activo'),
(347, 12345689, '2026-09-01', 'Activo'),
(426, 314567890, '2026-09-04', 'Abandonado'),
(515, 869012345, '2026-09-09', 'Abandonado'),
(582, 234567891, '2026-09-02', 'Comprado'),
(674, 647890123, '2026-09-07', 'Comprado'),
(719, 281234567, '2026-09-03', 'Activo'),
(802, 970123456, '2026-09-10', 'Comprado'),
(853, 425678901, '2026-09-05', 'Comprado'),
(938, 758901234, '2026-09-08', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_pedido` varchar(15) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `condado` varchar(20) DEFAULT NULL,
  `ciudad` varchar(20) DEFAULT NULL,
  `direccion_entrega` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_pedido`, `nombre`, `telefono`, `estado`, `condado`, `ciudad`, `direccion_entrega`) VALUES
('PED001', 'Juan Garzon', 305123456, 'Florida', 'Miami-Dade', 'Miami', 'Av. Central #123'),
('PED002', 'Juan Munos', 907234567, 'Alaska', 'Anchorage', 'Anchorage', 'Calle Norte #45'),
('PED003', 'Fernanda Silva', 509345678, 'Washington', 'King', 'Seattle', 'Av. Washington #89'),
('PED004', 'Juan Cordero', 214456789, 'Texas', 'Dallas', 'Dallas', 'Calle Texas #250'),
('PED005', 'Andrea Lopez', 310567890, 'California', 'Los Angeles', 'Los Angeles', 'Av. California #15'),
('PED006', 'Miguel Herrera', 786678901, 'Florida', 'Orange', 'Orlando', 'Calle Florida #99'),
('PED007', 'Valeria Cruz', 602789012, 'Arizona', 'Maricopa', 'Phoenix', 'Av. Arizona #450'),
('PED008', 'Daniel Torres', 702890123, 'Nevada', 'Clark', 'Las Vegas', 'Calle Nevada #12'),
('PED009', 'Paola Ramirez', 614901234, 'Ohio', 'Franklin', 'Columbus', 'Av. Ohio #210'),
('PED010', 'Javier Morales', 719123456, 'Colorado', 'Denver', 'Denver', 'Calle Colorado #78');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

CREATE TABLE `notificacion` (
  `id_ssn` int(9) DEFAULT NULL,
  `id_pedido` varchar(15) DEFAULT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `numero` int(10) DEFAULT NULL,
  `mesnaje` varchar(50) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `fecha_enviomensaje` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`id_ssn`, `id_pedido`, `nombre`, `email`, `numero`, `mesnaje`, `estado`, `fecha_enviomensaje`) VALUES
(12345689, 'PED001', 'Juan Garzon', 'juanestebangarzoncuervo11112@gmail.com', 305123456, 'Su pedido ha sido entregado.', 'Enviado', '2025-01-15'),
(234567891, 'PED002', 'Juan Munos', 'jn706970@gmail.com', 907234567, 'Su pedido esta en proceso.', 'Enviado', '2025-02-11'),
(281234567, 'PED003', 'Fernanda Silva', 'fernandasilva@gmail.com', 509345678, 'Su pedido va en camino.', 'Enviado', '2025-03-09'),
(314567890, 'PED004', 'Juan Cordero', 'manuel.corh07@gmail.com', 214456789, 'Su pedido fue cancelado.', 'Leido', '2025-03-21'),
(425678901, 'PED005', 'Andrea Lopez', 'andrealopez22@gmail.com', 310567890, 'Su pedido ha sido entregado.', 'Enviado', '2025-04-12'),
(536789012, 'PED006', 'Miguel Herrera', 'miguelherrera@gmail.com', 786678901, 'Estamos preparando su pedido.', 'Enviado', '2025-05-02'),
(647890123, 'PED007', 'Valeria Cruz', 'valeriacruz@gmail.com', 602789012, 'El repartidor esta en camino.', 'Leido', '2025-05-19'),
(758901234, 'PED008', 'Daniel Torres', 'danieltorres@gmail.com', 702890123, 'Su pedido fue entregado exitosamente.', 'Enviado', '2025-06-07'),
(869012345, 'PED009', 'Paola Ramirez', 'paolaramirez@gmail.com', 614901234, 'Su pedido presenta un retraso.', 'Pendiente', '2025-06-26'),
(970123456, 'PED010', 'Javier Morales', 'javiermorales@gmail.com', 719123456, 'Gracias por su compra.', 'Leido', '2025-07-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(10) NOT NULL,
  `Total_pago` decimal(2,0) DEFAULT NULL,
  `Metodo` varchar(15) DEFAULT NULL,
  `Estado` varchar(20) DEFAULT NULL,
  `Fecha_pago` date DEFAULT NULL,
  `id_pedido` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `Total_pago`, `Metodo`, `Estado`, `Fecha_pago`, `id_pedido`) VALUES
(1, 99, 'Tarjeta', 'Pagado', '2025-01-15', 'PED001'),
(2, 45, 'Efectivo', 'Pendiente', '2025-02-11', 'PED002'),
(3, 78, 'Transferencia', 'Pagado', '2025-03-09', 'PED003'),
(4, 30, 'Tarjeta', 'Reembolsado', '2025-03-21', 'PED004'),
(5, 60, 'Transferencia', 'Pagado', '2025-04-12', 'PED005'),
(6, 25, 'Efectivo', 'Pendiente', '2025-05-02', 'PED006'),
(7, 80, 'Tarjeta', 'Pagado', '2025-05-19', 'PED007'),
(8, 55, 'Transferencia', 'Pagado', '2025-06-07', 'PED008'),
(9, 40, 'Efectivo', 'Pendiente', '2025-06-26', 'PED009'),
(10, 90, 'Tarjeta', 'Pagado', '2025-07-14', 'PED010');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` varchar(15) NOT NULL,
  `id_ssn` int(9) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado_pedido` varchar(20) NOT NULL,
  `total_pago` decimal(2,0) NOT NULL,
  `direccion_entrega` varchar(50) NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_ssn`, `fecha_creacion`, `estado_pedido`, `total_pago`, `direccion_entrega`, `observaciones`) VALUES
('PED001', 12345689, '2025-01-15', 'Entregado', 99, 'Av. Central #123, Florida', 'Entrega realizada sin inconvenientes'),
('PED002', 234567891, '2025-02-10', 'Pendiente', 45, 'Calle Norte #45, Alaska', 'Esperando confirmaci?n del cliente'),
('PED003', 281234567, '2025-03-08', 'En camino', 78, 'Av. Washington #89', 'Repartidor asignado'),
('PED004', 314567890, '2025-03-20', 'Cancelado', 30, 'Calle Texas #250', 'Cancelado por solicitud del cliente'),
('PED005', 425678901, '2025-04-12', 'Entregado', 60, 'Av. California #15', 'Pedido entregado a tiempo'),
('PED006', 536789012, '2025-05-01', 'Pendiente', 25, 'Calle Florida #99', 'Pago contra entrega'),
('PED007', 647890123, '2025-05-18', 'En camino', 80, 'Av. Arizona #450', 'Entrega programada para hoy'),
('PED008', 758901234, '2025-06-07', 'Entregado', 55, 'Calle Nevada #12', 'Cliente satisfecho'),
('PED009', 869012345, '2025-06-25', 'Pendiente', 40, 'Av. Ohio #210', 'Esperando disponibilidad del producto'),
('PED010', 970123456, '2025-07-14', 'Entregado', 90, 'Calle Colorado #78', 'Entrega completada correctamente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_producto`
--

CREATE TABLE `pedido_producto` (
  `id_pedido` varchar(15) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `Nommbre` varchar(30) DEFAULT NULL,
  `Precio` bigint(20) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `Nommbre`, `Precio`, `stock`, `Descripcion`) VALUES
(1, 'Cemento Gris', 32000, 80, 'Bulto de cemento gris de alta resistencia'),
(2, 'Arena Fina', 18000, 120, 'Arena fina para mezclas y acabados'),
(3, 'Ladrillo Rojo', 2500, 500, 'Ladrillo tradicional para construccion'),
(4, 'Bloque Concreto', 4200, 350, 'Bloque de concreto para muros'),
(5, 'Varilla 3/8', 28000, 100, 'Varilla corrugada de acero de 6 metros'),
(6, 'Pala Punta', 45000, 35, 'Pala metalica con mango de madera'),
(7, 'Martillo Acero', 38000, 45, 'Martillo de acero para trabajos de construccion'),
(8, 'Taladro Electrico', 185000, 20, 'Taladro electrico de uso profesional'),
(9, 'Pintura Blanca', 75000, 30, 'Galon de pintura blanca para interiores'),
(10, 'Guantes Trabajo', 15000, 90, 'Guantes resistentes para trabajos de construccion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_ssn` int(9) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contrasenas` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_ssn`, `nombre`, `email`, `contrasenas`, `estado`) VALUES
(12345689, 'Juan Garzon', 'juanestebangarzoncuervo1112@gmail.com', 'piolin23032', 'florida'),
(41376381, 'Ana Sofia', 'sofia@gmail.com', '$2y$10$MAM7v/VlBHWFE', 'Mosquera'),
(107345404, 'Cristian Gomez', 'cris1@gmail.com', '$2y$10$CjgEHP.HKZTz5', 'Bogota'),
(234567891, 'Juan Munos', 'jm7069707@gmail.com', 'pillito33422', 'Alaska'),
(281234567, 'Fernanda Silva', 'fernandasilva@gmail.com', 'fer12345', 'Washington'),
(314567890, 'Juan Cordero', 'manuel.corh07@gmail.com', 'carlos123', 'Texas'),
(425678901, 'Andrea L?pez', 'andrealopez22@gmail.com', 'andrea456', 'California'),
(536789012, 'Miguel Herrera', 'miguelherrera@gmail.com', 'miguel789', 'Florida'),
(647890123, 'Valeria Cruz', 'valeriacruz@gmail.com', 'vale2024', 'Arizona'),
(758901234, 'Daniel Torres', 'danieltorres@gmail.com', 'daniel55', 'Nevada'),
(869012345, 'Paola Ram?rez', 'paolaramirez@gmail.com', 'paola777', 'Ohio'),
(970123456, 'Javier Morales', 'javiermorales@gmail.com', 'javi9090', 'Colorado'),
(987654321, 'celmira fajardo', 'anacel@gmail.com', '$2y$10$6FtlNpQEAdjM2', 'mosquera'),
(987654322, 'xczfbzfvb', 'jm7069787@gmail.com', '$2y$10$pNWDi/UchO5Jl', 'Mosquera'),
(1028864695, 'Smuel Barbosa', 'samuel@gmail.com', '$2y$10$rohmtjZmnLt0u', 'Funza'),
(1073235400, 'Marcela Munoz', 'marcela@gmail.com', '$2y$10$jEbVplD81DrbK', 'Madrid'),
(1073235404, 'Nestor Castro', 'jua@gmail.com', '$2y$10$ZW6uSNFwjl.jd', 'Funza'),
(1073235716, 'Samuel Barbosa', 'samuel@gmail.com', '$2y$10$3XhVYANU9uRSg', 'Funza'),
(1073502837, 'Alexandra Casrtro', 'n.alexa.castro@gmail.com', '$2y$10$f67lbi5CEt.JH', 'Mosquera');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_ssn` (`id_ssn`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD KEY `id_ssn` (`id_ssn`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_ssn` (`id_ssn`);

--
-- Indices de la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD PRIMARY KEY (`id_pedido`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_ssn`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_ssn`) REFERENCES `usuario` (`id_ssn`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_ssn`) REFERENCES `usuario` (`id_ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_3` FOREIGN KEY (`id_ssn`) REFERENCES `usuario` (`id_ssn`) ON DELETE CASCADE;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`id_ssn`) REFERENCES `usuario` (`id_ssn`),
  ADD CONSTRAINT `notificacion_ibfk_2` FOREIGN KEY (`id_ssn`) REFERENCES `usuario` (`id_ssn`),
  ADD CONSTRAINT `notificacion_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_ssn`) REFERENCES `usuario` (`id_ssn`);

--
-- Filtros para la tabla `pedido_producto`
--
ALTER TABLE `pedido_producto`
  ADD CONSTRAINT `pedido_producto_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `pedido_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
