# Panduan Pemasangan & Persediaan

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md)
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Panduan menyeluruh ini akan membimbing anda melalui pemasangan dan konfigurasi Azure Developer CLI (azd) pada sistem anda. Anda akan belajar pelbagai kaedah pemasangan untuk sistem operasi yang berbeza, penyediaan pengesahan, dan konfigurasi awal untuk menyediakan persekitaran pembangunan anda bagi penyebaran Azure.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Berjaya memasang Azure Developer CLI pada sistem operasi anda
- Konfigurasikan pengesahan dengan Azure menggunakan pelbagai kaedah
- Sediakan persekitaran pembangunan anda dengan keperluan asas
- Memahami pilihan pemasangan yang berbeza dan bila menggunakan setiap satunya
- Menyelesaikan masalah biasa pemasangan dan penetapan

## Hasil Pembelajaran

Selepas melengkapkan pelajaran ini, anda akan dapat:
- Memasang azd menggunakan kaedah yang sesuai untuk platform anda
- Mengautentikasi dengan Azure menggunakan azd auth login
- Mengesahkan pemasangan anda dan menguji arahan azd asas
- Mengkonfigurasikan persekitaran pembangunan anda untuk penggunaan azd yang optimum
- Menyelesaikan masalah pemasangan biasa secara berdikari

Panduan ini akan membantu anda memasang dan mengkonfigurasikan Azure Developer CLI pada sistem anda, tanpa mengira sistem operasi atau persekitaran pembangunan anda.

## Prasyarat

Sebelum memasang azd, pastikan anda mempunyai:
- **Langganan Azure** - [Buat akaun percuma](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk pengesahan dan pengurusan sumber
- **Git** - Untuk klon templat dan kawalan versi
- **Docker** (pilihan) - Untuk aplikasi berasaskan kontena

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
1. Muat turun keluaran terkini dari [GitHub](https://github.com/Azure/azure-dev/releases)
2. Nyahpek ke `C:\Program Files\azd\`
3. Tambah ke pembolehubah persekitaran PATH

### macOS

#### Pilihan 1: Homebrew (Disyorkan)
```bash
brew tap azure/azd
brew install azd
```

#### Pilihan 2: Skrip Pasang
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Pilihan 3: Pemasangan Manual
```bash
# Muat turun dan pasang
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Pilihan 1: Skrip Pasang (Disyorkan)
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

azd telah dipasang terlebih dahulu di GitHub Codespaces. Cipta ruang kod dan mula gunakan azd dengan segera.

### Docker

```bash
# Jalankan azd dalam bekas
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Cipta alias untuk penggunaan lebih mudah
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

Output dijangka:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Nombor versi sebenar akan berbeza. Semak [Keluaran Azure Developer CLI](https://github.com/Azure/azure-dev/releases) untuk versi terkini.

**✅ Senarai Semak Kejayaan Pemasangan:**
- [ ] `azd version` memaparkan nombor versi tanpa ralat
- [ ] `azd --help` memaparkan dokumentasi arahan
- [ ] `azd template list` memaparkan templat yang tersedia
- [ ] `az account show` memaparkan langganan Azure anda
- [ ] Anda boleh mencipta direktori ujian dan menjalankan `azd init` dengan jayanya

**Jika semua pemeriksaan lulus, anda sudah bersedia untuk teruskan ke [Projek Pertama Anda](first-project.md)!**

## Penyediaan Pengesahan

### Pengesahan Azure CLI (Disyorkan)
```bash
# Pasang Azure CLI jika belum dipasang
# Windows: winget pasang Microsoft.AzureCLI
# macOS: brew pasang azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Log masuk ke Azure
az login

# Sahkan pengesahan
az account show
```

### Pengesahan Kod Peranti
Jika anda menggunakan sistem tanpa kepala atau menghadapi masalah pelayar:
```bash
az login --use-device-code
```

### Principal Perkhidmatan (CI/CD)
Untuk persekitaran automasi:
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
export AZD_DEBUG=true  # Dayakan log debug
```

## Integrasi IDE

### Visual Studio Code
Pasang sambungan Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Sambungan (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Pasang sambungan

Ciri-ciri:
- IntelliSense untuk azure.yaml
- Arahan terminal terintegrasi
- Semakan templat
- Pemantauan penyebaran

### GitHub Codespaces
Cipta `.devcontainer/devcontainer.json`:
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

## 🐛 Penyelesaian Masalah Pemasangan

### Masalah Biasa

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

#### Masalah Rangkaian/Proksi
```bash
# Konfigurasikan proksi
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Langkau pengesahan SSL (tidak disarankan untuk produksi)
azd config set http.insecure true
```

#### Konflik Versi
```bash
# Alih keluar pemasangan lama
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Bersihkan konfigurasi
rm -rf ~/.azd
```

### Mendapatkan Bantuan Lanjut
```bash
# Dayakan log debug
export AZD_DEBUG=true
azd <command> --debug

# Lihat konfigurasi semasa
azd config list

# Lihat status penyebaran semasa
azd show
```

## Mengemas kini azd

### Kemas Kini Automatik
azd akan memberitahu anda apabila kemas kini tersedia:
```bash
azd version --check-for-updates
```

### Kemas Kini Manual

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
<summary><strong>Apa bezanya azd dengan az CLI?</strong></summary>

**Azure CLI (az)**: Alat aras rendah untuk mengurus sumber Azure individu
- `az webapp create`, `az storage account create`
- Satu sumber pada satu masa
- Fokus pengurusan infrastruktur

**Azure Developer CLI (azd)**: Alat aras tinggi untuk penyebaran aplikasi lengkap
- `azd up` menyebarkan seluruh aplikasi dengan semua sumber
- Aliran kerja berasaskan templat
- Fokus produktiviti pembangun

**Anda perlukan kedua-duanya**: azd menggunakan az CLI untuk pengesahan
</details>

<details>
<summary><strong>Bolehkah saya menggunakan azd dengan sumber Azure sedia ada?</strong></summary>

Boleh! Anda boleh:
1. Import sumber sedia ada ke dalam persekitaran azd
2. Rujuk sumber sedia ada dalam templat Bicep anda
3. Gunakan azd untuk penyebaran baru bersama-sama dengan infrastruktur sedia ada

Rujuk [Panduan Konfigurasi](configuration.md) untuk butiran.
</details>

<details>
<summary><strong>Adakah azd berfungsi dengan Azure Government atau Azure China?</strong></summary>

Ya, konfigurasikan awan:
```bash
# Kerajaan Azure
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
- Pengesahan principal perkhidmatan
- Mod tanpa interaksi

Lihat [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) untuk corak CI/CD.
</details>

<details>
<summary><strong>Berapa kos menggunakan azd?</strong></summary>

azd sendiri adalah **sepenuhnya percuma** dan sumber terbuka. Anda hanya membayar untuk:
- Sumber Azure yang anda sebarkan
- Kos penggunaan Azure (pengkomputeran, penyimpanan, dsb.)

Gunakan `azd provision --preview` untuk menganggarkan kos sebelum penyebaran.
</details>

## Langkah Seterusnya

1. **Lengkapkan pengesahan**: Pastikan anda boleh mengakses langganan Azure anda
2. **Cuba penyebaran pertama anda**: Ikuti [Panduan Projek Pertama](first-project.md)
3. **Terokai templat**: Semak templat yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE anda**: Sediakan persekitaran pembangunan anda

## Sokongan

Jika anda menghadapi masalah:
- [Dokumentasi Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Isu](https://github.com/Azure/azure-dev/issues)
- [Perbincangan Komuniti](https://github.com/Azure/azure-dev/discussions)
- [Sokongan Azure](https://azure.microsoft.com/support/)
- [**Kemahiran Ejen Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Dapatkan panduan arahan Azure terus dalam penyunting anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Mula Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md) 
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Pemasangan Selesai!** Teruskan ke [Projek Pertama Anda](first-project.md) untuk mula membina dengan azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, harap maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->