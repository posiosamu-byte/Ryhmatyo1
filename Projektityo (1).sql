-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Isäntä: db
-- Luontiaika: 09.11.2026 klo 06:08
-- Palvelimen versio: 8.0.46
-- PHP-versio 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `Varaus`, `Tilan_varuste`, `Kurssi`, `Laite`, `Tila_Luokka`, `Kayttaja`;
SET FOREIGN_KEY_CHECKS = 1;


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
  `nimi` varchar(255) NOT NULL,
  `kurssikoodi` varchar(50) NOT NULL,
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
-- Rakenne taululle `Tilan_varuste`
--

CREATE TABLE `Tilan_varuste` (
  `tila_id` int NOT NULL,
  `varuste_id` int NOT NULL,
  `maara` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Tila_Luokka`
--

CREATE TABLE `Tila_Luokka` (
  `Tila_id` int NOT NULL,
  `tilan_numero` int NOT NULL,
  `kapasiteetti` int NOT NULL,
  `rakennus` varchar(255) NOT NULL,
  `kerros` int NOT NULL,
  `tilan_tyyppi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Rakenne taululle `Varaus`
--

CREATE TABLE `Varaus` (
  `Varaus_id` int NOT NULL,
  `alkuaika` datetime NOT NULL,
  `loppuaika` datetime NOT NULL,
  `tila_status` varchar(255) NOT NULL,
  `kuvaus_tarkoitus` varchar(255) NOT NULL,
  `Tila` int NOT NULL,
  `kayttaja` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indeksit taulukolle `Kayttaja`
--
ALTER TABLE `Kayttaja`
  ADD PRIMARY KEY (`Kayttaja_id`),
  ADD UNIQUE KEY `uq_kayttaja_sahkoposti` (`sahkoposti`);

--
-- Indeksit taulukolle `Kurssi`
--
ALTER TABLE `Kurssi`
  ADD PRIMARY KEY (`Kurssi_id`),
  ADD KEY `fk_kurssi_opettaja` (`vastaava_opettaja_id`);

--
-- Indeksit taulukolle `Laite`
--
ALTER TABLE `Laite`
  ADD PRIMARY KEY (`varuste_id`);

--
-- Indeksit taulukolle `Tilan_varuste`
--
ALTER TABLE `Tilan_varuste`
  ADD PRIMARY KEY (`tila_id`,`varuste_id`),
  ADD KEY `fk_tilanvaruste_laite` (`varuste_id`);

--
-- Indeksit taulukolle `Tila_Luokka`
--
ALTER TABLE `Tila_Luokka`
  ADD PRIMARY KEY (`Tila_id`);

--
-- Indeksit taulukolle `Varaus`
--
ALTER TABLE `Varaus`
  ADD PRIMARY KEY (`Varaus_id`),
  ADD KEY `fk_varaus_tila` (`Tila`),
  ADD KEY `fk_varaus_kayttaja` (`kayttaja`);

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
-- AUTO_INCREMENT for table `Tila_Luokka`
--
ALTER TABLE `Tila_Luokka`
  MODIFY `Tila_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Varaus`
--
ALTER TABLE `Varaus`
  MODIFY `Varaus_id` int NOT NULL AUTO_INCREMENT;

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `Kurssi`
--
ALTER TABLE `Kurssi`
  ADD CONSTRAINT `fk_kurssi_opettaja` FOREIGN KEY (`vastaava_opettaja_id`) REFERENCES `Kayttaja` (`Kayttaja_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Rajoitteet taululle `Tilan_varuste`
--
ALTER TABLE `Tilan_varuste`
  ADD CONSTRAINT `fk_tilanvaruste_laite` FOREIGN KEY (`varuste_id`) REFERENCES `Laite` (`varuste_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tilanvaruste_tila` FOREIGN KEY (`tila_id`) REFERENCES `Tila_Luokka` (`Tila_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Rajoitteet taululle `Varaus`
--
ALTER TABLE `Varaus`
  ADD CONSTRAINT `fk_varaus_kayttaja` FOREIGN KEY (`kayttaja`) REFERENCES `Kayttaja` (`Kayttaja_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_varaus_tila` FOREIGN KEY (`Tila`) REFERENCES `Tila_Luokka` (`Tila_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
