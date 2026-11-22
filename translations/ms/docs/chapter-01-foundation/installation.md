# Panduan Pemasangan & Persediaan

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md)
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Panduan komprehensif ini akan membimbing anda langkah demi langkah memasang dan mengkonfigurasi Azure Developer CLI (azd) pada sistem anda. Anda akan belajar pelbagai kaedah pemasangan untuk sistem operasi yang berbeza, persediaan pengesahan, dan konfigurasi awal untuk menyediakan persekitaran pembangunan anda bagi penempatan Azure.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Berjaya memasang Azure Developer CLI pada sistem operasi anda
- Mengkonfigurasi pengesahan dengan Azure menggunakan pelbagai kaedah
- Menyediakan persekitaran pembangunan anda dengan prasyarat yang diperlukan
- Memahami pilihan pemasangan yang berbeza dan bila untuk menggunakannya
- Menyelesaikan masalah pemasangan dan persediaan yang biasa

## Hasil Pembelajaran

Setelah melengkapkan pelajaran ini, anda akan mampu:
- Memasang azd menggunakan kaedah yang sesuai untuk platform anda
- Melakukan pengesahan dengan Azure menggunakan azd auth login
- Mengesahkan pemasangan anda dan menguji arahan asas azd
- Mengkonfigurasi persekitaran pembangunan anda untuk penggunaan azd yang optimum
- Menyelesaikan masalah pemasangan yang biasa secara berdikari

Panduan ini akan membantu anda memasang dan mengkonfigurasi Azure Developer CLI pada sistem anda, tanpa mengira sistem operasi atau persekitaran pembangunan anda.

## Prasyarat

Sebelum memasang azd, pastikan anda mempunyai:
- **Langganan Azure** - [Cipta akaun percuma](https://azure.microsoft.com/free/)
- **Azure CLI** (pilihan) - Untuk contoh yang secara eksplisit menjalankan `az`; azd mengesahkan secara berdikari
- **Git** - Untuk menyalin templat dan kawalan versi
- **Docker** (pilihan) - Untuk aplikasi berasaskan kontena

**Jalan GA Foundry Bab 2:** Gunakan AZD **1.37.0 atau lebih baru**, pasang bundel dengan `azd ext install microsoft.foundry`, dan gunakan Python **3.13+** serta **uv** terkini untuk contoh hosted-agent. Mod penempatan kodnya membina secara jauh, jadi ia tidak memerlukan binaan Docker tempatan. Kebenaran Foundry, ketersediaan model serantau, dan kuota masih diperlukan; lihat [persediaan hosted-agent](../chapter-02-ai-development/microsoft-foundry-integration.md#1-prepare-and-initialize).

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
Muat turun arkib untuk seni bina macOS anda dari [aset keluaran](https://github.com/Azure/azure-dev/releases), ekstrak, dan tambah binari `azd` ke `PATH` anda.

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

Sesetengah Codespaces dan persekitaran kontena pembangunan sudah menyertakan `azd`, tetapi anda harus mengesahkannya dan bukan menganggapnya:

```bash
azd version
```

Jika `azd` tidak hadir, pasangkan ia dengan skrip standard untuk persekitaran tersebut.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Kontena sementara ini tidak menyimpan status log masuk antara sesi. Untuk penempatan berulang, gunakan [persediaan kontena pembangunan](dev-containers.md); binaan kontena juga memerlukan docker daemon yang diakses dari dalam kontena.

## ✅ Sahkan Pemasangan

Selepas pemasangan, sahkan azd berfungsi dengan betul:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Jangkaan keluaran:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Nombor versi sebenar mungkin berbeza. Semak [keluaran Azure Developer CLI](https://github.com/Azure/azure-dev/releases) untuk versi terkini.

**✅ Senarai Semak Kejayaan Pemasangan:**
- [ ] `azd version` memaparkan nombor versi tanpa ralat
- [ ] `azd --help` memaparkan dokumentasi arahan
- [ ] `azd template list` menunjukkan templat yang tersedia
- [ ] Anda boleh mencipta direktori ujian dan menjalankan `azd init` dengan jayanya

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

### Aliran Log Masuk Yang Mana Yang Perlu Anda Gunakan?

- Gunakan `azd auth login` jika anda mengikuti laluan AZD pemula dan kebanyakan menjalankan arahan `azd`.
- Gunakan `az login` juga apabila anda ingin menjalankan arahan Azure CLI seperti `az account show` atau memeriksa sumber secara langsung.
- Jika sesuatu latihan termasuk kedua-dua arahan `azd` dan `az`, jalankan kedua-dua arahan log masuk sekali pada permulaan.

### Pengesahan Kod Peranti
Jika anda menggunakan sistem tanpa antara muka atau menghadapi masalah pelayar:
```bash
azd auth login --use-device-code
```

### Prinsipal Perkhidmatan (CI/CD)
Untuk persekitaran automatik:
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Sahkan Persediaan Lengkap Anda

Jika anda mahu pemeriksaan kesiapsiagaan cepat sebelum memulakan Bab 1:

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
Pasang peluasan Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Extensions (Ctrl+Shift+X)
3. Cari "Azure Developer CLI"
4. Pasang peluasan

Ciri-ciri:
- IntelliSense untuk azure.yaml
- Arahan terminal bersepadu
- Penjelajahan templat
- Pemantauan penempatan

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
2. Konfigurasi kelayakan Azure
3. Gunakan terminal bersepadu untuk arahan azd

## 🐛 Penyelesaian Masalah Pemasangan

### Masalah Biasa

#### Kebenaran Ditolak (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Masalah PATH
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
azd akan memberi amaran apabila ada keluaran baru, dan anda boleh mengesahkan binaan semasa anda dengan:
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
<summary><strong>Apa perbezaan antara azd dan az CLI?</strong></summary>

**Azure CLI (az)**: Alat tahap rendah untuk mengurus sumber Azure secara individu
- `az webapp create`, `az storage account create`
- Satu sumber pada satu masa
- Fokus pada pengurusan infrastruktur

**Azure Developer CLI (azd)**: Alat tahap tinggi untuk penempatan aplikasi lengkap
- `azd up` melaksanakan penempatan seluruh aplikasi dengan semua sumber
- Aliran kerja berasaskan templat
- Fokus pada produktiviti pembangun

**Mereka bebas**: azd menggunakan pengesahan sendiri secara lalai. Pasang dan log masuk ke Azure CLI hanya untuk arahan `az`, atau secara eksplisit memilih `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Bolehkah saya gunakan azd dengan sumber Azure sedia ada?</strong></summary>

Ya! Anda boleh:
1. Mengimport sumber sedia ada ke dalam persekitaran azd
2. Merujuk kepada sumber sedia ada dalam templat Bicep anda
3. Gunakan azd untuk penempatan baru di samping infrastruktur sedia ada

Lihat [Panduan Konfigurasi](../chapter-03-configuration/configuration.md) untuk maklumat lanjut.
</details>

<details>
<summary><strong>Adakah azd berfungsi dengan Azure Government atau Azure China?</strong></summary>

Ya, konfigurasi awan:
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
- Pengesahan prinsip perkhidmatan
- Mod bukan interaktif

Lihat [Panduan Penempatan](../chapter-04-infrastructure/deployment-guide.md) untuk corak CI/CD.
</details>

<details>
<summary><strong>Berapakah kos menggunakan azd?</strong></summary>

azd itu sendiri adalah **percuma sepenuhnya** dan sumber terbuka. Anda hanya membayar untuk:
- Sumber Azure yang anda tempatkan
- Kos penggunaan Azure (pengkomputeran, penyimpanan, dsb.)

Gunakan `azd provision --preview` untuk memeriksa sumber yang dicadangkan, kemudian anggarkan kosnya dengan [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/). Pratonton tidak mengira harga.
</details>

## Langkah Seterusnya

1. **Lengkapkan pengesahan**: Pastikan anda boleh akses langganan Azure anda
2. **Cuba penempatan pertama anda**: Ikuti [Panduan Projek Pertama](first-project.md)
3. **Terokai templat**: Layari templat tersedia dengan `azd template list`
4. **Konfigurasikan IDE anda**: Sediakan persekitaran pembangunan anda

## Sokongan

Jika anda menghadapi masalah:
- [Dokumentasi Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Lapor Masalah](https://github.com/Azure/azure-dev/issues)
- [Perbincangan Komuniti](https://github.com/Azure/azure-dev/discussions)
- [Sokongan Azure](https://azure.microsoft.com/support/)
- [**Kemahiran Ejen Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Dapatkan panduan arahan Azure terus dalam penyunting anda dengan `npx skills add microsoft/github-copilot-for-azure`

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