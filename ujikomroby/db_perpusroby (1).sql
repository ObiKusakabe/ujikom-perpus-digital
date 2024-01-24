-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 03:24 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpusroby`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_buku`
--

CREATE TABLE `t_buku` (
  `bukuID` int(11) NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `tahunTerbit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_kategoribuku`
--

CREATE TABLE `t_kategoribuku` (
  `kategoriID` int(11) NOT NULL,
  `namaKategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_kategoribuku_relasi`
--

CREATE TABLE `t_kategoribuku_relasi` (
  `kategoriBukuRelasiID` int(11) NOT NULL,
  `bukuID` int(11) DEFAULT NULL,
  `kategoriID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_koleksipribadi`
--

CREATE TABLE `t_koleksipribadi` (
  `koleksiID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `bukuID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_peminjaman`
--

CREATE TABLE `t_peminjaman` (
  `peminjamanID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `bukuID` int(11) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `statusPeminjaman` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_ulasanbuku`
--

CREATE TABLE `t_ulasanbuku` (
  `ulasanID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `bukuID` int(11) DEFAULT NULL,
  `ulasan` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telp` varchar(14) DEFAULT NULL,
  `namaLengkap` varchar(150) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `level` enum('admin','petugas','anggota','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`userID`, `username`, `password`, `email`, `telp`, `namaLengkap`, `alamat`, `level`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@email.com', NULL, 'administrator', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_buku`
--
ALTER TABLE `t_buku`
  ADD PRIMARY KEY (`bukuID`);

--
-- Indexes for table `t_kategoribuku`
--
ALTER TABLE `t_kategoribuku`
  ADD PRIMARY KEY (`kategoriID`);

--
-- Indexes for table `t_kategoribuku_relasi`
--
ALTER TABLE `t_kategoribuku_relasi`
  ADD PRIMARY KEY (`kategoriBukuRelasiID`),
  ADD KEY `bukuID` (`bukuID`),
  ADD KEY `kategoriID` (`kategoriID`);

--
-- Indexes for table `t_koleksipribadi`
--
ALTER TABLE `t_koleksipribadi`
  ADD PRIMARY KEY (`koleksiID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `bukuID` (`bukuID`);

--
-- Indexes for table `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  ADD PRIMARY KEY (`peminjamanID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `bukuID` (`bukuID`);

--
-- Indexes for table `t_ulasanbuku`
--
ALTER TABLE `t_ulasanbuku`
  ADD PRIMARY KEY (`ulasanID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `bukuID` (`bukuID`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_buku`
--
ALTER TABLE `t_buku`
  MODIFY `bukuID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_kategoribuku`
--
ALTER TABLE `t_kategoribuku`
  MODIFY `kategoriID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_kategoribuku_relasi`
--
ALTER TABLE `t_kategoribuku_relasi`
  MODIFY `kategoriBukuRelasiID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_koleksipribadi`
--
ALTER TABLE `t_koleksipribadi`
  MODIFY `koleksiID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  MODIFY `peminjamanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_ulasanbuku`
--
ALTER TABLE `t_ulasanbuku`
  MODIFY `ulasanID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_kategoribuku_relasi`
--
ALTER TABLE `t_kategoribuku_relasi`
  ADD CONSTRAINT `t_kategoribuku_relasi_ibfk_1` FOREIGN KEY (`bukuID`) REFERENCES `t_buku` (`bukuID`),
  ADD CONSTRAINT `t_kategoribuku_relasi_ibfk_2` FOREIGN KEY (`kategoriID`) REFERENCES `t_kategoribuku` (`kategoriID`);

--
-- Constraints for table `t_koleksipribadi`
--
ALTER TABLE `t_koleksipribadi`
  ADD CONSTRAINT `t_koleksipribadi_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`),
  ADD CONSTRAINT `t_koleksipribadi_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `t_buku` (`bukuID`);

--
-- Constraints for table `t_peminjaman`
--
ALTER TABLE `t_peminjaman`
  ADD CONSTRAINT `t_peminjaman_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`),
  ADD CONSTRAINT `t_peminjaman_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `t_buku` (`bukuID`);

--
-- Constraints for table `t_ulasanbuku`
--
ALTER TABLE `t_ulasanbuku`
  ADD CONSTRAINT `t_ulasanbuku_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `t_user` (`userID`),
  ADD CONSTRAINT `t_ulasanbuku_ibfk_2` FOREIGN KEY (`bukuID`) REFERENCES `t_buku` (`bukuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
