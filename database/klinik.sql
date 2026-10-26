-- Skema database Klinik dengan data contoh (fiktif).
-- Akun login contoh: pasien1 / demo123 dan pasien2 / demo123.
-- Tabel juga dibuat otomatis oleh aplikasi (ddl-auto=update), file ini hanya
-- untuk melihat struktur dan mencoba dengan data contoh.

CREATE DATABASE IF NOT EXISTS `klinik` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `klinik`;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `gaji` bigint(20) DEFAULT NULL,
  `id_dokter` varchar(6) DEFAULT NULL,
  `ruang_praktik` varchar(6) DEFAULT NULL,
  `tarif` bigint(20) DEFAULT NULL,
  `tipe` varchar(4) DEFAULT NULL,
  `id_insan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`gaji`, `id_dokter`, `ruang_praktik`, `tarif`, `tipe`, `id_insan`) VALUES
(15000000, 'U905', 'R905', 45000, 'UMUM', 5),
(12000000, 'G198', 'R198', 30000, 'GIGI', 6),
(6000000, 'U215', 'R215', 25000, 'UMUM', 8),
(4500000, 'G512', 'R512', 32000, 'GIGI', 9);

-- --------------------------------------------------------

--
-- Table structure for table `dokter_gigi`
--

CREATE TABLE `dokter_gigi` (
  `bedah_mulut` bit(1) NOT NULL,
  `id_insan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter_gigi`
--

INSERT INTO `dokter_gigi` (`bedah_mulut`, `id_insan`) VALUES
(b'1', 6),
(b'0', 9);

-- --------------------------------------------------------

--
-- Table structure for table `dokter_umum`
--

CREATE TABLE `dokter_umum` (
  `bisa_merujuk` bit(1) NOT NULL,
  `id_insan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter_umum`
--

INSERT INTO `dokter_umum` (`bisa_merujuk`, `id_insan`) VALUES
(b'0', 5),
(b'1', 8);

-- --------------------------------------------------------

--
-- Table structure for table `insan`
--

CREATE TABLE `insan` (
  `id_insan` bigint(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `telp` varchar(12) DEFAULT NULL,
  `umur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `insan`
--

INSERT INTO `insan` (`id_insan`, `nama`, `telp`, `umur`) VALUES
(5, 'Dokter Umum Contoh Satu', '081200000005', 34),
(6, 'Dokter Gigi Contoh Satu', '081200000006', 56),
(8, 'Dokter Umum Contoh Dua', '081200000008', 39),
(9, 'Dokter Gigi Contoh Dua', '081200000009', 55),
(10, 'Pasien Contoh Satu', '081200000010', 20),
(13, 'Pasien Contoh Dua', '081200000013', 18);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `alergi` varchar(50) DEFAULT NULL,
  `id_insan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`alergi`, `id_insan`) VALUES
('Kacang', 10),
('Bawang', 13);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` bigint(20) NOT NULL,
  `total_biaya` bigint(20) NOT NULL,
  `uang_bayar` bigint(20) NOT NULL,
  `dokter_id_insan` bigint(20) DEFAULT NULL,
  `pasien_id_insan` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `total_biaya`, `uang_bayar`, `dokter_id_insan`, `pasien_id_insan`) VALUES
(9, 90000, 90000, 5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_keluhan`
--

CREATE TABLE `transaksi_keluhan` (
  `transaksi_id_transaksi` bigint(20) NOT NULL,
  `keluhan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_keluhan`
--

INSERT INTO `transaksi_keluhan` (`transaksi_id_transaksi`, `keluhan`) VALUES
(9, 'Ngilu'),
(9, 'Pusing');

-- --------------------------------------------------------

--
-- Table structure for table `un_pw`
--

CREATE TABLE `un_pw` (
  `id_akun` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `id_insan` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `un_pw`
--

INSERT INTO `un_pw` (`id_akun`, `password`, `username`, `id_insan`) VALUES
(6, 'demo123', 'pasien1', 10),
(9, 'demo123', 'pasien2', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_insan`);

--
-- Indexes for table `dokter_gigi`
--
ALTER TABLE `dokter_gigi`
  ADD PRIMARY KEY (`id_insan`);

--
-- Indexes for table `dokter_umum`
--
ALTER TABLE `dokter_umum`
  ADD PRIMARY KEY (`id_insan`);

--
-- Indexes for table `insan`
--
ALTER TABLE `insan`
  ADD PRIMARY KEY (`id_insan`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_insan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `FK9j6qnl47wqv0rq1qv5ib4rper` (`dokter_id_insan`),
  ADD KEY `FKsw5u068bnbxeeff4g3oc6bstw` (`pasien_id_insan`);

--
-- Indexes for table `transaksi_keluhan`
--
ALTER TABLE `transaksi_keluhan`
  ADD KEY `FKlm6pai66hdj522bf05643mlix` (`transaksi_id_transaksi`);

--
-- Indexes for table `un_pw`
--
ALTER TABLE `un_pw`
  ADD PRIMARY KEY (`id_akun`),
  ADD UNIQUE KEY `UK6v1erekocqw5ufa55b59uf1uc` (`id_insan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `insan`
--
ALTER TABLE `insan`
  MODIFY `id_insan` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `un_pw`
--
ALTER TABLE `un_pw`
  MODIFY `id_akun` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `FKje3wvo8u1pstbrwhicmra14qr` FOREIGN KEY (`id_insan`) REFERENCES `insan` (`id_insan`);

--
-- Constraints for table `dokter_gigi`
--
ALTER TABLE `dokter_gigi`
  ADD CONSTRAINT `FKa2k17c2mbfgxwqtefoqhay0kr` FOREIGN KEY (`id_insan`) REFERENCES `dokter` (`id_insan`);

--
-- Constraints for table `dokter_umum`
--
ALTER TABLE `dokter_umum`
  ADD CONSTRAINT `FKqopyuobig5ct8s3ehjissqdpy` FOREIGN KEY (`id_insan`) REFERENCES `dokter` (`id_insan`);

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `FK1xi20heq6hrbqp0j59hp0ngbe` FOREIGN KEY (`id_insan`) REFERENCES `insan` (`id_insan`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `FK9j6qnl47wqv0rq1qv5ib4rper` FOREIGN KEY (`dokter_id_insan`) REFERENCES `dokter` (`id_insan`),
  ADD CONSTRAINT `FKsw5u068bnbxeeff4g3oc6bstw` FOREIGN KEY (`pasien_id_insan`) REFERENCES `pasien` (`id_insan`);

--
-- Constraints for table `transaksi_keluhan`
--
ALTER TABLE `transaksi_keluhan`
  ADD CONSTRAINT `FKlm6pai66hdj522bf05643mlix` FOREIGN KEY (`transaksi_id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `un_pw`
--
ALTER TABLE `un_pw`
  ADD CONSTRAINT `FK935qdrxt4hfb8vnhi88vco83s` FOREIGN KEY (`id_insan`) REFERENCES `insan` (`id_insan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
