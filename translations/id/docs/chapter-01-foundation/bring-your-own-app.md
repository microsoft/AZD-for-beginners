# Bawa Aplikasi Anda Sendiri - Tambahkan azd ke Proyek yang Ada

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Proyek Pertama Anda](first-project.md)
- **➡️ Berikutnya**: [Dev Containers & Codespaces](dev-containers.md)

> Diverifikasi dengan `azd 1.27.1` pada Juli 2026.

## Pendahuluan

Dalam [Proyek Pertama Anda](first-project.md) Anda menerapkan aplikasi dengan memulai dari sebuah template. Tetapi kebanyakan waktu Anda sudah *memiliki* aplikasi—seperti API Node.js, layanan Python Flask, aplikasi web .NET—yang ada di folder pada mesin Anda. Pelajaran ini menunjukkan bagaimana menambahkan azd ke kode yang sudah ada sehingga Anda bisa menerapkannya dengan `azd up`, tanpa memerlukan template.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Memahami tiga cara memulai proyek azd
- Menjalankan `azd init` di dalam basis kode yang sudah ada
- Memahami apa fungsi `azure.yaml` dan folder `infra/` untuk aplikasi Anda
- Mengetahui kapan membiarkan azd menghasilkan infrastruktur vs. menulis sendiri
- Menerapkan aplikasi Anda yang sudah ada ke Azure dengan `azd up`

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan dapat:
- Menginisialisasi azd dalam proyek yang sudah Anda miliki
- Membaca dan mengedit file `azure.yaml` dasar
- Menghasilkan infrastruktur awal dengan `azd infra generate`
- Memilih host Azure yang sesuai untuk aplikasi Anda
- Menerapkan dan membersihkan aplikasi Anda sendiri

---

## Tiga Cara Memulai Proyek azd

| Titik awal | Perintah | Kapan digunakan |
|----------------|---------|-------------|
| **Dari sebuah template** | `azd init --template <name>` | Belajar, atau memulai aplikasi baru dari contoh yang sudah terbukti |
| **Dari kode yang sudah ada** | `azd init` (di folder proyek Anda) | Anda sudah memiliki aplikasi dan ingin menerapkannya |
| **Dari repositori Git** | `azd init --from-code` (di repo yang sudah dikloning) | Mengadopsi azd untuk repositori yang sudah ada |

Anda sudah mempraktikkan pilihan pertama. Pelajaran ini mencakup pilihan kedua—skenario nyata yang paling umum.

---

## Langkah 1: Jalankan `azd init` di Proyek Anda

Buka terminal **di dalam folder proyek Anda yang sudah ada** dan jalankan:

```bash
cd my-existing-app
azd init
```

azd akan menanyakan bagaimana Anda ingin menginisialisasi. Pilih:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pilih **"Gunakan kode di direktori saat ini."** Lalu azd memindai folder Anda, mendeteksi bahasa dan kerangka kerja Anda, lalu mengusulkan host.

### Apa yang dideteksi azd

azd mencari tanda seperti `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, atau `Dockerfile`, dan menyarankan host Azure yang cocok:

| Aplikasi Anda | Host yang kemungkinan terdeteksi |
|----------|----------------------|
| Aplikasi web Node.js / Python / .NET | Azure App Service atau Container Apps |
| Aplikasi dengan kontainer (`Dockerfile`) | Azure Container Apps |
| Aplikasi fungsi | Azure Functions |
| Situs statis (hasil build React/Vue) | Azure Static Web Apps |

Konfirmasikan layanan yang terdeteksi, dan azd membuat file-file yang Anda perlukan.

---

## Langkah 2: Pahami Apa yang Dibuat azd

Setelah init, Anda akan memiliki dua hal baru di proyek Anda:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definisi proyek

Ini adalah inti dari proyek azd. Versi minimalnya terlihat seperti ini:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` adalah bagian utama: setiap entri memetakan folder kode Anda ke host Azure. Jika aplikasi Anda memiliki frontend dan API, Anda akan memiliki dua layanan.

### `infra/` — sumber daya Azure Anda sebagai kode

Folder `infra/` menyimpan file Bicep yang mendefinisikan sumber daya Azure yang diperlukan aplikasi Anda (App Service, basis data, dll.). Anda tidak harus menulis ini secara manual—azd menghasilkan titik awal yang bekerja. Anda *bisa* mengeditnya nanti untuk menambahkan sumber daya atau memperketat keamanan (dibahas di [Bab 4](../chapter-04-infrastructure/README.md)).

> **Tips:** Ingin melihat atau menyesuaikan infrastruktur yang dihasilkan sebelum menerapkan? Jalankan `azd infra generate` (juga tersedia sebagai `azd infra synth`) untuk menulis IaC ke disk agar bisa ditinjau dan dikendalikan versinya.

---

## Langkah 3: Atur Konfigurasi yang Diperlukan

Jika aplikasi Anda membutuhkan pengaturan atau rahasia (string koneksi, kunci API), jangan hardcode langsung. Gunakan nilai lingkungan:

```bash
# Buat lingkungan
azd env new dev

# Tetapkan nilai yang tidak rahasia
azd env set API_VERSION 1.0.0
```

Untuk rahasia nyata, simpan di Key Vault dan rujuk dari infrastruktur Anda—lihat [Bab 3: Konfigurasi & Autentikasi](../chapter-03-configuration/authsecurity.md).

---

## Langkah 4: Terapkan

Sekarang gunakan alur kerja yang sudah Anda kenal:

```bash
# Otentikasi (diperlukan untuk azd)
azd auth login

# Pratinjau sumber daya yang akan dibuat
azd provision --preview

# Menyediakan infrastruktur dan menerapkan kode Anda
azd up
```

Saat selesai, azd mencetak URL aplikasi Anda. Verifikasi seperti aplikasi azd lainnya:

```bash
azd show           # tampilkan titik akhir
azd monitor --logs # periksa log jika perlu
```

---

## Masalah Umum Saat Pertama Kali

| Gejala | Penyebab Kemungkinan | Solusi |
|---------|--------------|-----|
| azd tidak mendeteksi aplikasi saya | Manifest hilang (misalnya `package.json`) | Tambahkan manifest, atau pilih host secara manual saat `azd init` |
| Build gagal saat `azd up` | Aplikasi memerlukan langkah build | Tambahkan `buildCommand`/`outputPath` di bawah layanan dalam `azure.yaml` |
| Aplikasi mulai tapi mengembalikan error | Konfigurasi/rahasia hilang | Atur nilai dengan `azd env set` atau sambungkan ke Key Vault |
| Host salah dipilih | Deteksi otomatis salah | Edit `host:` dalam `azure.yaml` dan jalankan ulang `azd up` |

Untuk lebih lanjut, lihat [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md).

---

## Bersihkan

```bash
azd down --force --purge
```

---

## Ringkasan

- `azd init` → **"Gunakan kode di direktori saat ini"** menambahkan azd ke aplikasi yang sudah Anda miliki.
- `azure.yaml` memetakan folder kode Anda ke host Azure; `infra/` mendefinisikan sumber daya sebagai Bicep.
- `azd infra generate` memungkinkan Anda meninjau atau menyesuaikan infrastruktur yang dihasilkan.
- Setelah diinisialisasi, aplikasi yang sudah ada menggunakan alur kerja `azd up` / `azd down` persis seperti aplikasi berbasis template.

---

## 🔗 Navigasi

| Arah | Pelajaran |
|-----------|--------|
| **Sebelumnya** | [Proyek Pertama Anda](first-project.md) |
| **Berikutnya** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Sumber Daya Terkait

- [Dasar-dasar AZD](azd-basics.md)
- [Bab 4: Infrastruktur sebagai Kode](../chapter-04-infrastructure/README.md)
- [Konfigurasi & Autentikasi](../chapter-03-configuration/authsecurity.md)
- [Cheat Sheet Perintah](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->