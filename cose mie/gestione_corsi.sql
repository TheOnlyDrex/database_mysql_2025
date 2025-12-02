-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 02, 2025 alle 13:11
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
-- Database: `gestione_corsi`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aule`
--

CREATE TABLE `aule` (
  `id` int(11) NOT NULL,
  `sede_id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `capienza` int(11) NOT NULL,
  `numero` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `aule`
--

INSERT INTO `aule` (`id`, `sede_id`, `nome`, `capienza`, `numero`) VALUES
(1, 1, 'Aula Magna', 100, 'A01'),
(2, 2, 'Laboratorio', 30, 'L02'),
(3, 0, 'Aula Standard', 50, 'S03');

-- --------------------------------------------------------

--
-- Struttura della tabella `certificazioni`
--

CREATE TABLE `certificazioni` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_certificazione` date NOT NULL,
  `punteggio_minimo` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi`
--

CREATE TABLE `corsi` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` text NOT NULL,
  `durata_ore` int(11) NOT NULL,
  `costo` decimal(8,2) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `corsi`
--

INSERT INTO `corsi` (`id`, `nome`, `descrizione`, `durata_ore`, `costo`, `data_inizio`, `data_fine`) VALUES
(1, 'SQL Base', 'Corso introduttivo a SQL', 40, 300.00, '2023-04-01', '2023-04-30'),
(2, 'MySQL Avanzato', 'Approfondimenti su MySQL', 60, 450.50, '2023-05-01', '2023-06-15'),
(3, 'Programmazione Web', 'Corso di programmazione web', 50, 350.75, '2023-06-01', '2023-06-30');

-- --------------------------------------------------------

--
-- Struttura della tabella `corsisti`
--

CREATE TABLE `corsisti` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_di_nascita` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` int(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `corsisti`
--

INSERT INTO `corsisti` (`id`, `nome`, `cognome`, `data_di_nascita`, `email`, `telefono`) VALUES
(1, 'Mario', 'Rossi', '1985-12-15', 'mario.rossi@example.com', 1234567890),
(2, 'Anna', 'Bianchi', '1990-07-20', 'anna.bianchi@example.com', 987654321),
(3, 'Luca', 'Verdi', '1988-11-30', 'luca.verdi@example.com', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `corsi_frequentati`
--

CREATE TABLE `corsi_frequentati` (
  `id` int(11) NOT NULL,
  `corsista_id` int(11) NOT NULL,
  `corso_id` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  `voto_finale` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `docenti`
--

CREATE TABLE `docenti` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `data_assunzione` date NOT NULL,
  `stipendio` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sedi`
--

CREATE TABLE `sedi` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `localita` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `sedi`
--

INSERT INTO `sedi` (`id`, `nome`, `indirizzo`, `localita`) VALUES
(1, 'Principale', NULL, 'Rimini'),
(2, 'Secondario', NULL, 'Riccione');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `aule`
--
ALTER TABLE `aule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sede_id_idx` (`sede_id`);

--
-- Indici per le tabelle `certificazioni`
--
ALTER TABLE `certificazioni`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsi`
--
ALTER TABLE `corsi`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `corsisti`
--
ALTER TABLE `corsisti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`) USING BTREE;

--
-- Indici per le tabelle `corsi_frequentati`
--
ALTER TABLE `corsi_frequentati`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `corsista_id` (`corsista_id`),
  ADD UNIQUE KEY `corso_id` (`corso_id`);

--
-- Indici per le tabelle `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `sedi`
--
ALTER TABLE `sedi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nome_idx` (`nome`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `aule`
--
ALTER TABLE `aule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `certificazioni`
--
ALTER TABLE `certificazioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `corsi`
--
ALTER TABLE `corsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `corsisti`
--
ALTER TABLE `corsisti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `corsi_frequentati`
--
ALTER TABLE `corsi_frequentati`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `docenti`
--
ALTER TABLE `docenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `sedi`
--
ALTER TABLE `sedi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `aule`
--
ALTER TABLE `aule`
  ADD CONSTRAINT `fk_aule_sedi` FOREIGN KEY (`sede_id`) REFERENCES `sedi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `corsi_frequentati`
--
ALTER TABLE `corsi_frequentati`
  ADD CONSTRAINT `fk_corsi` FOREIGN KEY (`corso_id`) REFERENCES `corsi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_corsisti` FOREIGN KEY (`corsista_id`) REFERENCES `corsisti` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
