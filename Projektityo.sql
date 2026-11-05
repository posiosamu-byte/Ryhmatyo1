-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Isäntä: db
-- Luontiaika: 05.11.2026 klo 09:52
-- Palvelimen versio: 8.0.46
-- PHP-versio 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Tietokanta: `Projektityo`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `Kayttaja`
--

CREATE TABLE `Kayttaja` (
  `Kayttaja_id` int NOT NULL,
  `nimi` varchar(255) NOT NULL,
  `sahkoposti` varchar(255) NOT NULL,
  `salasana_hash` varchar(255) NOT NULL,
  `rooli` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Kurssi`
--

CREATE TABLE `Kurssi` (
  `Kurssi_id` int NOT NULL,
  `nimi` int NOT NULL,
  `kurssikoodi` int NOT NULL,
  `vastaava_opettaja_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Laite`
--

CREATE TABLE `Laite` (
  `varuste_id` int NOT NULL,
  `nimi` varchar(255) NOT NULL,
  `kuvaus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Tila/Luokka`
--

CREATE TABLE `Tila/Luokka` (
  `Tila_id` int NOT NULL,
  `tilan_numero` int NOT NULL,
  `kapasiteetti` int NOT NULL,
  `rakennus` varchar(255) NOT NULL,
  `kerros` int NOT NULL,
  `tilan_tyyppi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Tilan_varuste`
--

CREATE TABLE `Tilan_varuste` (
  `tila_id` int NOT NULL,
  `varuste_id` int NOT NULL,
  `maara` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Varaus`
--

CREATE TABLE `Varaus` (
  `Varaus_id` int NOT NULL,
  `alkuaika` time(6) NOT NULL,
  `loppuaika` time(6) NOT NULL,
  `tila_status` varchar(255) NOT NULL,
  `kuvaus/tarkoitus` varchar(255) NOT NULL,
  `Tila` varchar(255) NOT NULL,
  `kayttaja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indeksit taulukolle `Kayttaja`
--
ALTER TABLE `Kayttaja`
  ADD PRIMARY KEY (`Kayttaja_id`);

--
-- Indeksit taulukolle `Kurssi`
--
ALTER TABLE `Kurssi`
  ADD PRIMARY KEY (`Kurssi_id`);

--
-- Indeksit taulukolle `Laite`
--
ALTER TABLE `Laite`
  ADD PRIMARY KEY (`varuste_id`);

--
-- Indeksit taulukolle `Tila/Luokka`
--
ALTER TABLE `Tila/Luokka`
  ADD PRIMARY KEY (`Tila_id`);

--
-- Indeksit taulukolle `Varaus`
--
ALTER TABLE `Varaus`
  ADD PRIMARY KEY (`Varaus_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Kayttaja`
--
ALTER TABLE `Kayttaja`
  MODIFY `Kayttaja_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Kurssi`
--
ALTER TABLE `Kurssi`
  MODIFY `Kurssi_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Laite`
--
ALTER TABLE `Laite`
  MODIFY `varuste_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tila/Luokka`
--
ALTER TABLE `Tila/Luokka`
  MODIFY `Tila_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Varaus`
--
ALTER TABLE `Varaus`
  MODIFY `Varaus_id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
