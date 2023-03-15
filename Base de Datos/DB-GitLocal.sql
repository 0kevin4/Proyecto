-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bisbd8nsokg2bmgcqkk4-mysql.services.clever-cloud.com:3306
-- Generation Time: Mar 15, 2023 at 12:27 AM
-- Server version: 8.0.15-5
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bisbd8nsokg2bmgcqkk4`
--
CREATE DATABASE IF NOT EXISTS `bisbd8nsokg2bmgcqkk4` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bisbd8nsokg2bmgcqkk4`;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetRoles`
--

CREATE TABLE `AspNetRoles` (
  `Id` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserClaims`
--

CREATE TABLE `AspNetUserClaims` (
  `Id` int(11) NOT NULL,
  `claimtype` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `claimvalue` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `aspnetuserId` int(11) NOT NULL,
  `UserId` varchar(45) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserLogins`
--

CREATE TABLE `AspNetUserLogins` (
  `Id` int(11) NOT NULL,
  `loginprovider` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `providerkey` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `UserId` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `ProviderDisplayName` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUserRoles`
--

CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `RoleId` int(11) NOT NULL,
  `Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AspNetUsers`
--

CREATE TABLE `AspNetUsers` (
  `Id` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `NormalizedUserName` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `UserName` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `PhoneNumber` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `EmailConfirmed` tinyint(4) DEFAULT NULL,
  `PasswordHash` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `ConcurrencyStamp` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `SecurityStamp` varchar(425) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `LockoutEnabled` tinyint(4) DEFAULT NULL,
  `LockoutEnd` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NormalizedEmail` varchar(225) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(4) DEFAULT NULL,
  `TwoFactorEnabled` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `AspNetUsers`
--

INSERT INTO `AspNetUsers` (`Id`, `NormalizedUserName`, `UserName`, `PhoneNumber`, `Email`, `EmailConfirmed`, `PasswordHash`, `ConcurrencyStamp`, `SecurityStamp`, `AccessFailedCount`, `LockoutEnabled`, `LockoutEnd`, `NormalizedEmail`, `PhoneNumberConfirmed`, `TwoFactorEnabled`) VALUES
('0bf58297-481b-41ef-8cae-27ea2430e0d8', 'MORENORAMIREZKEVINJOSE@GMAIL.COM', 'morenoramirezkevinjose@gmail.com', NULL, 'morenoramirezkevinjose@gmail.com', 1, 'AQAAAAEAACcQAAAAEBNyI8hJ55HYOWqaexRtflrrHeXmkWLVqYvtECJrBWS8PPH1On1WnnIHE71Av9N/bA==', '41fe6bea-589a-4cb6-a20e-204f0e3a0068', '554CNNBMVEYXEHNBFSJJM4XF4HX3FXXH', 0, 1, NULL, 'MORENORAMIREZKEVINJOSE@GMAIL.COM', 0, 0),
('229a8ad8-59df-43cc-b5a4-249aa8c29360', 'ANGIE1234@GMAIL.COM', 'angie1234@gmail.com', NULL, 'angie1234@gmail.com', 1, 'AQAAAAEAACcQAAAAEA25gKlaesT26RC2VTVPL6iQGA7Vs/WmOxGyoIc61OsntbjPkJUb8E2jTZCC2JpEnQ==', 'ea455850-91f9-48d2-ab72-56a2a8ac85bd', '7TYMR6ISIRTQTKPB5ZKUWBJLX66EVM4D', 0, 1, NULL, 'ANGIE1234@GMAIL.COM', 0, 0),
('5e49242a-a7c8-448b-80bf-78bdee759a34', 'KEVIN.MORENO23@MISENA.EDU.CO', 'kevin.moreno23@misena.edu.co', NULL, 'kevin.moreno23@misena.edu.co', 0, 'AQAAAAEAACcQAAAAEK5KFQCyovNd6v0X0rz5RFwhlyYogB5ANaos0kmmu+ED0S8CEzt7howUMjMqeE/x8g==', '45161df7-9a94-40a0-9087-e17c28590a26', 'UKG362NN6KCZAN2YNZEYIURAXNQCKMUK', 0, 1, NULL, 'KEVIN.MORENO23@MISENA.EDU.CO', 0, 0),
('8eb7d9b3-7da8-4bb2-b441-c11874cec009', 'KEVIN.MORENO249@MISENA.EDU.CO', 'kevin.moreno249@misena.edu.co', NULL, 'kevin.moreno249@misena.edu.co', 1, 'AQAAAAEAACcQAAAAEPKobyjE59j5YmoXcyo3tXCX25gbsy5EseWDCHhkcDTuBXgG4aEEerHPBnCc1V1omA==', '19d503e7-6222-490c-a481-342b901499f8', 'ZL7THIIV6FT2IVA7IPWVPPGMDCACRRRG', 0, 1, NULL, 'KEVIN.MORENO249@MISENA.EDU.CO', 0, 0),
('e83ac85a-d11d-40e6-bafb-c83b05da1fb3', 'JUAN.LANCHEROS662@MISENA.EDU.CO', 'juan.lancheros662@misena.edu.co', NULL, 'juan.lancheros662@misena.edu.co', 1, 'AQAAAAEAACcQAAAAEIMM8N4oekRqa6VmUXc/gkqqiw0cpQfDyweOq9Nkgj+iTUKOjDKTVersWOGofmX5vA==', '03ef06a6-ce01-4708-a0b9-f86b29f0deb0', 'QFO3ZTJKUWXDFFUBIFIR7BYVUPESGUBI', 0, 1, NULL, 'JUAN.LANCHEROS662@MISENA.EDU.CO', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(225) COLLATE utf8mb4_general_ci NOT NULL,
  `loginprovider` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `value` varchar(225) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `CATEGORIA`
--

CREATE TABLE `CATEGORIA` (
  `categoriaId` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `nombre` varchar(64) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `CATEGORIA`
--

INSERT INTO `CATEGORIA` (`categoriaId`, `estado`, `nombre`) VALUES
(1, 1, 'Peluches'),
(2, 1, 'Afiches'),
(3, 1, 'Dulces'),
(4, 1, 'Bolsos'),
(5, 1, 'Maquillaje'),
(6, 1, 'Globos'),
(7, 1, 'Perfumes'),
(8, 1, 'Calzado'),
(9, 1, 'Relojes'),
(10, 1, 'Vajilla'),
(11, 1, 'Cajas sorpresa'),
(12, 1, 'Habladores'),
(13, 1, 'Joyas'),
(14, 1, 'Licores'),
(16, 1, 'Peluches'),
(17, 0, 'Emojis');

-- --------------------------------------------------------

--
-- Table structure for table `MARCA`
--

CREATE TABLE `MARCA` (
  `marcaId` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `MARCA`
--

INSERT INTO `MARCA` (`marcaId`, `nombre`, `estado`) VALUES
(1, 'Bavaria', 1),
(2, 'Colombina', 1),
(3, 'Bimar', 1),
(4, 'Casio', 1),
(5, 'Jumbo', 1),
(6, 'Waffer', 1),
(7, 'Festival', 1),
(8, 'Trululu', 1),
(9, 'Mate', 1),
(10, 'maybelline', 1),
(11, 'Urban decay', 1),
(12, 'Winner sport', 1),
(13, 'Musk', 1),
(14, 'Dancing', 1),
(15, 'Celos', 1),
(16, 'black opium', 1),
(17, 'Puma', 1),
(18, 'Nike', 1),
(19, 'Tissot', 1),
(20, 'diesel', 1),
(21, 'NM', 1),
(22, 'Peluche hablante', 0),
(23, 'pirulo feoooooto puto', 1);

-- --------------------------------------------------------

--
-- Table structure for table `PRECIO`
--

CREATE TABLE `PRECIO` (
  `precioId` int(11) NOT NULL,
  `fechaIngreso` datetime NOT NULL,
  `precioCompra` decimal(10,0) NOT NULL,
  `descuento` decimal(10,0) NOT NULL,
  `precioVentaInicial` decimal(10,0) NOT NULL,
  `precioVentaFinal` decimal(10,0) NOT NULL,
  `producto_productoid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PRECIO`
--

INSERT INTO `PRECIO` (`precioId`, `fechaIngreso`, `precioCompra`, `descuento`, `precioVentaInicial`, `precioVentaFinal`, `producto_productoid`) VALUES
(1, '2022-01-02 00:00:00', '16500', '0', '16500', '16500', 1),
(2, '2022-01-02 00:00:00', '5000', '0', '5000', '5000', 2),
(3, '2022-01-02 00:00:00', '2800', '0', '2800', '2800', 3),
(4, '2022-01-02 00:00:00', '3500', '0', '3500', '3500', 4),
(5, '2022-01-02 00:00:00', '5000', '0', '5000', '5000', 5),
(6, '2022-01-02 00:00:00', '2300', '0', '2300', '2300', 6),
(7, '2022-01-02 00:00:00', '900', '0', '900', '900', 7),
(8, '2022-01-02 00:00:00', '1700', '0', '1700', '1700', 8),
(9, '2022-01-02 00:00:00', '900', '0', '900', '900', 9),
(10, '2022-01-02 00:00:00', '380', '0', '380', '380', 10),
(11, '2022-01-02 00:00:00', '90000', '0', '90000', '90000', 11),
(12, '2022-01-02 00:00:00', '50000', '0', '50000', '50000', 12),
(13, '2022-01-02 00:00:00', '550', '0', '550', '550', 13),
(14, '2022-01-02 00:00:00', '80000', '0', '80000', '80000', 14),
(15, '2022-01-02 00:00:00', '100', '0', '100', '100', 15),
(16, '2022-01-02 00:00:00', '5800', '0', '5800', '5800', 16),
(17, '2022-01-02 00:00:00', '5800', '0', '5800', '5800', 17),
(18, '2022-01-02 00:00:00', '5800', '0', '5800', '5800', 18),
(19, '2022-01-02 00:00:00', '3500', '0', '3500', '3500', 19),
(20, '2022-01-02 00:00:00', '3500', '0', '3500', '3500', 20),
(21, '2022-01-02 00:00:00', '600', '0', '600', '600', 21),
(22, '2022-01-02 00:00:00', '350', '0', '350', '350', 22),
(23, '2022-01-02 00:00:00', '3800', '0', '3800', '3800', 23),
(24, '2022-01-02 00:00:00', '1000', '0', '1000', '1000', 24),
(25, '2022-01-02 00:00:00', '1000', '0', '1000', '1000', 25),
(26, '2022-01-02 00:00:00', '1200', '0', '1200', '1200', 26),
(27, '2022-01-02 00:00:00', '1200', '0', '1200', '1200', 27),
(28, '2022-01-02 00:00:00', '1500', '0', '1500', '1500', 28),
(29, '2022-01-02 00:00:00', '1500', '0', '1500', '1500', 29),
(30, '2022-01-02 00:00:00', '2100', '0', '2100', '2100', 30),
(31, '2022-01-02 00:00:00', '1800', '0', '1800', '1800', 31),
(32, '2022-01-02 00:00:00', '1700', '0', '1700', '1700', 32),
(33, '2022-01-02 00:00:00', '2000', '0', '2000', '2000', 33),
(34, '2022-01-02 00:00:00', '2000', '0', '2000', '2000', 34),
(35, '2022-01-02 00:00:00', '2500', '0', '2500', '2500', 35),
(36, '2022-01-02 00:00:00', '7000', '0', '7000', '7000', 36),
(37, '2022-01-02 00:00:00', '7000', '0', '7000', '7000', 37),
(38, '2022-01-02 00:00:00', '3800', '0', '3800', '3800', 38),
(39, '2022-01-02 00:00:00', '3800', '0', '3800', '3800', 39),
(40, '2022-01-02 00:00:00', '3800', '0', '3800', '3800', 40),
(41, '2022-01-02 00:00:00', '2200', '0', '2200', '2200', 41),
(42, '2022-01-02 00:00:00', '2200', '0', '2200', '2200', 42),
(43, '2022-01-02 00:00:00', '2200', '0', '2200', '2200', 43),
(44, '2022-01-02 00:00:00', '2500', '0', '2500', '2500', 44),
(45, '2022-01-02 00:00:00', '2500', '0', '2500', '2500', 45),
(46, '2022-01-02 00:00:00', '2500', '0', '2500', '2500', 46),
(47, '2022-01-02 00:00:00', '1500', '0', '1500', '1500', 47),
(48, '2022-01-02 00:00:00', '6000', '0', '6000', '6000', 48),
(49, '2022-01-02 00:00:00', '4000', '0', '4000', '4000', 49),
(50, '2022-01-02 00:00:00', '2500', '0', '2500', '2500', 50),
(51, '2022-01-02 00:00:00', '800', '0', '800', '800', 51),
(52, '2022-01-02 00:00:00', '800', '0', '800', '800', 52),
(53, '2022-01-02 00:00:00', '800', '0', '800', '800', 53),
(54, '2022-01-02 00:00:00', '800', '0', '800', '800', 54),
(55, '2022-01-02 00:00:00', '2000', '0', '2000', '2000', 55),
(56, '2022-01-02 00:00:00', '1500', '0', '1500', '1500', 56),
(57, '2022-01-02 00:00:00', '3500', '0', '3500', '3500', 57),
(58, '2022-01-02 00:00:00', '350', '0', '350', '350', 58),
(59, '2022-01-02 00:00:00', '400', '0', '400', '400', 59),
(60, '2022-01-02 00:00:00', '400', '0', '400', '400', 60),
(61, '2022-01-02 00:00:00', '800', '0', '800', '800', 61),
(62, '2022-01-02 00:00:00', '450', '0', '450', '450', 62),
(63, '2022-01-02 00:00:00', '600', '0', '600', '600', 63),
(64, '2022-01-02 00:00:00', '700', '0', '700', '700', 64),
(65, '2022-01-02 00:00:00', '320', '0', '320', '320', 65);

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCTO`
--

CREATE TABLE `PRODUCTO` (
  `productoId` int(11) NOT NULL,
  `nombre` varchar(75) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `subcategoria_subcategoriaid` int(11) DEFAULT NULL,
  `marca_marcaid` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `stockMaximo` int(11) DEFAULT NULL,
  `stockMinimo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PRODUCTO`
--

INSERT INTO `PRODUCTO` (`productoId`, `nombre`, `descripcion`, `estado`, `subcategoria_subcategoriaid`, `marca_marcaid`, `Cantidad`, `stockMaximo`, `stockMinimo`) VALUES
(1, 'Stich grande', 'Muñeco', 1, 3, 3, 255, 250, 50),
(2, 'Oso mediano', 'Muñeco', 1, 3, 3, 150, 250, 50),
(3, 'Peluche corazon', 'Muñeco', 1, 1, 3, 150, 250, 50),
(4, 'Pokemon pequeño', 'Muñeco', 1, 3, 3, 150, 250, 50),
(5, 'Mico mediano', 'Muñeco', 1, 5, 3, 150, 250, 50),
(6, 'Afiche de amor grande', 'Cartel', 1, 9, 21, 150, 250, 50),
(7, 'Afiche de cumpleaños pequeño', 'Cartel', 1, 6, 21, 150, 250, 50),
(8, 'Afiches de amistad medianos', 'Cartel', 1, 8, 21, 150, 250, 50),
(9, 'Afiches de navidad pequeño', 'Cartel', 1, 7, 21, 150, 250, 50),
(10, 'Chocolatinas jumbo grandes', 'Dulce', 1, 10, 5, 150, 250, 50),
(11, 'Chocolatinas wafer pequeño', 'Dulce', 1, 13, 6, 150, 250, 50),
(12, 'bombones pequeños', 'Dulce', 1, 11, 2, 150, 250, 50),
(13, 'Paquete de masmelos grande', 'Dulce', 1, 12, 2, 150, 250, 50),
(14, 'Galletas festival', 'Dulce', 1, 13, 7, 150, 250, 50),
(15, 'Paquete de gomitas trululu aro pequeño', 'Dulce', 1, 14, 8, 150, 250, 50),
(16, 'Bolso de cuero pequeño', 'Bolso', 1, 15, 21, 150, 250, 50),
(17, 'Bolso de cuero grande', 'Bolso', 1, 15, 21, 150, 250, 50),
(18, 'Bolso de cuero mediano', 'Bolso', 1, 15, 21, 150, 250, 50),
(19, 'Bolso de peluche grande', 'Bolso', 1, 16, 21, 150, 250, 50),
(20, 'Bolso de peluche pequeño', 'Bolso', 1, 16, 21, 150, 250, 50),
(21, 'Labial mate pequeño', 'Maquillaje', 1, 18, 9, 150, 250, 50),
(22, 'Pestañina maybelline pequeña', 'Maquillaje', 1, 19, 10, 150, 250, 50),
(23, 'Sombras urban decay Grande', 'Maquillaje', 1, 20, 11, 150, 250, 50),
(24, 'Iluminadores medianos', 'Maquillaje', 1, 21, 21, 150, 250, 50),
(25, 'Pestañas postizas grande', 'Maquillaje', 1, 22, 21, 150, 250, 50),
(26, 'Globos metalizados grandes', 'Decoracion', 1, 23, 21, 150, 250, 50),
(27, 'Globo corazon mediano', 'Decoracion', 1, 24, 21, 150, 250, 50),
(28, 'Globo con helio grande', 'Decoracion', 1, 25, 21, 150, 250, 50),
(29, 'Globo trasparente pequeño', 'Decoracion', 1, 26, 21, 150, 250, 50),
(30, 'Globo trasparante grande', 'Decoracion', 1, 26, 21, 150, 250, 50),
(31, 'Perfume winner sport mediano', 'Aroma', 1, 28, 12, 150, 250, 50),
(32, 'Perfume musk pequeño', 'Aroma', 1, 28, 13, 150, 250, 50),
(33, 'Perfume dancing mediano', 'Aroma', 1, 27, 14, 150, 250, 50),
(34, 'Perfume celos mediana', 'Aroma', 1, 27, 15, 150, 250, 50),
(35, 'Perfume black opium mediano', 'Aroma', 1, 27, 16, 150, 250, 50),
(36, 'Zapatillas puma', 'Calazado', 1, 29, 17, 150, 250, 50),
(37, 'Zapatillas nike', 'Calazado', 1, 29, 18, 150, 250, 50),
(38, 'Pantuflas de osos', 'Calazado', 1, 30, 21, 150, 250, 50),
(39, 'Pantuflas de gatos', 'Calazado', 1, 30, 21, 150, 250, 50),
(40, 'Pantuflas de micos', 'Calazado', 1, 30, 21, 150, 250, 50),
(41, 'Reloj pulso de goma casio', 'Relojes', 1, 31, 4, 150, 250, 50),
(42, 'Reloj puso de goma Tissot', 'Relojes', 1, 31, 19, 150, 250, 50),
(43, 'Reloj pulso de goma diesel', 'Relojes', 1, 31, 20, 150, 250, 50),
(44, 'Reloj pulso normal Casio', 'Relojes', 1, 32, 4, 150, 250, 50),
(45, 'Reloj pulso normal diesel', 'Relojes', 1, 32, 20, 150, 250, 50),
(46, 'Posillos personalizados grandes', 'Vajillas', 1, 33, 21, 150, 250, 50),
(47, 'Copas personalizadas pequeñas', 'Vajillas', 1, 34, 21, 150, 250, 50),
(48, 'Caja de madera decorada grande', 'Cajas', 1, 35, 21, 150, 250, 50),
(49, 'Caja de carton personalizada mediana', 'Cajas', 1, 36, 21, 150, 250, 50),
(50, 'Cajas decorativas peque±as', 'Cajas', 1, 37, 21, 150, 250, 50),
(51, 'Habladores de cumpleaños pequeño', 'Detalles', 1, 38, 21, 150, 250, 50),
(52, 'Habladores de navidad medianos', 'Detalles', 1, 39, 21, 150, 250, 50),
(53, 'Habladores de amistad grandes', 'Detalles', 1, 41, 21, 150, 250, 50),
(54, 'Habladores de amor medianos', 'Detalles', 1, 40, 21, 150, 250, 50),
(55, 'Cadenas de oro', 'Joyas', 1, 43, 21, 150, 250, 50),
(56, 'Cadenas de plata', 'Joyas', 1, 43, 21, 150, 250, 50),
(57, 'Anillos de oro', 'Joyas', 1, 45, 21, 150, 250, 50),
(58, 'Manillas con mostacilla', 'Utiles', 1, 47, 21, 150, 250, 50),
(59, 'Balacas con pepas', 'Utiles', 1, 47, 21, 150, 250, 50),
(60, 'Balacas con flores', 'Utiles', 1, 47, 21, 150, 250, 50),
(61, 'Cerveza corona grande', 'Licor', 1, 48, 1, 150, 250, 50),
(62, 'Cerveza Budweiser mediana', 'Licor', 1, 49, 1, 150, 250, 50),
(63, 'Cerveza duff mediana', 'Licor', 1, 50, 1, 150, 250, 50),
(64, 'Cerveza artesanal grande', 'Licor', 1, 51, 1, 150, 250, 50),
(65, 'Cerveza polar pequeña', 'Licor', 1, 52, 1, 150, 250, 50);

-- --------------------------------------------------------

--
-- Table structure for table `SUBCATEGORIA`
--

CREATE TABLE `SUBCATEGORIA` (
  `subcategoriaId` int(11) NOT NULL,
  `nombre` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `categoria_categoriaid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `SUBCATEGORIA`
--

INSERT INTO `SUBCATEGORIA` (`subcategoriaId`, `nombre`, `estado`, `categoria_categoriaid`) VALUES
(1, 'Emojis', 1, 1),
(2, 'Peluche hablante', 1, 1),
(3, 'Peluche no hablante', 1, 1),
(4, 'leones', 1, 1),
(5, 'chimuelos', 1, 1),
(6, 'Cumpleaños', 1, 2),
(7, 'Navidad', 1, 2),
(8, 'Amistad', 1, 2),
(9, 'Amor', 1, 2),
(10, 'Chocolatinas', 1, 3),
(11, 'Bombones', 1, 3),
(12, 'Masmelos', 1, 3),
(13, 'Galletas', 1, 3),
(14, 'Gomitas', 1, 3),
(15, 'Bolso cuero', 1, 4),
(16, 'Bolso peluche', 1, 4),
(17, 'Maleta', 1, 4),
(18, 'Labial', 1, 5),
(19, 'Pestañina', 1, 5),
(20, 'Sombras', 1, 5),
(21, 'Iluminadores', 1, 5),
(22, 'Pestañas postizas', 1, 5),
(23, 'Globo metalizado', 1, 6),
(24, 'Globo corazon', 1, 6),
(25, 'Globo helio', 1, 6),
(26, 'Globo transparente', 1, 6),
(27, 'Perfume dama', 1, 7),
(28, 'Perfume caballero', 1, 7),
(29, 'Zapatillas', 1, 8),
(30, 'Pantuflas', 1, 8),
(31, 'Reloj pulso goma', 1, 9),
(32, 'Reloj pulso normal', 1, 9),
(33, 'Posillos personalizados', 1, 10),
(34, 'Copas personalizadas', 1, 10),
(35, 'Cajas de madera', 1, 11),
(36, 'Cajas de carton', 1, 11),
(37, 'Caja decorativa', 1, 11),
(38, 'Cumpleaños', 1, 12),
(39, 'Navidad', 1, 12),
(40, 'Amor', 1, 12),
(41, 'Amistad', 1, 12),
(42, 'Hallowen', 1, 12),
(43, 'Cadenas', 1, 13),
(44, 'Aretes', 1, 13),
(45, 'Anillos', 1, 13),
(47, 'Balacas', 1, 13),
(48, 'Corona', 1, 14),
(49, 'Budweiser', 1, 14),
(50, 'Duff', 1, 14),
(51, 'Artesanal', 1, 14),
(52, 'Polar', 1, 14);

-- --------------------------------------------------------

--
-- Table structure for table `TRANSACCION`
--

CREATE TABLE `TRANSACCION` (
  `Id` int(11) NOT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `TipoTransaccion` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Descripcion` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Usuario` varchar(125) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `TRANSACCION`
--

INSERT INTO `TRANSACCION` (`Id`, `IdProducto`, `Fecha`, `TipoTransaccion`, `Cantidad`, `Descripcion`, `Usuario`) VALUES
(57, 1, '2023-03-13 19:38:07', 'Entrada', 100, NULL, 'kevin'),
(60, 1, '2023-03-13 00:00:00', 'Entrada', 1, NULL, 'kevin'),
(61, 1, '2023-03-13 19:43:07', 'Entrada', 1, NULL, '1'),
(62, 1, '2023-03-13 20:06:00', 'Entrada', 100, NULL, 'kevin.moreno249@misena.edu.co'),
(63, 1, '2023-03-13 20:12:54', 'Entrada', 100, NULL, 'morenoramirezkevinjose@gmail.com'),
(64, 1, '2023-03-13 20:14:46', 'Salida', 6700, NULL, 'morenoramirezkevinjose@gmail.com'),
(65, 1, '2023-03-13 20:16:33', 'Salida', 33, NULL, 'morenoramirezkevinjose@gmail.com'),
(66, 1, '2023-03-13 20:17:09', 'Entrada', 140, NULL, 'morenoramirezkevinjose@gmail.com'),
(67, 1, '2023-03-13 20:26:53', 'Entrada', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(68, 2, '2023-03-13 20:27:21', 'Salida', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(69, 1, '2023-03-13 20:28:17', 'Salida', 10, NULL, 'kevin.moreno249@misena.edu.co'),
(70, 1, '2023-03-13 20:29:24', 'Entrada', 10, NULL, 'kevin.moreno249@misena.edu.co'),
(71, 1, '2023-03-13 20:37:31', 'Salida', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(72, 2, '2023-03-13 20:37:44', 'Entrada', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(73, 1, '2023-03-13 20:39:48', 'Entrada', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(74, 2, '2023-03-13 20:39:58', 'Salida', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(75, 1, '2023-03-13 20:40:42', 'Entrada', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(76, 1, '2023-03-13 20:40:49', 'Salida', 220, NULL, 'kevin.moreno249@misena.edu.co'),
(77, 2, '2023-03-13 20:40:56', 'Entrada', 110, NULL, 'kevin.moreno249@misena.edu.co'),
(78, 1, '2023-03-14 13:47:32', 'Entrada', 100, NULL, 'kevin.moreno249@misena.edu.co'),
(79, 1, '2023-03-14 13:48:11', 'Entrada', 5, NULL, 'kevin.moreno249@misena.edu.co');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AspNetRoles`
--
ALTER TABLE `AspNetRoles`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `s_idx` (`UserId`);

--
-- Indexes for table `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `aspnetuserlogin_aspnetuser_fk` (`UserId`);

--
-- Indexes for table `AspNetUserRoles`
--
ALTER TABLE `AspNetUserRoles`
  ADD PRIMARY KEY (`UserId`,`RoleId`,`Id`),
  ADD KEY `aspnetuserroles_ibfk_2` (`RoleId`);

--
-- Indexes for table `AspNetUsers`
--
ALTER TABLE `AspNetUsers`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`value`);

--
-- Indexes for table `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
  ADD PRIMARY KEY (`categoriaId`);

--
-- Indexes for table `MARCA`
--
ALTER TABLE `MARCA`
  ADD PRIMARY KEY (`marcaId`);

--
-- Indexes for table `PRECIO`
--
ALTER TABLE `PRECIO`
  ADD PRIMARY KEY (`precioId`),
  ADD KEY `Producto_idx` (`producto_productoid`);

--
-- Indexes for table `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  ADD PRIMARY KEY (`productoId`),
  ADD KEY `producto_marca_fk` (`marca_marcaid`),
  ADD KEY `producto_subcategoria_fk` (`subcategoria_subcategoriaid`);

--
-- Indexes for table `SUBCATEGORIA`
--
ALTER TABLE `SUBCATEGORIA`
  ADD PRIMARY KEY (`subcategoriaId`),
  ADD KEY `subcategoria_categoria_fk` (`categoria_categoriaid`);

--
-- Indexes for table `TRANSACCION`
--
ALTER TABLE `TRANSACCION`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Producto_Transaccion` (`IdProducto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `AspNetRoles`
--
ALTER TABLE `AspNetRoles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
  MODIFY `categoriaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `MARCA`
--
ALTER TABLE `MARCA`
  MODIFY `marcaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `PRECIO`
--
ALTER TABLE `PRECIO`
  MODIFY `precioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  MODIFY `productoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `SUBCATEGORIA`
--
ALTER TABLE `SUBCATEGORIA`
  MODIFY `subcategoriaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `TRANSACCION`
--
ALTER TABLE `TRANSACCION`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AspNetUserClaims`
--
ALTER TABLE `AspNetUserClaims`
  ADD CONSTRAINT `Claims_User` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`);

--
-- Constraints for table `AspNetUserLogins`
--
ALTER TABLE `AspNetUserLogins`
  ADD CONSTRAINT `aspnetuserlogin_aspnetuser_fk` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`);

--
-- Constraints for table `AspNetUserRoles`
--
ALTER TABLE `AspNetUserRoles`
  ADD CONSTRAINT `AspNetUserRoles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AspNetUserRoles_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `User` FOREIGN KEY (`value`) REFERENCES `AspNetUsers` (`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `PRECIO`
--
ALTER TABLE `PRECIO`
  ADD CONSTRAINT `Producto` FOREIGN KEY (`producto_productoid`) REFERENCES `PRODUCTO` (`productoId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  ADD CONSTRAINT `Subcategoria` FOREIGN KEY (`subcategoria_subcategoriaid`) REFERENCES `SUBCATEGORIA` (`subcategoriaId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `marca` FOREIGN KEY (`marca_marcaid`) REFERENCES `MARCA` (`marcaId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `SUBCATEGORIA`
--
ALTER TABLE `SUBCATEGORIA`
  ADD CONSTRAINT `categoria` FOREIGN KEY (`categoria_categoriaid`) REFERENCES `CATEGORIA` (`categoriaId`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `TRANSACCION`
--
ALTER TABLE `TRANSACCION`
  ADD CONSTRAINT `Producto_Transaccion` FOREIGN KEY (`IdProducto`) REFERENCES `PRODUCTO` (`productoId`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
