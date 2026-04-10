-- ============================================================
-- Şantiye Stok Takip Sistemi - Kurulum SQL
-- Kullanım: Bu dosyayı phpMyAdmin veya MySQL CLI ile import edin
-- Admin: admin / salman6969
-- ============================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET NAMES utf8mb4;

-- --------------------------------------------------------
-- Veritabanı oluştur (gerekirse)
-- CREATE DATABASE IF NOT EXISTS `stok_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- USE `stok_db`;
-- --------------------------------------------------------

-- Kullanıcılar tablosu
CREATE TABLE IF NOT EXISTS `kullanicilar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) DEFAULT NULL,
  `kullanici_adi` varchar(50) DEFAULT NULL,
  `sifre` varchar(255) DEFAULT NULL,
  `rol` int(11) DEFAULT 0 COMMENT '1=Admin, 0=Normal Kullanıcı',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kullanici_adi` (`kullanici_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Admin kullanıcısı (şifre: salman6969)
INSERT IGNORE INTO `kullanicilar` (`ad`, `kullanici_adi`, `sifre`, `rol`) VALUES
('Admin User', 'admin', 'salman6969', 1);

-- --------------------------------------------------------

-- Kategoriler tablosu
CREATE TABLE IF NOT EXISTS `kategoriler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `kategoriler` (`id`, `ad`) VALUES
(1, 'Kamyonlar'),
(2, 'Binek araçlar'),
(3, 'İş makineleri'),
(4, 'Yapı malzemeleri');

-- --------------------------------------------------------

-- Lokasyonlar tablosu
CREATE TABLE IF NOT EXISTS `lokasyonlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO `lokasyonlar` (`id`, `ad`) VALUES
(1, 'Depo 1'),
(2, 'Şantiye A'),
(3, 'Şantiye B');

-- --------------------------------------------------------

-- Malzemeler tablosu
CREATE TABLE IF NOT EXISTS `malzemeler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `adet` int(11) DEFAULT 0,
  `lokasyon` varchar(100) DEFAULT NULL,
  `resim` varchar(255) DEFAULT NULL,
  `bakim_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Araçlar tablosu
CREATE TABLE IF NOT EXISTS `araclar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `kamera` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Stok hareket tablosu
CREATE TABLE IF NOT EXISTS `stok_hareket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `malzeme_id` int(11) DEFAULT NULL,
  `islem` varchar(20) DEFAULT NULL,
  `miktar` int(11) DEFAULT NULL,
  `aciklama` text DEFAULT NULL,
  `tarih` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Zimmet tablosu
CREATE TABLE IF NOT EXISTS `zimmet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `malzeme_id` int(11) DEFAULT NULL,
  `alan_kisi` varchar(100) DEFAULT NULL,
  `miktar` int(11) DEFAULT NULL,
  `tarih` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Çevrimdışı işlemler tablosu (PWA sync)
CREATE TABLE IF NOT EXISTS `pending_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `synced` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Alanlar tablosu
CREATE TABLE IF NOT EXISTS `alanlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

-- Malzeme - Alan ilişki tablosu
CREATE TABLE IF NOT EXISTS `malzeme_alan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `malzeme_id` int(11) DEFAULT NULL,
  `alan_id` int(11) DEFAULT NULL,
  `deger` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

COMMIT;
