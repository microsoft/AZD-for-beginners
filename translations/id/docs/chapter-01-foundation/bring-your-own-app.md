# Bawa Aplikasi Anda Sendiri - Tambahkan azd ke Proyek yang Ada

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Fondasi & Mulai Cepat
- **⬅️ Sebelumnya**: [Proyek Pertamamu](first-project.md)
- **➡️ Selanjutnya**: [Dev Containers & Codespaces](dev-containers.md)

> Tinjauan perintah dan konfigurasi target: `azd 1.37.2` (November 2026). File yang dihasilkan bergantung pada aplikasi yang terdeteksi; penyebaran Azure tidak dieksekusi dalam tinjauan ini.

## Pendahuluan

Di [Proyek Pertamamu](first-project.md) kamu melakukan penyebaran aplikasi dengan memulai dari template. Namun sebagian besar waktu kamu sudah *memiliki* aplikasi — sebuah API Node.js, layanan Python Flask, aplikasi web .NET — yang terletak di folder pada mesinmu. Pelajaran ini menunjukkan bagaimana menambahkan azd ke kode yang sudah ada agar kamu dapat menyebarkannya dengan `azd up`, tanpa perlu template.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, kamu akan:
- Memahami tiga cara memulai proyek azd
- Menjalankan `azd init` di dalam basis kode yang sudah ada
- Memahami apa yang dilakukan `azure.yaml` dan folder `infra/` untuk aplikasimu
- Mengetahui kapan membiarkan azd menghasilkan infrastruktur vs. menulis sendiri
- Menyebarkan aplikasi yang sudah ada ke Azure dengan `azd up`

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, kamu akan dapat:
- Menginisialisasi azd dalam proyek yang sudah kamu miliki
- Membaca dan mengedit file `azure.yaml` dasar
- Menghasilkan infrastruktur awal dengan `azd infra generate`
- Memilih host Azure yang sesuai untuk aplikasimu
- Menyebarkan dan membersihkan aplikasi kamu sendiri

---

## Tiga Cara Memulai Proyek azd

| Titik Mulai | Perintah | Kapan digunakan |
|----------------|---------|-------------|
| **Dari template** | `azd init --template <name> .` (direktori kosong) | Belajar, atau memulai aplikasi baru dari contoh yang terbukti |
| **Dari kode yang sudah ada** | `azd init` (di folder proyek kamu) | Kamu sudah memiliki aplikasi dan ingin menyebarkannya |
| **Dari repo Git** | `azd init --from-code` (di repo yang sudah dikloning) | Mengadopsi azd untuk repositori yang sudah ada |

Kamu sudah mempraktekkan opsi pertama. Pelajaran ini membahas opsi kedua — skenario dunia nyata yang paling umum.

---

## Langkah 1: Jalankan `azd init` di Proyekmu

Buka terminal **di dalam folder proyek yang sudah ada** dan jalankan:

```bash
cd my-existing-app
azd init
```

azd akan menanyakan bagaimana kamu ingin menginisialisasi. Pilih:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pilih **"Gunakan kode di direktori saat ini."** azd kemudian memindai foldermu, mendeteksi bahasa dan kerangka kerja, serta mengusulkan host.

### Apa yang dideteksi azd

azd mencari sinyal aplikasi seperti `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, atau sebuah `Dockerfile`. Alur from-code bukanlah wizard pemilihan host umum untuk setiap target penyebaran yang didukung:

| Aplikasi Anda | Host yang kemungkinan terdeteksi |
|----------|----------------------|
| Aplikasi web Node.js / Python / .NET yang didukung | Biasanya Azure Container Apps; periksa definisi yang dihasilkan |
| Aplikasi dengan kontainer (`Dockerfile`) | Azure Container Apps |
| Aplikasi Fungsi atau proyek Static Web Apps | Gunakan template yang cocok atau buat `azure.yaml` dan infrastruktur jika from-code tidak mendukung tata letakmu |

Konfirmasikan layanan yang terdeteksi, dan azd akan membuat file yang kamu perlukan.

---

## Langkah 2: Pahami Apa yang Dibuat azd

Setelah inisialisasi, periksa `azure.yaml`. Alur generated-infrastructure dapat menyimpan infrastruktur secara implisit sampai kamu menjalankan `azd infra generate`; jangan menganggap `infra/` sudah ada:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definisi proyek

Ini adalah inti dari proyek azd. **Definisi App Service ilustratif** berikut membutuhkan infrastruktur App Service yang cocok; ini bukan alasan untuk mengubah host Container Apps yang dihasilkan tanpa mengubah infrastrukturnya:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` adalah bagian kunci: setiap entri memetakan folder kode kamu ke host Azure. Jika aplikasi kamu memiliki frontend dan API, akan ada dua layanan.

### `infra/` — sumber daya Azure kamu sebagai kode

Folder `infra/` menyimpan file Bicep yang mendefinisikan sumber daya Azure yang diperlukan aplikasi kamu (App Service, basis data, dll). Kamu tidak harus menulis ini dengan tangan — azd menghasilkan titik awal yang bekerja. Kamu *bisa* mengeditnya kemudian untuk menambahkan sumber daya atau memperketat keamanan (dibahas di [Bab 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Ingin melihat atau menyesuaikan infrastruktur yang dihasilkan sebelum menyebarkan? Jalankan `azd infra generate` (juga tersedia sebagai `azd infra synth`) untuk menulis IaC ke disk agar bisa kamu tinjau dan kontrol versi.

---

## Langkah 3: Atur Konfigurasi yang Diperlukan

Jika aplikasi kamu membutuhkan pengaturan atau rahasia (string koneksi, kunci API), jangan menulisnya secara langsung. Gunakan nilai lingkungan:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Ini hanya menyimpan nilai lokal. Untuk memengaruhi aplikasi, gunakan secara eksplisit dalam parameter infrastruktur, pengaturan layanan yang didukung, atau hook; menetapkan variabel sembarangan tidak mengkonfigurasi runtime yang disebarkan.

Untuk rahasia nyata, simpan di Key Vault dan referensikan dari infrastruktur kamu — lihat [Bab 3: Konfigurasi & Autentikasi](../chapter-03-configuration/authsecurity.md).

---

## Langkah 4: Sebarkan

Sekarang gunakan alur kerja yang sudah kamu kenal:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Saat selesai, azd mencetak URL aplikasi kamu. Verifikasi dengan cara yang sama seperti aplikasi azd lainnya:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Masalah Umum Saat Pertama Kali

| Gejala | Penyebab Kemungkinan | Perbaikan |
|---------|--------------|-----|
| azd tidak mendeteksi aplikasiku | Manifest hilang (misal, `package.json`) | Tambahkan manifest, atau pilih host secara manual saat `azd init` |
| Build gagal saat `azd up` | Aplikasi butuh langkah build | Konfigurasikan skrip paket aplikasi atau hook layanan `prepackage`; gunakan `dist` untuk output penyebaran, bukan `buildCommand`/`outputPath` |
| Aplikasi mulai tapi mengembalikan kesalahan | Konfigurasi/rahasia hilang | Sambungkan nilai ke pengaturan runtime aplikasi atau referensi Key Vault; hanya `azd env set` tidak cukup |
| Host salah dipilih | Deteksi otomatis tidak sesuai kebutuhan | Ubah baik `host:` dan infrastrukturnya, atau pilih template yang sesuai |

Untuk lebih lengkap, lihat [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md).

---

## Bersihkan

```bash
azd down --force --purge
```

---

## Ringkasan

- `azd init` → **"Gunakan kode di direktori saat ini"** menambahkan azd ke aplikasi yang sudah kamu miliki.
- `azure.yaml` memetakan folder kode kamu ke host Azure; `infra/` mendefinisikan sumber daya sebagai Bicep.
- `azd infra generate` memungkinkan kamu meninjau atau menyesuaikan infrastruktur yang dibuat.
- Setelah diinisialisasi, aplikasi lama kamu menggunakan alur kerja `azd up` / `azd down` yang sama dengan aplikasi berbasis template.

---

## 🔗 Navigasi

| Arah | Pelajaran |
|-----------|--------|
| **Sebelumnya** | [Proyek Pertamamu](first-project.md) |
| **Selanjutnya** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Sumber Terkait

- [Dasar-Dasar AZD](azd-basics.md)
- [Bab 4: Infrastruktur sebagai Kode](../chapter-04-infrastructure/README.md)
- [Konfigurasi & Autentikasi](../chapter-03-configuration/authsecurity.md)
- [Lembar Cheat Perintah](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->