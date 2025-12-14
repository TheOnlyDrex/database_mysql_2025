-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 14, 2025 alle 21:50
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_test`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `test_mansioni`
--

CREATE TABLE `test_mansioni` (
  `id` int(11) NOT NULL,
  `mansione` varchar(67) NOT NULL,
  `paga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `test_mansioni`
--

INSERT INTO `test_mansioni` (`id`, `mansione`, `paga`) VALUES
(1, 'falegname', NULL),
(2, 'fabbro', NULL),
(3, 'contadino', 500);

-- --------------------------------------------------------

--
-- Struttura della tabella `test_persone`
--

CREATE TABLE `test_persone` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `eta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `test_persone`
--

INSERT INTO `test_persone` (`id`, `nome`, `cognome`, `eta`) VALUES
(1, 'alberto', 'merola', 67),
(2, 'gilberto', 'alfredi', 16),
(3, 'elisabetta', 'zulli', 34),
(4, 'aurelia', 'gilberti', 44);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `test_mansioni`
--
ALTER TABLE `test_mansioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `test_persone`
--
ALTER TABLE `test_persone`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `test_mansioni`
--
ALTER TABLE `test_mansioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `test_persone`
--
ALTER TABLE `test_persone`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
