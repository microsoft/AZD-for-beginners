# Panduan Pemasangan & Persediaan

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md)
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Panduan komprehensif ini akan membimbing anda melalui pemasangan dan konfigurasi Azure Developer CLI (azd) pada sistem anda. Anda akan mempelajari pelbagai kaedah pemasangan untuk sistem operasi yang berbeza, persediaan pengesahan, dan konfigurasi awal untuk menyediakan persekitaran pembangunan anda bagi penghantaran Azure.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Berjaya memasang Azure Developer CLI pada sistem operasi anda
- Mengkonfigurasi pengesahan dengan Azure menggunakan pelbagai kaedah
- Menyediakan persekitaran pembangunan anda dengan prasyarat yang diperlukan
- Memahami pelbagai pilihan pemasangan dan bila untuk menggunakan setiap satu
- Menyelesaikan isu pemasangan dan persediaan yang biasa

## Hasil Pembelajaran

Selepas melengkapkan pelajaran ini, anda akan mampu:
- Memasang azd menggunakan kaedah yang sesuai untuk platform anda
- Mengesahkan dengan Azure menggunakan azd auth login
- Mengesahkan pemasangan anda dan menguji arahan azd asas
- Mengkonfigurasi persekitaran pembangunan anda untuk penggunaan azd yang optimum
- Menyelesaikan masalah pemasangan yang biasa secara berdikari

Panduan ini akan membantu anda memasang dan mengkonfigurasi Azure Developer CLI pada sistem anda, tanpa mengira sistem operasi atau persekitaran pembangunan anda.

## Prasyarat

Sebelum memasang azd, pastikan anda mempunyai:
- **Langganan Azure** - [Buat akaun percuma](https://azure.microsoft.com/free/)
- **Azure CLI** (pilihan) - Untuk contoh yang secara eksplisit menjalankan `az`; azd mengesahkan secara bebas
- **Git** - Untuk mengklon templat dan kawalan versi
- **Docker** (pilihan) - Untuk aplikasi berbekas

## Kaedah Pemasangan

### Windows

#### Pilihan 1: Pengurus Pakej Windows (Disyorkan)
```cmd
winget install microsoft.azd
```

#### Pilihan 2: Skrip Pemasangan PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
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

#### Pilihan 2: Skrip Pemasangan
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Pilihan 3: Pemasangan Manual
Muat turun arkib untuk seni bina macOS anda dari [aset keluaran](https://github.com/Azure/azure-dev/releases), nyahpek, dan tambahkan binari `azd` ke `PATH` anda.

### Linux

#### Pilihan 1: Skrip Pemasangan (Disyorkan)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Pilihan 2: Pengurus Pakej

**Pemasangan manual dari aset keluaran:**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Sesetengah persekitaran Codespaces dan bekas dev sudah termasuk `azd`, tetapi anda harus mengesahkannya daripada menganggapnya:

```bash
azd version
```

Jika `azd` tiada, pasang dengan skrip standard untuk persekitaran tersebut.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Bekas sementara ini tidak mengekalkan keadaan log masuk antara larian. Untuk penghantaran berulang, gunakan [persediaan bekas dev](dev-containers.md); binaan bekas juga memerlukan daemon Docker yang boleh diakses dari dalam bekas.

## ✅ Pengesahan Pemasangan

Setelah pemasangan, sahkan azd berfungsi dengan betul:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Jangkaan output:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Nombor versi sebenar akan berbeza. Semak [Keluaran Azure Developer CLI](https://github.com/Azure/azure-dev/releases) untuk versi terkini.

**✅ Senarai Semak Kejayaan Pemasangan:**
- [ ] `azd version` memaparkan nombor versi tanpa ralat
- [ ] `azd --help` memaparkan dokumentasi arahan
- [ ] `azd template list` menunjukkan templat yang tersedia
- [ ] Anda boleh membuat direktori ujian dan menjalankan `azd init` dengan berjaya

**Jika semua pemeriksaan lulus, anda sudah bersedia untuk meneruskan ke [Projek Pertama Anda](first-project.md)!**

## Persediaan Pengesahan

### Persediaan Pemula Disyorkan

Untuk aliran kerja AZD-pertama, log masuk dengan `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Gunakan log masuk Azure CLI hanya apabila anda merancang untuk menjalankan arahan `az` sendiri sepanjang kursus.

### Pengesahan Azure CLI (Pilihan)
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

### Aliran Log Masuk Mana Yang Patut Anda Gunakan?

- Gunakan `azd auth login` jika anda mengikuti laluan AZD untuk pemula dan kebanyakannya menjalankan arahan `azd`.
- Gunakan `az login` juga apabila anda mahu menjalankan arahan Azure CLI seperti `az account show` atau memeriksa sumber secara langsung.
- Jika satu latihan mengandungi kedua-dua arahan `azd` dan `az`, jalankan kedua-dua arahan log masuk sekali pada permulaan.

### Pengesahan Kod Peranti
Jika anda berada pada sistem tanpa kepala atau mengalami masalah pelayar:
```bash
azd auth login --use-device-code
```

### Perwakilan Perkhidmatan (CI/CD)
Untuk persekitaran automatik:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Sahkan Persediaan Lengkap Anda

Jika anda mahu pemeriksaan kesediaan pantas sebelum memulakan Bab 1:

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

### Pembolehubah Persekitaran
Tambah ke profil shell anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
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
- Arahan terminal bersepadu
- Penyemakan templat
- Pemantauan penghantaran

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
1. Pasang plugin Azure
2. Konfigurasi kelayakan Azure
3. Gunakan terminal bersepadu untuk arahan azd

## 🐛 Menyelesaikan Masalah Pemasangan

### Isu Biasa

#### Kebenaran Ditolak (Windows)
```powershell
# Run PowerShell as Administrator
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

### Mendapatkan Bantuan Lanjut
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Mengemas Kini azd

### Semak Kemas Kini
azd memberi amaran apabila keluaran yang lebih baru tersedia, dan anda boleh mengesahkan binaan semasa anda dengan:
```bash
azd version
```

### Kemas Kini Manual

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

## 💡 Soalan Lazim

<details>
<summary><strong>Apakah perbezaan antara azd dan az CLI?</strong></summary>

**Azure CLI (az)**: Alat tahap rendah untuk menguruskan sumber Azure individu
- `az webapp create`, `az storage account create`
- Satu sumber pada satu masa
- Fokus pengurusan infrastruktur

**Azure Developer CLI (azd)**: Alat tahap tinggi untuk penghantaran aplikasi lengkap
- `azd up` menghantar seluruh aplikasi dengan semua sumber
- Aliran kerja berasaskan templat
- Fokus produktiviti pembangun

**Mereka adalah bebas**: azd menggunakan pengesahan sendiri secara lalai. Pasang dan log masuk ke Azure CLI hanya untuk arahan `az`, atau secara eksplisit memilih masuk ke `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Bolehkah saya menggunakan azd dengan sumber Azure yang sedia ada?</strong></summary>

Ya! Anda boleh:
1. Import sumber sedia ada ke dalam persekitaran azd
2. Rujuk sumber sedia ada dalam templat Bicep anda
3. Gunakan azd untuk penghantaran baru bersama infrastruktur sedia ada

Lihat [Panduan Konfigurasi](../chapter-03-configuration/configuration.md) untuk butiran.
</details>

<details>
<summary><strong>Adakah azd berfungsi dengan Azure Government atau Azure China?</strong></summary>

Ya, konfigurasikan awan:
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Jika anda juga menggunakan Azure CLI, konfigurasikan `az cloud set --name ...` secara berasingan. Perkhidmatan templat dan ketersediaan model berbeza mengikut awan.
</details>

<details>
<summary><strong>Bolehkah saya menggunakan azd dalam saluran CI/CD?</strong></summary>

Sudah tentu! azd direka untuk automasi:
- Integrasi GitHub Actions
- Sokongan Azure DevOps
- Pengesahan perwakilan perkhidmatan
- Mod tanpa interaksi

Lihat [Panduan Penghantaran](../chapter-04-infrastructure/deployment-guide.md) untuk corak CI/CD.
</details>

<details>
<summary><strong>Berapakah kos menggunakan azd?</strong></summary>

azd sendiri adalah **sepenuhnya percuma** dan sumber terbuka. Anda hanya membayar untuk:
- Sumber Azure yang anda hantar
- Kos penggunaan Azure (pengiraan, storan, dll.)

Gunakan `azd provision --preview` untuk memeriksa sumber yang dicadangkan, kemudian anggarkan kos mereka dengan [Pengira Harga Azure](https://azure.microsoft.com/pricing/calculator/). Pratonton tidak mengira harga.
</details>

## Langkah Seterusnya

1. **Lengkapkan pengesahan**: Pastikan anda boleh mengakses langganan Azure anda
2. **Cuba penghantaran pertama anda**: Ikuti [Panduan Projek Pertama](first-project.md)
3. **Terokai templat**: Semak templat yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE anda**: Sediakan persekitaran pembangunan anda

## Sokongan

Jika anda menghadapi masalah:
- [Dokumentasi Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Isu](https://github.com/Azure/azure-dev/issues)
- [Perbincangan Komuniti](https://github.com/Azure/azure-dev/discussions)
- [Sokongan Azure](https://azure.microsoft.com/support/)
- [**Kemahiran Ejen Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Dapatkan panduan arahan Azure terus dalam editor anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md) 
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Pemasangan Selesai!** Teruskan ke [Projek Pertama Anda](first-project.md) untuk mula membina dengan azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->