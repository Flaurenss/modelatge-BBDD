-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2020 a las 18:28:20
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `address_name` varchar(45) NOT NULL,
  `address_type` set('street','number','flat','door','city','zip','country') DEFAULT NULL,
  `Provider_NIF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`address_name`, `address_type`, `Provider_NIF`) VALUES
('CalleGafa', 'street', 111),
('10', 'number', 111);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(11) NOT NULL,
  `brand_name` varchar(45) NOT NULL,
  `Provider_NIF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `brand_name`, `Provider_NIF`) VALUES
(123, 'GafasEco', 111);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `register_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`name`, `email`, `address`, `telephone`, `register_date`) VALUES
('Lorenzo', 'lorenzo@email.com', 'CalleCliente', 999999999, '2020-07-20 18:16:46'),
('Paula', 'paula@email.com', 'CalleClientePaula', 888888888, '2020-07-20 18:18:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client_buy_glasses`
--

CREATE TABLE `client_buy_glasses` (
  `Glasses_id_glasses` int(11) NOT NULL,
  `Client_name` varchar(45) NOT NULL,
  `Client_email` varchar(45) NOT NULL,
  `Employee_id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client_buy_glasses`
--

INSERT INTO `client_buy_glasses` (`Glasses_id_glasses`, `Client_name`, `Client_email`, `Employee_id_employee`) VALUES
(12854, 'Lorenzo', 'lorenzo@email.com', 555);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_employee`) VALUES
(555);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glasses`
--

CREATE TABLE `glasses` (
  `id_glasses` int(11) NOT NULL,
  `frame_type` enum('float','metal','pasta') NOT NULL,
  `frame_color` varchar(45) NOT NULL,
  `glass_color` varchar(45) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `Provider_NIF` int(11) NOT NULL,
  `Brand_id_brand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `glasses`
--

INSERT INTO `glasses` (`id_glasses`, `frame_type`, `frame_color`, `glass_color`, `price`, `Provider_NIF`, `Brand_id_brand`) VALUES
(12854, 'pasta', 'black', 'gray', '55', 111, 123),
(65489, 'metal', 'red', 'blue', '90', 111, 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provider`
--

CREATE TABLE `provider` (
  `NIF` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `telephone` int(11) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provider`
--

INSERT INTO `provider` (`NIF`, `name`, `zip`, `telephone`, `fax`) VALUES
(111, 'GafasNacho', 8470, 937725878, '088898');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recommendation`
--

CREATE TABLE `recommendation` (
  `recommender_client_name` varchar(45) DEFAULT NULL,
  `recommender_client_email` varchar(45) DEFAULT NULL,
  `recommended_client_name` varchar(45) NOT NULL,
  `recomended_client_email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `recommendation`
--

INSERT INTO `recommendation` (`recommender_client_name`, `recommender_client_email`, `recommended_client_name`, `recomended_client_email`) VALUES
('Paula', 'paula@email.com', 'Lorenzo', 'lorenzo@email.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD KEY `fk_Address_Provider1` (`Provider_NIF`);

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `fk_Brand_Provider1_idx` (`Provider_NIF`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`name`,`email`);

--
-- Indices de la tabla `client_buy_glasses`
--
ALTER TABLE `client_buy_glasses`
  ADD KEY `fk_Client_buy_glasses_Glasses1_idx` (`Glasses_id_glasses`),
  ADD KEY `fk_Client_buy_glasses_Client1_idx` (`Client_name`,`Client_email`),
  ADD KEY `fk_Client_buy_glasses_Employee1_idx` (`Employee_id_employee`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indices de la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD PRIMARY KEY (`id_glasses`),
  ADD KEY `fk_Glasses_Provider1_idx` (`Provider_NIF`),
  ADD KEY `fk_Glasses_Brand1_idx` (`Brand_id_brand`);

--
-- Indices de la tabla `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`NIF`);

--
-- Indices de la tabla `recommendation`
--
ALTER TABLE `recommendation`
  ADD KEY `fk_Recomendation_Client1_idx` (`recommender_client_name`,`recommender_client_email`),
  ADD KEY `fk_Recomendation_Client2_idx` (`recommended_client_name`,`recomended_client_email`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_Address_Provider1` FOREIGN KEY (`Provider_NIF`) REFERENCES `provider` (`NIF`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `fk_Brand_Provider1` FOREIGN KEY (`Provider_NIF`) REFERENCES `provider` (`NIF`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `client_buy_glasses`
--
ALTER TABLE `client_buy_glasses`
  ADD CONSTRAINT `fk_Client_buy_glasses_Client1` FOREIGN KEY (`Client_name`,`Client_email`) REFERENCES `client` (`name`, `email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Client_buy_glasses_Employee1` FOREIGN KEY (`Employee_id_employee`) REFERENCES `employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Client_buy_glasses_Glasses1` FOREIGN KEY (`Glasses_id_glasses`) REFERENCES `glasses` (`id_glasses`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `glasses`
--
ALTER TABLE `glasses`
  ADD CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_id_brand`) REFERENCES `brand` (`id_brand`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Glasses_Provider1` FOREIGN KEY (`Provider_NIF`) REFERENCES `provider` (`NIF`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recommendation`
--
ALTER TABLE `recommendation`
  ADD CONSTRAINT `fk_Recomendation_Client1` FOREIGN KEY (`recommender_client_name`,`recommender_client_email`) REFERENCES `client` (`name`, `email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Recomendation_Client2` FOREIGN KEY (`recommended_client_name`,`recomended_client_email`) REFERENCES `client` (`name`, `email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
