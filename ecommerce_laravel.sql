-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Agu 2023 pada 08.13
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_laravel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `about`
--

CREATE TABLE `about` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `about`
--

INSERT INTO `about` (`id`, `judul_website`, `logo`, `deskripsi`, `alamat`, `email`, `telepon`, `created_at`, `updated_at`, `atas_nama`, `no_rekening`) VALUES
(1, 'Ecommerce Laravel', 'default.png', 'Zenna Shop is a very slick and clean e-commerce template with endless possibilities. Creating an awesome clothes store with this Theme is easy than you can imagine. And finally the subconscious is the mechanism through which thought impulses which are repeated regularly with feeling. And emotion are quickened. Duis turpis eros, tincidunt at, tempor a nisi. Fusce turpis mi, sollicitudin non volutpat id, ornare at nunc. Vestibulum tristique molestie mauris, non ultricies turpis consequat eget.', 'KP. Nagreg RT/RW : 004/002 Kel.Rajeg Mulya Kec.Rajeg Kab.Tangerang Prov.Banten Pos:15540', 'azism145@gmail.com', '085155337432', '2023-08-01 03:44:10', '2023-08-04 20:03:05', 'Azis Maulana', '1234-1234-1234-1234');

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `is_checkout` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `nama_kategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'FOR HER', 'Best Selling Deals', '16907747658.jpg', '2023-07-30 20:39:25', '2023-07-30 21:47:42'),
(2, 'ACCESORRIES', 'Hot Trends', '16907748115.jpg', '2023-07-30 20:40:11', '2023-07-30 20:40:11'),
(3, 'FOR HIM', 'New Collection', '16907748452.jpg', '2023-07-30 20:40:45', '2023-07-30 20:40:45'),
(4, 'Susu', 'Susu', '16922393189.jpg', '2023-08-16 19:28:38', '2023-08-16 19:28:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_member` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `members`
--

INSERT INTO `members` (`id`, `nama_member`, `no_hp`, `email`, `password`, `created_at`, `updated_at`) VALUES
(2, 'Azis', '085171025272', 'azism145@gmail.com', '$2y$10$16szjioqsrMuRGAcAfsKGOS.lBuqkg2XF.tXQHcXTLOkZ5rsFoKuC', '2023-08-04 20:55:16', '2023-08-04 20:55:16'),
(3, 'Anos Voldigoad', '085155337432', 'anosvoldigoad145@gmail.com', '$2y$10$U5Dz9dNbBe3zbneDeDfAgemw7MQXr8PR2IuLiHRsyYBaaqj1EoBi.', '2023-08-14 02:53:30', '2023-08-14 02:53:30'),
(4, 'Anos Voldigoad', '08516551848', 'akulaku@gmail.com', '$2y$10$vxgpIuNGnyA2/HxRgTG12OY4IuRPPGcJFALPhT4/MjfysMIz/N7kq', '2023-08-14 02:56:20', '2023-08-14 02:56:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_06_24_022208_create_categories_table', 1),
(6, '2023_06_26_031341_create_sub_categories_table', 1),
(7, '2023_06_27_021620_create_sliders_table', 1),
(8, '2023_06_28_010534_create_products_table', 1),
(9, '2023_06_30_091729_create_members_table', 1),
(10, '2023_07_01_041328_create_testimonis_table', 1),
(11, '2023_07_03_030617_create_reviews_table', 1),
(12, '2023_07_04_044545_create_orders_table', 1),
(13, '2023_07_04_050000_add_status_to_orders_table', 1),
(14, '2023_07_22_030915_modify_order_details_table', 1),
(15, '2023_07_23_014036_create_payments_table', 1),
(16, '2023_07_28_013250_create_about_table', 1),
(17, '2023_08_05_025344_add_rekening_to_about', 2),
(18, '2023_08_05_032638_drop_column_in_members', 3),
(20, '2023_08_07_051906_create_carts_table', 4),
(21, '2023_08_13_031014_add_id_member_to_payments', 5),
(23, '2023_08_20_043751_create_temporary_carts_table', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `invoice` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `id_member`, `invoice`, `grand_total`, `created_at`, `updated_at`, `status`) VALUES
(139, 2, 23082110, 162785, '2023-08-20 17:15:10', NULL, 'Dikemas'),
(140, 2, 23082140, 474220, '2023-08-20 17:27:40', NULL, 'Dikemas'),
(141, 2, 23082135, 9861550, '2023-08-20 17:30:35', NULL, 'Dikemas'),
(142, 2, 23082118, 9484400, '2023-08-20 17:35:18', NULL, 'Dikemas'),
(143, 2, 23082120, 9484400, '2023-08-20 17:44:20', NULL, 'Dikemas'),
(144, 2, 23082107, 9484400, '2023-08-20 17:46:07', NULL, 'Dikemas'),
(145, 2, 23082132, 9484400, '2023-08-20 17:47:32', NULL, 'Dikemas'),
(146, 2, 23082130, 5622100, '2023-08-20 18:00:30', NULL, 'Dikemas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `size` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_produk`, `jumlah`, `size`, `color`, `total`, `created_at`, `updated_at`) VALUES
(224, 139, 5, 5, 'XL', 'Hijau', 152785, '2023-08-20 17:15:10', NULL),
(225, 140, 10, 5, 'XL', 'Kuning', 464220, '2023-08-20 17:27:40', NULL),
(226, 141, 10, 100, 'XL', 'Hijau', 9474400, '2023-08-20 17:30:35', NULL),
(227, 141, 1, 10, 'XL', 'Hitam', 377150, '2023-08-20 17:30:35', NULL),
(228, 142, 10, 100, 'XL', 'Hijau', 9474400, '2023-08-20 17:35:18', NULL),
(229, 143, 10, 100, 'XL', 'Hijau', 9474400, '2023-08-20 17:44:20', NULL),
(230, 144, 10, 100, 'XL', 'Hijau', 9474400, '2023-08-20 17:46:07', NULL),
(231, 145, 10, 100, 'XL', 'Hijau', 9474400, '2023-08-20 17:47:32', NULL),
(232, 146, 9, 100, 'S', 'Hitam', 5612100, '2023-08-20 18:00:30', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `provinsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail_alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT INTO `payments` (`id`, `id_order`, `jumlah`, `provinsi`, `kabupaten`, `detail_alamat`, `status`, `no_rekening`, `atas_nama`, `created_at`, `updated_at`, `id_member`) VALUES
(106, 139, 162785, 'asdsa', 'asdsa', 'asdas', 'Diterima', '0', 'asdsa', '2023-08-20 17:15:10', '2023-08-20 17:15:10', 2),
(107, 140, 474220, 'asdas', 'asda', 'asdas', 'Diterima', '0', 'asdas', '2023-08-20 17:27:40', '2023-08-20 17:27:40', 2),
(108, 141, 9861550, 'asdsa', 'asdas', 'asdas', 'Diterima', '0', 'asdas', '2023-08-20 17:30:35', '2023-08-20 17:30:35', 2),
(109, 142, 9484400, 'asdas', 'asda', 'asdsa', 'Diterima', '0', 'asdsa', '2023-08-20 17:35:18', '2023-08-20 17:35:18', 2),
(110, 143, 9484400, 'asdsa', 'asdas', 'asdsa', 'Diterima', '0', 'sadsa', '2023-08-20 17:44:20', '2023-08-20 17:44:20', 2),
(111, 144, 9484400, 'asda', 'asdas', 'asdas', 'Diterima', '0', 'asda', '2023-08-20 17:46:07', '2023-08-20 17:46:07', 2),
(112, 145, 9484400, 'asdsa', 'asdas', 'asdas', 'Diterima', '0', 'asdsa', '2023-08-20 17:47:32', '2023-08-20 17:47:32', 2),
(113, 146, 5622100, 'asd', 'asd', 'asad', 'Diterima', '0', 'asd', '2023-08-20 18:00:30', '2023-08-20 18:00:30', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_subkategori` int(11) NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `bahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ukuran` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warna` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `id_kategori`, `id_subkategori`, `nama_barang`, `gambar`, `deskripsi`, `harga`, `diskon`, `bahan`, `tags`, `sku`, `ukuran`, `warna`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_1.jpg', 'Lorem Ipsum Dolor Sit Amet', 37715, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'YNLC3OFo', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(2, 3, 4, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_2.jpg', 'Lorem Ipsum Dolor Sit Amet', 69006, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'IJMqYuLR', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(3, 2, 4, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_3.jpg', 'Lorem Ipsum Dolor Sit Amet', 91253, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'kec7oYit', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(4, 3, 3, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_4.jpg', 'Lorem Ipsum Dolor Sit Amet', 60236, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'ZDbFQGCc', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(5, 1, 4, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_5.jpg', 'Lorem Ipsum Dolor Sit Amet', 30557, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'dXdRJTZU', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(6, 1, 1, 'Baju Ganteng', 'shop_image_6.jpg', 'Lorem Ipsum Dolor Sit Amet', 61288, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', '6AkkzGQD', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(7, 1, 1, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_7.jpg', 'Lorem Ipsum Dolor Sit Amet', 25883, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'ORaQUkjJ', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(8, 2, 4, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_8.jpg', 'Lorem Ipsum Dolor Sit Amet', 31733, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'c4EY6Jfe', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(9, 1, 3, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_9.jpg', 'Lorem Ipsum Dolor Sit Amet', 56121, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'Qq6Nrt7a', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(10, 1, 1, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_10.jpg', 'Lorem Ipsum Dolor Sit Amet', 94844, 10000, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'SH3ogvgL', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(11, 1, 3, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_11.jpg', 'Lorem Ipsum Dolor Sit Amet', 73045, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'JOi2W89g', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(12, 1, 4, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_12.jpg', 'Lorem Ipsum Dolor Sit Amet', 87201, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', '1iRuTJLF', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(13, 2, 4, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_13.jpg', 'Lorem Ipsum Dolor Sit Amet', 73543, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'ujANJnN6', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(14, 2, 1, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_14.jpg', 'Lorem Ipsum Dolor Sit Amet', 45661, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'mFH11csL', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(15, 1, 1, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_15.jpg', 'Lorem Ipsum Dolor Sit Amet', 28194, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'K7oOtFdX', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(16, 1, 3, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_16.jpg', 'Lorem Ipsum Dolor Sit Amet', 18377, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'iU35HhWu', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(17, 2, 1, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_17.jpg', 'Lorem Ipsum Dolor Sit Amet', 27049, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', '8jQ2cQml', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(18, 3, 1, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_18.jpg', 'Lorem Ipsum Dolor Sit Amet', 84447, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'BpsjICnQ', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(19, 1, 3, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_19.jpg', 'Lorem Ipsum Dolor Sit Amet', 77652, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'Z1LFoxd5', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(20, 3, 4, 'Lorem Ipsum Dolor Sit Amet', 'shop_image_20.jpg', 'Lorem Ipsum Dolor Sit Amet', 89147, 0, 'Lorem Ipsum Dolor', 'Lorem,Ipsum,Dolor,Sit,Amet', 'rxfRV7GY', 'S,M,L,XL', 'Hitam,Biru,Kuning,Putih,Hijau', '2023-07-30 21:07:12', '2023-07-30 21:07:12'),
(21, 4, 5, 'susu formula sgm', '16922394045.jpg', 'Susu bayi pilihan', 127000, 0, 'Susu Sapi', 'Susu', '1214131', '24x24', 'Putih', '2023-08-16 19:30:05', '2023-08-16 19:30:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_slider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sliders`
--

INSERT INTO `sliders` (`id`, `nama_slider`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Rimuru Tempest', 'New Action Figure Of Rimuru Tempest has Arrived!', '16920093681.jpg', '2023-07-30 20:36:16', '2023-08-14 03:36:08'),
(2, 'Naruto Uzumaki', 'New Figure Naruto has Arrived!', '16920094607.jpg', '2023-07-30 20:36:52', '2023-08-14 03:37:40'),
(3, 'Gojo Satoru', 'New Gojo Satoru Figure has arrived!', '16920096298.jpg', '2023-07-30 20:37:28', '2023-08-14 03:40:29'),
(4, 'Ayang', 'Ayang', '16921500678.jpg', '2023-08-15 18:41:07', '2023-08-15 18:41:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `nama_subkategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `id_kategori`, `nama_subkategori`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dresses', 'lorem ipsum dolor sit amet', '16907749886.jpg', '2023-07-30 20:43:08', '2023-07-30 20:43:08'),
(2, 1, 'WATCHES', 'lorem ipsum dolor sit amet', '16907750519.jpg', '2023-07-30 20:43:40', '2023-07-30 20:44:11'),
(3, 2, 'BELTS', 'lorem ipsum dolor sit amet', '16907751174.jpg', '2023-07-30 20:45:17', '2023-07-30 20:45:17'),
(4, 3, 'T-SHIRTS', 'lorem ipsum dolor sit amet', '16907751597.jpg', '2023-07-30 20:45:59', '2023-07-30 20:45:59'),
(5, 4, 'bayi', 'bayi', '16922393483.jpg', '2023-08-16 19:29:08', '2023-08-16 19:29:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `temporary_carts`
--

CREATE TABLE `temporary_carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL,
  `is_checkout` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `temporary_carts`
--

INSERT INTO `temporary_carts` (`id`, `id_member`, `id_barang`, `jumlah`, `size`, `color`, `total`, `is_checkout`, `created_at`, `updated_at`) VALUES
(121, 2, 10, 100, 'XL', 'Hijau', 9474400, 0, NULL, NULL),
(122, 2, 9, 100, 'S', 'Hitam', 5612100, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonis`
--

CREATE TABLE `testimonis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_testimoni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `testimonis`
--

INSERT INTO `testimonis` (`id`, `nama_testimoni`, `deskripsi`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Donald Trump / CEO of Trump organization', 'I’am amazed, I should say thank you so much for your awesome template. Design is so good and neat, every detail has been taken care these team are realy amazing and talented! I will work only with this agency.', '16907752835.jpg', '2023-07-30 20:48:04', '2023-07-30 21:54:40'),
(2, 'John C. Marshall', 'This is the excellent theme. It has many useful features that can be use for any kind of business. The support is just amazing and design.', '16907753287.jpg', '2023-07-30 20:48:48', '2023-07-30 20:48:48'),
(3, 'Matthew Whilson / PR Agent', 'Needless to say, beautifully designed theme that serves many purpose. Even more sutomers support is the best! Highly recommend this theme to anyone who enjoys a fine product.', '16907753658.jpg', '2023-07-30 20:49:25', '2023-07-30 20:49:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@admin.com', '2023-08-20 18:07:04', '$2y$10$eRZ.MbaXJ6.yg2WcwGZAdeBWnuAaSepwuyWWnfOdilujYSN76X8Lu', NULL, '2023-08-20 18:07:04', '2023-08-20 18:07:04');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `temporary_carts`
--
ALTER TABLE `temporary_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `testimonis`
--
ALTER TABLE `testimonis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT untuk tabel `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `temporary_carts`
--
ALTER TABLE `temporary_carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT untuk tabel `testimonis`
--
ALTER TABLE `testimonis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
