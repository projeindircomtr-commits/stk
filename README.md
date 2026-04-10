# 🏗️ Şantiye Stok Takip Sistemi

PHP + MySQL tabanlı, PWA destekli şantiye malzeme ve araç stok takip sistemi.

## Özellikler

- ✅ **Malzeme yönetimi** – Excel görünümlü tablo, arama, filtreleme, güncelleme
- ✅ **Araç yönetimi** – Kamera/GPS durumu, sahip bilgisi, plaka takibi
- ✅ **Stok giriş/çıkış** – Zimmet kaydı ile çıkış işlemi
- ✅ **Kategori & Lokasyon** yönetimi
- ✅ **Raporlama dashboardı** – Grafikler ve istatistikler
- ✅ **Kullanıcı yönetimi** – Admin ve normal kullanıcı rolleri
- ✅ **PWA (Progressive Web App)** – Offline çalışma ve online senkronizasyon
- ✅ **Mobil kamera desteği** – Resim çekip direkt yükleme
- ✅ **Büyük dosya desteği** – Resim yükleme limiti 100 MB

## Kurulum

### 1. Dosyaları sunucuya yükleyin

Tüm dosyaları `/stok/` klasörüne yükleyin:

```
https://projeindir.com.tr/stok/
```

### 2. Veritabanı oluşturun

phpMyAdmin veya MySQL CLI üzerinden `install.sql` dosyasını import edin:

```bash
mysql -u KULLANICI -p VERITABANI < install.sql
```

### 3. `db.php` dosyasını düzenleyin

```php
define('DB_HOST',     'localhost');
define('DB_USER',     'veritabani_kullanici');
define('DB_PASSWORD', 'veritabani_sifre');
define('DB_NAME',     'veritabani_adi');
```

Alternatif olarak sunucu ortam değişkenleri kullanabilirsiniz:
- `DB_HOST`
- `DB_USER`
- `DB_PASSWORD`
- `DB_NAME`

### 4. `uploads/` klasörü izinleri

```bash
chmod 755 uploads/
```

### 5. Sisteme giriş

| Alan | Değer |
|------|-------|
| URL | `https://projeindir.com.tr/stk/login.php` |
| Kullanıcı adı | `admin` |
| Şifre | `salman6969` |

## Sayfa Yapısı

| Sayfa | Açıklama |
|-------|----------|
| `login.php` | Giriş sayfası |
| `index.php` | Ana dashboard |
| `dashboard.php` | Detaylı raporlama |
| `malzemeler.php` | Malzeme listesi (Excel görünümü) |
| `ekle.php` | Yeni malzeme ekle |
| `araclar.php` | Araç listesi (Excel görünümü) |
| `arac_ekle.php` | Yeni araç ekle |
| `stok_islem.php` | Stok giriş/çıkış |
| `kategoriler.php` | Kategori yönetimi |
| `lokasyon.php` | Lokasyon yönetimi |
| `kullanici_ekle.php` | Kullanıcı yönetimi (sadece admin) |

## Teknik Gereksinimler

- PHP 7.4+
- MySQL 5.7+ veya MariaDB 10.3+
- mod_rewrite etkin Apache
- `uploads/` klasörü yazılabilir

## Resim Boyutları

- **Malzeme resimleri:** max 100 MB (JPG, PNG, GIF, WEBP)
- **Araç resimleri:** max 100 MB (JPG, PNG, GIF, WEBP)
- Mobil cihazlarda direkt kamera açılır
