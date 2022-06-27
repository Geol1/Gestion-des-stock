-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2022 at 09:48 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mystock`
--

-- --------------------------------------------------------

--
-- Table structure for table `caissier`
--

CREATE TABLE `caissier` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `montant_vendu_Caissier` int(11) DEFAULT NULL,
  `telephone` varchar(10) NOT NULL,
  `id_patron` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `caissier`
--

INSERT INTO `caissier` (`id`, `nom`, `password`, `montant_vendu_Caissier`, `telephone`, `id_patron`) VALUES
(1, 'abomo', '12345', 125, '699187769', 1),
(6, 'brad', '123456', NULL, '699999999', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `reference` varchar(20) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `id_client` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `create_at` date NOT NULL,
  `update_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `magasinier`
--

CREATE TABLE `magasinier` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `addresse` varchar(10) DEFAULT NULL,
  `id_patron` int(11) DEFAULT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `magasinier`
--

INSERT INTO `magasinier` (`id`, `nom`, `prenom`, `password`, `telephone`, `addresse`, `id_patron`, `image`) VALUES
(1, 'Ken fack', 'Noe', '123456', '671234400 ', 'Ebang ', 1, 'assets/upload/images/9.jpg'),
(2, 'Pro', 'amateur', '123456', ' 695926008', ' ngoua', 1, 'assets/upload/images/13.jpg'),
(4, 'Geol', 'professionnel', '123456', '699999999', 'ngoua', 1, 'assets/upload/images/12.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `patron`
--

CREATE TABLE `patron` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patron`
--

INSERT INTO `patron` (`id`, `email`, `nom`, `prenom`, `address`, `image`, `password`) VALUES
(1, 'ngnitedem@gmail.com', 'Ngnitedem', 'Oldrich ', 'Paris, tour Eifeil', 'assets/upload/images/1.jpg', '123456'),
(2, 'marlin@gmail.com', 'Kougaba', 'Marlin', 'Kribi, plage hawayene', 'assets/upload/images/10.jpg', '123456'),
(3, 'barbara@gmail.com', 'Raye Mounchili', 'Barbara', 'Bonas, parlement', 'assets/upload/images/3.jpg', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `reference` varchar(30) DEFAULT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_patron` int(11) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `reference`, `nom`, `stock`, `prix`, `description`, `id_patron`, `image`) VALUES
(20, ' man02', 'oldrich', 75, 7000, 'kposdkfas', 2, 'assets/upload/images/5.jpg'),
(22, '6546', 'lkklj', 747, 474, '474', 3, 'assets/upload/images/1.jpg'),
(24, 'test', '7', 56, 2312100, 'lepoas   asndoasnd asdaskd sa dsaj dsaj ', 1, 'assets/upload/images/2.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caissier`
--
ALTER TABLE `caissier`
  ADD PRIMARY KEY (`id`,`telephone`),
  ADD KEY `id_patron` (`id_patron`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `magasinier`
--
ALTER TABLE `magasinier`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_patron` (`id_patron`);

--
-- Indexes for table `patron`
--
ALTER TABLE `patron`
  ADD PRIMARY KEY (`id`,`email`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_patron` (`id_patron`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caissier`
--
ALTER TABLE `caissier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `magasinier`
--
ALTER TABLE `magasinier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patron`
--
ALTER TABLE `patron`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caissier`
--
ALTER TABLE `caissier`
  ADD CONSTRAINT `caissier_ibfk_1` FOREIGN KEY (`id_patron`) REFERENCES `patron` (`id`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `magasinier` (`id`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id`);

--
-- Constraints for table `magasinier`
--
ALTER TABLE `magasinier`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_patron`) REFERENCES `patron` (`id`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`id_patron`) REFERENCES `patron` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
