<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-22T09:16:00+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "id"
}
-->
# Panduan Instalasi & Pengaturan

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Dasar-Dasar AZD](azd-basics.md)
- **➡️ Selanjutnya**: [Proyek Pertama Anda](first-project.md)
- **🚀 Bab Selanjutnya**: [Bab 2: Pengembangan Berbasis AI](../microsoft-foundry/microsoft-foundry-integration.md)

## Pendahuluan

Panduan lengkap ini akan memandu Anda melalui proses instalasi dan konfigurasi Azure Developer CLI (azd) di sistem Anda. Anda akan mempelajari berbagai metode instalasi untuk sistem operasi yang berbeda, pengaturan autentikasi, dan konfigurasi awal untuk mempersiapkan lingkungan pengembangan Anda untuk penerapan di Azure.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Berhasil menginstal Azure Developer CLI di sistem operasi Anda
- Mengonfigurasi autentikasi dengan Azure menggunakan berbagai metode
- Menyiapkan lingkungan pengembangan Anda dengan prasyarat yang diperlukan
- Memahami berbagai opsi instalasi dan kapan menggunakannya
- Memecahkan masalah umum terkait instalasi dan pengaturan

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan dapat:
- Menginstal azd menggunakan metode yang sesuai untuk platform Anda
- Melakukan autentikasi dengan Azure menggunakan `azd auth login`
- Memverifikasi instalasi Anda dan menguji perintah dasar azd
- Mengonfigurasi lingkungan pengembangan Anda untuk penggunaan azd yang optimal
- Menyelesaikan masalah instalasi umum secara mandiri

Panduan ini akan membantu Anda menginstal dan mengonfigurasi Azure Developer CLI di sistem Anda, terlepas dari sistem operasi atau lingkungan pengembangan Anda.

## Prasyarat

Sebelum menginstal azd, pastikan Anda memiliki:
- **Langganan Azure** - [Buat akun gratis](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk autentikasi dan pengelolaan sumber daya
- **Git** - Untuk mengkloning template dan kontrol versi
- **Docker** (opsional) - Untuk aplikasi berbasis kontainer

## Metode Instalasi

### Windows

#### Opsi 1: PowerShell (Direkomendasikan)
```powershell
# Jalankan sebagai Administrator atau dengan hak istimewa yang ditingkatkan
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Opsi 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Opsi 3: Chocolatey
```cmd
choco install azd
```

#### Opsi 4: Instalasi Manual
1. Unduh rilis terbaru dari [GitHub](https://github.com/Azure/azure-dev/releases)
2. Ekstrak ke `C:\Program Files\azd\`
3. Tambahkan ke variabel lingkungan PATH

### macOS

#### Opsi 1: Homebrew (Direkomendasikan)
```bash
brew tap azure/azd
brew install azd
```

#### Opsi 2: Skrip Instalasi
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsi 3: Instalasi Manual
```bash
# Unduh dan instal
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Opsi 1: Skrip Instalasi (Direkomendasikan)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsi 2: Pengelola Paket

**Ubuntu/Debian:**
```bash
# Tambahkan repositori paket Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Instal azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Tambahkan repositori paket Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd sudah terinstal di GitHub Codespaces. Cukup buat codespace dan mulai gunakan azd segera.

### Docker

```bash
# Jalankan azd dalam sebuah kontainer
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Buat alias untuk penggunaan yang lebih mudah
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Verifikasi Instalasi

Setelah instalasi, verifikasi bahwa azd berfungsi dengan benar:

```bash
# Periksa versi
azd version

# Lihat bantuan
azd --help

# Daftar template yang tersedia
azd template list
```

Output yang diharapkan:
```
azd version 1.5.0 (commit abc123)
```

**✅ Daftar Periksa Keberhasilan Instalasi:**
- [ ] `azd version` menampilkan nomor versi tanpa error
- [ ] `azd --help` menampilkan dokumentasi perintah
- [ ] `azd template list` menampilkan template yang tersedia
- [ ] `az account show` menampilkan langganan Azure Anda
- [ ] Anda dapat membuat direktori uji dan menjalankan `azd init` dengan sukses

**Jika semua pemeriksaan berhasil, Anda siap melanjutkan ke [Proyek Pertama Anda](first-project.md)!**

## Pengaturan Autentikasi

### Autentikasi Azure CLI (Direkomendasikan)
```bash
# Instal Azure CLI jika belum terinstal
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Masuk ke Azure
az login

# Verifikasi autentikasi
az account show
```

### Autentikasi Kode Perangkat
Jika Anda menggunakan sistem tanpa antarmuka atau mengalami masalah dengan browser:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Untuk lingkungan otomatis:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurasi

### Konfigurasi Global
```bash
# Atur langganan default
azd config set defaults.subscription <subscription-id>

# Atur lokasi default
azd config set defaults.location eastus2

# Lihat semua konfigurasi
azd config list
```

### Variabel Lingkungan
Tambahkan ke profil shell Anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasi Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurasi azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktifkan pencatatan debug
```

## Integrasi IDE

### Visual Studio Code
Instal ekstensi Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Extensions (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Instal ekstensi

Fitur:
- IntelliSense untuk azure.yaml
- Perintah terminal terintegrasi
- Penjelajahan template
- Pemantauan penerapan

### GitHub Codespaces
Buat file `.devcontainer/devcontainer.json`:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Instal plugin Azure
2. Konfigurasikan kredensial Azure
3. Gunakan terminal terintegrasi untuk perintah azd

## 🐛 Pemecahan Masalah Instalasi

### Masalah Umum

#### Izin Ditolak (Windows)
```powershell
# Jalankan PowerShell sebagai Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masalah PATH
Tambahkan azd secara manual ke PATH Anda:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Masalah Jaringan/Proxy
```bash
# Konfigurasi proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Lewati verifikasi SSL (tidak disarankan untuk produksi)
azd config set http.insecure true
```

#### Konflik Versi
```bash
# Hapus instalasi lama
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Bersihkan konfigurasi
rm -rf ~/.azd
```

### Mendapatkan Bantuan Lebih Lanjut
```bash
# Aktifkan pencatatan debug
export AZD_DEBUG=true
azd <command> --debug

# Lihat log terperinci
azd logs

# Periksa info sistem
azd info
```

## Memperbarui azd

### Pembaruan Otomatis
azd akan memberi tahu Anda saat pembaruan tersedia:
```bash
azd version --check-for-updates
```

### Pembaruan Manual

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Pertanyaan yang Sering Diajukan

<details>
<summary><strong>Apa perbedaan antara azd dan az CLI?</strong></summary>

**Azure CLI (az)**: Alat tingkat rendah untuk mengelola sumber daya Azure individu
- `az webapp create`, `az storage account create`
- Satu sumber daya dalam satu waktu
- Fokus pada pengelolaan infrastruktur

**Azure Developer CLI (azd)**: Alat tingkat tinggi untuk penerapan aplikasi lengkap
- `azd up` menerapkan seluruh aplikasi dengan semua sumber daya
- Alur kerja berbasis template
- Fokus pada produktivitas pengembang

**Anda membutuhkan keduanya**: azd menggunakan az CLI untuk autentikasi
</details>

<details>
<summary><strong>Bisakah saya menggunakan azd dengan sumber daya Azure yang sudah ada?</strong></summary>

Tentu! Anda dapat:
1. Mengimpor sumber daya yang ada ke dalam lingkungan azd
2. Merujuk sumber daya yang ada dalam template Bicep Anda
3. Menggunakan azd untuk penerapan baru bersama infrastruktur yang sudah ada

Lihat [Panduan Konfigurasi](configuration.md) untuk detailnya.
</details>

<details>
<summary><strong>Apakah azd bekerja dengan Azure Government atau Azure China?</strong></summary>

Ya, konfigurasikan cloud:
```bash
# Azure Pemerintah
az cloud set --name AzureUSGovernment
az login

# Azure Cina
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Bisakah saya menggunakan azd dalam pipeline CI/CD?</strong></summary>

Tentu saja! azd dirancang untuk otomatisasi:
- Integrasi GitHub Actions
- Dukungan Azure DevOps
- Autentikasi service principal
- Mode non-interaktif

Lihat [Panduan Penerapan](../deployment/deployment-guide.md) untuk pola CI/CD.
</details>

<details>
<summary><strong>Berapa biaya menggunakan azd?</strong></summary>

azd sendiri **sepenuhnya gratis** dan open-source. Anda hanya membayar untuk:
- Sumber daya Azure yang Anda terapkan
- Biaya konsumsi Azure (komputasi, penyimpanan, dll.)

Gunakan `azd provision --preview` untuk memperkirakan biaya sebelum penerapan.
</details>

## Langkah Selanjutnya

1. **Selesaikan autentikasi**: Pastikan Anda dapat mengakses langganan Azure Anda
2. **Coba penerapan pertama Anda**: Ikuti [Panduan Proyek Pertama](first-project.md)
3. **Jelajahi template**: Telusuri template yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE Anda**: Siapkan lingkungan pengembangan Anda

## Dukungan

Jika Anda mengalami masalah:
- [Dokumentasi Resmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Masalah](https://github.com/Azure/azure-dev/issues)
- [Diskusi Komunitas](https://github.com/Azure/azure-dev/discussions)
- [Dukungan Azure](https://azure.microsoft.com/support/)

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Dasar-Dasar AZD](azd-basics.md) 
- **➡️ Selanjutnya**: [Proyek Pertama Anda](first-project.md)
- **🚀 Bab Selanjutnya**: [Bab 2: Pengembangan Berbasis AI](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Instalasi Selesai!** Lanjutkan ke [Proyek Pertama Anda](first-project.md) untuk mulai membangun dengan azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk memberikan hasil yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa terjemahan manusia profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau interpretasi yang salah yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->