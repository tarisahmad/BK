-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2022 pada 09.35
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` text NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` text NOT NULL,
  `id_kategori` int(11) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama`, `harga`, `stok`, `gambar`, `id_kategori`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Yellow Sweater', 75000, 49990, 'product-1.jpg', 2, 1, '2022-11-28 05:38:01', NULL, NULL),
(2, 'Dusty Pink Crop Swater', 100000, 12, 'product-2.jpg', 2, 1, '2022-11-28 07:01:03', NULL, NULL),
(3, 'Green Jacket', 250000, 3, 'product-3.jpg', 1, 1, '2022-11-28 07:01:03', NULL, NULL),
(4, 'Grey Syal', 50000, 20, 'product-4.jpg', 3, 1, '2022-11-28 07:01:03', NULL, NULL),
(5, 'Yellow Bag', 150000, 40, 'product-7.jpg', 3, 1, '2022-11-28 07:01:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `kode_voucher` varchar(10) NOT NULL,
  `tanggal_mulai_berlaku` date NOT NULL,
  `tanggal_akhir_berlaku` date NOT NULL,
  `besar_diskon` tinyint(2) NOT NULL,
  `aktif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `diskon`
--

INSERT INTO `diskon` (`id`, `kode_voucher`, `tanggal_mulai_berlaku`, `tanggal_akhir_berlaku`, `besar_diskon`, `aktif`) VALUES
(1, 'halo123', '2022-12-13', '2022-12-31', 10, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'Men', 1, '2022-11-28 05:35:38', NULL, NULL),
(2, 'Women', 1, '2022-11-28 05:35:38', NULL, NULL),
(3, 'Kids', 1, '2022-11-28 05:35:38', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
--

CREATE TABLE `komentar` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_barang` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `komentar` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id`, `id_barang`, `id_user`, `komentar`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 2, 1, 'Good Product', 1, '2022-11-28 01:11:02', NULL, NULL),
(2, 3, 2, 'Good', 2, '2022-11-28 01:22:40', NULL, NULL),
(3, 1, 5, 'sadasda', 5, '2022-12-16 19:40:26', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2022-11-25-050448', 'App\\Database\\Migrations\\User', 'default', 'App', 1669352783, 1),
(2, '2022-11-25-050726', 'App\\Database\\Migrations\\Kategori', 'default', 'App', 1669353410, 2),
(3, '2022-11-25-051118', 'App\\Database\\Migrations\\Barang', 'default', 'App', 1669353410, 2),
(4, '2022-11-25-051507', 'App\\Database\\Migrations\\Transaksi', 'default', 'App', 1669353410, 2),
(5, '2022-11-25-051557', 'App\\Database\\Migrations\\Komentar', 'default', 'App', 1669353410, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_barang` int(11) UNSIGNED NOT NULL,
  `id_pembeli` int(11) UNSIGNED NOT NULL,
  `id_diskon` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `ongkir` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_barang`, `id_pembeli`, `id_diskon`, `jumlah`, `total_harga`, `alamat`, `ongkir`, `status`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 2, 1, NULL, 1, 118000, 'Jl. Nakula 1 No.44, Pendrikan Kidul, Semarang Tengah', 18000, 0, 1, '2022-11-28 00:45:21', NULL, NULL),
(2, 3, 2, NULL, 2, 519000, 'Tunahan Rt 21 Rw 06, Keling, Jepara', 19000, 0, 2, '2022-11-28 01:22:23', NULL, NULL),
(3, 2, 4, NULL, 1, 122000, 'Tunahan Rt 21 Rw 06, Keling, Jepara', 22000, 0, 4, '2022-12-07 07:09:01', NULL, NULL),
(4, 1, 4, NULL, 1, 94000, 'Tunahan Rt 21 Rw 06, Keling, Jepara', 19000, 0, 4, '2022-12-07 21:12:54', NULL, NULL),
(5, 2, 4, NULL, 1, 119000, 'Tunahan Rt 21 Rw 06, Keling, Jepara', 19000, 0, 4, '2022-12-07 22:21:08', NULL, NULL),
(6, 1, 5, NULL, 2, 184000, 'Truntum Gama, Semarang', 34000, 0, 5, '2022-12-16 19:40:01', NULL, NULL),
(7, 1, 5, NULL, 1, 105000, 'Semarang, Jawa Tengah', 30000, 0, 5, '2022-12-16 21:39:48', NULL, NULL),
(8, 1, 5, NULL, 1, 105000, 'Jalan Beruang no. 12A', 30000, 0, 5, '2022-12-16 21:59:57', NULL, NULL),
(9, 1, 5, NULL, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 00:02:22', NULL, NULL),
(10, 1, 5, NULL, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 01:16:36', NULL, NULL),
(11, 1, 5, NULL, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 01:16:46', NULL, NULL),
(12, 1, 5, NULL, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 01:18:04', NULL, NULL),
(13, 1, 5, NULL, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 01:18:19', NULL, NULL),
(14, 1, 5, NULL, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 01:18:29', NULL, NULL),
(15, 1, 5, NULL, 1, -981000, 'Jakarta Selatan, DKI Jakarta', 34000, 0, 5, '2022-12-17 01:48:56', NULL, NULL),
(16, 1, 5, NULL, 1, 94500, 'Semarang, Jawa Tengah', 30000, 0, 5, '2022-12-17 01:50:37', NULL, NULL),
(17, 1, 5, 1, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 01:57:47', NULL, NULL),
(18, 1, 5, 1, 1, 79200, 'Jakarta Selatan, DKI Jakarta', 13000, 0, 5, '2022-12-17 01:58:41', NULL, NULL),
(19, 1, 5, 1, 1, 94500, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 02:01:01', NULL, NULL),
(20, 1, 5, 1, 1, 79200, 'Jakarta Selatan, DKI Jakarta', 13000, 0, 5, '2022-12-17 02:02:28', NULL, NULL),
(21, 1, 5, NULL, 1, 105000, 'Jakarta Selatan, DKI Jakarta', 30000, 0, 5, '2022-12-17 02:23:35', NULL, NULL),
(22, 1, 5, NULL, 1, 109000, 'Jakarta Selatan, DKI Jakarta', 34000, 0, 5, '2022-12-17 02:24:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `salt` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `role` int(1) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `salt`, `avatar`, `role`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES
(1, 'user01', '9c2059dc2b499b4d5f141cbd615f97c3', '6384361ada0a94.64807814', NULL, 1, 0, '2022-11-27 22:16:26', NULL, NULL),
(2, 'irpan', '588e29f36e5cc27076e806a5908e2401', '6384615fdadf09.83597180', NULL, 1, 0, '2022-11-28 01:21:03', NULL, NULL),
(3, 'adel12', '2bbd0b757cfa56a462e6afd92ec61276', '638586251449f4.85059900', NULL, 1, 0, '2022-11-28 22:10:13', NULL, NULL),
(4, 'ekkaokt', 'b3db804a71cab73dea2bf38dfdd7324c', '6385a2bd58b6b0.42357697', NULL, 1, 0, '2022-11-29 00:12:13', NULL, NULL),
(5, 'user1', '0db5acc3578959a0533995a4f8652fc3', '639d1db882ebf1.62661104', NULL, 1, 0, '2022-12-16 19:39:04', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id_kategori_foreign` (`id_kategori`);

--
-- Indeks untuk tabel `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `komentar_id_user_foreign` (`id_user`),
  ADD KEY `komentar_id_barang_foreign` (`id_barang`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id_pembeli_foreign` (`id_pembeli`),
  ADD KEY `transaksi_id_barang_foreign` (`id_barang`),
  ADD KEY `id_diskon` (`id_diskon`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `diskon`
--
ALTER TABLE `diskon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `komentar`
--
ALTER TABLE `komentar`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `komentar_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_id_barang_foreign` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_id_pembeli_foreign` FOREIGN KEY (`id_pembeli`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
