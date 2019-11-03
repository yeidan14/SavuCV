-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 31-10-2019 a las 04:15:48
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `savucv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosper`
--

CREATE TABLE `datosper` (
  `nombres` varchar(45) DEFAULT NULL,
  `oneapellido` varchar(45) DEFAULT NULL,
  `twoapellido` varchar(45) DEFAULT NULL,
  `Tipo_documento` varchar(8) DEFAULT NULL,
  `N_documento` varchar(45) DEFAULT NULL,
  `Persona_genero` varchar(11) DEFAULT NULL,
  `Nacionalidad` varchar(45) DEFAULT NULL,
  `Pais_nacionalidad` varchar(45) DEFAULT NULL,
  `tipo_libreta` varchar(20) DEFAULT NULL,
  `numero_libreta` varchar(45) DEFAULT NULL,
  `dm_libreta` varchar(45) DEFAULT NULL,
  `Fecha_naciemiento` varchar(20) DEFAULT NULL,
  `Pais_nacimiento` varchar(45) DEFAULT NULL,
  `Depto_naciemiento` varchar(45) DEFAULT NULL,
  `Municipio_nacimiento` varchar(45) DEFAULT NULL,
  `Direccion_corresp` varchar(45) DEFAULT NULL,
  `Pais_correspo` varchar(45) DEFAULT NULL,
  `Mun_correspo` varchar(45) DEFAULT NULL,
  `Dpto_correspo` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `usuario_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `datosper`
--

INSERT INTO `datosper` (`nombres`, `oneapellido`, `twoapellido`, `Tipo_documento`, `N_documento`, `Persona_genero`, `Nacionalidad`, `Pais_nacionalidad`, `tipo_libreta`, `numero_libreta`, `dm_libreta`, `Fecha_naciemiento`, `Pais_nacimiento`, `Depto_naciemiento`, `Municipio_nacimiento`, `Direccion_corresp`, `Pais_correspo`, `Mun_correspo`, `Dpto_correspo`, `Telefono`, `Email`, `usuario_usuario`) VALUES
('qweqwe', 'asdasd', 'qweqwe', 'PAS', 'asdasd', 'Masculino', 'colombiano', 'qweqwe', 'PrimeraClase', 'qweqwe', 'qweqwe', '2019-10-05', 'qweqwe', 'qweqwe', 'qweqwe', 'qweqwe', 'qweqwe', 'asdasd', 'qweqwe', 'tt', 'richar@ufps.com', 'yeison'),
('Yeison Daniel', 'Manrique', 'Camacho', 'CC', '1098102072', 'Masculino', 'colombiano', 'Colombia', 'PrimeraClase', '1098102072', '15', '1995-12-13', 'Colombia', 'Santander', 'Capitanejo', 'Av 5 #4-53', 'Colombia', 'Capitanejo', 'Santander', '3156347940', 'yeisondanielmc@ufps.edu.co', 'Yeison19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ed_superior`
--

CREATE TABLE `ed_superior` (
  `id` int(11) NOT NULL,
  `modalidad` varchar(3) DEFAULT NULL,
  `N_semestres` int(11) DEFAULT NULL,
  `Graduado` varchar(5) DEFAULT NULL,
  `Nombre_titulo` varchar(45) DEFAULT NULL,
  `Terminacion` varchar(25) DEFAULT NULL,
  `N_targeta` varchar(45) DEFAULT NULL,
  `usuario_usuario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ed_superior`
--

INSERT INTO `ed_superior` (`id`, `modalidad`, `N_semestres`, `Graduado`, `Nombre_titulo`, `Terminacion`, `N_targeta`, `usuario_usuario`) VALUES
(56, 'TE', 6, 'no', 'asdasdasd', '2019-10-16', '1023124', 'Yeison'),
(59, 'MG', 2, 'si', 'magister en ciencias sociales ', '2019-10-02', '1023124', 'Yeison19'),
(60, 'TE', 5, 'si', 'Ingeniero de sistemas', '2019-10-18', '1023124', 'Yeison19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expelab`
--

CREATE TABLE `expelab` (
  `id_explaboral` int(11) NOT NULL,
  `Empresa` varchar(45) DEFAULT NULL,
  `TipoEmpresa` varchar(45) DEFAULT NULL,
  `PaisEmpresa` varchar(45) DEFAULT NULL,
  `DepEmpresa` varchar(45) DEFAULT NULL,
  `MuniEmpresa` varchar(45) DEFAULT NULL,
  `CorreoEmp` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `FIngreso` varchar(20) DEFAULT NULL,
  `FechaRetiro` varchar(20) DEFAULT NULL,
  `Cargo` varchar(45) DEFAULT NULL,
  `Dependencia` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `usuario_usuario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `expelab`
--

INSERT INTO `expelab` (`id_explaboral`, `Empresa`, `TipoEmpresa`, `PaisEmpresa`, `DepEmpresa`, `MuniEmpresa`, `CorreoEmp`, `Telefono`, `FIngreso`, `FechaRetiro`, `Cargo`, `Dependencia`, `Direccion`, `usuario_usuario`) VALUES
(1, 'Marothz', 'Privada', 'Colombia', 'Norte de Santander', 'Cucuta', 'yei@gmail.com', '3224514544', '2019-10-18', '2019-10-31', 'Diseñador', 'Diseño publicitario', 'Av 7 centro Cucuta', 'Yeison19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fbasica`
--

CREATE TABLE `fbasica` (
  `Ncurso` int(11) DEFAULT NULL,
  `Titulo` varchar(45) DEFAULT NULL,
  `Bfecha_grado` varchar(20) DEFAULT NULL,
  `usuario_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fbasica`
--

INSERT INTO `fbasica` (`Ncurso`, `Titulo`, `Bfecha_grado`, `usuario_usuario`) VALUES
(10, 'Tecnico en diseño grafico', '2019-10-11', 'yeison'),
(11, 'Tecnico en diseño grafico para medios impreso', '2019-10-17', 'Yeison19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `idlengua` int(11) NOT NULL,
  `nombre_idioma` varchar(45) DEFAULT NULL,
  `lo_habla` varchar(10) DEFAULT NULL,
  `lo_lee` varchar(10) DEFAULT NULL,
  `lo_escribe` varchar(10) DEFAULT NULL,
  `usuario_usuario` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`idlengua`, `nombre_idioma`, `lo_habla`, `lo_lee`, `lo_escribe`, `usuario_usuario`) VALUES
(1, 'qweqwe', 'qweqweq', 'qweqw', 'eqweqwe', 'Yeison'),
(2, 'Espanol', 'Muy bien', 'Regular', 'Bien', 'Yeison19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obervaciones`
--

CREATE TABLE `obervaciones` (
  `Obervacionescol` longtext,
  `ciudad` varchar(45) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `usuario_usuario` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiemexp`
--

CREATE TABLE `tiemexp` (
  `usuario_usuario` varchar(45) NOT NULL,
  `spublicoyears` int(2) NOT NULL,
  `spublicomonths` int(2) NOT NULL,
  `sprivadoyears` int(2) NOT NULL,
  `sprivadomonths` int(2) NOT NULL,
  `tiyears` int(2) NOT NULL,
  `timonths` int(2) NOT NULL,
  `totalyears` int(8) NOT NULL,
  `toalmonths` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `email`, `password`) VALUES
('alexander', 'yeidan14@gmail.com', 'yeidan141995'),
('danielM14', 'yeidan14@gmail.com', 'yeidan141995'),
('heisson225', 'asdasd', 'yeidan141995'),
('Yeison', 'asdasd', 'yeidan141995'),
('Yeison19', 'yeidan14@gmail.com', 'yeidan141995');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `datosper`
--
ALTER TABLE `datosper`
  ADD PRIMARY KEY (`usuario_usuario`);

--
-- Indices de la tabla `ed_superior`
--
ALTER TABLE `ed_superior`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ed_superior_usuario1` (`usuario_usuario`);

--
-- Indices de la tabla `expelab`
--
ALTER TABLE `expelab`
  ADD PRIMARY KEY (`id_explaboral`),
  ADD KEY `fk_expelab_usuario1` (`usuario_usuario`);

--
-- Indices de la tabla `fbasica`
--
ALTER TABLE `fbasica`
  ADD PRIMARY KEY (`usuario_usuario`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`idlengua`),
  ADD KEY `fk_idioma_usuario1` (`usuario_usuario`);

--
-- Indices de la tabla `obervaciones`
--
ALTER TABLE `obervaciones`
  ADD PRIMARY KEY (`usuario_usuario`);

--
-- Indices de la tabla `tiemexp`
--
ALTER TABLE `tiemexp`
  ADD PRIMARY KEY (`usuario_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ed_superior`
--
ALTER TABLE `ed_superior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `expelab`
--
ALTER TABLE `expelab`
  MODIFY `id_explaboral` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `idlengua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datosper`
--
ALTER TABLE `datosper`
  ADD CONSTRAINT `fk_datosper_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `ed_superior`
--
ALTER TABLE `ed_superior`
  ADD CONSTRAINT `fk_ed_superior_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `expelab`
--
ALTER TABLE `expelab`
  ADD CONSTRAINT `fk_expelab_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `fbasica`
--
ALTER TABLE `fbasica`
  ADD CONSTRAINT `fk_fbasica_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD CONSTRAINT `fk_idioma_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `obervaciones`
--
ALTER TABLE `obervaciones`
  ADD CONSTRAINT `fk_obervaciones_usuario1` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `tiemexp`
--
ALTER TABLE `tiemexp`
  ADD CONSTRAINT `fk_tiemexp_usuario` FOREIGN KEY (`usuario_usuario`) REFERENCES `usuario` (`usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
