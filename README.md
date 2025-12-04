# 🎓 Üniversite Bölüm Yönetim Sistemi

![Status](https://img.shields.io/badge/Status-Completed-success)
![Frontend](https://img.shields.io/badge/Frontend-React.js-blue)
![Backend](https://img.shields.io/badge/Backend-Node.js%20%7C%20Express.js-green)
![Database](https://img.shields.io/badge/Database-MySQL-orange)

Bu proje, üniversitelerin akademik birimlerinde yürütülen ders ve sınav programlama süreçlerinin dijital ortamda etkin, düzenli ve sürdürülebilir şekilde yönetilmesini sağlamak amacıyla geliştirilmiş web tabanlı bir yazılım çözümüdür.

## 🚀 Proje Hakkında

Geliştirilen sistem; bölüm başkanı, sekreter ve öğretim elemanları arasındaki iş akışını dijitalleştirerek manuel iş yükünü azaltmayı ve planlama hatalarını (çakışmaları) önlemeyi hedefler. RESTful mimari prensiplerine uygun olarak tasarlanan sistem, otomatik sınav oturma düzeni oluşturma ve kapı isimliği çıktısı alma gibi spesifik akademik ihtiyaçlara çözüm sunar.

### 🎯 Temel Hedefler
* **Çakışma Kontrolü:** Ders ve sınav programlarında zaman/mekan çakışmalarının otomatik engellenmesi.
* **Oturma Düzeni:** Sınavlar için sınıf kapasitesine göre rastgele ve adil oturma planı oluşturulması.
* **Rol Bazlı Erişim:** Bölüm Başkanı, Sekreter ve Öğretim Elemanı için özelleştirilmiş arayüzler.
* **Verimlilik:** Ders programlarının "Kapı İsimliği" formatında otomatik çıktısının alınması.

## 🛠️ Teknik Altyapı ve Mimari

Proje, katmanlı mimari yapısında **MERN Stack** (MongoDB yerine MySQL kullanılarak) benzeri bir yapıda geliştirilmiştir.

| Katman | Teknoloji | Açıklama |
| :--- | :--- | :--- |
| **Frontend** | React.js | Kullanıcı dostu, dinamik ve modüler arayüz. |
| **Backend** | Node.js / Express.js | RESTful API, İş mantığı ve Algoritmalar. |
| **Veritabanı** | MySQL | İlişkisel veri tabanı yönetimi. |
| **Güvenlik** | JWT & Bcrypt | Token tabanlı kimlik doğrulama ve şifreleme. |

## ⚙️ Modüller ve Özellikler

### 1. Kullanıcı Yönetimi ve Yetkilendirme
* **Roller:** Bölüm Başkanı, Sekreter, Öğretim Elemanı.
* **Güvenlik:** JWT ile oturum yönetimi, Bcrypt ile şifrelerin hashlenerek saklanması.
* **Yönetim:** Sadece yetkili kullanıcılar (Bölüm Başkanı) yeni kullanıcı ekleyebilir veya rol değiştirebilir.

### 2. Ders Programı Yönetimi
* Derslerin gün, saat ve derslik bazında planlanması.
* Aynı derslikte veya saatte çakışma olduğunda sistemin uyarı vermesi.
* Öğretim elemanı atamaları.

### 3. Sınav Yönetimi
* Sınav tarih, saat ve gözetmen atamaları.
* **Sınav Oturma Düzeni Algoritması:** Sınıf kapasitesine ve öğrenci sayısına göre öğrencileri rastgele blok/sıra/koltuk düzenine yerleştirir.
* PDF çıktı desteği (İmza listesi ve Oturma planı görseli).

### 4. Kapı İsimliği (Program Çıktısı)
* Öğretim elemanlarının haftalık ders programlarını kapılarına asabilecekleri formatta otomatik tablo oluşturur.

## 📸 Ekran Görüntüleri ve İşleyiş

*(Buraya projenizden ekran görüntüleri ekleyebilirsiniz, örneğin:)*
* *Giriş Ekranı*
* *Ders Programı Tablosu*
* *Otomatik Oluşturulan Sınav Oturma Planı*

## 💾 Veritabanı Şeması

Proje ilişkisel bir veri modeline sahiptir:
* **`kullanicilar`**: Kullanıcı adı, şifre (hash), rol.
* **`dersler`**: Ders adı, gün, saat, derslik, öğretmen ID, öğrenci sayısı.
* **`ogrenciler`**: Öğrenci no, ad soyad, sınıf, bölüm.
* **`ogrenci_ders`**: Öğrenci ve ders arasındaki çoka-çok ilişki ve notlar.

## 🚀 Kurulum

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları izleyin:

### Ön Gereksinimler
* Node.js
* MySQL Server

### Adım 1: Veritabanı Kurulumu
MySQL üzerinde `bolum_yonetim_db` adında bir veritabanı oluşturun ve proje dosyasındaki `database.sql` dosyasını içe aktarın.

### Adım 2: Backend Kurulumu
```bash
cd backend
npm install
# .env dosyasını oluşturun (DB_HOST, DB_USER, DB_PASS, JWT_SECRET)
npm start


