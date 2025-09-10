<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b0f9bb7d2efce4196ceab8e3269080d3",
  "translation_date": "2025-09-10T13:30:02+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "ms"
}
-->
# Asas AZD - Memahami Azure Developer CLI

## Pengenalan

Pelajaran ini memperkenalkan anda kepada Azure Developer CLI (azd), alat baris perintah yang berkuasa untuk mempercepat perjalanan anda dari pembangunan tempatan ke penyebaran di Azure. Anda akan mempelajari konsep asas, ciri utama, dan memahami bagaimana azd mempermudah penyebaran aplikasi cloud-native.

## Matlamat Pembelajaran

Pada akhir pelajaran ini, anda akan:
- Memahami apa itu Azure Developer CLI dan tujuan utamanya
- Mempelajari konsep asas seperti templat, persekitaran, dan perkhidmatan
- Meneroka ciri utama termasuk pembangunan berasaskan templat dan Infrastruktur sebagai Kod
- Memahami struktur projek azd dan aliran kerjanya
- Bersedia untuk memasang dan mengkonfigurasi azd untuk persekitaran pembangunan anda

## Hasil Pembelajaran

Selepas melengkapkan pelajaran ini, anda akan dapat:
- Menerangkan peranan azd dalam aliran kerja pembangunan cloud moden
- Mengenal pasti komponen struktur projek azd
- Menghuraikan bagaimana templat, persekitaran, dan perkhidmatan berfungsi bersama
- Memahami manfaat Infrastruktur sebagai Kod dengan azd
- Mengenali pelbagai perintah azd dan tujuan penggunaannya

## Apa itu Azure Developer CLI (azd)?

Azure Developer CLI (azd) ialah alat baris perintah yang direka untuk mempercepat perjalanan anda dari pembangunan tempatan ke penyebaran di Azure. Ia mempermudah proses membina, menyebar, dan mengurus aplikasi cloud-native di Azure.

## Konsep Asas

### Templat
Templat adalah asas kepada azd. Ia mengandungi:
- **Kod aplikasi** - Kod sumber dan kebergantungan anda
- **Definisi infrastruktur** - Sumber Azure yang ditakrifkan dalam Bicep atau Terraform
- **Fail konfigurasi** - Tetapan dan pembolehubah persekitaran
- **Skrip penyebaran** - Aliran kerja penyebaran automatik

### Persekitaran
Persekitaran mewakili sasaran penyebaran yang berbeza:
- **Pembangunan** - Untuk ujian dan pembangunan
- **Pementasan** - Persekitaran pra-pengeluaran
- **Pengeluaran** - Persekitaran pengeluaran langsung

Setiap persekitaran mengekalkan:
- Kumpulan sumber Azure tersendiri
- Tetapan konfigurasi
- Keadaan penyebaran

### Perkhidmatan
Perkhidmatan adalah blok binaan aplikasi anda:
- **Frontend** - Aplikasi web, SPA
- **Backend** - API, mikroservis
- **Pangkalan Data** - Penyelesaian penyimpanan data
- **Penyimpanan** - Penyimpanan fail dan blob

## Ciri Utama

### 1. Pembangunan Berasaskan Templat
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastruktur sebagai Kod
- **Bicep** - Bahasa khusus domain Azure
- **Terraform** - Alat infrastruktur multi-cloud
- **Templat ARM** - Templat Azure Resource Manager

### 3. Aliran Kerja Bersepadu
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Pengurusan Persekitaran
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Struktur Projek

Struktur projek azd yang tipikal:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Fail Konfigurasi

### azure.yaml
Fail konfigurasi utama projek:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Konfigurasi khusus persekitaran:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Aliran Kerja Biasa

### Memulakan Projek Baru
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Kitaran Pembangunan
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Memahami `azd down --force --purge`
Perintah `azd down --force --purge` adalah cara yang berkuasa untuk sepenuhnya meruntuhkan persekitaran azd anda dan semua sumber yang berkaitan. Berikut adalah pecahan setiap bendera:
```
--force
```
- Melangkau arahan pengesahan.
- Berguna untuk automasi atau skrip di mana input manual tidak praktikal.
- Memastikan proses peruntuhan berjalan tanpa gangguan, walaupun CLI mengesan ketidakkonsistenan.

```
--purge
```
Memadamkan **semua metadata yang berkaitan**, termasuk:
Keadaan persekitaran  
Folder `.azure` tempatan  
Maklumat penyebaran yang di-cache  
Menghalang azd daripada "mengingati" penyebaran sebelumnya, yang boleh menyebabkan masalah seperti kumpulan sumber yang tidak sepadan atau rujukan daftar yang usang.

### Mengapa menggunakan kedua-duanya?
Apabila anda menghadapi masalah dengan `azd up` disebabkan oleh keadaan yang tertinggal atau penyebaran separa, gabungan ini memastikan permulaan yang **bersih**.

Ia sangat berguna selepas penghapusan sumber secara manual di portal Azure atau apabila menukar templat, persekitaran, atau konvensi penamaan kumpulan sumber.

### Mengurus Pelbagai Persekitaran
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Perintah Navigasi

### Penemuan
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Pengurusan Projek
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Pemantauan
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Amalan Terbaik

### 1. Gunakan Nama yang Bermakna
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Manfaatkan Templat
- Mulakan dengan templat sedia ada
- Sesuaikan mengikut keperluan anda
- Cipta templat yang boleh digunakan semula untuk organisasi anda

### 3. Pengasingan Persekitaran
- Gunakan persekitaran berasingan untuk pembangunan/pementasan/pengeluaran
- Jangan sekali-kali menyebar terus ke pengeluaran dari mesin tempatan
- Gunakan saluran CI/CD untuk penyebaran pengeluaran

### 4. Pengurusan Konfigurasi
- Gunakan pembolehubah persekitaran untuk data sensitif
- Simpan konfigurasi dalam kawalan versi
- Dokumentasikan tetapan khusus persekitaran

## Perkembangan Pembelajaran

### Pemula (Minggu 1-2)
1. Pasang azd dan sahkan
2. Sebarkan templat mudah
3. Fahami struktur projek
4. Pelajari perintah asas (up, down, deploy)

### Pertengahan (Minggu 3-4)
1. Sesuaikan templat
2. Urus pelbagai persekitaran
3. Fahami kod infrastruktur
4. Sediakan saluran CI/CD

### Lanjutan (Minggu 5+)
1. Cipta templat tersuai
2. Corak infrastruktur lanjutan
3. Penyebaran multi-rantau
4. Konfigurasi bertaraf perusahaan

## Langkah Seterusnya

- [Pemasangan & Persediaan](installation.md) - Pasang dan konfigurasikan azd
- [Projek Pertama Anda](first-project.md) - Tutorial praktikal
- [Panduan Konfigurasi](configuration.md) - Pilihan konfigurasi lanjutan

## Sumber Tambahan

- [Gambaran Keseluruhan Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Galeri Templat](https://azure.github.io/awesome-azd/)
- [Contoh Komuniti](https://github.com/Azure-Samples)

---

**Navigasi**
- **Pelajaran Sebelumnya**: [README](../../README.md)
- **Pelajaran Seterusnya**: [Pemasangan & Persediaan](installation.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.