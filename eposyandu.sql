-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2021 at 04:24 AM
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
  `tanggal_lahir_anak` date NOT NULL,
  `usia` int(10) NOT NULL,
  `jk_anak` enum('P','L') NOT NULL,
  `id_ibu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_anak`
--

INSERT INTO `ref_anak` (`id_anak`, `nama_anak`, `nik_anak`, `tempat_lahir_anak`, `tanggal_lahir_anak`, `usia`, `jk_anak`, `id_ibu`) VALUES
(2, 'Anisa Meilia', '3709212800944', 'Jakarta', '2021-02-19', 1, 'P', NULL),
(4, 'Andree', '3790284013832', 'Bandung', '2021-02-02', 2, 'L', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ref_ibu`
--

CREATE TABLE `ref_ibu` (
  `id_ibu` int(11) NOT NULL,
  `nama_ibu` varchar(255) NOT NULL,
  `nik_ibu` varchar(20) NOT NULL,
  `alamat_ibu` text NOT NULL,
  `telp_ibu` varchar(20) NOT NULL,
  `foto_ibu` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_ibu`
--

INSERT INTO `ref_ibu` (`id_ibu`, `nama_ibu`, `nik_ibu`, `alamat_ibu`, `telp_ibu`, `foto_ibu`) VALUES
(13, 'Farida Zahra', '3704992032989', 'Jl. Leuwi Panjang', '089398172281', NULL),
(14, 'Violet Aprilia', '3792098842910', 'Jl. Cibaduyut Raya', '089382871728', NULL);

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
  `id_vaksin` varchar(255) NOT NULL,
  `nama_anak` varchar(255) NOT NULL,
  `id_petugas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_imunisasi`
--

INSERT INTO `ref_imunisasi` (`id_imunisasi`, `tgl_imunisasi`, `usia_saat_vaksin`, `tinggi_badan`, `berat_badan`, `periode`, `id_vaksin`, `nama_anak`, `id_petugas`) VALUES
(23, '2021-04-13', 12, 24, 21, 3, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ref_petugas`
--

CREATE TABLE `ref_petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `jabatan_petugas` varchar(50) NOT NULL,
  `jk_petugas` enum('L','P') NOT NULL,
  `temp_lahir_petugas` varchar(50) DEFAULT NULL,
  `tgl_lahir_petugas` date NOT NULL,
  `alamat_petugas` text DEFAULT NULL,
  `telp_petugas` varchar(20) DEFAULT NULL,
  `foto_petugas` int(11) DEFAULT NULL,
  `status_petugas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_petugas`
--

INSERT INTO `ref_petugas` (`id_petugas`, `nama_petugas`, `jabatan_petugas`, `jk_petugas`, `temp_lahir_petugas`, `tgl_lahir_petugas`, `alamat_petugas`, `telp_petugas`, `foto_petugas`, `status_petugas`) VALUES
(3, 'Agus Septian', 'Kepala Posyandu', 'L', 'Bandung', '1965-12-03', 'Jl.Batu Nunggal', '089348002124', NULL, 'Pasif'),
(6, 'sdfaksdfj', 'sdjkfajkh', 'P', 'aksjdfak', '2021-04-02', 'dlkajsdfklj', '090903940', NULL, 'akldsjfa');

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

--
-- Dumping data for table `ref_posyandu`
--

INSERT INTO `ref_posyandu` (`id_posyandu`, `nama_posyandu`, `alamat_posyandu`, `kel_posyandu`, `kec_posyandu`, `kota_kab_posyandu`) VALUES
(1, 'aldkjajsd', 'lksajdfalkjsdfj', 'lkajsdfaslkj', 'kljasdfkj', 'laksjdflakj');

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
(16, 'alksdjaklj');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ref_anak`
--
ALTER TABLE `ref_anak`
  ADD PRIMARY KEY (`id_anak`);

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
  MODIFY `id_anak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ref_ibu`
--
ALTER TABLE `ref_ibu`
  MODIFY `id_ibu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ref_imunisasi`
--
ALTER TABLE `ref_imunisasi`
  MODIFY `id_imunisasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `ref_petugas`
--
ALTER TABLE `ref_petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ref_posyandu`
--
ALTER TABLE `ref_posyandu`
  MODIFY `id_posyandu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ref_vaksin`
--
ALTER TABLE `ref_vaksin`
  MODIFY `id_vaksin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
