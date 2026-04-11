# Panduan Pemasangan & Penetapan

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md)
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Pengenalan

Panduan menyeluruh ini akan membimbing anda melalui pemasangan dan konfigurasi Azure Developer CLI (azd) pada sistem anda. Anda akan mempelajari pelbagai kaedah pemasangan untuk sistem pengoperasian berbeza, penetapan pengesahan, dan konfigurasi awal untuk menyediakan persekitaran pembangunan anda bagi penyebaran Azure.

## Matlamat Pembelajaran

Menjelang akhir pelajaran ini, anda akan:
- Berjaya memasang Azure Developer CLI pada sistem pengoperasian anda
- Mengkonfigurasi pengesahan dengan Azure menggunakan pelbagai kaedah
- Menyediakan persekitaran pembangunan anda dengan prasyarat yang perlu
- Memahami pilihan pemasangan berbeza dan bila untuk menggunakan setiap satu
- Menyelesaikan masalah pemasangan dan penetapan yang biasa

## Hasil Pembelajaran

Selepas menyiapkan pelajaran ini, anda akan dapat:
- Memasang azd menggunakan kaedah yang sesuai untuk platform anda
- Mengesahkan dengan Azure menggunakan azd auth login
- Mengesahkan pemasangan anda dan menguji arahan azd asas
- Mengkonfigurasi persekitaran pembangunan anda untuk penggunaan azd yang optimum
- Menyelesaikan masalah pemasangan biasa secara berdikari

Panduan ini akan membantu anda memasang dan mengkonfigurasi Azure Developer CLI pada sistem anda, tanpa mengira sistem pengoperasian atau persekitaran pembangunan anda.

## Prasyarat

Sebelum memasang azd, pastikan anda mempunyai:
- **Langganan Azure** - [Cipta akaun percuma](https://azure.microsoft.com/free/)
- **Azure CLI** - Untuk pengesahan dan pengurusan sumber
- **Git** - Untuk menyalin templat dan kawalan versi
- **Docker** (pilihan) - Untuk aplikasi berasaskan kontena

## Kaedah Pemasangan

### Windows

#### Pilihan 1: Pengurus Pakej Windows (Disyorkan)
```cmd
winget install microsoft.azd
```

#### Pilihan 2: Skrip Pemasangan PowerShell
```powershell
# Berguna apabila winget tidak tersedia
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

**Pemasangan manual dari aset keluaran:**
```bash
# Muat turun arkib terkini untuk seni bina Linux anda dari:
# https://github.com/Azure/azure-dev/releases
# Kemudian nyahmampatkan dan tambah binari azd ke PATH anda.
```

### GitHub Codespaces

Beberapa persekitaran Codespaces dan bekas pembangunan sudah termasuk `azd`, tetapi anda harus mengesahkannya daripada menganggapnya:

```bash
azd version
```

Jika `azd` tiada, pasangkannya dengan skrip standard untuk persekitaran tersebut.

### Docker

```bash
# Jalankan azd dalam bekas
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

Output dijangka:
```
azd version 1.x.x (commit xxxxxx)
```

**Nota**: Nombor versi sebenar akan berbeza. Semak [Keluaran Azure Developer CLI](https://github.com/Azure/azure-dev/releases) untuk versi terkini.

**✅ Senarai Semak Kejayaan Pemasangan:**
- [ ] `azd version` menunjukkan nombor versi tanpa ralat
- [ ] `azd --help` memaparkan dokumentasi arahan
- [ ] `azd template list` memaparkan templat yang tersedia
- [ ] Anda boleh mencipta direktori ujian dan jalankan `azd init` dengan berjaya

**Jika semua pemeriksaan lulus, anda sedia untuk meneruskan ke [Projek Pertama Anda](first-project.md)!**

## Penetapan Pengesahan

### Penetapan Untuk Pemula (Disyorkan)

Untuk aliran kerja AZD-pertama, log masuk dengan `azd auth login`.

```bash
# Diperlukan untuk arahan AZD seperti azd up
azd auth login

# Sahkan status pengesahan AZD
azd auth login --check-status
```

Gunakan log masuk Azure CLI hanya apabila anda merancang menjalankan arahan `az` sendiri sepanjang kursus.

### Pengesahan Azure CLI (Pilihan)
```bash
# Pasang Azure CLI jika belum dipasang
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: lihat dokumentasi pemasangan Azure CLI untuk edaran anda

# Log masuk ke Azure
az login

# Sahkan pengesahan
az account show
```

### Aliran Log Masuk Mana Yang Harus Anda Gunakan?

- Gunakan `azd auth login` jika anda mengikuti laluan AZD pemula dan lebih banyak menjalankan arahan `azd`.
- Gunakan `az login` juga apabila anda mahu menjalankan arahan Azure CLI seperti `az account show` atau memeriksa sumber secara langsung.
- Jika latihan termasuk kedua-dua arahan `azd` dan `az`, jalankan kedua-dua arahan log masuk sekali di awal.

### Pengesahan Kod Peranti
Jika anda menggunakan sistem tanpa kepala atau menghadapi masalah pelayar:
```bash
azd auth login --use-device-code
```

### Perwakilan Perkhidmatan (CI/CD)
Untuk persekitaran automatik:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Sahkan Penetapan Lengkap Anda

Jika anda mahu pemeriksaan kesediaan cepat sebelum memulakan Bab 1:

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
# Tetapkan langganan lalai
azd config set defaults.subscription <subscription-id>

# Tetapkan lokasi lalai
azd config set defaults.location eastus2

# Lihat semua konfigurasi
azd config show
```

### Pembolehubah Persekitaran
Tambah ke profil shell anda (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Konfigurasi Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Konfigurasi azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Aktifkan log pengesanan ralat
```

## Integrasi IDE

### Visual Studio Code
Pasang sambungan Azure Developer CLI:
1. Buka VS Code
2. Pergi ke Sambungan (Ctrl+Shift+X)
3. Cari “Azure Developer CLI”
4. Pasang sambungan tersebut

Ciri-ciri:
- IntelliSense untuk azure.yaml
- Arahan terminal bersepadu
- Penyemakan templat
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
2. Konfigurasi kelayakan Azure
3. Gunakan terminal bersepadu untuk arahan azd

## 🐛 Penyelesaian Masalah Pemasangan

### Masalah Biasa

#### Kebenaran Ditolak (Windows)
```powershell
# Jalankan PowerShell sebagai Pentadbir
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
# Konfigurasikan proksi
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Langkau pengesahan SSL (tidak disyorkan untuk pengeluaran)
azd config set http.insecure true
```

#### Konflik Versi
```bash
# Buang pemasangan lama
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: keluarkan binari azd sebelumnya atau pautan simbolik sebelum memasang semula

# Bersihkan konfigurasi
rm -rf ~/.azd
```

### Mendapatkan Bantuan Lagi
```bash
# Aktifkan logging debug
export AZD_DEBUG=true
azd <command> --debug

# Lihat konfigurasi semasa
azd config show

# Lihat status penyebaran semasa
azd show
```

## Mengemas Kini azd

### Semakan Kemas Kini
azd memberi amaran apabila keluaran baru tersedia, dan anda boleh sahkan binaan semasa anda dengan:
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

**Azure CLI (az)**: Alat tahap rendah untuk pengurusan sumber Azure individu
- `az webapp create`, `az storage account create`
- Satu sumber pada satu masa
- Fokus pengurusan infrastruktur

**Azure Developer CLI (azd)**: Alat tahap tinggi untuk penyebaran aplikasi lengkap
- `azd up` menyebarkan seluruh aplikasi dengan semua sumber
- Aliran kerja berasaskan templat
- Fokus produktiviti pembangun

**Anda perlukan kedua-duanya**: azd menggunakan az CLI untuk pengesahan
</details>

<details>
<summary><strong>Bolehkah saya menggunakan azd dengan sumber Azure yang sedia ada?</strong></summary>

Ya! Anda boleh:
1. Mengimport sumber sedia ada ke dalam persekitaran azd
2. Merujuk sumber sedia ada dalam templat Bicep anda
3. Menggunakan azd untuk penyebaran baru bersama infrastruktur sedia ada

Lihat [Panduan Konfigurasi](configuration.md) untuk butiran.
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
- Pengesahan perwakilan perkhidmatan
- Mod tidak interaktif

Lihat [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md) untuk corak CI/CD.
</details>

<details>
<summary><strong>Berapakah kos menggunakan azd?</strong></summary>

azd sendiri adalah **sepenuhnya percuma** dan sumber terbuka. Anda hanya membayar untuk:
- Sumber Azure yang anda sebarkan
- Kos penggunaan Azure (pengkomputeran, storan, dll.)

Gunakan `azd provision --preview` untuk menganggar kos sebelum penyebaran.
</details>

## Langkah Seterusnya

1. **Selesaikan pengesahan**: Pastikan anda boleh mengakses langganan Azure anda
2. **Cuba penyebaran pertama anda**: Ikuti [Panduan Projek Pertama](first-project.md)
3. **Terokai templat**: Semak templat yang tersedia dengan `azd template list`
4. **Konfigurasikan IDE anda**: Sediakan persekitaran pembangunan anda

## Sokongan

Jika anda menghadapi masalah:
- [Dokumentasi Rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Laporkan Masalah](https://github.com/Azure/azure-dev/issues)
- [Perbincangan Komuniti](https://github.com/Azure/azure-dev/discussions)
- [Sokongan Azure](https://azure.microsoft.com/support/)
- [**Kemahiran Ejen Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Dapatkan panduan arahan Azure terus dalam penyunting anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 1 - Asas & Permulaan Pantas
- **⬅️ Sebelumnya**: [Asas AZD](azd-basics.md) 
- **➡️ Seterusnya**: [Projek Pertama Anda](first-project.md)
- **🚀 Bab Seterusnya**: [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Pemasangan Selesai!** Teruskan ke [Projek Pertama Anda](first-project.md) untuk mula membina dengan azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->