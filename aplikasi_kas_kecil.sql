-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2018 at 03:28 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_kas_kecil`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_pengajuan`
--

CREATE TABLE `data_pengajuan` (
  `id_pengajuan` int(11) NOT NULL,
  `id_pegawai` char(18) DEFAULT NULL,
  `nama_pegawai` varchar(50) DEFAULT NULL,
  `tanggal_pengajuan` date DEFAULT NULL,
  `tanggal_disetujui` date DEFAULT NULL,
  `status` char(16) NOT NULL DEFAULT 'Belum Di Setujui'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_pengajuan`
--

INSERT INTO `data_pengajuan` (`id_pengajuan`, `id_pegawai`, `nama_pegawai`, `tanggal_pengajuan`, `tanggal_disetujui`, `status`) VALUES
(1, 'pegawai', 'testing user', '2018-06-21', '2018-06-21', 'Telah Di Setujui'),
(2, 'pegawai', 'testing user', '2018-06-24', '2018-06-24', 'Telah Di Setujui');

-- --------------------------------------------------------

--
-- Table structure for table `data_rekening`
--

CREATE TABLE `data_rekening` (
  `id` int(11) NOT NULL,
  `no_rekening` int(3) NOT NULL,
  `kode_rekening` char(3) NOT NULL,
  `id_barang` int(3) DEFAULT NULL,
  `nama_barang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_rekening`
--

INSERT INTO `data_rekening` (`id`, `no_rekening`, `kode_rekening`, `id_barang`, `nama_barang`) VALUES
(1, 511, 'ATK', 1, 'Perfarat (Pembolong Kertas)'),
(2, 511, 'ATK', 2, 'Stepler'),
(3, 511, 'ATK', 3, 'Steples'),
(4, 511, 'ATK', 4, 'Map'),
(5, 511, 'ATK', 5, 'Pulpen'),
(6, 511, 'ATK', 6, 'Pensil'),
(7, 511, 'ATK', 7, 'Tinta'),
(8, 511, 'ATK', 8, 'Kertas'),
(9, 511, 'ATK', 9, 'Gunting'),
(10, 511, 'ATK', 10, 'Cuter'),
(11, 511, 'ATK', 11, 'Solatip'),
(12, 511, 'ATK', 12, 'Clip'),
(13, 511, 'ATK', 13, 'Penggaris'),
(14, 511, 'ATK', 14, 'Amplop '),
(15, 511, 'ATK', 15, 'Materai'),
(16, 502, 'OPS', 1, 'Transportasi'),
(17, 502, 'OPS', 2, 'Meeting');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengajuan`
--

CREATE TABLE `detail_pengajuan` (
  `id` int(11) NOT NULL,
  `id_pengajuan` int(11) NOT NULL,
  `id_pegawai` char(18) NOT NULL,
  `no_rekening` int(3) NOT NULL,
  `id_barang` int(3) NOT NULL,
  `nama_barang` varchar(30) NOT NULL,
  `unit` char(10) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pengajuan`
--

INSERT INTO `detail_pengajuan` (`id`, `id_pengajuan`, `id_pegawai`, `no_rekening`, `id_barang`, `nama_barang`, `unit`, `jumlah`, `keterangan`) VALUES
(3, 1, 'pegawai', 511, 5, 'Pulpen', 'Pcs', 10, 'Penambahan pulpen karyawan'),
(4, 2, 'pegawai', 511, 3, 'Steples', 'Pcs', 4, 'penambahan alat kantor');

-- --------------------------------------------------------

--
-- Table structure for table `pembentukan_dana`
--

CREATE TABLE `pembentukan_dana` (
  `no_pengisian` varchar(15) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah` int(15) NOT NULL DEFAULT '0',
  `terpakai` int(15) NOT NULL DEFAULT '0',
  `keterangan` varchar(25) DEFAULT NULL,
  `uraian` varchar(40) DEFAULT NULL,
  `terakhir_digunakan` datetime DEFAULT NULL,
  `jumlah_pengisian_kembali` double NOT NULL DEFAULT '0',
  `tanggal_pengisian_kembali` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembentukan_dana`
--

INSERT INTO `pembentukan_dana` (`no_pengisian`, `tanggal`, `jumlah`, `terpakai`, `keterangan`, `uraian`, `terakhir_digunakan`, `jumlah_pengisian_kembali`, `tanggal_pengisian_kembali`) VALUES
('PBK/18/06/001', '2018-06-21', 10000000, 350000, 'Minggu Ketiga', 'Dana Awal Kas Kecil', '2018-06-25 06:22:10', 500000, '2018-06-24 13:54:24');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran_dana`
--

CREATE TABLE `pengeluaran_dana` (
  `kode_transaksi` varchar(15) NOT NULL,
  `no_nota` varchar(15) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_barang` int(3) DEFAULT NULL,
  `no_rekening` int(3) DEFAULT NULL,
  `keterangan` text,
  `uraian` varchar(50) DEFAULT NULL,
  `nominal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran_dana`
--

INSERT INTO `pengeluaran_dana` (`kode_transaksi`, `no_nota`, `tanggal`, `id_barang`, `no_rekening`, `keterangan`, `uraian`, `nominal`) VALUES
('TRX/18/06/001', 'PBK/18/06/001', '2018-06-25', 5, 511, 'Biaya  Alat Tulis Kantor', 'pembelian pulpen', 200000),
('TRX/18/06/002', 'PBK/18/06/001', '2018-06-25', 3, 511, 'Biaya  Alat Tulis Kantor', 'pembelian steples', 150000);

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `no_rekening` int(3) NOT NULL,
  `kode_rekening` char(3) NOT NULL,
  `keterangan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`no_rekening`, `kode_rekening`, `keterangan`) VALUES
(502, 'OPS', ' Biaya Operasional'),
(511, 'ATK', ' Biaya  Alat Tulis Kantor');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `username` char(18) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `jabatan` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` char(18) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `jabatan` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `nama`, `password`, `jabatan`) VALUES
('admin', 'testing user', '123', 'Admin'),
('keuangan', 'testing user', '123', 'Keuangan'),
('pegawai', 'testing user', '123', 'Pegawai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_pengajuan`
--
ALTER TABLE `data_pengajuan`
  ADD PRIMARY KEY (`id_pengajuan`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `nama_pegawai` (`nama_pegawai`);

--
-- Indexes for table `data_rekening`
--
ALTER TABLE `data_rekening`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nama_barang` (`nama_barang`),
  ADD KEY `no_rekening` (`no_rekening`),
  ADD KEY `kode_rekening` (`kode_rekening`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `detail_pengajuan`
--
ALTER TABLE `detail_pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_pengajuan` (`id_pengajuan`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `no_rekening` (`no_rekening`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `pembentukan_dana`
--
ALTER TABLE `pembentukan_dana`
  ADD PRIMARY KEY (`no_pengisian`);

--
-- Indexes for table `pengeluaran_dana`
--
ALTER TABLE `pengeluaran_dana`
  ADD PRIMARY KEY (`kode_transaksi`),
  ADD KEY `no_nota` (`no_nota`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no_rekening`),
  ADD UNIQUE KEY `kode_rekening` (`kode_rekening`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`username`),
  ADD KEY `nama` (`nama`),
  ADD KEY `password` (`password`),
  ADD KEY `jabatan` (`jabatan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD KEY `nama` (`nama`),
  ADD KEY `password` (`password`),
  ADD KEY `jabatan` (`jabatan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_rekening`
--
ALTER TABLE `data_rekening`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `detail_pengajuan`
--
ALTER TABLE `detail_pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rekening`
--
ALTER TABLE `data_rekening`
  ADD CONSTRAINT `data_rekening_ibfk_1` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_rekening_ibfk_2` FOREIGN KEY (`kode_rekening`) REFERENCES `rekening` (`kode_rekening`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_pengajuan`
--
ALTER TABLE `detail_pengajuan`
  ADD CONSTRAINT `detail_pengajuan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `data_rekening` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pengajuan_ibfk_2` FOREIGN KEY (`no_rekening`) REFERENCES `data_rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pengajuan_ibfk_3` FOREIGN KEY (`id_pengajuan`) REFERENCES `data_pengajuan` (`id_pengajuan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengeluaran_dana`
--
ALTER TABLE `pengeluaran_dana`
  ADD CONSTRAINT `pengeluaran_dana_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `detail_pengajuan` (`id_barang`),
  ADD CONSTRAINT `pengeluaran_dana_ibfk_2` FOREIGN KEY (`no_rekening`) REFERENCES `detail_pengajuan` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengeluaran_dana_ibfk_3` FOREIGN KEY (`no_nota`) REFERENCES `pembentukan_dana` (`no_pengisian`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`nama`) REFERENCES `user` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_ibfk_3` FOREIGN KEY (`password`) REFERENCES `user` (`password`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sessions_ibfk_4` FOREIGN KEY (`jabatan`) REFERENCES `user` (`jabatan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
