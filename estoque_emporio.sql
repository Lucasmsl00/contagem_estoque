-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/10/2024 às 21:19
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estoque_emporio`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `pallets`
--

CREATE TABLE `pallets` (
  `id` int(11) NOT NULL,
  `pallet_number` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `inserted_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pallets`
--

INSERT INTO `pallets` (`id`, `pallet_number`, `product_id`, `quantity`, `inserted_date`) VALUES
(1, 101, 1, 10, '2024-10-20'),
(2, 101, 2, 0, '2024-10-20'),
(3, 102, 3, 15, '2024-10-21'),
(4, 102, 4, 15, '2024-10-21'),
(5, 103, 5, 25, '2024-10-22'),
(6, 103, 6, 40, '2024-10-22'),
(7, 104, 7, 10, '2024-10-23'),
(8, 104, 8, 35, '2024-10-23'),
(9, 101, 1, 10, '2024-10-23'),
(10, 103, 1, 20, '2024-10-23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `volume_code` enum('UN','KG') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `product_code`, `name`, `volume_code`) VALUES
(1, 'PRD001', 'Shampoo 500ml', 'UN'),
(2, 'PRD002', 'Condicionador 500ml', 'UN'),
(3, 'PRD003', 'Cera Capilar 100g', 'UN'),
(4, 'PRD004', 'Máquina de Corte', 'UN'),
(5, 'PRD005', 'Pó Descolorante 1kg', 'KG'),
(6, 'PRD006', 'Gel Fixador 300ml', 'UN'),
(7, 'PRD007', 'Barbeador Elétrico', 'UN'),
(8, 'PRD008', 'Creme para Barbear 200ml', 'UN');

-- --------------------------------------------------------

--
-- Estrutura para tabela `retirada_prod`
--

CREATE TABLE `retirada_prod` (
  `id` int(11) NOT NULL,
  `cod_prod` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `person_name` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `retirada_prod`
--

INSERT INTO `retirada_prod` (`id`, `cod_prod`, `product_name`, `quantity`, `person_name`, `date`) VALUES
(2, 1, '', '10', 'Lucas', '2024-10-23'),
(3, 3, 'Cera Capilar 100g', '5', 'Lucas', '2024-10-23');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pallets`
--
ALTER TABLE `pallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `retirada_prod`
--
ALTER TABLE `retirada_prod`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pallets`
--
ALTER TABLE `pallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `retirada_prod`
--
ALTER TABLE `retirada_prod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pallets`
--
ALTER TABLE `pallets`
  ADD CONSTRAINT `pallets_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
