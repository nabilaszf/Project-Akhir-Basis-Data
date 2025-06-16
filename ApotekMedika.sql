-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2025 at 03:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotekmedikaa`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_pelanggan` (IN `p_id_pelanggan` VARCHAR(10), IN `p_nama` VARCHAR(100), IN `p_alamat` VARCHAR(200), IN `p_no_hp` VARCHAR(15))   BEGIN
    INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, alamat, no_hp)
    VALUES (p_id_pelanggan, p_nama, p_alamat, p_no_hp);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID_Admin` varchar(10) NOT NULL,
  `Nama_Admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID_Admin`, `Nama_Admin`) VALUES
('A1', 'Agus'),
('A2', 'Bambang'),
('A3', 'Cahya'),
('A4', 'Danu'),
('A5', 'Eka');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pemesanan`
--

CREATE TABLE `detail_pemesanan` (
  `ID_Pemesanan` varchar(10) NOT NULL,
  `ID_Obat` varchar(10) NOT NULL,
  `Jumlah` varchar(10) DEFAULT NULL,
  `Subtotal_Harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_pemesanan`
--

INSERT INTO `detail_pemesanan` (`ID_Pemesanan`, `ID_Obat`, `Jumlah`, `Subtotal_Harga`) VALUES
('P1', 'O2', '1', 9800.00),
('P10', 'O5', '1', 5870.00),
('P2', 'O1', '1', 5762.00),
('P3', 'O3', '1', 1700.00),
('P4', 'O2', '1', 9800.00),
('P5', 'O5', '1', 5870.00),
('P6', 'O2', '1', 9800.00),
('P7', 'O1', '1', 5762.00),
('P8', 'O1', '1', 5510.00),
('P9', 'O4', '1', 4530.00);

--
-- Triggers `detail_pemesanan`
--
DELIMITER $$
CREATE TRIGGER `kurangi_stok_obat` AFTER INSERT ON `detail_pemesanan` FOR EACH ROW BEGIN
    UPDATE obat
    SET stok = stok - NEW.jumlah
    WHERE id_obat = NEW.id_obat;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_resep`
--

CREATE TABLE `detail_resep` (
  `ID_Resep` varchar(10) NOT NULL,
  `ID_Obat` varchar(10) NOT NULL,
  `Jumlah` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_resep`
--

INSERT INTO `detail_resep` (`ID_Resep`, `ID_Obat`, `Jumlah`) VALUES
('R1', 'O2', '1'),
('R10', 'O5', '1'),
('R2', 'O1', '1'),
('R3', 'O3', '1'),
('R4', 'O2', '1'),
('R5', 'O5', '1'),
('R6', 'O2', '1'),
('R7', 'O1', '1'),
('R8', 'O1', '1'),
('R9', 'O4', '1');

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `ID_Obat` varchar(10) NOT NULL,
  `Nama_Obat` varchar(100) DEFAULT NULL,
  `Jenis_Obat` varchar(50) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL,
  `Harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`ID_Obat`, `Nama_Obat`, `Jenis_Obat`, `Stok`, `Harga`) VALUES
('O1', 'Paracetamol', 'Obat Bebas', 10, 5762.00),
('O2', 'Amoxicillin', 'Obat Keras', 10, 9800.00),
('O3', 'Morfin', 'Obat Keras Khusus', 10, 1700.00),
('O4', 'Cetirizine', 'Obat Bebas Terbatas', 25, 4530.00),
('O5', 'Omeprazole', 'Obat Keras', 18, 5870.00),
('O6', 'Antasida Doen', 'Obat Bebas', 15, 5510.00);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID_Pelanggan` varchar(10) NOT NULL,
  `Nama_Pelanggan` varchar(100) DEFAULT NULL,
  `Alamat` text DEFAULT NULL,
  `No_Hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`ID_Pelanggan`, `Nama_Pelanggan`, `Alamat`, `No_Hp`) VALUES
('2422', 'Faiz', 'Ngadimulyo', '082420506022'),
('2423', 'Zara', 'Mertoyudan', '082420506023'),
('2427', 'Rama', 'Pringsurat', '082420506027'),
('2458', 'Bila', 'Krasak', '082430506058'),
('2481', 'Rara', 'Rejowinangun', '2440506081'),
('2482', 'Jennie', 'Jambesari', '2440506082');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `ID_Pembayaran` varchar(10) NOT NULL,
  `ID_Pemesanan` varchar(10) DEFAULT NULL,
  `ID_Pelanggan` varchar(10) DEFAULT NULL,
  `Metode_Pembayaran` varchar(50) DEFAULT NULL,
  `Tanggal_Bayar` date DEFAULT NULL,
  `Status_Bayar` enum('Paid','Unpaid') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`ID_Pembayaran`, `ID_Pemesanan`, `ID_Pelanggan`, `Metode_Pembayaran`, `Tanggal_Bayar`, `Status_Bayar`) VALUES
('B1', 'P1', '2422', 'Transfer', '2025-06-02', 'Paid'),
('B10', 'P10', '2422', 'Cash On Delivery', '2025-06-04', 'Paid'),
('B2', 'P2', '2423', 'Transfer', '2025-06-02', 'Paid'),
('B3', 'P3', '2427', 'Transfer', '2025-06-02', 'Paid'),
('B4', 'P4', '2458', 'Transfer', '2025-06-02', 'Paid'),
('B5', 'P5', '2423', 'Transfer', '2025-06-04', 'Paid'),
('B6', 'P6', '2458', 'Cash On Delivery', '2025-06-04', 'Paid'),
('B7', 'P7', '2482', 'Cash On Delivery', '2025-06-04', 'Paid'),
('B8', 'P8', '2481', 'Transfer', '2025-06-04', 'Paid'),
('B9', 'P9', '2423', 'Cash On Delivery', '2025-06-04', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `ID_Pemesanan` varchar(10) NOT NULL,
  `ID_Pelanggan` varchar(10) DEFAULT NULL,
  `ID_Admin` varchar(10) DEFAULT NULL,
  `Tanggal_Pesan` date DEFAULT NULL,
  `Total_Harga` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemesanan`
--

INSERT INTO `pemesanan` (`ID_Pemesanan`, `ID_Pelanggan`, `ID_Admin`, `Tanggal_Pesan`, `Total_Harga`) VALUES
('P1', '2422', 'A1', '2025-06-02', 9800.00),
('P10', '2422', 'A5', '2025-06-04', 5870.00),
('P2', '2423', 'A2', '2025-06-02', 5762.00),
('P3', '2427', 'A2', '2025-06-02', 1700.00),
('P4', '2458', 'A1', '2025-06-02', 9800.00),
('P5', '2423', 'A4', '2025-06-04', 5870.00),
('P6', '2458', 'A4', '2025-06-04', 9800.00),
('P7', '2482', 'A4', '2025-06-04', 5762.00),
('P8', '2481', 'A5', '2025-06-04', 5510.00),
('P9', '2423', 'A5', '2025-06-04', 4530.00);

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `ID_Pengiriman` varchar(10) NOT NULL,
  `ID_Pemesanan` varchar(10) DEFAULT NULL,
  `Tanggal_Pengiriman` date DEFAULT NULL,
  `Status_Pengiriman` enum('Terkirim','Belum Terkirim') DEFAULT NULL,
  `Alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`ID_Pengiriman`, `ID_Pemesanan`, `Tanggal_Pengiriman`, `Status_Pengiriman`, `Alamat`) VALUES
('K1', 'P1', '2025-06-02', 'Terkirim', 'Ngadimulyo'),
('K10', 'P10', '2025-06-04', 'Terkirim', 'Ngadimulyo'),
('K2', 'P2', '2025-06-02', 'Terkirim', 'Mertoyudan'),
('K3', 'P3', '2025-06-02', 'Terkirim', 'Pringsurat'),
('K4', 'P4', '2025-06-02', 'Terkirim', 'Krasak'),
('K5', 'P5', '2025-06-04', 'Terkirim', 'Mertoyudan'),
('K6', 'P6', '2025-06-04', 'Terkirim', 'Krasak'),
('K7', 'P7', '2025-06-04', 'Terkirim', 'Jambesari'),
('K8', 'P8', '2025-06-04', 'Terkirim', 'Rejowinangun'),
('K9', 'P9', '2025-06-04', 'Terkirim', 'Mertoyudan');

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `ID_Resep` varchar(10) NOT NULL,
  `ID_Pemesanan` varchar(10) DEFAULT NULL,
  `Nama_Dokter` varchar(100) DEFAULT NULL,
  `Keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`ID_Resep`, `ID_Pemesanan`, `Nama_Dokter`, `Keterangan`) VALUES
('R1', 'P1', 'dr. Richard', 'Obat harus habis.'),
('R10', 'P10', 'dr. Richard', 'Obat harus habis.'),
('R2', 'P2', 'dr. Ayman', 'Obat harus habis.'),
('R3', 'P3', 'dr. Ikhsan', 'Obat harus habis.'),
('R4', 'P4', 'dr. Farhan', 'Obat harus habis.'),
('R5', 'P5', 'dr. Ayman', '-'),
('R6', 'P6', 'dr. Ayman', '-'),
('R7', 'P7', 'dr. Ikhsan', 'Obat harus habis.'),
('R8', 'P8', 'dr. Farhan', 'Obat harus habis.'),
('R9', 'P9', 'dr. Farhan', 'Obat harus habis.');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_obat_stok`
-- (See below for the actual view)
--
CREATE TABLE `view_obat_stok` (
`id_obat` varchar(10)
,`nama_obat` varchar(100)
,`jenis_obat` varchar(50)
,`harga` decimal(10,2)
,`stok` int(11)
,`status_stok` varchar(17)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_obat_terlaris`
-- (See below for the actual view)
--
CREATE TABLE `view_obat_terlaris` (
`Nama_Obat` varchar(100)
,`Total_Dibeli` double
);

-- --------------------------------------------------------

--
-- Structure for view `view_obat_stok`
--
DROP TABLE IF EXISTS `view_obat_stok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_obat_stok`  AS SELECT `obat`.`ID_Obat` AS `id_obat`, `obat`.`Nama_Obat` AS `nama_obat`, `obat`.`Jenis_Obat` AS `jenis_obat`, `obat`.`Harga` AS `harga`, `obat`.`Stok` AS `stok`, CASE WHEN `obat`.`Stok` = 0 THEN 'Stok Habis' WHEN `obat`.`Stok` < 10 THEN 'Stok Hampir Habis' ELSE 'Stok Aman' END AS `status_stok` FROM `obat` ;

-- --------------------------------------------------------

--
-- Structure for view `view_obat_terlaris`
--
DROP TABLE IF EXISTS `view_obat_terlaris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_obat_terlaris`  AS SELECT `o`.`Nama_Obat` AS `Nama_Obat`, sum(`dp`.`Jumlah`) AS `Total_Dibeli` FROM (`detail_pemesanan` `dp` join `obat` `o` on(`dp`.`ID_Obat` = `o`.`ID_Obat`)) GROUP BY `o`.`ID_Obat` ORDER BY sum(`dp`.`Jumlah`) DESC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID_Admin`);

--
-- Indexes for table `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD PRIMARY KEY (`ID_Pemesanan`,`ID_Obat`),
  ADD KEY `ID_Obat` (`ID_Obat`);

--
-- Indexes for table `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD PRIMARY KEY (`ID_Resep`,`ID_Obat`),
  ADD KEY `ID_Obat` (`ID_Obat`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`ID_Obat`),
  ADD KEY `idx_nama_obat` (`Nama_Obat`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID_Pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`ID_Pembayaran`),
  ADD KEY `ID_Pemesanan` (`ID_Pemesanan`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`ID_Pemesanan`),
  ADD KEY `ID_Pelanggan` (`ID_Pelanggan`),
  ADD KEY `ID_Admin` (`ID_Admin`);

--
-- Indexes for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD PRIMARY KEY (`ID_Pengiriman`),
  ADD KEY `ID_Pemesanan` (`ID_Pemesanan`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`ID_Resep`),
  ADD KEY `ID_Pemesanan` (`ID_Pemesanan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pemesanan`
--
ALTER TABLE `detail_pemesanan`
  ADD CONSTRAINT `detail_pemesanan_ibfk_1` FOREIGN KEY (`ID_Pemesanan`) REFERENCES `pemesanan` (`ID_Pemesanan`),
  ADD CONSTRAINT `detail_pemesanan_ibfk_2` FOREIGN KEY (`ID_Obat`) REFERENCES `obat` (`ID_Obat`);

--
-- Constraints for table `detail_resep`
--
ALTER TABLE `detail_resep`
  ADD CONSTRAINT `detail_resep_ibfk_1` FOREIGN KEY (`ID_Resep`) REFERENCES `resep` (`ID_Resep`),
  ADD CONSTRAINT `detail_resep_ibfk_2` FOREIGN KEY (`ID_Obat`) REFERENCES `obat` (`ID_Obat`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`ID_Pemesanan`) REFERENCES `pemesanan` (`ID_Pemesanan`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`);

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`ID_Pelanggan`) REFERENCES `pelanggan` (`ID_Pelanggan`),
  ADD CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`ID_Admin`) REFERENCES `admin` (`ID_Admin`);

--
-- Constraints for table `pengiriman`
--
ALTER TABLE `pengiriman`
  ADD CONSTRAINT `pengiriman_ibfk_1` FOREIGN KEY (`ID_Pemesanan`) REFERENCES `pemesanan` (`ID_Pemesanan`);

--
-- Constraints for table `resep`
--
ALTER TABLE `resep`
  ADD CONSTRAINT `resep_ibfk_1` FOREIGN KEY (`ID_Pemesanan`) REFERENCES `pemesanan` (`ID_Pemesanan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
