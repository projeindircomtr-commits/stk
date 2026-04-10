<?php
include "db.php"; 
if(!isset($_SESSION['login'])){
    exit("Hata: Giriş yapılmamış.");
}

if(!isset($_GET['id'])){
    exit("Hata: ID yok.");
}

$id = intval($_GET['id']);

$stmt = $baglanti->prepare("DELETE FROM lokasyonlar WHERE id=?");
$stmt->bind_param("i", $id);
if($stmt->execute()){
    echo "ok";
} else {
    echo $baglanti->error;
}
?>