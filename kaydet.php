<?php
include "db.php";
if(!isset($_SESSION['login'])){ header("Location: login.php"); exit; }

$ad          = trim($_POST['ad'] ?? '');
$kat         = intval($_POST['kategori'] ?? 0);
$adet        = intval($_POST['adet'] ?? 0);
$lok         = trim($_POST['lokasyon'] ?? '');

$resim = "";
if(isset($_FILES['resim']) && $_FILES['resim']['name'] != ""){
    $uzanti = strtolower(pathinfo($_FILES['resim']['name'], PATHINFO_EXTENSION));
    $resim  = time() . "_" . uniqid() . "." . $uzanti;
    move_uploaded_file($_FILES['resim']['tmp_name'], "uploads/" . $resim);
}

$stmt = $baglanti->prepare("INSERT INTO malzemeler (ad, kategori_id, adet, lokasyon, resim) VALUES (?,?,?,?,?)");
$stmt->bind_param("siiss", $ad, $kat, $adet, $lok, $resim);
$stmt->execute();
$id = $baglanti->insert_id;

$alanlar = $baglanti->query("SELECT * FROM alanlar");
while($a = $alanlar->fetch_assoc()){
    $deger = trim($_POST['alan_' . $a['id']] ?? '');
    $stmt2 = $baglanti->prepare("INSERT INTO malzeme_alan (malzeme_id, alan_id, deger) VALUES (?,?,?)");
    $stmt2->bind_param("iis", $id, $a['id'], $deger);
    $stmt2->execute();
}

header("Location: index.php");
exit;