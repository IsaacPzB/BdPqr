-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-03-2022 a las 04:04:07
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pqr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_solicitud`
--

CREATE TABLE `estado_solicitud` (
  `id_estado_solicitud` int(11) NOT NULL,
  `estado_solicitud` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_solicitud`
--

INSERT INTO `estado_solicitud` (`id_estado_solicitud`, `estado_solicitud`) VALUES
(1, 'Cerrada'),
(2, 'Abierta'),
(3, 'Suspendida'),
(4, 'Nueva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_respuesta` int(11) NOT NULL,
  `id_solicitudes` int(11) NOT NULL,
  `respuesta` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL,
  `asesor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id_solicitudes` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_tipo_solicitud` int(11) NOT NULL,
  `id_tipo_prioridad` int(11) NOT NULL,
  `id_estado_solicitud` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `n_asesor` int(11) NOT NULL,
  `n_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_prioridad`
--

CREATE TABLE `tipo_prioridad` (
  `id_tipo_prioridad` int(11) NOT NULL,
  `tipo_prioridad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_prioridad`
--

INSERT INTO `tipo_prioridad` (`id_tipo_prioridad`, `tipo_prioridad`) VALUES
(1, 'Baja'),
(2, 'Media'),
(3, 'Alta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_solicitud`
--

CREATE TABLE `tipo_solicitud` (
  `id_tipo_solicitud` int(11) NOT NULL,
  `tipo_solicitud` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_solicitud`
--

INSERT INTO `tipo_solicitud` (`id_tipo_solicitud`, `tipo_solicitud`) VALUES
(1, 'Queja'),
(2, 'Peticion'),
(3, 'Reclamo'),
(4, 'Sugerencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int(11) NOT NULL,
  `tipo_usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id_tipo_usuario`, `tipo_usuario`) VALUES
(1, 'Administrador'),
(2, 'Asesor'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `numero_identificacion` varchar(20) NOT NULL,
  `numero_telefono` varchar(12) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `direccion` varchar(15) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estado_solicitud`
--
ALTER TABLE `estado_solicitud`
  ADD PRIMARY KEY (`id_estado_solicitud`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `id_solicitudes` (`id_solicitudes`),
  ADD KEY `asesor` (`asesor`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id_solicitudes`),
  ADD KEY `id_tipo_solicitud` (`id_tipo_solicitud`),
  ADD KEY `id_tipo_prioridad` (`id_tipo_prioridad`),
  ADD KEY `id_estado_solicitud` (`id_estado_solicitud`),
  ADD KEY `n_asesor` (`n_asesor`),
  ADD KEY `n_usuario` (`n_usuario`);

--
-- Indices de la tabla `tipo_prioridad`
--
ALTER TABLE `tipo_prioridad`
  ADD PRIMARY KEY (`id_tipo_prioridad`);

--
-- Indices de la tabla `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  ADD PRIMARY KEY (`id_tipo_solicitud`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id_tipo_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `numero_identificacion` (`numero_identificacion`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estado_solicitud`
--
ALTER TABLE `estado_solicitud`
  MODIFY `id_estado_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id_respuesta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id_solicitudes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_prioridad`
--
ALTER TABLE `tipo_prioridad`
  MODIFY `id_tipo_prioridad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_solicitud`
--
ALTER TABLE `tipo_solicitud`
  MODIFY `id_tipo_solicitud` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_solicitudes`) REFERENCES `solicitudes` (`id_solicitudes`),
  ADD CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`asesor`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`id_tipo_solicitud`) REFERENCES `tipo_solicitud` (`id_tipo_solicitud`),
  ADD CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`id_tipo_prioridad`) REFERENCES `tipo_prioridad` (`id_tipo_prioridad`),
  ADD CONSTRAINT `solicitudes_ibfk_3` FOREIGN KEY (`id_estado_solicitud`) REFERENCES `estado_solicitud` (`id_estado_solicitud`),
  ADD CONSTRAINT `solicitudes_ibfk_4` FOREIGN KEY (`n_asesor`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `solicitudes_ibfk_5` FOREIGN KEY (`n_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
