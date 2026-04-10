<?php
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type');

require 'db.php';

// Kimlik doğrulama kontrolü
if(!isset($_SESSION['login']) || $_SESSION['login'] !== true){
    http_response_code(401);
    echo json_encode(['error' => 'Yetkisiz erişim']);
    exit;
}

$action = isset($_GET['action']) ? $_GET['action'] : '';
$method = $_SERVER['REQUEST_METHOD'];

// JSON request body al
$input = json_decode(file_get_contents('php://input'), true) ?? [];

// ======================== MALZEMELER ========================
if ($action == 'malzemeler' && $method == 'GET') {
    $result = $baglanti->query("SELECT * FROM malzemeler ORDER BY id DESC");
    $malzemeler = [];
    while ($row = $result->fetch_assoc()) {
        $malzemeler[] = $row;
    }
    echo json_encode(['status' => 'success', 'data' => $malzemeler]);
}

// MALZEME EKLE
elseif ($action == 'malzeme_add' && $method == 'POST') {
    $ad          = trim($input['ad'] ?? '');
    $kategori_id = intval($input['kategori_id'] ?? 0);
    $adet        = intval($input['adet'] ?? 0);
    $lokasyon    = trim($input['lokasyon'] ?? '');

    $stmt = $baglanti->prepare("INSERT INTO malzemeler (ad, kategori_id, adet, lokasyon) VALUES (?,?,?,?)");
    $stmt->bind_param("siis", $ad, $kategori_id, $adet, $lokasyon);
    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'id' => $baglanti->insert_id, 'message' => 'Malzeme eklendi']);
    } else {
        echo json_encode(['status' => 'error', 'message' => $baglanti->error]);
    }
}

// MALZEME GÜNCELLE
elseif ($action == 'malzeme_update' && $method == 'POST') {
    $id   = intval($input['id'] ?? 0);
    $ad   = trim($input['ad'] ?? '');
    $adet = intval($input['adet'] ?? 0);

    $stmt = $baglanti->prepare("UPDATE malzemeler SET ad=?, adet=? WHERE id=?");
    $stmt->bind_param("sii", $ad, $adet, $id);
    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Malzeme güncellendi']);
    } else {
        echo json_encode(['status' => 'error', 'message' => $baglanti->error]);
    }
}

// MALZEME SİL
elseif ($action == 'malzeme_delete' && $method == 'POST') {
    $id = intval($input['id'] ?? 0);

    $stmt = $baglanti->prepare("DELETE FROM malzemeler WHERE id=?");
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Malzeme silindi']);
    } else {
        echo json_encode(['status' => 'error', 'message' => $baglanti->error]);
    }
}

// ======================== ARAÇLAR ========================
elseif ($action == 'araclar' && $method == 'GET') {
    $result = $baglanti->query("SELECT * FROM araclar ORDER BY id DESC");
    $araclar = [];
    while ($row = $result->fetch_assoc()) {
        $araclar[] = $row;
    }
    echo json_encode(['status' => 'success', 'data' => $araclar]);
}

elseif ($action == 'arac_add' && $method == 'POST') {
    $marka   = trim($input['marka'] ?? '');
    $model   = trim($input['model'] ?? '');
    $plaka   = trim($input['plaka'] ?? '');
    $sahip   = trim($input['sahip'] ?? '');
    $telefon = trim($input['telefon'] ?? '');

    $stmt = $baglanti->prepare("INSERT INTO araclar (marka, model, plaka, sahip, telefon) VALUES (?,?,?,?,?)");
    $stmt->bind_param("sssss", $marka, $model, $plaka, $sahip, $telefon);
    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Araç eklendi']);
    } else {
        echo json_encode(['status' => 'error', 'message' => $baglanti->error]);
    }
}

// ======================== KATEGORİLER ========================
elseif ($action == 'kategoriler' && $method == 'GET') {
    $result = $baglanti->query("SELECT * FROM kategoriler ORDER BY id DESC");
    $kategoriler = [];
    while ($row = $result->fetch_assoc()) {
        $kategoriler[] = $row;
    }
    echo json_encode(['status' => 'success', 'data' => $kategoriler]);
}

elseif ($action == 'kategori_add' && $method == 'POST') {
    $ad = trim($input['ad'] ?? '');

    $stmt = $baglanti->prepare("INSERT INTO kategoriler (ad) VALUES (?)");
    $stmt->bind_param("s", $ad);
    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Kategori eklendi']);
    } else {
        echo json_encode(['status' => 'error', 'message' => $baglanti->error]);
    }
}

// ======================== LOKASYONLAR ========================
elseif ($action == 'lokasyonlar' && $method == 'GET') {
    $result = $baglanti->query("SELECT * FROM lokasyonlar ORDER BY id DESC");
    $lokasyonlar = [];
    while ($row = $result->fetch_assoc()) {
        $lokasyonlar[] = $row;
    }
    echo json_encode(['status' => 'success', 'data' => $lokasyonlar]);
}

elseif ($action == 'lokasyon_add' && $method == 'POST') {
    $ad = trim($input['ad'] ?? '');

    $stmt = $baglanti->prepare("INSERT INTO lokasyonlar (ad) VALUES (?)");
    $stmt->bind_param("s", $ad);
    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Lokasyon eklendi']);
    } else {
        echo json_encode(['status' => 'error', 'message' => $baglanti->error]);
    }
}

// Bilinmeyen istek
else {
    echo json_encode(['status' => 'error', 'message' => 'Geçersiz istek']);
}

$baglanti->close();
?>