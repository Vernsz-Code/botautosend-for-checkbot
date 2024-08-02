-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 02 Agu 2024 pada 01.37
-- Versi server: 8.0.30
-- Versi PHP: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jadwal_pengecekan_bot`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `custom`
--

CREATE TABLE `custom` (
  `id` int NOT NULL,
  `waktu` time NOT NULL,
  `pesan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift_malam`
--

CREATE TABLE `shift_malam` (
  `id` int NOT NULL,
  `waktu` time NOT NULL,
  `pesan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `shift_malam`
--

INSERT INTO `shift_malam` (`id`, `waktu`, `pesan`) VALUES
(1, '23:00:00', ''),
(2, '23:15:00', ''),
(3, '23:30:00', ''),
(4, '23:45:00', ''),
(5, '00:00:00', ''),
(6, '00:15:00', ''),
(7, '00:30:00', ''),
(8, '00:45:00', ''),
(9, '01:00:00', ''),
(10, '01:15:00', ''),
(11, '01:30:00', ''),
(12, '01:45:00', ''),
(13, '02:00:00', ''),
(14, '02:15:00', ''),
(15, '02:30:00', ''),
(16, '02:45:00', ''),
(17, '03:00:00', ''),
(18, '03:15:00', ''),
(19, '03:30:00', ''),
(20, '03:45:00', ''),
(21, '04:00:00', ''),
(22, '04:15:00', ''),
(23, '04:30:00', ''),
(24, '04:45:00', ''),
(25, '05:00:00', ''),
(26, '05:15:00', ''),
(27, '05:30:00', ''),
(28, '05:45:00', ''),
(29, '06:00:00', ''),
(30, '06:15:00', ''),
(31, '06:30:00', ''),
(32, '06:45:00', ''),
(33, '07:00:00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift_pagi`
--

CREATE TABLE `shift_pagi` (
  `id` int NOT NULL,
  `waktu` time NOT NULL,
  `pesan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `shift_pagi`
--

INSERT INTO `shift_pagi` (`id`, `waktu`, `pesan`) VALUES
(38, '07:00:00', ''),
(39, '07:15:00', ''),
(40, '07:30:00', ''),
(41, '07:45:00', ''),
(42, '08:00:00', ''),
(43, '08:15:00', ''),
(44, '08:30:00', ''),
(45, '08:45:00', ''),
(46, '09:00:00', ''),
(47, '09:15:00', ''),
(48, '09:30:00', ''),
(49, '09:45:00', ''),
(50, '10:00:00', ''),
(51, '10:15:00', ''),
(52, '10:30:00', ''),
(53, '10:45:00', ''),
(54, '11:00:00', ''),
(55, '11:15:00', ''),
(56, '11:30:00', ''),
(57, '11:45:00', ''),
(58, '12:00:00', ''),
(59, '12:15:00', ''),
(60, '12:30:00', ''),
(61, '12:45:00', ''),
(62, '13:00:00', ''),
(63, '13:15:00', ''),
(64, '13:30:00', ''),
(65, '13:45:00', ''),
(66, '14:00:00', ''),
(67, '14:15:00', ''),
(68, '14:30:00', ''),
(69, '14:45:00', ''),
(70, '15:00:00', ''),
(71, '15:15:00', ''),
(72, '15:30:00', ''),
(73, '15:45:00', ''),
(74, '16:00:00', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `shift_siang`
--

CREATE TABLE `shift_siang` (
  `id` int NOT NULL,
  `waktu` time NOT NULL,
  `pesan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `shift_siang`
--

INSERT INTO `shift_siang` (`id`, `waktu`, `pesan`) VALUES
(1, '16:00:00', ''),
(2, '16:15:00', ''),
(3, '16:30:00', ''),
(4, '16:45:00', ''),
(5, '17:00:00', ''),
(6, '17:15:00', ''),
(7, '17:30:00', ''),
(8, '17:45:00', ''),
(9, '18:00:00', ''),
(10, '18:15:00', ''),
(11, '18:30:00', ''),
(12, '18:45:00', ''),
(13, '19:00:00', ''),
(14, '19:15:00', ''),
(15, '19:30:00', ''),
(16, '19:45:00', ''),
(17, '20:00:00', ''),
(18, '20:15:00', ''),
(19, '20:30:00', ''),
(20, '20:45:00', ''),
(21, '21:00:00', ''),
(22, '21:15:00', ''),
(23, '21:30:00', ''),
(24, '21:45:00', ''),
(25, '22:00:00', ''),
(26, '22:15:00', ''),
(27, '22:30:00', ''),
(28, '22:45:00', ''),
(29, '23:00:00', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `custom`
--
ALTER TABLE `custom`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shift_malam`
--
ALTER TABLE `shift_malam`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shift_pagi`
--
ALTER TABLE `shift_pagi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `shift_siang`
--
ALTER TABLE `shift_siang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `custom`
--
ALTER TABLE `custom`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `shift_malam`
--
ALTER TABLE `shift_malam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `shift_pagi`
--
ALTER TABLE `shift_pagi`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT untuk tabel `shift_siang`
--
ALTER TABLE `shift_siang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
