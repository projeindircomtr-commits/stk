<?php
session_start();

// Veritabanı bağlantı ayarları - kurulum sonrası kendi bilgilerinizle değiştirin
define('DB_HOST',     getenv('DB_HOST')     ?: 'localhost');
define('DB_USER',     getenv('DB_USER')     ?: 'mar2e7groucomtr_stok');
define('DB_PASSWORD', getenv('DB_PASSWORD') ?: 'Ceza1Ceza');
define('DB_NAME',     getenv('DB_NAME')     ?: 'mar2e7groucomtr_stok');

$baglanti = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
$baglanti->set_charset('utf8mb4');
if($baglanti->connect_error){
    die("DB Hatası: ".$baglanti->connect_error);
}
?>