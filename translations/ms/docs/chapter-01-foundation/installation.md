# Panduan Pemasangan & Persediaan

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md)
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan Berfokus AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Panduan menyeluruh ini akan memandu anda memasang dan mengkonfigurasi Azure Developer CLI (azd) pada sistem anda. Anda akan mempelajari pelbagai kaedah pemasangan untuk sistem operasi yang berbeza, penyediaan pengesahan, dan konfigurasi awal untuk menyediakan persekitaran pembangunan anda bagi penghantaran ke Azure.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Berjaya memasang Azure Developer CLI pada sistem operasi anda
- Mengkonfigurasi pengesahan dengan Azure menggunakan pelbagai kaedah
- Menyediakan persekitaran pembangunan anda dengan prasyarat yang diperlukan
- Memahami pilihan pemasangan yang berbeza dan bila menggunakan setiap satu
- Menyelesaikan masalah pemasangan dan persediaan yang biasa

## Hasil Pembelajaran

Selepas menyelesaikan pelajaran ini, anda akan dapat:
- Memasang azd menggunakan kaedah yang sesuai untuk platform anda
- Mengesahkan identiti dengan Azure menggunakan azd auth login
- Mengesahkan pemasangan anda dan menguji arahan azd asas
- Mengkonfigurasi persekitaran pembangunan anda untuk penggunaan azd yang optimum
- Menyelesaikan masalah pemasangan biasa sendiri

Panduan ini akan membantu anda memasang dan mengkonfigurasi Azure Developer CLI pada sistem anda, tanpa mengira sistem operasi atau persekitaran pembangunan anda.

## Prasyarat

Sebelum memasang azd, pastikan anda mempunyai:
- **Langganan Azure** - [Buka akaun percuma](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk pengesahan dan pengurusan sumber
- **Git** - Untuk mengklon templat dan kawalan versi
- **Docker** (pilihan) - Untuk aplikasi berkontena

## Kaedah Pemasangan

### Windows

#### Pilihan 1: PowerShell (Disyorkan)
```powershell
# Jalankan sebagai Pentadbir atau dengan keistimewaan yang ditinggikan
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Pilihan 2: Pengurus Pakej Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Pilihan 3: Chocolatey
```cmd
choco install azd
```

#### Pilihan 4: Pemasangan Manual
1. Muat turun pelepasan terkini dari [GitHub](https://github.com/Azure/azure-dev/releases)
2. Ekstrak ke `C:\Program Files\azd\`
3. Tambah ke pembolehubah persekitaran PATH

### macOS

#### Pilihan 1: Homebrew (Disyorkan)
```bash
brew tap azure/azd
brew install azd
```

#### Pilihan 2: Skrip Pemasangan
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Pilihan 3: Pemasangan Manual
```bash
# Muat turun dan pasang
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Pilihan 1: Skrip Pemasangan (Disyorkan)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Pilihan 2: Pengurus Pakej

**Ubuntu/Debian:**
```bash
# Tambah repositori pakej Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Pasang azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Tambah repositori pakej Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd dipasang terlebih dahulu dalam GitHub Codespaces. Cipta codespace dan mula menggunakan azd dengan serta-merta.

### Docker

```bash
# Jalankan azd dalam kontena
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Cipta alias untuk penggunaan yang lebih mudah
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Sahkan Pemasangan

Selepas pemasangan, sahkan azd berfungsi dengan betul:

```bash
# Semak versi
azd version

# Lihat bantuan
azd --help

# Senaraikan templat yang tersedia
azd template list
```

Output yang dijangka:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Nombor versi sebenar mungkin berbeza. Semak [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) untuk versi terkini.

**✅ Senarai Semak Kejayaan Pemasangan:**
- [ ] `azd version` menunjukkan nombor versi tanpa ralat
- [ ] `azd --help` memaparkan dokumentasi arahan
- [ ] `azd template list` memaparkan templat yang tersedia
- [ ] `az account show` memaparkan langganan Azure anda
- [ ] Anda boleh membuat direktori ujian dan menjalankan `azd init` dengan jayanya

**Jika semua semakan lulus, anda sedia untuk meneruskan ke [Projek Pertama Anda](first-project.md)!**

## Penyediaan Pengesahan

### Pengesahan Azure CLI (Disyorkan)
```bash
# Pasang Azure CLI jika belum dipasang
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Log masuk ke Azure
az login

# Semak pengesahan
az account show
```

### Pengesahan Kod Peranti
Jika anda berada pada sistem tanpa antaramuka grafik (headless) atau mengalami masalah pelayar:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
Untuk persekitaran automatik:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Konfigurasi

### Konfigurasi Global
```bash
# Tetapkan langganan lalai
azd config set defaults.subscription <subscription-id>

# Tetapkan lokasi lalai
azd config set defaults.location eastus2

# Lihat semua konfigurasi
azd config list
```

### Pembolehubah Persekitaran
Tambah ke profil shell anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasi Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurasi azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktifkan log debug
```

## Integrasi IDE

### Visual Studio Code
Pasang peluasan Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Sambungan (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Pasang peluasan

Ciri-ciri:
- IntelliSense untuk azure.yaml
- Arahan terminal terintegrasi
- Penyemakan templat
- Pemantauan penghantaran

### GitHub Codespaces
Cipta sebuah `.devcontainer/devcontainer.json`:
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
1. Pasang plugin Azure
2. Konfigurasikan kelayakan Azure
3. Gunakan terminal terintegrasi untuk arahan azd

## 🐛 Menyelesaikan Masalah Pemasangan

### Isu Biasa

#### Kebenaran Ditolak (Windows)
```powershell
# Jalankan PowerShell sebagai Pentadbir
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Isu PATH
Tambah azd ke PATH anda secara manual:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Isu Rangkaian/Proksi
```bash
# Konfigurasikan proksi
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Langkau pengesahan SSL (tidak disyorkan untuk pengeluaran)
azd config set http.insecure true
```

#### Konflik Versi
```bash
# Buang pemasangan lama
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Bersihkan konfigurasi
rm -rf ~/.azd
```

### Mendapatkan Bantuan Lanjut
```bash
# Dayakan pencatatan debug
export AZD_DEBUG=true
azd <command> --debug

# Lihat konfigurasi semasa
azd config list

# Lihat status penyebaran semasa
azd show
```

## Mengemas kini azd

### Kemas kini Automatik
azd akan memberitahu anda apabila kemas kini tersedia:
```bash
azd version --check-for-updates
```

### Kemas kini Manual

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

## 💡 Soalan Lazim

<details>
<summary><strong>Apakah perbezaan antara azd dan az CLI?</strong></summary>

**Azure CLI (az)**: Alat tahap rendah untuk mengurus sumber Azure individu
- `az webapp create`, `az storage account create`
- Satu sumber pada satu masa
- Fokus pada pengurusan infrastruktur

**Azure Developer CLI (azd)**: Alat peringkat tinggi untuk penghantaran aplikasi lengkap
- `azd up` menerapkan keseluruhan aplikasi dengan semua sumber
- Aliran kerja berasaskan templat
- Fokus pada produktiviti pembangun

**Anda memerlukan kedua-duanya**: azd menggunakan az CLI untuk pengesahan
</details>

<details>
<summary><strong>Bolehkah saya menggunakan azd dengan sumber Azure sedia ada?</strong></summary>

Ya! Anda boleh:
1. Mengimport sumber sedia ada ke dalam persekitaran azd
2. Merujuk sumber sedia ada dalam templat Bicep anda
3. Menggunakan azd untuk penghantaran baru bersama infrastruktur sedia ada

Lihat [Panduan Konfigurasi](configuration.md) untuk butiran.
</details>

<details>
<summary><strong>Adakah azd berfungsi dengan Azure Government atau Azure China?</strong></summary>

Ya, konfigurasikan awan:
```bash
# Azure Kerajaan
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Bolehkah saya menggunakan azd dalam saluran CI/CD?</strong></summary>

Sudah tentu! azd direka untuk automasi:
- Integrasi GitHub Actions
- Sokongan Azure DevOps
- Pengesahan service principal
- Mod tanpa interaksi

Lihat [Panduan Penghantaran](../chapter-04-infrastructure/deployment-guide.md) untuk corak CI/CD.
</details>

<details>
<summary><strong>Berapa kos menggunakan azd?</strong></summary>

azd sendiri adalah **sepenuhnya percuma** dan sumber terbuka. Anda hanya membayar untuk:
- Sumber Azure yang anda terapkan
- Kos penggunaan Azure (pengkomputeran, storan, dll.)

Gunakan `azd provision --preview` untuk menganggarkan kos sebelum penghantaran.
</details>

## Langkah Seterusnya

1. **Selesaikan pengesahan**: Pastikan anda dapat mengakses langganan Azure anda
2. **Cuba penghantaran pertama anda**: Ikuti [Panduan Projek Pertama](first-project.md)
3. **Terokai templat**: Semak templat yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE anda**: Sediakan persekitaran pembangunan anda

## Sokongan

Jika anda menghadapi masalah:
- [Dokumentasi Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Lapor Isu](https://github.com/Azure/azure-dev/issues)
- [Perbincangan Komuniti](https://github.com/Azure/azure-dev/discussions)
- [Sokongan Azure](https://azure.microsoft.com/support/)

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md) 
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan Berfokus AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Pemasangan Selesai!** Teruskan ke [Projek Pertama Anda](first-project.md) untuk mula membina dengan azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang muktamad. Untuk maklumat penting, disyorkan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab ke atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->