-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 26 Jan 2020 pada 19.44
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redroomz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_booking` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bill`
--

INSERT INTO `bill` (`id_bill`, `id_user`, `id_booking`, `total_price`, `created_on`, `updated_on`) VALUES
(1, 6, 1, 100000, '2020-01-24 20:14:49', '2020-01-24 20:14:49'),
(3, 9, 2, 300000, '2020-01-24 20:18:33', '2020-01-24 20:18:33'),
(4, 9, 3, 300000, '2020-01-24 21:07:03', '2020-01-24 21:07:03'),
(6, 1, 7, 300000, '2020-01-25 17:05:44', '2020-01-25 17:05:44'),
(7, 1, 12, 503501, '2020-01-25 18:20:10', '2020-01-25 18:20:10'),
(8, 1, 12, 503501, '2020-01-25 18:21:20', '2020-01-25 18:21:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `id_booking` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `checkin` date NOT NULL DEFAULT '0000-00-00',
  `checkout` date NOT NULL DEFAULT '0000-00-00',
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`id_booking`, `id_user`, `id_hotel`, `room`, `total`, `checkin`, `checkout`, `email`, `name`, `no_hp`, `created_on`, `updated_on`, `status`) VALUES
(1, 1, 15, 4, 2400000, '2020-01-28', '2020-01-30', 'vildanafriyansyah567@gmail.com', 'Vildan', '895349060749', '2020-01-26 17:39:26', '2020-01-26 17:39:26', 0),
(2, 3, 15, 4, 2400000, '2020-01-29', '2020-01-31', 'vildanafriyansyah567@gmail.com', 'Vildan', '123', '2020-01-26 18:31:52', '2020-01-26 18:31:52', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `city`
--

CREATE TABLE `city` (
  `id_city` int(5) NOT NULL,
  `city` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_province` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `city`
--

INSERT INTO `city` (`id_city`, `city`, `image`, `id_province`) VALUES
(1, 'JAKARTA', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTjUQtHxppT6dFe-3UnMLwD0fQYHrcqPjwAz6Wdk1Lo7BS1PR3&s', 1),
(2, 'TANGERANG', 'https://i.ytimg.com/vi/650qE6fg0DA/hqdefault.jpg', 1),
(3, 'BEKASI', 'https://assets-a2.kompasiana.com/items/album/2015/09/21/sb2-55ff3f82197b61c50ab4d9c9.jpg?t=o&v=350', 1),
(4, 'BOGOR', 'https://pbs.twimg.com/media/BpJH3_jIMAAQwXk.jpg', 1),
(5, 'TANGERANG', 'https://i.ytimg.com/vi/650qE6fg0DA/hqdefault.jpg', 1),
(6, 'TANGERANG SELATAN', '', 1),
(7, 'JAKARTA BARAT', '', 2),
(8, 'JAKARTA PUSAT', '', 2),
(9, 'JAKARTA SELATAN', '', 2),
(10, 'JAKARTA TIMUR', '', 2),
(11, 'JAKARTA UTARA', '', 2),
(12, 'KEPULAUAN SERIBU', '', 2),
(13, 'BANDUNG', '', 3),
(14, 'BANDUNG BARAT', '', 3),
(15, 'BANJAR', '', 3),
(16, 'BEKASI', '', 3),
(17, 'BOGOR', '', 3),
(18, 'CIAMIS', '', 3),
(19, 'CIANJUR', '', 3),
(20, 'CIMAHI', '', 3),
(21, 'CIREBON', '', 3),
(22, 'DEPOK', '', 3),
(23, 'GARUT', '', 3),
(24, 'INDRAMAYU', '', 3),
(25, 'KARAWANG', '', 3),
(26, 'KUNINGAN', '', 3),
(27, 'MAJALENGKA', '', 3),
(28, 'PANGANDARAN', '', 3),
(29, 'PURWAKARTA', '', 3),
(30, 'SUBANG', '', 3),
(31, 'SUKABUMI', '', 3),
(32, 'SUMEDANG', '', 3),
(33, 'TASIKMALAYA', '', 3),
(34, 'BANJARNEGARA', '', 4),
(35, 'BANYUMAS', '', 4),
(36, 'BATANG', '', 4),
(37, 'BLORA', '', 4),
(38, 'BOYOLALI', '', 4),
(39, 'BREBES', '', 4),
(40, 'CILACAP', '', 4),
(41, 'DEMAK', '', 4),
(42, 'GROBOGAN', '', 4),
(43, 'JEPARA', '', 4),
(44, 'KARANGANYAR', '', 4),
(45, 'KEBUMEN', '', 4),
(46, 'KENDAL', '', 4),
(47, 'KLATEN', '', 4),
(48, 'KUDUS', '', 4),
(49, 'MAGELANG', '', 4),
(50, 'PATI', '', 4),
(51, 'PEKALONGAN', '', 4),
(52, 'PEMALANG', '', 4),
(53, 'PURBALINGGA', '', 4),
(54, 'PURWOREJO', '', 4),
(55, 'REMBANG', '', 4),
(56, 'SALATIGA', '', 4),
(57, 'SEMARANG', '', 4),
(58, 'SRAGEN', '', 4),
(59, 'SUKOHARJO', '', 4),
(60, 'SURAKARTA (SOLO)', '', 4),
(61, 'TEGAL', '', 4),
(62, 'TEMANGGUNG', '', 4),
(63, 'WONOGIRI', '', 4),
(64, 'WONOSOBO', '', 4),
(65, 'BANTUL', '', 5),
(66, 'GUNUNG KIDUL', '', 5),
(67, 'KULON PROGO', '', 5),
(68, 'SLEMAN', '', 5),
(69, 'YOGYAKARTA', '', 5),
(70, 'BANGKALAN', '', 6),
(71, 'BANYUWANGI', '', 6),
(72, 'BATU', '', 6),
(73, 'BLITAR', '', 6),
(74, 'BOJONEGORO', '', 6),
(75, 'BONDOWOSO', '', 6),
(76, 'GRESIK', '', 6),
(77, 'JEMBER', '', 6),
(78, 'JOMBANG', '', 6),
(79, 'KEDIRI', '', 6),
(80, 'LAMONGAN', '', 6),
(81, 'LUMAJANG', '', 6),
(82, 'MADIUN', '', 6),
(83, 'MAGETAN', '', 6),
(84, 'MALANG', '', 6),
(85, 'MOJOKERTO', '', 6),
(86, 'NGANJUK', '', 6),
(87, 'NGAWI', '', 6),
(88, 'PACITAN', '', 6),
(89, 'PAMEKASAN', '', 6),
(90, 'PASURUAN', '', 6),
(91, 'PONOROGO', '', 6),
(92, 'PROBOLINGGO', '', 6),
(93, 'SAMPANG', '', 6),
(94, 'SIDOARJO', '', 6),
(95, 'SITUBONDO', '', 6),
(96, 'SUMENEP', '', 6),
(97, 'SURABAYA', '', 6),
(98, 'TRENGGALEK', '', 6),
(99, 'TUBAN', '', 6),
(100, 'TULUNGAGUNG', '', 6),
(101, 'BADUNG', '', 7),
(102, 'BANGLI', '', 7),
(103, 'BULELENG', '', 7),
(104, 'DENPASAR', '', 7),
(105, 'GIANYAR', '', 7),
(106, 'JEMBRANA', '', 7),
(107, 'KARANGASEM', '', 7),
(108, 'KLUNGKUNG', '', 7),
(109, 'TABANAN', '', 7),
(110, 'ACEH BARAT', '', 8),
(111, 'ACEH BARAT DAYA', '', 8),
(112, 'ACEH BESAR', '', 8),
(113, 'ACEH JAYA', '', 8),
(114, 'ACEH SELATAN', '', 8),
(115, 'ACEH SINGKIL', '', 8),
(116, 'ACEH TAMIANG', '', 8),
(117, 'ACEH TENGAH', '', 8),
(118, 'ACEH TENGGARA', '', 8),
(119, 'ACEH TIMUR', '', 8),
(120, 'ACEH UTARA', '', 8),
(121, 'BANDA ACEH', '', 8),
(122, 'BENER MERIAH', '', 8),
(123, 'BIREUEN', '', 8),
(124, 'GAYO LUES', '', 8),
(125, 'LANGSA', '', 8),
(126, 'LHOKSEUMAWE', '', 8),
(127, 'NAGAN RAYA', '', 8),
(128, 'PIDIE', '', 8),
(129, 'PIDIE JAYA', '', 8),
(130, 'SABANG', '', 8),
(131, 'SIMEULUE', '', 8),
(132, 'SUBULUSSALAM', '', 8),
(133, 'ASAHAN', '', 9),
(134, 'BATU BARA', '', 9),
(135, 'BINJAI', '', 9),
(136, 'DAIRI', '', 9),
(137, 'DELI SERDANG', '', 9),
(138, 'GUNUNGSITOLI', '', 9),
(139, 'HUMBANG HASUNDUTAN', '', 9),
(140, 'KARO', '', 9),
(141, 'LABUHAN BATU', '', 9),
(142, 'LABUHAN BATU SELATAN', '', 9),
(143, 'LABUHAN BATU UTARA', '', 9),
(144, 'LANGKAT', '', 9),
(145, 'MANDAILING NATAL', '', 9),
(146, 'MEDAN', '', 9),
(147, 'NIAS', '', 9),
(148, 'NIAS BARAT', '', 9),
(149, 'NIAS SELATAN', '', 9),
(150, 'NIAS UTARA', '', 9),
(151, 'PADANG LAWAS', '', 9),
(152, 'PADANG LAWAS UTARA', '', 9),
(153, 'PADANG SIDEMPUAN', '', 9),
(154, 'PAKPAK BHARAT', '', 9),
(155, 'PEMATANG SIANTAR', '', 9),
(156, 'SAMOSIR', '', 9),
(157, 'SERDANG BEDAGAI', '', 9),
(158, 'SIBOLGA', '', 9),
(159, 'SIMALUNGUN', '', 9),
(160, 'TANJUNG BALAI', '', 9),
(161, 'TAPANULI SELATAN', '', 9),
(162, 'TAPANULI TENGAH', '', 9),
(163, 'TAPANULI UTARA', '', 9),
(164, 'TEBING TINGGI', '', 9),
(165, 'TOBA SAMOSIR', '', 9),
(166, 'AGAM', '', 10),
(167, 'BUKITTINGGI', '', 10),
(168, 'DHARMASRAYA', '', 10),
(169, 'KEPULAUAN MENTAWAI', '', 10),
(170, 'LIMA PULUH KOTO/KOTA', '', 10),
(171, 'PADANG', '', 10),
(172, 'PADANG PANJANG', '', 10),
(173, 'PADANG PARIAMAN', '', 10),
(174, 'PARIAMAN', '', 10),
(175, 'PASAMAN', '', 10),
(176, 'PASAMAN BARAT', '', 10),
(177, 'PAYAKUMBUH', '', 10),
(178, 'PESISIR SELATAN', '', 10),
(179, 'SAWAH LUNTO', '', 10),
(180, 'SIJUNJUNG (SAWAH LUNTO SIJUNJUNG)', '', 10),
(181, 'SOLOK', '', 10),
(182, 'SOLOK SELATAN', '', 10),
(183, 'TANAH DATAR', '', 10),
(184, 'BENGKALIS', '', 11),
(185, 'DUMAI', '', 11),
(186, 'INDRAGIRI HILIR', '', 11),
(187, 'INDRAGIRI HULU', '', 11),
(188, 'KAMPAR', '', 11),
(189, 'KEPULAUAN MERANTI', '', 11),
(190, 'KUANTAN SINGINGI', '', 11),
(191, 'PEKANBARU', '', 11),
(192, 'PELALAWAN', '', 11),
(193, 'ROKAN HILIR', '', 11),
(194, 'ROKAN HULU', '', 11),
(195, 'SIAK', '', 11),
(196, 'BATAM', '', 12),
(197, 'BINTAN', '', 12),
(198, 'KARIMUN', '', 12),
(199, 'KEPULAUAN ANAMBAS', '', 12),
(200, 'LINGGA', '', 12),
(201, 'NATUNA', '', 12),
(202, 'TANJUNG PINANG', '', 12),
(203, 'BATANG HARI', '', 13),
(204, 'BUNGO', '', 13),
(205, 'JAMBI', '', 13),
(206, 'KERINCI', '', 13),
(207, 'MERANGIN', '', 13),
(208, 'MUARO JAMBI', '', 13),
(209, 'SAROLANGUN', '', 13),
(210, 'SUNGAIPENUH', '', 13),
(211, 'TANJUNG JABUNG BARAT', '', 13),
(212, 'TANJUNG JABUNG TIMUR', '', 13),
(213, 'TEBO', '', 13),
(214, 'BENGKULU', '', 14),
(215, 'BENGKULU SELATAN', '', 14),
(216, 'BENGKULU TENGAH', '', 14),
(217, 'BENGKULU UTARA', '', 14),
(218, 'KAUR', '', 14),
(219, 'KEPAHIANG', '', 14),
(220, 'LEBONG', '', 14),
(221, 'MUKO MUKO', '', 14),
(222, 'REJANG LEBONG', '', 14),
(223, 'SELUMA', '', 14),
(224, 'BANYUASIN', '', 15),
(225, 'EMPAT LAWANG', '', 15),
(226, 'LAHAT', '', 15),
(227, 'LUBUK LINGGAU', '', 15),
(228, 'MUARA ENIM', '', 15),
(229, 'MUSI BANYUASIN', '', 15),
(230, 'MUSI RAWAS', '', 15),
(231, 'OGAN ILIR', '', 15),
(232, 'OGAN KOMERING ILIR', '', 15),
(233, 'OGAN KOMERING ULU', '', 15),
(234, 'OGAN KOMERING ULU SELATAN', '', 15),
(235, 'OGAN KOMERING ULU TIMUR', '', 15),
(236, 'PAGAR ALAM', '', 15),
(237, 'PALEMBANG', '', 15),
(238, 'PRABUMULIH', '', 15),
(239, 'BANGKA', '', 16),
(240, 'BANGKA BARAT', '', 16),
(241, 'BANGKA SELATAN', '', 16),
(242, 'BANGKA TENGAH', '', 16),
(243, 'BELITUNG', '', 16),
(244, 'BELITUNG TIMUR', '', 16),
(245, 'PANGKAL PINANG', '', 16),
(246, 'BANDAR LAMPUNG', '', 17),
(247, 'LAMPUNG BARAT', '', 17),
(248, 'LAMPUNG SELATAN', '', 17),
(249, 'LAMPUNG TENGAH', '', 17),
(250, 'LAMPUNG TIMUR', '', 17),
(251, 'LAMPUNG UTARA', '', 17),
(252, 'MESUJI', '', 17),
(253, 'METRO', '', 17),
(254, 'PESAWARAN', '', 17),
(255, 'PESISIR BARAT', '', 17),
(256, 'PRINGSEWU', '', 17),
(257, 'TANGGAMUS', '', 17),
(258, 'TULANG BAWANG', '', 17),
(259, 'TULANG BAWANG BARAT', '', 17),
(260, 'WAY KANAN', '', 17),
(261, 'BENGKAYANG', '', 18),
(262, 'KAPUAS HULU', '', 18),
(263, 'KAYONG UTARA', '', 18),
(264, 'KETAPANG', '', 18),
(265, 'KUBU RAYA', '', 18),
(266, 'LANDAK', '', 18),
(267, 'MELAWI', '', 18),
(268, 'PONTIANAK', '', 18),
(269, 'SAMBAS', '', 18),
(270, 'SANGGAU', '', 18),
(271, 'SEKADAU', '', 18),
(272, 'SINGKAWANG', '', 18),
(273, 'SINTANG', '', 18),
(274, 'BARITO SELATAN', '', 19),
(275, 'BARITO TIMUR', '', 19),
(276, 'BARITO UTARA', '', 19),
(277, 'GUNUNG MAS', '', 19),
(278, 'KAPUAS', '', 19),
(279, 'KATINGAN', '', 19),
(280, 'KOTAWARINGIN BARAT', '', 19),
(281, 'KOTAWARINGIN TIMUR', '', 19),
(282, 'LAMANDAU', '', 19),
(283, 'MURUNG RAYA', '', 19),
(284, 'PALANGKA RAYA', '', 19),
(285, 'PULANG PISAU', '', 19),
(286, 'SERUYAN', '', 19),
(287, 'SUKAMARA', '', 19),
(288, 'BALANGAN', '', 20),
(289, 'BANJAR', '', 20),
(290, 'BANJARBARU', '', 20),
(291, 'BANJARMASIN', '', 20),
(292, 'BARITO KUALA', '', 20),
(293, 'HULU SUNGAI SELATAN', '', 20),
(294, 'HULU SUNGAI TENGAH', '', 20),
(295, 'HULU SUNGAI UTARA', '', 20),
(296, 'KOTABARU', '', 20),
(297, 'TABALONG', '', 20),
(298, 'TANAH BUMBU', '', 20),
(299, 'TANAH LAUT', '', 20),
(300, 'TAPIN', '', 20),
(301, 'BALIKPAPAN', '', 21),
(302, 'BERAU', '', 21),
(303, 'BONTANG', '', 21),
(304, 'KUTAI BARAT', '', 21),
(305, 'KUTAI KARTANEGARA', '', 21),
(306, 'KUTAI TIMUR', '', 21),
(307, 'PASER', '', 21),
(308, 'PENAJAM PASER UTARA', '', 21),
(309, 'SAMARINDA', '', 21),
(310, 'BULUNGAN (BULONGAN)', '', 22),
(311, 'MALINAU', '', 22),
(312, 'NUNUKAN', '', 22),
(313, 'TANA TIDUNG', '', 22),
(314, 'TARAKAN', '', 22),
(315, 'MAJENE', '', 23),
(316, 'MAMASA', '', 23),
(317, 'MAMUJU', '', 23),
(318, 'MAMUJU UTARA', '', 23),
(319, 'POLEWALI MANDAR', '', 23),
(320, 'BANTAENG', '', 24),
(321, 'BARRU', '', 24),
(322, 'BONE', '', 24),
(323, 'BULUKUMBA', '', 24),
(324, 'ENREKANG', '', 24),
(325, 'GOWA', '', 24),
(326, 'JENEPONTO', '', 24),
(327, 'LUWU', '', 24),
(328, 'LUWU TIMUR', '', 24),
(329, 'LUWU UTARA', '', 24),
(330, 'MAKASSAR', '', 24),
(331, 'MAROS', '', 24),
(332, 'PALOPO', '', 24),
(333, 'PANGKAJENE KEPULAUAN', '', 24),
(334, 'PAREPARE', '', 24),
(335, 'PINRANG', '', 24),
(336, 'SELAYAR (KEPULAUAN SELAYAR)', '', 24),
(337, 'SIDENRENG RAPPANG/RAPANG', '', 24),
(338, 'SINJAI', '', 24),
(339, 'SOPPENG', '', 24),
(340, 'TAKALAR', '', 24),
(341, 'TANA TORAJA', '', 24),
(342, 'TORAJA UTARA', '', 24),
(343, 'WAJO', '', 24),
(344, 'BAU-BAU', '', 25),
(345, 'BOMBANA', '', 25),
(346, 'BUTON', '', 25),
(347, 'BUTON UTARA', '', 25),
(348, 'KENDARI', '', 25),
(349, 'KOLAKA', '', 25),
(350, 'KOLAKA UTARA', '', 25),
(351, 'KONAWE', '', 25),
(352, 'KONAWE SELATAN', '', 25),
(353, 'KONAWE UTARA', '', 25),
(354, 'MUNA', '', 25),
(355, 'WAKATOBI', '', 25),
(356, 'BANGGAI', '', 26),
(357, 'BANGGAI KEPULAUAN', '', 26),
(358, 'BUOL', '', 26),
(359, 'DONGGALA', '', 26),
(360, 'MOROWALI', '', 26),
(361, 'PALU', '', 26),
(362, 'PARIGI MOUTONG', '', 26),
(363, 'POSO', '', 26),
(364, 'SIGI', '', 26),
(365, 'TOJO UNA-UNA', '', 26),
(366, 'TOLI-TOLI', '', 26),
(367, 'BOALEMO', '', 27),
(368, 'BONE BOLANGO', '', 27),
(369, 'GORONTALO', '', 27),
(370, 'GORONTALO UTARA', '', 27),
(371, 'POHUWATO', '', 27),
(372, 'BITUNG', '', 28),
(373, 'BOLAANG MONGONDOW (BOLMONG)', '', 28),
(374, 'BOLAANG MONGONDOW SELATAN', '', 28),
(375, 'BOLAANG MONGONDOW TIMUR', '', 28),
(376, 'BOLAANG MONGONDOW UTARA', '', 28),
(377, 'KEPULAUAN SANGIHE', '', 28),
(378, 'KEPULAUAN SIAU TAGULANDANG BIARO (SITARO)', '', 28),
(379, 'KEPULAUAN TALAUD', '', 28),
(380, 'KOTAMOBAGU', '', 28),
(381, 'MANADO', '', 28),
(382, 'MINAHASA', '', 28),
(383, 'MINAHASA SELATAN', '', 28),
(384, 'MINAHASA TENGGARA', '', 28),
(385, 'MINAHASA UTARA', '', 28),
(386, 'TOMOHON', '', 28),
(387, 'AMBON', '', 29),
(388, 'BURU', '', 29),
(389, 'BURU SELATAN', '', 29),
(390, 'KEPULAUAN ARU', '', 29),
(391, 'MALUKU BARAT DAYA', '', 29),
(392, 'MALUKU TENGAH', '', 29),
(393, 'MALUKU TENGGARA', '', 29),
(394, 'MALUKU TENGGARA BARAT', '', 29),
(395, 'SERAM BAGIAN BARAT', '', 29),
(396, 'SERAM BAGIAN TIMUR', '', 29),
(397, 'TUAL', '', 29),
(398, 'HALMAHERA BARAT', '', 30),
(399, 'HALMAHERA SELATAN', '', 30),
(400, 'HALMAHERA TENGAH', '', 30),
(401, 'HALMAHERA TIMUR', '', 30),
(402, 'HALMAHERA UTARA', '', 30),
(403, 'KEPULAUAN SULA', '', 30),
(404, 'PULAU MOROTAI', '', 30),
(405, 'TERNATE', '', 30),
(406, 'TIDORE KEPULAUAN', '', 30),
(407, 'BIMA', '', 31),
(408, 'DOMPU', '', 31),
(409, 'LOMBOK BARAT', '', 31),
(410, 'LOMBOK TENGAH', '', 31),
(411, 'LOMBOK TIMUR', '', 31),
(412, 'LOMBOK UTARA', '', 31),
(413, 'MATARAM', '', 31),
(414, 'SUMBAWA', '', 31),
(415, 'SUMBAWA BARAT', '', 31),
(416, 'ALOR', '', 32),
(417, 'BELU', '', 32),
(418, 'ENDE', '', 32),
(419, 'FLORES TIMUR', '', 32),
(420, 'KUPANG', '', 32),
(421, 'LEMBATA', '', 32),
(422, 'MANGGARAI', '', 32),
(423, 'MANGGARAI BARAT', '', 32),
(424, 'MANGGARAI TIMUR', '', 32),
(425, 'NAGEKEO', '', 32),
(426, 'NGADA', '', 32),
(427, 'ROTE NDAO', '', 32),
(428, 'SABU RAIJUA', '', 32),
(429, 'SIKKA', '', 32),
(430, 'SUMBA BARAT', '', 32),
(431, 'SUMBA BARAT DAYA', '', 32),
(432, 'SUMBA TENGAH', '', 32),
(433, 'SUMBA TIMUR', '', 32),
(434, 'TIMOR TENGAH SELATAN', '', 32),
(435, 'TIMOR TENGAH UTARA', '', 32),
(436, 'FAKFAK', '', 33),
(437, 'KAIMANA', '', 33),
(438, 'MANOKWARI', '', 33),
(439, 'MANOKWARI SELATAN', '', 33),
(440, 'MAYBRAT', '', 33),
(441, 'PEGUNUNGAN ARFAK', '', 33),
(442, 'RAJA AMPAT', '', 33),
(443, 'SORONG', '', 33),
(444, 'SORONG SELATAN', '', 33),
(445, 'TAMBRAUW', '', 33),
(446, 'TELUK BINTUNI', '', 33),
(447, 'TELUK WONDAMA', '', 33),
(448, 'ASMAT', '', 34),
(449, 'BIAK NUMFOR', '', 34),
(450, 'BOVEN DIGOEL', '', 34),
(451, 'DEIYAI (DELIYAI)', '', 34),
(452, 'DOGIYAI', '', 34),
(453, 'INTAN JAYA', '', 34),
(454, 'JAYAPURA', '', 34),
(455, 'JAYAWIJAYA', '', 34),
(456, 'KEEROM', '', 34),
(457, 'KEPULAUAN YAPEN (YAPEN WAROPEN)', '', 34),
(458, 'LANNY JAYA', '', 34),
(459, 'MAMBERAMO RAYA', '', 34),
(460, 'MAMBERAMO TENGAH', '', 34),
(461, 'MAPPI', '', 34),
(462, 'MERAUKE', '', 34),
(463, 'MIMIKA', '', 34),
(464, 'NABIRE', '', 34),
(465, 'NDUGA', '', 34),
(466, 'PANIAI', '', 34),
(467, 'PEGUNUNGAN BINTANG', '', 34),
(468, 'PUNCAK', '', 34),
(469, 'PUNCAK JAYA', '', 34),
(470, 'SARMI', '', 34),
(471, 'SUPIORI', '', 34),
(472, 'TOLIKARA', '', 34),
(473, 'WAROPEN', '', 34),
(474, 'YAHUKIMO', '', 34),
(475, 'YALIMO', '', 34);

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `saldo` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`id_history`, `id_user`, `saldo`, `name`, `description`, `total`, `created_on`, `updated_on`) VALUES
(1, 1, 10000000, NULL, 'Topup', NULL, '2020-01-26 17:37:00', '2020-01-26 17:37:00'),
(2, 1, NULL, 'Alpine Hotel', 'Booking', 2400000, '2020-01-26 17:39:26', '2020-01-26 17:39:26'),
(3, 3, 5000000, NULL, 'Topup', NULL, '2020-01-26 18:30:05', '2020-01-26 18:30:05'),
(4, 3, NULL, 'Alpine Hotel', 'Booking', 2400000, '2020-01-26 18:31:52', '2020-01-26 18:31:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hotels`
--

CREATE TABLE `hotels` (
  `id_hotel` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `rate` float NOT NULL,
  `id_city` int(11) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hotels`
--

INSERT INTO `hotels` (`id_hotel`, `image`, `name`, `rate`, `id_city`, `longitude`, `latitude`, `price`, `description`, `created_on`, `updated_on`) VALUES
(15, 'https://static.misteraladin.com/images/hotel/0000042000/0000041683/alpine-hotel-photo.400x225.jpg', 'Alpine Hotel', 2.7, 1, '', '', 300000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 14:13:05', '2020-01-25 17:07:36'),
(16, 'https://static.misteraladin.com/images/hotel/0000001000/0000000525/mandarin-oriental-jakarta-photo11.400x225.jpg', 'Mandarin Oriental 10', 3.7, 1, '', '', 293040, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:13', '2020-01-25 17:07:36'),
(17, 'https://static.misteraladin.com/images/hotel/0000001000/0000000506/le-meridien-jakarta-photo.400x225.jpg', 'Le Meridien 10', 4.2, 1, '', '', 217800, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:18', '2020-01-25 17:07:36'),
(18, 'https://static.misteraladin.com/images/hotel/0000001000/0000000569/raffles-jakarta-photo12.400x225.jpg', 'Raffles 10', 5, 3, '', '', 348480, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:23', '2020-01-25 17:07:36'),
(19, 'https://static.misteraladin.com/images/hotel/0000001000/0000000582/fairmont-jakarta-photo.400x225.jpg', 'Fairmont 10', 3, 2, '', '', 367891, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:26', '2020-01-25 17:07:36'),
(20, 'https://static.misteraladin.com/images/hotel/0000001000/0000000524/grand-hyatt-jakarta-photo.400x225.jpg', 'Grand Hyatt 10', 4.2, 2, '', '', 327014, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:29', '2020-01-25 17:07:36'),
(21, 'https://static.misteraladin.com/images/hotel/0000001000/0000000873/mercure-jakarta-simatupang-photo26.400x225.jpg', 'Mercure Jakarta Simatupang', 3.1, 1, '', '', 108900, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:35', '2020-01-25 17:07:36'),
(22, 'https://static.misteraladin.com/images/hotel/0000001000/0000000594/holiday-inn-express-jakarta-pluit-citygate-photo.400x225.jpg', 'Holiday Inn Express Jakarta Pluit Citygate', 3.7, 1, '', '', 62132, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:38', '2020-01-25 17:07:36'),
(23, 'https://static.misteraladin.com/images/hotel/0000040000/0000039058/ibis-styles-jakarta-sunter-photo1.400x225.jpg', 'Ibis Styles Jakarta Sunter', 3.1, 3, '', '', 60000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:41', '2020-01-25 17:07:36'),
(24, 'https://static.misteraladin.com/images/hotel/0000001000/0000000512/hotel-indonesia-kempinski-jakarta-photo.400x225.jpg', 'Hotel Indonesia Kempinski 10', 4.7, 1, '', '', 326251, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:45', '2020-01-25 17:07:36'),
(25, 'https://static.misteraladin.com/images/hotel/0000001000/0000000519/pullman-jakarta-indonesia-photo1.400x225.jpg', 'Pullman Jakarta Indonesia', 3, 4, '', '', 202675, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:16:48', '2020-01-25 17:07:36'),
(26, 'https://static.misteraladin.com/images/hotel/0000042000/0000041709/house-of-arsonia-bougainvillea-photo.400x225.jpg', 'House of Arsonia Bougainvillea', 4.1, 4, '', '', 310000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:08:51', '2020-01-25 17:07:36'),
(27, 'https://static.misteraladin.com/images/hotel/0000042000/0000041721/house-of-arsonia-flamboyant-photo.400x225.jpg', 'House of Arsonia Flamboyant', 4, 1, '', '', 310000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:08:45', '2020-01-25 17:07:36'),
(28, 'https://static.misteraladin.com/images/hotel/0000042000/0000041728/fontana-residencia-guest-house-photo.400x225.jpg', 'Fontana Residencia Guest House', 3.1, 1, '', '', 33999, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:17:00', '2020-01-25 17:07:36'),
(29, 'https://static.misteraladin.com/images/hotel/0000067000/0000066263/ibis-styles-bogor-raya-photo.400x225.jpg', 'ibis Styles Bogor Raya', 3.8, 2, '', '', 605000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:08:35', '2020-01-25 17:07:36'),
(30, 'https://static.misteraladin.com/images/hotel/0000042000/0000041679/the-packer-lodge-hostel-photo22.400x225.jpg', 'The Packer Lodge - Hostel', 4.2, 1, '', '', 280125, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:08:29', '2020-01-25 17:07:36'),
(31, 'https://static.misteraladin.com/images/hotel/0000043000/0000042033/holiday-inn-cikarang-jababeka-photo.400x225.jpg', 'Holiday Inn Cikarang Jababeka', 4.2, 4, '', '', 889468, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:08:25', '2020-01-25 17:07:36'),
(32, 'https://static.misteraladin.com/images/hotel/0000042000/0000041631/hotel-banyuwangi-sintera-photo.400x225.jpg', 'Hotel Banyuwangi Sintera', 3.1, 1, '', '', 400001, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:08:20', '2020-01-25 17:07:36'),
(33, 'https://static.misteraladin.com/images/hotel/0000039000/0000038938/holiday-inn-express-jakarta-international-expo-photo.400x225.jpg', 'Holiday Inn Express Jakarta International Expo', 3.7, 1, '', '', 147156, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:17:29', '2020-01-25 17:07:36'),
(34, 'https://static.misteraladin.com/images/hotel/0000042000/0000041647/four-seasons-hotel-jakarta-photo.400x225.jpg', 'Four Seasons Hotel 10', 4.9, 1, '', '', 329670, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:17:32', '2020-01-25 17:07:36'),
(35, 'https://static.misteraladin.com/images/hotel/0000042000/0000041674/the-westin-jakarta-photo.400x225.jpg', 'The Westin 10', 3.1, 1, '', '', 285560, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:17:35', '2020-01-25 17:07:36'),
(36, 'https://static.misteraladin.com/images/hotel/0000042000/0000041694/four-points-by-sheraton-jakarta-thamrin-photo4.400x225.jpg', 'Four Points by Sheraton Jakarta Thamrin', 4.8, 1, '', '', 108779, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 16:17:38', '2020-01-25 17:07:36'),
(37, 'https://static.misteraladin.com/images/hotel/0000042000/0000041707/hotel-lautze-indah-photo.400x225.jpg', 'Hotel Lautze Indah', 3.1, 1, '', '', 216501, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:52', '2020-01-25 17:07:36'),
(38, 'https://static.misteraladin.com/images/hotel/0000042000/0000041670/coins-hotel-photo.400x225.jpg', 'Coin\'s Hotel', 3.6, 1, '', '', 450001, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:45', '2020-01-25 17:07:36'),
(39, 'https://static.misteraladin.com/images/hotel/0000042000/0000041626/luxury-apartment-by-mediapura-photo9.400x225.jpg', 'Luxury Apartment by Mediapura', 3.4, 1, '', '', 725001, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:40', '2020-01-25 17:07:36'),
(40, 'https://static.misteraladin.com/images/hotel/0000042000/0000041663/maxwell-sweet-apartment-photo21.400x225.jpg', 'Maxwell Sweet Apartment', 4.6, 1, '', '', 1250000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:36', '2020-01-25 17:07:36'),
(41, 'https://static.misteraladin.com/images/hotel/0000001000/0000000523/mercure-jakarta-sabang-photo.400x225.jpg', 'Mercure Jakarta Sabang', 4.3, 1, '', '', 1316480, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:30', '2020-01-25 17:07:36'),
(42, 'https://static.misteraladin.com/images/hotel/0000001000/0000000702/grand-whiz-hotel-kelapa-gading-photo.400x225.jpg', 'Grand Whiz Hotel Kelapa Gading', 4.1, 1, '', '', 590000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:24', '2020-01-25 17:07:36'),
(43, 'https://static.misteraladin.com/images/hotel/0000001000/0000000490/discovery-hotel-convention-ancol-photo.400x225.jpg', 'Discovery Hotel & Convention Ancol', 4.2, 1, '', '', 824176, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:19', '2020-01-25 17:07:36'),
(44, 'https://static.misteraladin.com/images/hotel/0000001000/0000000734/everyday-smart-hotel-mangga-besar-photo26.400x225.jpg', 'Everyday Smart Hotel Mangga Besar', 4.4, 1, '', '', 350000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:12', '2020-01-25 17:07:36'),
(45, 'https://static.misteraladin.com/images/hotel/0000042000/0000041615/darcici-cempaka-putih-photo.400x225.jpg', 'd\'Arcici Cempaka Putih', 2.9, 1, '', '', 430001, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:07', '2020-01-25 17:07:36'),
(46, 'https://static.misteraladin.com/images/hotel/0000043000/0000042513/swift-inn-aeropolis-airport-photo.400x225.jpg', 'Swift Inn Aeropolis Airport', 2, 3, '', '', 215000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:07:03', '2020-01-25 17:07:36'),
(47, 'https://static.misteraladin.com/images/hotel/0000042000/0000041639/centro-city-service-apartment-photo.400x225.jpg', 'Centro City Service Apartment', 4, 1, '', '', 338000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:56', '2020-01-25 17:07:36'),
(48, 'https://static.misteraladin.com/images/hotel/0000009000/0000008176/8176_grand-batik-inn-photo.400x225.jpg', 'Grand Batik Inn', 3.1, 1, '', '', 390000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:52', '2020-01-25 17:07:36'),
(49, 'https://static.misteraladin.com/images/hotel/0000042000/0000041684/dprimahotel-itc-mangga-dua-photo.400x225.jpg', 'd\'primahotel ITC Mangga Dua', 3.8, 1, '', '', 515262, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:46', '2020-01-25 17:07:36'),
(50, 'https://static.misteraladin.com/images/hotel/0000001000/0000000546/bale-ocasa-photo.400x225.jpg', 'Bale OCasa', 4.1, 3, '', '', 414400, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:42', '2020-01-25 17:07:36'),
(51, 'https://static.misteraladin.com/images/hotel/0000041000/0000040489/amaris-hotel-pakuan-bogor.400x225.jpg', 'Amaris Hotel Pakuan 20', 3.2, 2, '', '', 521481, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:37', '2020-01-25 17:07:36'),
(52, 'https://static.misteraladin.com/images/hotel/0000009000/0000008979/8979_flat-06-sampit-residence-photo11.400x225.jpg', 'Sampit Residence by Flat06', 4.1, 1, '', '', 398999, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:32', '2020-01-25 17:07:36'),
(53, 'https://static.misteraladin.com/images/hotel/0000041000/0000040838/diradja-hotel-photo3.400x225.jpg', 'Diradja Hotel', 4.9, 1, '', '', 495000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:26', '2020-01-25 17:07:36'),
(54, 'https://static.misteraladin.com/images/hotel/0000001000/0000000558/558_pomelotel-hotel17.400x225.jpg', 'Pomelotel', 4.2, 1, '', '', 551282, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:22', '2020-01-25 17:07:36'),
(55, 'https://static.misteraladin.com/images/hotel/0000009000/0000008540/n1-hotel-photo21.400x225.jpg', 'N1 Hotel', 5, 1, '', '', 285000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:17', '2020-01-25 17:07:36'),
(56, 'https://static.misteraladin.com/images/hotel/0000040000/0000039689/p-hotel-photo1.400x225.jpg', 'P Hotel', 3.9, 1, '', '', 420000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:13', '2020-01-25 17:07:36'),
(57, 'https://static.misteraladin.com/images/hotel/0000039000/0000038935/zest-hotel-bogor-photo.400x225.jpg', 'Zest Hotel 20', 3, 2, '', '', 618310, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:08', '2020-01-25 17:07:36'),
(58, 'https://static.misteraladin.com/images/hotel/0000001000/0000000877/amaris-hotel-tebet-jakarta-photo13.400x225.jpg', 'Amaris Hotel Tebet 10', 4, 1, '', '', 470000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:06:02', '2020-01-25 17:07:36'),
(59, 'https://static.misteraladin.com/images/hotel/0000071000/0000070262/pesona-hotel-cikarang-photo14.400x225.jpg', 'Pesona Hotel Cikarang', 3, 4, '', '', 275001, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:58', '2020-01-25 17:07:36'),
(60, 'https://static.misteraladin.com/images/hotel/0000039000/0000038998/the-acacia-jakarta-photo.400x225.jpg', 'The Acacia 10', 3.1, 1, '', '', 615000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:55', '2020-01-25 17:07:36'),
(61, 'https://static.misteraladin.com/images/hotel/0000042000/0000041666/sare-suites-photo2.400x225.jpg', 'SARE Suites', 4, 1, '', '', 298999, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:48', '2020-01-25 17:07:36'),
(62, 'https://static.misteraladin.com/images/hotel/0000009000/0000008318/sparks-life-jakarta-photo18.400x225.jpg', 'Sparks Life 10', 4.8, 1, '', '', 500000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:41', '2020-01-25 17:07:36'),
(63, 'https://static.misteraladin.com/images/hotel/0000042000/0000041691/menteng-house-photo1.400x225.jpg', 'Menteng House', 4, 1, '', '', 450001, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:36', '2020-01-25 17:07:36'),
(64, 'https://static.misteraladin.com/images/hotel/0000009000/0000008448/hotel-bintang-griyawisata-photo8.400x225.jpg', 'Hotel Bintang Griyawisata', 3.1, 1, '', '', 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:28', '2020-01-25 17:07:36'),
(65, 'https://static.misteraladin.com/images/hotel/0000041000/0000040339/yasmin-karawaci12.400x225.jpg', 'Yasmin Karawaci', 4.9, 3, '', '', 524999, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:25', '2020-01-25 17:07:36'),
(66, 'https://static.misteraladin.com/images/hotel/0000066000/0000065929/morrissey-hotel-residences-photo16.400x225.jpg', 'Morrissey Hotel Residences', 4.5, 1, '', '', 1386001, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:20', '2020-01-25 17:07:36'),
(67, 'https://static.misteraladin.com/images/hotel/0000039000/0000038976/putri-duyung-ancol-photo7.400x225.jpg', 'Putri Duyung Ancol', 2, 1, '', '', 1455300, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:16', '2020-01-25 17:07:36'),
(68, 'https://static.misteraladin.com/images/hotel/0000001000/0000000712/amaris-hotel-senen-photo.400x225.jpg', 'Amaris Hotel Senen', 3, 1, '', '', 437500, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:10', '2020-01-25 17:07:36'),
(69, 'https://static.misteraladin.com/images/hotel/0000082000/0000081030/limperial-spalet-photo.400x225.jpg', 'L\'Imperial Spatel', 3.8, 4, '', '', 227500, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:07', '2020-01-25 17:07:36'),
(70, 'https://static.misteraladin.com/images/hotel/0000043000/0000042065/amaris-hotel-citra-raya-tangerang-photo.400x225.jpg', 'Amaris Hotel Citra Raya - 30', 3.1, 3, '', '', 488400, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:05:00', '2020-01-25 17:07:36'),
(71, 'https://static.misteraladin.com/images/hotel/0000001000/0000000573/gran-melia-jakarta-photo9.400x225.jpg', 'Gran Melia 10', 4, 1, '', '', 1633500, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum', '2020-01-26 12:04:56', '2020-01-25 17:07:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `profile`
--

CREATE TABLE `profile` (
  `id_profile` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `saldo` int(11) DEFAULT 0,
  `name` varchar(50) NOT NULL,
  `birthday` date DEFAULT '0000-00-00',
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `image` longtext DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `profile`
--

INSERT INTO `profile` (`id_profile`, `id_user`, `saldo`, `name`, `birthday`, `no_hp`, `email`, `image`, `created_on`, `updated_on`) VALUES
(2, 3, 2600000, 'Vildan', '1899-11-30', '123', 'vildanafriyansyah567@gmail.com', 'content://media/external/images/media/142963', '2020-01-26 18:36:40', '2020-01-26 18:36:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `province`
--

CREATE TABLE `province` (
  `id_province` int(5) NOT NULL,
  `province` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `province`
--

INSERT INTO `province` (`id_province`, `province`) VALUES
(1, 'BANTEN'),
(2, 'DKI JAKARTA'),
(3, 'JAWA BARAT'),
(4, 'JAWA TENGAH'),
(5, 'DI YOGYAKARTA'),
(6, 'JAWA TIMUR'),
(7, 'BALI'),
(8, 'NANGGROE ACEH DARUSSALAM (NAD)'),
(9, 'SUMATERA UTARA'),
(10, 'SUMATERA BARAT'),
(11, 'RIAU'),
(12, 'KEPULAUAN RIAU'),
(13, 'JAMBI'),
(14, 'BENGKULU'),
(15, 'SUMATERA SELATAN'),
(16, 'BANGKA BELITUNG'),
(17, 'LAMPUNG'),
(18, 'KALIMANTAN BARAT'),
(19, 'KALIMANTAN TENGAH'),
(20, 'KALIMANTAN SELATAN'),
(21, 'KALIMANTAN TIMUR'),
(22, 'KALIMANTAN UTARA'),
(23, 'SULAWESI BARAT'),
(24, 'SULAWESI SELATAN'),
(25, 'SULAWESI TENGGARA'),
(26, 'SULAWESI TENGAH'),
(27, 'GORONTALO'),
(28, 'SULAWESI UTARA'),
(29, 'MALUKU'),
(30, 'MALUKU UTARA'),
(31, 'NUSA TENGGARA BARAT (NTB)'),
(32, 'NUSA TENGGARA TIMUR (NTT)'),
(33, 'PAPUA BARAT'),
(34, 'PAPUA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `revoked_token`
--

CREATE TABLE `revoked_token` (
  `id_revoked` int(11) NOT NULL,
  `token` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `login` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `revoked_token`
--

INSERT INTO `revoked_token` (`id_revoked`, `token`, `status`, `login`, `logout`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpbGRhbmFmcml5YW5zeWFoNTY3QGdtYWlsLmNvbSIsImlkIjoxLCJpYXQiOjE1ODAwNjAxNjR9.5zcELcD-pBox5DF7D2ynI9Uy0Mfje6KSGVhGjwnOiT8', 1, '2020-01-26 17:36:04', '2020-01-26 17:49:26'),
(5, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpbGRhbmFmcml5YW5zeWFoNTY3QGdtYWlsLmNvbSIsImlkIjoxLCJpYXQiOjE1ODAwNjIzOTJ9.1ckzAtIlx9KGFBa0yCnaMs_CvAXKw8IXiQH88LLjxYg', 1, '2020-01-26 18:13:12', '0000-00-00 00:00:00'),
(6, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpbGRhbmFmcml5YW5zeWFoNTY3QGdtYWlsLmNvbSIsImlkIjozLCJpYXQiOjE1ODAwNjMzODJ9.BpKSg2jPgyg4ZH8bwsZnIwa2NCW3lGT2oOtIe2LB2Kc', 0, '2020-01-26 18:29:42', '0000-00-00 00:00:00'),
(7, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpbGRhbmFmcml5YW5zeWFoNTY3QGdtYWlsLmNvbSIsImlkIjozLCJpYXQiOjE1ODAwNjM5MTZ9.rM7DE5F45tPU2phN4f0HW-ZyWrzhcKoeRaMOYe1VNSw', 0, '2020-01-26 18:38:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id_room` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `rate` float NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id_room`, `id_hotel`, `image`, `rate`, `name`, `price`, `description`, `created_on`, `updated_on`) VALUES
(1, 1, 'fruitarian.jpg, fruit tea lemon.png, happymeal.jpg', 0, 'VVIP', 100000, 'loren ipsum', '2020-01-24 18:06:08', '2020-01-23 18:12:06'),
(3, 1, 'fruitarian.jpg, fruit tea lemon.png, happymeal.jpg', 0, 'VVIP', 200000, 'loren ipsum', '2020-01-24 18:06:19', '2020-01-23 18:16:38'),
(4, 1, 'fruitarian.jpg, fruit tea lemon.png, happymeal.jpg', 0, 'VVIP', 300000, 'loren ipsum', '2020-01-24 18:02:45', '2020-01-24 18:02:45');

-- --------------------------------------------------------

--
-- Struktur dari tabel `topup`
--

CREATE TABLE `topup` (
  `id_topup` int(11) NOT NULL,
  `saldo` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `topup`
--

INSERT INTO `topup` (`id_topup`, `saldo`, `id_user`, `created_on`, `updated_on`) VALUES
(1, 10000000, 1, '2020-01-26 17:37:00', '2020-01-26 17:37:00'),
(2, 5000000, 3, '2020-01-26 18:30:05', '2020-01-26 18:30:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `email`, `password`, `created_on`, `updated_on`) VALUES
(3, 'vildanafriyansyah567@gmail.com', '$2a$10$RBGDe3MLrtiVSANm4tXlKO9fFZ/q7DL9fYhChJec/hbJqxQ54P1Oy', '2020-01-26 18:27:48', '2020-01-26 18:27:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `applicable` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expire` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`);

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indeks untuk tabel `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indeks untuk tabel `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indeks untuk tabel `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id_profile`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id_province`);

--
-- Indeks untuk tabel `revoked_token`
--
ALTER TABLE `revoked_token`
  ADD PRIMARY KEY (`id_revoked`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id_room`);

--
-- Indeks untuk tabel `topup`
--
ALTER TABLE `topup`
  ADD PRIMARY KEY (`id_topup`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`email`);

--
-- Indeks untuk tabel `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `booking`
--
ALTER TABLE `booking`
  MODIFY `id_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id_hotel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT untuk tabel `profile`
--
ALTER TABLE `profile`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `province`
--
ALTER TABLE `province`
  MODIFY `id_province` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `revoked_token`
--
ALTER TABLE `revoked_token`
  MODIFY `id_revoked` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id_room` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `topup`
--
ALTER TABLE `topup`
  MODIFY `id_topup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
