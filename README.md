# Klinik

Aplikasi web sederhana untuk pendaftaran dan pembayaran di klinik, dibuat dengan Spring Boot. Pasien membuat akun, memilih dokter umum atau dokter gigi, mengisi keluhan, membayar, lalu mendapat struk.

## Fitur

- Registrasi, login, dan logout
- Dashboard pasien
- Pilihan dokter umum dan dokter gigi beserta detailnya
- Pengisian keluhan dan alergi
- Pembayaran dan pencetakan struk transaksi
- Informasi akun (lihat, ubah, hapus)
- Pengelolaan data insan dan pasien (tambah, ubah, hapus)

## Teknologi

- Java 21
- Spring Boot 3.5 (Web, Data JPA, Validation)
- Thymeleaf
- MySQL
- Lombok
- Maven

## Struktur

```
klinik/
  src/main/java/com/example/klinik/
    controller/   # routing halaman
    entity/       # model data (Insan, Pasien, Dokter, Transaksi, ...)
    repository/   # akses database (Spring Data JPA)
  src/main/resources/
    templates/    # halaman Thymeleaf
    static/       # CSS dan gambar
    application.properties
```

## Cara menjalankan

1. Pasang Java 21 dan MySQL.
2. Siapkan database `klinik`, pilih salah satu:
   - **Dengan data contoh:** di phpMyAdmin buka tab **Import** dan pilih `database/klinik.sql`. File ini membuat database `klinik`, tabelnya, dan data contoh fiktif (4 dokter, 2 pasien, 1 transaksi). Akun contoh: `pasien1` / `demo123` atau `pasien2` / `demo123`.
   - **Kosong:** cukup buat database kosong, tabel dibuat otomatis oleh aplikasi saat pertama dijalankan.
     ```sql
     CREATE DATABASE klinik;
     ```
3. Sesuaikan `klinik/src/main/resources/application.properties` jika user atau password MySQL kamu berbeda. Bawaannya user `root` tanpa password di `localhost:3306`.
4. Jalankan dari folder `klinik/`:
   ```bash
   ./mvnw spring-boot:run
   ```
5. Buka <http://localhost:8085>.

Tabel juga dibuat otomatis saat aplikasi pertama kali dijalankan (`spring.jpa.hibernate.ddl-auto=update`).

## Catatan

Konfigurasi database bawaan hanya untuk pengembangan lokal. Jangan memakai user `root` tanpa password di lingkungan publik.
