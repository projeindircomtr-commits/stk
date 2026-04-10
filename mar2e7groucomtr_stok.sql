-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 06 Nis 2026, 21:13:07
-- Sunucu sürümü: 10.11.16-MariaDB
-- PHP Sürümü: 8.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `mar2e7groucomtr_stok`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alanlar`
--

CREATE TABLE `alanlar` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `araclar`
--

CREATE TABLE `araclar` (
  `id` int(11) NOT NULL,
  `marka` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plaka` varchar(20) DEFAULT NULL,
  `camera` varchar(10) DEFAULT 'Yok',
  `gps` varchar(10) DEFAULT 'Yok',
  `sahip` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `lokasyon` varchar(100) DEFAULT NULL,
  `resim` varchar(255) DEFAULT NULL,
  `kamera` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Tablo döküm verisi `araclar`
--

INSERT INTO `araclar` (`id`, `marka`, `model`, `plaka`, `camera`, `gps`, `sahip`, `telefon`, `kategori_id`, `lokasyon`, `resim`, `kamera`) VALUES
(1, 'Ghj', 'Ghj', 'Ghjk', 'Var', 'Yok', 'Hjkk', 'Ghjk', 1, NULL, '', NULL),
(2, 'Hjkkj', 'Hhddd', 'Bhhh', 'Var', 'Var', 'Fguom', '99968', 1, NULL, '', NULL),
(3, 'Ggh', 'Vvhh', 'Ghjh', 'Var', 'Yok', 'Vbh', '999', 1, NULL, '', NULL),
(4, 'Hjkkjvhbbvjk', 'Yhjkjj', 'Ghbnn', 'Var', 'Yok', 'Bnlllkj', '86789', 1, NULL, '', NULL),
(7, 'Hh', 'Hhh', 'Bb', 'Yok', 'Yok', 'Bbb', 'Bbb', 1, NULL, '1775463967_17754639376613051843326023897659.jpg', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`id`, `ad`) VALUES
(1, 'Kamyonlar'),
(2, 'Binek araçlar'),
(3, 'Konteynerlar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) DEFAULT NULL,
  `kullanici_adi` varchar(50) DEFAULT NULL,
  `sifre` varchar(255) DEFAULT NULL,
  `rol` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `ad`, `kullanici_adi`, `sifre`, `rol`) VALUES
(1, 'Admin User', 'admin', 'salman6969', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lokasyonlar`
--

CREATE TABLE `lokasyonlar` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Tablo döküm verisi `lokasyonlar`
--

INSERT INTO `lokasyonlar` (`id`, `ad`) VALUES
(1, 'Depo1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `malzemeler`
--

CREATE TABLE `malzemeler` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `adet` int(11) DEFAULT 0,
  `lokasyon` varchar(100) DEFAULT NULL,
  `resim` varchar(255) DEFAULT NULL,
  `bakim_tarihi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Tablo döküm verisi `malzemeler`
--

INSERT INTO `malzemeler` (`id`, `ad`, `kategori_id`, `adet`, `lokasyon`, `resim`, `bakim_tarihi`) VALUES
(1, 'Denem', 0, 1, '', '', NULL),
(2, '34abm236', 1, 1, 'Depo1', '', NULL),
(3, '34jsjd37', 1, 1, 'Depo1', '', NULL),
(4, '34ddf', 1, 1, 'Depo1', '1775179582_1000140379.jpg', NULL),
(5, '34hsj', 1, 1, 'Depo1', '', NULL),
(6, '33gsjs28', 1, 5, 'Depo1', '1775179940_17751799263437091395731579083483.jpg', NULL),
(7, '34hdj383', 1, 5, 'Depo1', '1775194291_17751942823704993100533817260681.jpg', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `malzeme_alan`
--

CREATE TABLE `malzeme_alan` (
  `id` int(11) NOT NULL,
  `malzeme_id` int(11) DEFAULT NULL,
  `alan_id` int(11) DEFAULT NULL,
  `deger` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stok_hareket`
--

CREATE TABLE `stok_hareket` (
  `id` int(11) NOT NULL,
  `malzeme_id` int(11) DEFAULT NULL,
  `islem` varchar(20) DEFAULT NULL,
  `miktar` int(11) DEFAULT NULL,
  `aciklama` text DEFAULT NULL,
  `tarih` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `zimmet`
--

CREATE TABLE `zimmet` (
  `id` int(11) NOT NULL,
  `malzeme_id` int(11) DEFAULT NULL,
  `alan_kisi` varchar(100) DEFAULT NULL,
  `miktar` int(11) DEFAULT NULL,
  `tarih` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pending_operations`
--

CREATE TABLE `pending_operations` (
  `id` int(11) NOT NULL,
  `action` varchar(100) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `synced` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `alanlar`
--
ALTER TABLE `alanlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `araclar`
--
ALTER TABLE `araclar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kullanici_adi` (`kullanici_adi`);

--
-- Tablo için indeksler `lokasyonlar`
--
ALTER TABLE `lokasyonlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `malzemeler`
--
ALTER TABLE `malzemeler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `malzeme_alan`
--
ALTER TABLE `malzeme_alan`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `stok_hareket`
--
ALTER TABLE `stok_hareket`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `zimmet`
--
ALTER TABLE `zimmet`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `pending_operations`
--
ALTER TABLE `pending_operations`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `alanlar`
--
ALTER TABLE `alanlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `araclar`
--
ALTER TABLE `araclar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `lokasyonlar`
--
ALTER TABLE `lokasyonlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `malzemeler`
--
ALTER TABLE `malzemeler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `malzeme_alan`
--
ALTER TABLE `malzeme_alan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `stok_hareket`
--
ALTER TABLE `stok_hareket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `zimmet`
--
ALTER TABLE `zimmet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `pending_operations`
--
ALTER TABLE `pending_operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;