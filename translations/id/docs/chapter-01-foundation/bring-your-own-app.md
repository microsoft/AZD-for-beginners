# Bawa Aplikasi Anda Sendiri - Tambahkan azd ke Proyek yang Sudah Ada

**Chapter Navigation:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Current Chapter**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Previous**: [Proyek Pertama Anda](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Divalidasi terhadap `azd 1.25.6` pada Juni 2026.

## Pendahuluan

Di [Proyek Pertama Anda](first-project.md) Anda mendeploy sebuah aplikasi dengan memulai dari template. Tetapi sebagian besar waktu Anda sudah *punya* aplikasi—sebuah API Node.js, layanan Python Flask, aplikasi web .NET—yang berada di folder di mesin Anda. Pelajaran ini menunjukkan bagaimana menambahkan azd ke kode yang sudah ada sehingga Anda dapat mendeploynya dengan `azd up`, tanpa perlu template.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Memahami tiga cara untuk memulai proyek azd
- Menjalankan `azd init` di dalam basis kode yang sudah ada
- Memahami apa yang dilakukan `azure.yaml` dan folder `infra/` untuk aplikasi Anda
- Mengetahui kapan membiarkan azd menghasilkan infrastruktur vs. menulis sendiri
- Menyebarkan aplikasi yang sudah ada ke Azure dengan `azd up`

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan dapat:
- Menginisialisasi azd di proyek yang sudah Anda miliki
- Membaca dan mengedit file `azure.yaml` dasar
- Menghasilkan infrastruktur awal dengan `azd infra generate`
- Memilih host Azure yang sesuai untuk aplikasi Anda
- Menyebarkan dan membersihkan aplikasi Anda sendiri

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Untuk belajar, atau memulai aplikasi baru dari contoh yang sudah terbukti |
| **From your existing code** | `azd init` (in your project folder) | Anda sudah memiliki aplikasi dan ingin menyebarkannya |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Mengadopsi azd untuk repositori yang sudah ada |

Anda sudah mempraktikkan opsi pertama. Pelajaran ini membahas opsi kedua—skenario dunia nyata yang paling umum.

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

Pilih **"Use code in the current directory."** azd kemudian memindai folder Anda, mendeteksi bahasa dan kerangka kerja Anda, dan mengusulkan sebuah host.

### Apa yang dideteksi azd

azd mencari sinyal seperti `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, atau sebuah `Dockerfile`, dan menyarankan host Azure yang sesuai:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service atau Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Konfirmasi layanan yang terdeteksi, dan azd akan membuat kerangka file yang Anda butuhkan.

---

## Langkah 2: Memahami Apa yang Dibuat azd

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

Ini adalah inti dari proyek azd. Yang minimal terlihat seperti ini:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` adalah bagian kunci: setiap entri memetakan sebuah folder kode Anda ke sebuah host Azure. Jika aplikasi Anda memiliki frontend dan API, Anda akan memiliki dua layanan.

### `infra/` — sumber daya Azure Anda sebagai kode

Folder `infra/` menyimpan file Bicep yang mendefinisikan sumber daya Azure yang dibutuhkan aplikasi Anda (App Service, database, dll.). Anda tidak harus menulis ini secara manual—azd menghasilkan titik awal yang bekerja. Anda *dapat* mengeditnya nanti untuk menambah sumber daya atau memperketat keamanan (dibahas di [Bab 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Ingin melihat atau menyesuaikan infrastruktur yang dihasilkan sebelum mendeploy? Jalankan `azd infra generate` (juga tersedia sebagai `azd infra synth`) untuk menulis IaC ke disk sehingga Anda dapat meninjau dan mengontrol versinya.

---

## Langkah 3: Atur Konfigurasi yang Diperlukan

Jika aplikasi Anda membutuhkan pengaturan atau secret (sebuah connection string, sebuah API key), jangan hardcode mereka. Gunakan nilai lingkungan:

```bash
# Buat lingkungan
azd env new dev

# Tetapkan nilai yang bukan rahasia
azd env set API_VERSION 1.0.0
```

Untuk secret yang sebenarnya, simpan di Key Vault dan referensikan dari infrastruktur Anda—lihat [Bab 3: Konfigurasi & Otentikasi](../chapter-03-configuration/authsecurity.md).

---

## Langkah 4: Deploy

Sekarang gunakan alur kerja yang sama yang sudah Anda ketahui:

```bash
# Otentikasi (diperlukan untuk azd)
azd auth login

# Pratinjau sumber daya yang akan dibuat
azd provision --preview

# Sediakan infrastruktur dan terapkan kode Anda
azd up
```

Saat selesai, azd mencetak URL aplikasi Anda. Verifikasi dengan cara yang sama seperti aplikasi azd lainnya:

```bash
azd show           # tampilkan endpoint
azd monitor --logs # periksa log jika perlu
```

---

## Masalah Umum Saat Pertama Kali

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Tambahkan manifes, atau pilih host secara manual saat `azd init` |
| Build fails during `azd up` | App needs a build step | Tambahkan `buildCommand`/`outputPath` di bawah service dalam `azure.yaml` |
| App starts but returns errors | Missing config/secret | Atur nilai dengan `azd env set` atau hubungkan Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` di `azure.yaml` dan jalankan kembali `azd up` |

Untuk lebih lanjut, lihat [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md).

---

## Pembersihan

```bash
azd down --force --purge
```

---

## Ringkasan

- `azd init` → **"Use code in the current directory."** menambahkan azd ke aplikasi yang sudah Anda miliki.
- `azure.yaml` memetakan folder kode Anda ke host Azure; `infra/` mendefinisikan sumber daya sebagai Bicep.
- `azd infra generate` memungkinkan Anda meninjau atau menyesuaikan infrastruktur yang dihasilkan.
- Setelah diinisialisasi, aplikasi yang sudah ada menggunakan alur kerja `azd up` / `azd down` yang sama persis seperti aplikasi berbasis template.

---

## 🔗 Navigasi

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Proyek Pertama Anda](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Sumber Terkait

- [Dasar-dasar AZD](azd-basics.md)
- [Bab 4: Infrastruktur sebagai Kode](../chapter-04-infrastructure/README.md)
- [Konfigurasi & Otentikasi](../chapter-03-configuration/authsecurity.md)
- [Ringkasan Perintah](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->