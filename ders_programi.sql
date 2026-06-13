-- MySQL şema dökümü (yalnızca yapı / schema-only)
-- Veritabanı: ders_programi
-- ------------------------------------------------------
-- NOT: Bu dosya GÜVENLİK NEDENİYLE yalnızca tablo yapısını (DDL) içerir.
-- Gerçek veriler (kullanıcı şifre hash'leri, öğrenci PII'leri vb.) BİLİNÇLİ olarak çıkarılmıştır
-- ve repoya commit'lenmemelidir. Veri içeren dump'lar .gitignore tarafından engellenir.

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dersler`
--

DROP TABLE IF EXISTS `dersler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dersler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isim` varchar(255) NOT NULL,
  `gun` varchar(50) NOT NULL,
  `saat` varchar(50) NOT NULL,
  `derslik` varchar(50) NOT NULL,
  `ogretmen` varchar(255) NOT NULL,
  `sinif` int DEFAULT NULL,
  `ogrenciSayisi` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `derslikler`
--

DROP TABLE IF EXISTS `derslikler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `derslikler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(50) NOT NULL,
  `kapasite` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicilar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kullanici_adi` varchar(50) DEFAULT NULL,
  `sifre` varchar(255) DEFAULT NULL,
  `rol` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kullanici_adi` (`kullanici_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ogrenci_ders`
--

DROP TABLE IF EXISTS `ogrenci_ders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ogrenci_ders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ogrenci_id` int NOT NULL,
  `ders_id` int NOT NULL,
  `notu` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ogrenci_id` (`ogrenci_id`),
  KEY `ders_id` (`ders_id`),
  CONSTRAINT `ogrenci_ders_ibfk_1` FOREIGN KEY (`ogrenci_id`) REFERENCES `ogrenciler` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ogrenci_ders_ibfk_2` FOREIGN KEY (`ders_id`) REFERENCES `dersler` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ogrenciler`
--

DROP TABLE IF EXISTS `ogrenciler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ogrenciler` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ogrenci_no` varchar(20) NOT NULL,
  `ad_soyad` varchar(100) NOT NULL,
  `sinif` varchar(10) NOT NULL,
  `bolum` varchar(100) NOT NULL DEFAULT 'Yazılım Mühendisliği',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ogrenci_no` (`ogrenci_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sinav_oturma`
--

DROP TABLE IF EXISTS `sinav_oturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinav_oturma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sinav_id` int DEFAULT NULL,
  `ogrenci_id` int DEFAULT NULL,
  `sira` varchar(10) DEFAULT NULL,
  `kolon` int DEFAULT NULL,
  `gozcu` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sinav_programi`
--

DROP TABLE IF EXISTS `sinav_programi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinav_programi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ders_id` int NOT NULL,
  `tarih` date NOT NULL,
  `saat` time NOT NULL,
  `gozcu` varchar(100) DEFAULT NULL,
  `onayli` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ders_id` (`ders_id`),
  CONSTRAINT `sinav_programi_ibfk_1` FOREIGN KEY (`ders_id`) REFERENCES `dersler` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('bolum_baskani','ogretim_elemani','bolum_sekreteri') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
