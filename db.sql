-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: padadan-db
-- Waktu pembuatan: 07 Nov 2021 pada 12.05
-- Versi server: 8.0.26
-- Versi PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `padadan`
--
CREATE DATABASE IF NOT EXISTS `padadan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `padadan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `_chat_history`
--

CREATE TABLE `_chat_history` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `session` varchar(50) DEFAULT NULL,
  `data` json DEFAULT NULL,
  `serverMessage` text,
  `userMessage` text,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `_chat_history`
--

INSERT INTO `_chat_history` (`id`, `user`, `session`, `data`, `serverMessage`, `userMessage`, `createdAt`, `updatedAt`) VALUES
(1, 2, NULL, '[]', NULL, 'a', '2021-11-07 08:00:07', '2021-11-07 08:00:07'),
(2, 2, NULL, '[]', 'Selamat datang di warung\n    1. Lihat daftar kategori\n    2. Lihat keranjang belanja\n    3. Ubah profil\n    ', 'a', '2021-11-07 10:55:22', '2021-11-07 10:55:22'),
(3, 2, NULL, '[]', 'Selamat datang di warung\n1. Lihat daftar kategori\n2. Lihat keranjang belanja\n3. Ubah profil\n', 'a', '2021-11-07 10:56:42', '2021-11-07 10:56:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_product`
--

CREATE TABLE `_product` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createdAt` timestamp NOT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `_product`
--

INSERT INTO `_product` (`id`, `name`, `description`, `img`, `tag`, `createdAt`, `updatedAt`) VALUES
(1, 'Beras 10rb', NULL, NULL, '1,2', '2021-11-07 08:00:07', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `_product_tag`
--

CREATE TABLE `_product_tag` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `_product_tag`
--

INSERT INTO `_product_tag` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'sembako', '2021-11-07 10:21:56', NULL),
(2, 'dapur', '2021-11-07 10:21:56', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `_product_variant`
--

CREATE TABLE `_product_variant` (
  `id` int NOT NULL,
  `product` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `netto` float NOT NULL,
  `unit` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `_product_variant`
--

INSERT INTO `_product_variant` (`id`, `product`, `name`, `netto`, `unit`, `createdAt`, `updatedAt`) VALUES
(1, 1, 'setengah liter', 0.5, 'liter', '2021-11-07 08:00:07', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `_setting`
--

CREATE TABLE `_setting` (
  `id` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `_setting`
--

INSERT INTO `_setting` (`id`, `name`, `value`, `createdAt`, `updatedAt`) VALUES
(1, 'wa session', '{\"WABrowserId\":\"\\\"JkvbhV06vINxcy/q8QZIzw==\\\"\",\"WASecretBundle\":\"{\\\"key\\\":\\\"08lVJ8HnFgdvSQ39MwIkg9nFKeWTHHqgPoM0IdTb+Qs=\\\",\\\"encKey\\\":\\\"3qW1b2Yc2zHwX6nSZdSGozacso3cUREpGUnzAEMsKs4=\\\",\\\"macKey\\\":\\\"08lVJ8HnFgdvSQ39MwIkg9nFKeWTHHqgPoM0IdTb+Qs=\\\"}\",\"WAToken1\":\"\\\"Jk+iKk75+T/G0pQTjuTGAoshYMnEv+GmV2XgSC2jUjU=\\\"\",\"WAToken2\":\"\\\"1@FPNfmGSDe6MPpL10hWVvyyh3LWZ+wmnSlZ62nuAgKqRuanhWQWq+4CqUyRwimIzg2CsLkFv9l38d3w==\\\"\"}', '2021-11-06 08:52:03', '2021-11-07 10:57:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_user`
--

CREATE TABLE `_user` (
  `id` int NOT NULL,
  `whatsapp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `_user`
--

INSERT INTO `_user` (`id`, `whatsapp`, `fullName`, `createdAt`, `updatedAt`) VALUES
(1, '6285559762435@c.us', NULL, '2021-11-06 22:12:05', '2021-11-06 22:12:05'),
(2, '6285210566071@c.us', NULL, '2021-11-06 22:26:04', '2021-11-06 22:26:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `_user_cart`
--

CREATE TABLE `_user_cart` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `product` int NOT NULL,
  `product_variant` int NOT NULL,
  `qty` int NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `_chat_history`
--
ALTER TABLE `_chat_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indeks untuk tabel `_product`
--
ALTER TABLE `_product`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `_product_tag`
--
ALTER TABLE `_product_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `_product_variant`
--
ALTER TABLE `_product_variant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product` (`product`);

--
-- Indeks untuk tabel `_setting`
--
ALTER TABLE `_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `_user`
--
ALTER TABLE `_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `_user_cart`
--
ALTER TABLE `_user_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `product` (`product`),
  ADD KEY `product_variant` (`product_variant`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `_chat_history`
--
ALTER TABLE `_chat_history`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `_product`
--
ALTER TABLE `_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `_product_tag`
--
ALTER TABLE `_product_tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `_product_variant`
--
ALTER TABLE `_product_variant`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `_setting`
--
ALTER TABLE `_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `_user`
--
ALTER TABLE `_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `_user_cart`
--
ALTER TABLE `_user_cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `_chat_history`
--
ALTER TABLE `_chat_history`
  ADD CONSTRAINT `_chat_history_ibfk_1` FOREIGN KEY (`user`) REFERENCES `_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `_product_variant`
--
ALTER TABLE `_product_variant`
  ADD CONSTRAINT `_product_variant_ibfk_1` FOREIGN KEY (`product`) REFERENCES `_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `_user_cart`
--
ALTER TABLE `_user_cart`
  ADD CONSTRAINT `_user_cart_ibfk_1` FOREIGN KEY (`user`) REFERENCES `_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_user_cart_ibfk_2` FOREIGN KEY (`product`) REFERENCES `_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_user_cart_ibfk_3` FOREIGN KEY (`product_variant`) REFERENCES `_product_variant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
