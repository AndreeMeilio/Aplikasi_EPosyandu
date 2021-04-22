-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2021 at 07:00 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eposyandu`
--

-- --------------------------------------------------------

--
-- Table structure for table `ref_anak`
--

CREATE TABLE `ref_anak` (
  `id_anak` int(11) NOT NULL,
  `nama_anak` varchar(50) NOT NULL,
  `nik_anak` varchar(25) NOT NULL,
  `tempat_lahir_anak` varchar(255) NOT NULL,
  `tgl_lahir_anak` date NOT NULL,
  `usia_anak` int(10) NOT NULL,
  `jk_anak` enum('P','L') NOT NULL,
  `id_ibu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_anak`
--

INSERT INTO `ref_anak` (`id_anak`, `nama_anak`, `nik_anak`, `tempat_lahir_anak`, `tgl_lahir_anak`, `usia_anak`, `jk_anak`, `id_ibu`) VALUES
(8, 'Yuli Yulianti', '3721892982119292', 'Bandung  ', '2021-04-15', 3, 'P', 1),
(9, 'Andree Meilio', '3794300298393029', 'Bandung      ', '2021-01-06', 3, 'L', 1),
(10, 'Isti Asih', '3672193203919822', 'Bandung    ', '2021-02-10', 2, 'P', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ref_bantuan`
--

CREATE TABLE `ref_bantuan` (
  `id_bantuan` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `pesan` text NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_bantuan`
--

INSERT INTO `ref_bantuan` (`id_bantuan`, `nama`, `pesan`, `email`) VALUES
(1, 'Andree Meilio', 'dffdfd', 'meilioandree27@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `ref_ibu`
--

CREATE TABLE `ref_ibu` (
  `id_ibu` int(11) NOT NULL,
  `nama_ibu` varchar(255) NOT NULL,
  `nik_ibu` varchar(20) NOT NULL,
  `alamat_ibu` text NOT NULL,
  `no_telp_ibu` varchar(20) NOT NULL,
  `foto_ibu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_ibu`
--

INSERT INTO `ref_ibu` (`id_ibu`, `nama_ibu`, `nik_ibu`, `alamat_ibu`, `no_telp_ibu`, `foto_ibu`) VALUES
(1, 'Violet Evergarden', '3708291990005', 'Jl.Pahlawan no.12', '089342124352', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ref_imunisasi`
--

CREATE TABLE `ref_imunisasi` (
  `id_imunisasi` int(11) NOT NULL,
  `tgl_imunisasi` date NOT NULL,
  `usia_saat_vaksin` int(2) NOT NULL,
  `tinggi_badan` int(3) NOT NULL,
  `berat_badan` int(3) NOT NULL,
  `periode` int(2) NOT NULL,
  `id_vaksin` int(11) DEFAULT NULL,
  `id_anak` int(11) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_imunisasi`
--

INSERT INTO `ref_imunisasi` (`id_imunisasi`, `tgl_imunisasi`, `usia_saat_vaksin`, `tinggi_badan`, `berat_badan`, `periode`, `id_vaksin`, `id_anak`, `id_petugas`) VALUES
(5, '2021-04-14', 2, 54, 11, 2, 2, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ref_login`
--

CREATE TABLE `ref_login` (
  `id_login` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_petugas_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_login`
--

INSERT INTO `ref_login` (`id_login`, `username`, `password`, `id_petugas_login`) VALUES
(2, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 0),
(6, 'petugas1', '2158ff877fab5522711af28b273283033302c577', 1),
(7, 'petugas2', 'b37db86413cd76093be82f93f9cdeccb6de0e730', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ref_petugas`
--

CREATE TABLE `ref_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `jabatan_petugas` varchar(50) NOT NULL,
  `jk_petugas` enum('L','P') NOT NULL,
  `tempat_lahir_petugas` varchar(50) NOT NULL,
  `tgl_lahir_petugas` date NOT NULL,
  `alamat_petugas` text NOT NULL,
  `no_telp_petugas` varchar(20) NOT NULL,
  `foto_petugas` int(11) DEFAULT NULL,
  `status_petugas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_petugas`
--

INSERT INTO `ref_petugas` (`id_petugas`, `nama_petugas`, `jabatan_petugas`, `jk_petugas`, `tempat_lahir_petugas`, `tgl_lahir_petugas`, `alamat_petugas`, `no_telp_petugas`, `foto_petugas`, `status_petugas`) VALUES
(1, 'Zul', 'petugas', 'L', 'Bandung', '2004-01-24', 'Komplek Bojong Malaka Indah', '088809401456  ', NULL, 'aktif'),
(2, 'Keanu Arifin', 'Sekretaris', 'L', 'Bandung', '2021-04-06', 'Jl. Cibaduyut Raya', '089644493902', NULL, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `ref_posyandu`
--

CREATE TABLE `ref_posyandu` (
  `id_posyandu` int(11) NOT NULL,
  `nama_posyandu` varchar(50) NOT NULL,
  `alamat_posyandu` text NOT NULL,
  `kel_posyandu` varchar(50) NOT NULL,
  `kec_posyandu` varchar(50) NOT NULL,
  `kota_kab_posyandu` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ref_vaksin`
--

CREATE TABLE `ref_vaksin` (
  `id_vaksin` int(11) NOT NULL,
  `nama_vaksin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_vaksin`
--

INSERT INTO `ref_vaksin` (`id_vaksin`, `nama_vaksin`) VALUES
(2, 'ada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ref_anak`
--
ALTER TABLE `ref_anak`
  ADD PRIMARY KEY (`id_anak`);

--
-- Indexes for table `ref_bantuan`
--
ALTER TABLE `ref_bantuan`
  ADD PRIMARY KEY (`id_bantuan`);

--
-- Indexes for table `ref_ibu`
--
ALTER TABLE `ref_ibu`
  ADD PRIMARY KEY (`id_ibu`);

--
-- Indexes for table `ref_imunisasi`
--
ALTER TABLE `ref_imunisasi`
  ADD PRIMARY KEY (`id_imunisasi`);

--
-- Indexes for table `ref_login`
--
ALTER TABLE `ref_login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `ref_petugas`
--
ALTER TABLE `ref_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `ref_posyandu`
--
ALTER TABLE `ref_posyandu`
  ADD PRIMARY KEY (`id_posyandu`);

--
-- Indexes for table `ref_vaksin`
--
ALTER TABLE `ref_vaksin`
  ADD PRIMARY KEY (`id_vaksin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ref_anak`
--
ALTER TABLE `ref_anak`
  MODIFY `id_anak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ref_bantuan`
--
ALTER TABLE `ref_bantuan`
  MODIFY `id_bantuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ref_ibu`
--
ALTER TABLE `ref_ibu`
  MODIFY `id_ibu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ref_imunisasi`
--
ALTER TABLE `ref_imunisasi`
  MODIFY `id_imunisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ref_login`
--
ALTER TABLE `ref_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ref_petugas`
--
ALTER TABLE `ref_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ref_posyandu`
--
ALTER TABLE `ref_posyandu`
  MODIFY `id_posyandu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ref_vaksin`
--
ALTER TABLE `ref_vaksin`
  MODIFY `id_vaksin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
