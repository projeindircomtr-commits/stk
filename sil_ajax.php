<?php
include "db.php"; 
if(!isset($_SESSION['login'])){
    exit("Giriş yapılmamış.");
}

if(!isset($_GET['id'])){
    exit("ID yok.");
}

$id = intval($_GET['id']);

// Silmeden önce resim varsa dosyayı da sil
$stmt = $baglanti->prepare("SELECT resim FROM malzemeler WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$resim = $stmt->get_result()->fetch_assoc();
if($resim && $resim['resim'] && file_exists("uploads/" . $resim['resim'])){
    unlink("uploads/" . $resim['resim']);
}

// Malzemeyi sil
$stmt2 = $baglanti->prepare("DELETE FROM malzemeler WHERE id=?");
$stmt2->bind_param("i", $id);
if($stmt2->execute()){
    echo "ok";
} else {
    echo $baglanti->error;
}
?>