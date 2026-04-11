# Ringkasan Perintah - Perintah AZD Esensial

**Referensi Cepat untuk Semua Bab**
- **📚 Beranda Kursus**: [AZD untuk Pemula](../README.md)
- **📖 Memulai Cepat**: [Bab 1: Dasar & Memulai Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pengembangan Berbasis AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pendahuluan

Ringkasan perintah komprehensif ini menyediakan referensi cepat untuk perintah Azure Developer CLI yang paling sering digunakan, disusun menurut kategori dengan contoh praktis. Sempurna untuk pencarian cepat saat pengembangan, pemecahan masalah, dan operasi harian dengan proyek azd.

## Tujuan Pembelajaran

Dengan menggunakan ringkasan perintah ini, Anda akan:
- Memiliki akses instan ke perintah dan sintaks Azure Developer CLI yang penting
- Memahami pengorganisasian perintah berdasarkan kategori fungsional dan kasus penggunaan
- Merujuk contoh praktis untuk skenario pengembangan dan penyebaran umum
- Mengakses perintah pemecahan masalah untuk resolusi isu cepat
- Menemukan opsi konfigurasi dan kustomisasi tingkat lanjut dengan efisien
- Menemukan perintah manajemen lingkungan dan alur kerja multi-lingkungan

## Hasil Pembelajaran

Dengan merujuk ringkasan perintah ini secara rutin, Anda akan dapat:
- Menjalankan perintah azd dengan percaya diri tanpa merujuk dokumentasi lengkap
- Cepat menyelesaikan masalah umum menggunakan perintah diagnostik yang sesuai
- Mengelola beberapa lingkungan dan skenario penyebaran secara efisien
- Menerapkan fitur azd tingkat lanjut dan opsi konfigurasi sesuai kebutuhan
- Memecahkan masalah penyebaran menggunakan urutan perintah yang sistematis
- Mengoptimalkan alur kerja melalui penggunaan pintasan dan opsi azd yang efektif

## Perintah Memulai

### Autentikasi
```bash
# Masuk ke Azure melalui AZD
azd auth login

# Masuk ke Azure CLI (AZD menggunakan ini di balik layar)
az login

# Periksa akun saat ini
az account show

# Atur langganan default
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Keluar dari AZD
azd auth logout

# Keluar dari Azure CLI
az logout
```

### Inisialisasi Proyek
```bash
# Jelajahi template yang tersedia
azd template list

# Inisialisasi dari template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inisialisasi di direktori saat ini
azd init .

# Inisialisasi dengan nama kustom
azd init --template todo-nodejs-mongo my-awesome-app
```

## Perintah Penyebaran Inti

### Alur Kerja Penyebaran Lengkap
```bash
# Terapkan semuanya (penyediaan + penyebaran)
azd up

# Terapkan dengan prompt konfirmasi dinonaktifkan
azd up --confirm-with-no-prompt

# Terapkan ke lingkungan tertentu
azd up --environment production

# Terapkan dengan parameter khusus
azd up --parameter location=westus2
```

### Hanya Infrastruktur
```bash
# Menyediakan sumber daya Azure
azd provision

# 🧪 Pratinjau perubahan infrastruktur
azd provision --preview
# Menampilkan tampilan simulasi mengenai sumber daya yang akan dibuat/dimodifikasi/dihapus
# Mirip dengan 'terraform plan' atau 'bicep what-if' - aman dijalankan, tidak ada perubahan yang diterapkan
```

### Hanya Aplikasi
```bash
# Menerapkan kode aplikasi
azd deploy

# Menerapkan layanan tertentu
azd deploy --service web
azd deploy --service api

# Menerapkan semua layanan
azd deploy --all
```

### Build dan Paket
```bash
# Membangun aplikasi
azd package

# Membangun layanan tertentu
azd package --service api
```

## 🌍 Manajemen Lingkungan

### Operasi Lingkungan
```bash
# Daftar semua lingkungan
azd env list

# Buat lingkungan baru
azd env new development
azd env new staging --location westus2

# Pilih lingkungan
azd env select production

# Tampilkan lingkungan yang tersedia
azd env list

# Segarkan status lingkungan
azd env refresh
```

### Variabel Lingkungan
```bash
# Tetapkan variabel lingkungan
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Dapatkan variabel lingkungan
azd env get API_KEY

# Daftar semua variabel lingkungan
azd env get-values

# Hapus variabel lingkungan
azd env unset DEBUG
```

## ⚙️ Perintah Konfigurasi

### Konfigurasi Global
```bash
# Daftar semua konfigurasi
azd config show

# Atur default global
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Hapus konfigurasi
azd config unset defaults.location

# Atur ulang semua konfigurasi
azd config reset
```

### Konfigurasi Proyek
```bash
# Validasi azure.yaml
azd config validate

# Tampilkan informasi proyek
azd show

# Dapatkan endpoint layanan
azd show --output json
```

## 📊 Pemantauan dan Diagnostik

### Dasbor Pemantauan
```bash
# Buka dasbor pemantauan portal Azure
azd monitor

# Buka metrik waktu nyata di Application Insights
azd monitor --live

# Buka blade log di Application Insights
azd monitor --logs

# Buka ikhtisar di Application Insights
azd monitor --overview
```

### Melihat Log Kontainer
```bash
# Lihat log melalui Azure CLI (untuk Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Ikuti log secara real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Lihat log di Azure Portal
azd monitor --logs
```

### Kueri Log Analytics
```bash
# Akses Log Analytics melalui Azure Portal
azd monitor --logs

# Kueri log menggunakan Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Perintah Pemeliharaan

### Pembersihan
```bash
# Hapus semua sumber daya Azure
azd down

# Hapus paksa tanpa konfirmasi
azd down --force

# Hapus permanen sumber daya yang dihapus sementara
azd down --purge

# Pembersihan lengkap
azd down --force --purge
```

### Pembaruan
```bash
# Periksa pembaruan azd
azd version

# Dapatkan versi saat ini
azd version

# Lihat konfigurasi saat ini
azd config show
```

## 🔧 Perintah Lanjutan

### Pipeline dan CI/CD
```bash
# Konfigurasikan GitHub Actions
azd pipeline config

# Konfigurasikan Azure DevOps
azd pipeline config --provider azdo

# Tampilkan konfigurasi pipeline
azd pipeline show
```

### Manajemen Infrastruktur
```bash
# Hasilkan template infrastruktur
azd infra generate

# 🧪 Pratinjau & Perencanaan Infrastruktur
azd provision --preview
# Mensimulasikan penyediaan infrastruktur tanpa melakukan penyebaran
# Menganalisis template Bicep/Terraform dan menampilkan:
# - Sumber daya yang akan ditambahkan (hijau +)
# - Sumber daya yang akan dimodifikasi (kuning ~)
# - Sumber daya yang akan dihapus (merah -)
# Aman dijalankan - tidak ada perubahan nyata yang dilakukan pada lingkungan Azure

# Menyintesis infrastruktur dari azure.yaml
azd infra synth
```

### Informasi Proyek
```bash
# Tampilkan status proyek dan titik akhir
azd show

# Tampilkan informasi proyek secara rinci sebagai JSON
azd show --output json

# Dapatkan titik akhir layanan
azd show --output json | jq '.services'
```

## 🤖 Perintah AI & Ekstensi

### Ekstensi AZD
```bash
# Daftar semua ekstensi yang tersedia (termasuk AI)
azd extension list

# Pasang ekstensi agen Foundry
azd extension install azure.ai.agents

# Pasang ekstensi penyetelan halus
azd extension install azure.ai.finetune

# Pasang ekstensi model kustom
azd extension install azure.ai.models

# Perbarui semua ekstensi yang terpasang
azd extension upgrade --all
```

### Perintah Agen AI
```bash
# Inisialisasi proyek agen dari manifes
azd ai agent init -m <manifest-path-or-uri>

# Menargetkan proyek Foundry tertentu
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Tentukan direktori sumber agen
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pilih target hosting
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Mulai server MCP untuk proyek Anda
azd mcp start

# Kelola persetujuan alat untuk operasi MCP
azd copilot consent list
```

### Generasi Infrastruktur
```bash
# Hasilkan file IaC dari definisi proyek Anda
azd infra generate

# Hasilkan infrastruktur dari file azure.yaml
azd infra synth
```

---

## 🎯 Alur Kerja Cepat

### Alur Kerja Pengembangan
```bash
# Mulai proyek baru
azd init --template todo-nodejs-mongo
cd my-project

# Terapkan ke lingkungan pengembangan
azd env new dev
azd up

# Lakukan perubahan dan terapkan ulang
azd deploy

# Buka dasbor pemantauan
azd monitor --live
```

### Alur Kerja Multi-Lingkungan
```bash
# Siapkan lingkungan
azd env new dev
azd env new staging  
azd env new production

# Terapkan ke dev
azd env select dev
azd up

# Uji dan promosikan ke staging
azd env select staging
azd up

# Terapkan ke produksi
azd env select production
azd up
```

### Alur Kerja Pemecahan Masalah
```bash
# Aktifkan mode debug
export AZD_DEBUG=true

# Periksa status penyebaran
azd show

# Validasi konfigurasi
azd config show

# Buka dasbor pemantauan untuk log
azd monitor --logs

# Periksa status sumber daya
azd show --output json
```

## 🔍 Perintah Debugging

### Informasi Debug
```bash
# Aktifkan output debug
export AZD_DEBUG=true
azd <command> --debug

# Nonaktifkan telemetri untuk output yang lebih bersih
export AZD_DISABLE_TELEMETRY=true

# Periksa konfigurasi saat ini
azd config show

# Periksa status autentikasi
az account show
```

### Debug Template
```bash
# Daftar template yang tersedia beserta rincian
azd template list --output json

# Tampilkan informasi template
azd template show <template-name>

# Validasi template sebelum inisialisasi
azd template validate <template-name>
```

## 📁 Perintah File dan Direktori

### Struktur Proyek
```bash
# Tampilkan struktur direktori saat ini
tree /f  # Windows
find . -type f  # Linux/macOS

# Arahkan ke root proyek azd
cd $(azd root)

# Tampilkan direktori konfigurasi azd
echo $AZD_CONFIG_DIR  # Biasanya ~/.azd
```

## 🎨 Format Output

### Output JSON
```bash
# Dapatkan keluaran JSON untuk skrip
azd show --output json
azd env list --output json
azd config show --output json

# Urai dengan jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Tabel
```bash
# Format sebagai tabel
azd env list --output table

# Lihat layanan yang telah diterapkan
azd show --output json | jq '.services | keys'
```

## 🔧 Kombinasi Perintah Umum

### Skrip Pemeriksaan Kesehatan
```bash
#!/bin/bash
# Pemeriksaan kesehatan cepat
azd show
azd env get-values
azd monitor --logs
```

### Validasi Penyebaran
```bash
#!/bin/bash
# Validasi sebelum penyebaran
azd show
azd provision --preview  # Pratinjau perubahan sebelum menerapkan
az account show
```

### Perbandingan Lingkungan
```bash
#!/bin/bash
# Bandingkan lingkungan
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skrip Pembersihan Sumber Daya
```bash
#!/bin/bash
# Bersihkan lingkungan lama
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Variabel Lingkungan

### Variabel Lingkungan Umum
```bash
# Konfigurasi Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Konfigurasi AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfigurasi Aplikasi
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Perintah Darurat

### Perbaikan Cepat
```bash
# Atur ulang otentikasi
az account clear
az login

# Paksa muat ulang lingkungan
azd env refresh

# Terapkan kembali semua layanan
azd deploy

# Periksa status penyebaran
azd show --output json
```

### Perintah Pemulihan
```bash
# Pulihkan dari penerapan yang gagal - bersihkan dan terapkan ulang
azd down --force --purge
azd up

# Hanya reprovisikan infrastruktur
azd provision

# Hanya terapkan ulang aplikasi
azd deploy
```

## 💡 Tips Profesional

### Alias untuk Alur Kerja Lebih Cepat
```bash
# Tambahkan ke .bashrc atau .zshrc Anda
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Pintasan Fungsi
```bash
# Beralih lingkungan dengan cepat
azd-env() {
    azd env select $1 && azd show
}

# Penerapan cepat dengan pemantauan
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status lingkungan
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Bantuan dan Dokumentasi

### Mendapatkan Bantuan
```bash
# Bantuan umum
azd --help
azd help

# Bantuan khusus untuk perintah
azd up --help
azd env --help
azd config --help

# Tampilkan informasi versi dan build
azd version
azd version --output json
```

### Tautan Dokumentasi
```bash
# Buka dokumentasi di peramban
azd docs

# Tampilkan dokumentasi templat
azd template show <template-name> --docs
```

---

**Tip**: Tandai ringkasan perintah ini dan gunakan `Ctrl+F` untuk menemukan perintah yang Anda butuhkan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Pemeriksaan Pra-penyebaran](../docs/pre-deployment/preflight-checks.md)
- **Pelajaran Berikutnya**: [Glosarium](glossary.md)

---

> **💡 Ingin bantuan perintah Azure di editor Anda?** Instal [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) dengan `npx skills add microsoft/github-copilot-for-azure` — 37 keterampilan untuk AI, Foundry, penyebaran, diagnostik, dan lainnya.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->