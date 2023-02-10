-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 20-Out-2022 às 19:13
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `financeapp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta`
--

DROP TABLE IF EXISTS `conta`;
CREATE TABLE IF NOT EXISTS `conta` (
  `Id` int(11) AUTO_INCREMENT NOT NULL,
  `Nome` varchar(10) COLLATE latin1_bin NOT NULL,
  `Email` varchar(100) COLLATE latin1_bin NOT NULL,
  `Senha` varchar(64) COLLATE latin1_bin NOT NULL,
  `Senha_token` varchar(64) COLLATE latin1_bin,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id` int(11) AUTO_INCREMENT NOT NULL,
  `Conta_id` int(11) NOT NULL,
  `Nome` varchar(25) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_contaid` (`Conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `Id` int(11) AUTO_INCREMENT NOT NULL,
  `Categoria_id` int(11) NOT NULL,
  `Conta_id` int(11) NOT NULL,
  `Nome` varchar(30) COLLATE latin1_bin NOT NULL,
  `Tipo` char(1) COLLATE latin1_bin NOT NULL,
  `Data` date NOT NULL,
  `Valor` double NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_categoriaid` (`Categoria_id`),
  KEY `fk_contaid` (`Conta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `fk_categoriaid` FOREIGN KEY (`Categoria_id`) REFERENCES `categoria` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
