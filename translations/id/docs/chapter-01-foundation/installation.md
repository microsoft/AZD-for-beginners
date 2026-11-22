# Panduan Instalasi & Pengaturan

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Dasar-dasar AZD](azd-basics.md)
- **➡️ Berikutnya**: [Proyek Pertamamu](first-project.md)
- **🚀 Bab Berikutnya**: [Bab 2: Pengembangan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pendahuluan

Panduan komprehensif ini akan memandu Anda dalam menginstal dan mengonfigurasi Azure Developer CLI (azd) di sistem Anda. Anda akan mempelajari berbagai metode instalasi untuk sistem operasi yang berbeda, pengaturan autentikasi, dan konfigurasi awal untuk mempersiapkan lingkungan pengembangan Anda untuk penyebaran Azure.

## Tujuan Pembelajaran

Pada akhir pelajaran ini, Anda akan:
- Berhasil menginstal Azure Developer CLI di sistem operasi Anda
- Mengonfigurasi autentikasi dengan Azure menggunakan berbagai metode
- Menyiapkan lingkungan pengembangan dengan prasyarat yang diperlukan
- Memahami opsi instalasi yang berbeda dan kapan menggunakannya
- Memecahkan masalah umum instalasi dan pengaturan

## Hasil Pembelajaran

Setelah menyelesaikan pelajaran ini, Anda akan mampu:
- Menginstal azd menggunakan metode yang sesuai untuk platform Anda
- Autentikasi dengan Azure menggunakan azd auth login
- Memverifikasi instalasi Anda dan menguji perintah dasar azd
- Mengonfigurasi lingkungan pengembangan untuk penggunaan azd yang optimal
- Menyelesaikan masalah instalasi umum secara mandiri

Panduan ini akan membantu Anda menginstal dan mengonfigurasi Azure Developer CLI di sistem Anda, terlepas dari sistem operasi atau lingkungan pengembangan Anda.

## Prasyarat

Sebelum menginstal azd, pastikan Anda memiliki:
- **Langganan Azure** - [Buat akun gratis](https://azure.microsoft.com/free/)
- **Azure CLI** (opsional) - Untuk contoh yang secara eksplisit menjalankan `az`; azd melakukan autentikasi secara mandiri
- **Git** - Untuk mengkloning templat dan kontrol versi
- **Docker** (opsional) - Untuk aplikasi berbasis container

**Jalur Foundry GA Bab 2:** Gunakan AZD **1.37.0 atau lebih baru**, instal bundel dengan `azd ext install microsoft.foundry`, dan gunakan Python **3.13+** serta **uv** saat ini untuk contoh agen-host. Mode penyebaran kodenya membangun secara remote, jadi tidak memerlukan build Docker lokal. Izin Foundry, ketersediaan model regional, dan kuota tetap diperlukan; lihat [pengaturan agen-host](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

## Metode Instalasi

### Windows

#### Opsi 1: Windows Package Manager (Direkomendasikan)
```cmd
winget install microsoft.azd
```

#### Opsi 2: Skrip Instalasi PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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
Unduh arsip untuk arsitektur macOS Anda dari [aset rilis](https://github.com/Azure/azure-dev/releases), ekstrak, dan tambahkan binary `azd` ke `PATH` Anda.

### Linux

#### Opsi 1: Skrip Instalasi (Direkomendasikan)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Opsi 2: Manajer Paket

**Instalasi manual dari aset rilis:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Beberapa Codespaces dan lingkungan kontainer pengembangan sudah menyertakan `azd`, tetapi Anda harus memverifikasi daripada menganggapnya sudah ada:

```bash
azd version
```

Jika `azd` hilang, instal menggunakan skrip standar untuk lingkungan tersebut.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Kontainer ephemeral ini tidak mempertahankan status login antar jalankan. Untuk penyebaran berulang, gunakan [pengaturan kontainer pengembangan](dev-containers.md); membangun kontainer juga memerlukan daemon Docker yang dapat diakses dari dalam kontainer.

## ✅ Verifikasi Instalasi

Setelah instalasi, verifikasi azd bekerja dengan benar:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Output yang diharapkan:
```
azd version 1.x.x (commit xxxxxx)
```

**Catatan**: Nomor versi aktual akan bervariasi. Periksa [rilis Azure Developer CLI](https://github.com/Azure/azure-dev/releases) untuk versi terbaru.

**✅ Daftar Periksa Keberhasilan Instalasi:**
- [ ] `azd version` menunjukkan nomor versi tanpa error
- [ ] `azd --help` menampilkan dokumentasi perintah
- [ ] `azd template list` menunjukkan templat yang tersedia
- [ ] Anda dapat membuat direktori uji dan menjalankan `azd init` dengan sukses

**Jika semua pemeriksaan berhasil, Anda siap melanjutkan ke [Proyek Pertamamu](first-project.md)!**

## Pengaturan Autentikasi

### Pengaturan Pemula yang Direkomendasikan

Untuk alur kerja AZD-pertama, masuk dengan `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Gunakan masuk Azure CLI hanya jika Anda berencana menjalankan perintah `az` sendiri selama kursus.

### Autentikasi Azure CLI (Opsional)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Alur Masuk Mana yang Harus Anda Gunakan?

- Gunakan `azd auth login` jika Anda mengikuti jalur AZD pemula dan terutama menjalankan perintah `azd`.
- Gunakan juga `az login` saat ingin menjalankan perintah Azure CLI seperti `az account show` atau memeriksa sumber daya secara langsung.
- Jika latihan mencakup kedua perintah `azd` dan `az`, jalankan kedua perintah masuk sekali di awal.

### Autentikasi Kode Perangkat
Jika Anda berada di sistem tanpa antarmuka atau mengalami masalah browser:
```bash
azd auth login --use-device-code
```

### Principal Layanan (CI/CD)
Untuk lingkungan otomatis:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validasi Pengaturan Lengkap Anda

Jika Anda ingin pemeriksaan kesiapan cepat sebelum mulai Bab 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## Konfigurasi

### Konfigurasi Global
```bash
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Variabel Lingkungan
Tambahkan ke profil shell Anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Integrasi IDE

### Visual Studio Code
Instal ekstensi Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Ekstensi (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Instal ekstensi

Fitur:
- IntelliSense untuk azure.yaml
- Perintah terminal terintegrasi
- Penelusuran templat
- Pemantauan penyebaran

### GitHub Codespaces
Buat `.devcontainer/devcontainer.json`:
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

## 🐛 Memecahkan Masalah Instalasi

### Masalah Umum

#### Izin Ditolak (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masalah PATH
Tambahkan azd ke PATH Anda secara manual:

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
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Konflik Versi
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Mendapatkan Bantuan Lebih Lanjut
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Memperbarui azd

### Pemeriksaan Pembaruan
azd memberi peringatan saat rilis baru tersedia, dan Anda dapat memeriksa build Anda saat ini dengan:
```bash
azd version
```

### Pembaruan Manual

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
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

**Azure CLI (az)**: Alat tingkat rendah untuk mengelola sumber daya Azure individual
- `az webapp create`, `az storage account create`
- Satu sumber daya sekaligus
- Fokus pada manajemen infrastruktur

**Azure Developer CLI (azd)**: Alat tingkat tinggi untuk penyebaran aplikasi lengkap
- `azd up` menyebarkan seluruh aplikasi dengan semua sumber daya
- Alur kerja berbasis templat
- Fokus pada produktivitas pengembang

**Mereka independen**: azd menggunakan autentikasi sendiri secara default. Instal dan masuk ke Azure CLI hanya untuk perintah `az`, atau secara eksplisit pilih menggunakan `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Bisakah saya menggunakan azd dengan sumber daya Azure yang sudah ada?</strong></summary>

Ya! Anda dapat:
1. Mengimpor sumber daya yang sudah ada ke lingkungan azd
2. Mereferensikan sumber daya yang sudah ada dalam templat Bicep Anda
3. Menggunakan azd untuk penyebaran baru berdampingan dengan infrastruktur yang sudah ada

Lihat [Panduan Konfigurasi](../chapter-03-configuration/configuration.md) untuk detailnya.
</details>

<details>
<summary><strong>Apakah azd bekerja dengan Azure Government atau Azure China?</strong></summary>

Ya, konfigurasikan cloud:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Jika Anda juga menggunakan Azure CLI, konfigurasikan `az cloud set --name ...` secara terpisah. Layanan templat dan ketersediaan model bervariasi menurut cloud.
</details>

<details>
<summary><strong>Bisakah saya menggunakan azd dalam pipeline CI/CD?</strong></summary>

Tentu! azd dirancang untuk otomatisasi:
- Integrasi GitHub Actions
- Dukungan Azure DevOps
- Autentikasi principal layanan
- Mode non-interaktif

Lihat [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) untuk pola CI/CD.
</details>

<details>
<summary><strong>Berapa biaya penggunaan azd?</strong></summary>

azd sendiri **sepenuhnya gratis** dan open-source. Anda hanya membayar untuk:
- Sumber daya Azure yang Anda deploy
- Biaya konsumsi Azure (komputasi, penyimpanan, dll.)

Gunakan `azd provision --preview` untuk memeriksa sumber daya yang diusulkan, lalu perkirakan biayanya dengan [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/). Pratinjau tidak menghitung harga.
</details>

## Langkah Selanjutnya

1. **Selesaikan autentikasi**: Pastikan Anda dapat mengakses langganan Azure Anda
2. **Coba penyebaran pertama**: Ikuti [Panduan Proyek Pertama](first-project.md)
3. **Jelajahi templat**: Telusuri templat yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE Anda**: Siapkan lingkungan pengembangan Anda

## Dukungan

Jika Anda mengalami masalah:
- [Dokumentasi Resmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Masalah](https://github.com/Azure/azure-dev/issues)
- [Diskusi Komunitas](https://github.com/Azure/azure-dev/discussions)
- [Dukungan Azure](https://azure.microsoft.com/support/)
- [**Keahlian Agen Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Dapatkan panduan perintah Azure langsung di editor Anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 1 - Dasar & Mulai Cepat
- **⬅️ Sebelumnya**: [Dasar-dasar AZD](azd-basics.md) 
- **➡️ Berikutnya**: [Proyek Pertamamu](first-project.md)
- **🚀 Bab Berikutnya**: [Bab 2: Pengembangan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Instalasi Selesai!** Lanjutkan ke [Proyek Pertamamu](first-project.md) untuk mulai membangun dengan azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->