# Lembaran Cheat Arahan - Arahan AZD Penting

**Rujukan Pantas untuk Semua Bab**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Pantas**: [Bab 1: Asas & Mula Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Arahan AI**: [Bab 2: Pembangunan Utama AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pengenalan

Lembaran cheat yang menyeluruh ini menyediakan rujukan pantas untuk arahan Azure Developer CLI yang paling kerap digunakan, disusun mengikut kategori dengan contoh praktikal. Sesuai untuk rujukan pantas semasa pembangunan, penyelesaian masalah, dan operasi harian dengan projek azd.

## Matlamat Pembelajaran

Dengan menggunakan lembaran cheat ini, anda akan:
- Mendapat akses segera kepada arahan dan sintaks Azure Developer CLI penting
- Memahami organisasi arahan mengikut kategori fungsi dan kes penggunaan
- Merujuk contoh praktikal untuk senario pembangunan dan penyebaran biasa
- Mengakses arahan penyelesaian masalah untuk penyelesaian isu dengan cepat
- Menemui pilihan konfigurasi dan pengubahsuaian lanjutan dengan cekap
- Menemui arahan pengurusan persekitaran dan aliran kerja pelbagai persekitaran

## Hasil Pembelajaran

Dengan rujukan kerap kepada lembaran cheat ini, anda akan dapat:
- Melaksanakan arahan azd dengan yakin tanpa merujuk dokumentasi penuh
- Menyelesaikan isu biasa dengan pantas menggunakan arahan diagnostik yang sesuai
- Mengurus pelbagai persekitaran dan senario penyebaran dengan cekap
- Menggunakan ciri azd lanjutan dan pilihan konfigurasi mengikut keperluan
- Menyelesaikan masalah penyebaran menggunakan urutan arahan sistematik
- Mengoptimumkan aliran kerja melalui penggunaan pintasan dan pilihan azd yang berkesan

## Arahan Memulakan

### Pengesahan
```bash
# Log masuk ke Azure melalui AZD
azd auth login

# Log masuk ke Azure CLI (AZD menggunakan ini di belakang tabir)
az login

# Semak akaun semasa
az account show

# Tetapkan langganan lalai
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Log keluar dari AZD
azd auth logout

# Log keluar dari Azure CLI
az logout
```

### Inisialisasi Projek
```bash
# Layari templat yang tersedia
azd template list

# Inisialisasi dari templat
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Inisialisasi dalam direktori semasa
azd init .

# Inisialisasi dengan nama tersuai
azd init --template todo-nodejs-mongo my-awesome-app
```

## Arahan Penyebaran Teras

### Aliran Kerja Penyebaran Lengkap
```bash
# Kerahkan semua (penyediaan + kerahkan)
azd up

# Kerahkan dengan arahan pengesahan dinyahdayakan
azd up --confirm-with-no-prompt

# Kerahkan ke persekitaran tertentu
azd up --environment production

# Kerahkan dengan parameter tersuai
azd up --parameter location=westus2
```

### Infrastruktur Sahaja
```bash
# Menyediakan sumber Azure
azd provision

# 🧪 Pratonton perubahan infrastruktur
azd provision --preview
# Menunjukkan pandangan ujian memandu tentang sumber yang akan dibuat/diubah/dihapus
# Serupa dengan 'terraform plan' atau 'bicep what-if' - selamat untuk dijalankan, tiada perubahan diterapkan
```

### Aplikasi Sahaja
```bash
# Menyebarkan kod aplikasi
azd deploy

# Menyebarkan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Menyebarkan semua perkhidmatan
azd deploy --all
```

### Bina dan Pek
```bash
# Bina aplikasi
azd package

# Bina perkhidmatan khusus
azd package --service api
```

## 🌍 Pengurusan Persekitaran

### Operasi Persekitaran
```bash
# Senaraikan semua persekitaran
azd env list

# Cipta persekitaran baru
azd env new development
azd env new staging --location westus2

# Pilih persekitaran
azd env select production

# Tunjukkan persekitaran semasa
azd env show

# Segarkan keadaan persekitaran
azd env refresh
```

### Pembolehubah Persekitaran
```bash
# Tetapkan pembolehubah persekitaran
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Dapatkan pembolehubah persekitaran
azd env get API_KEY

# Senaraikan semua pembolehubah persekitaran
azd env get-values

# Keluarkan pembolehubah persekitaran
azd env unset DEBUG
```

## ⚙️ Arahan Konfigurasi

### Konfigurasi Global
```bash
# Senaraikan semua konfigurasi
azd config list

# Tetapkan lalai global
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Alih keluar konfigurasi
azd config unset defaults.location

# Tetapkan semula semua konfigurasi
azd config reset
```

### Konfigurasi Projek
```bash
# Sahkan azure.yaml
azd config validate

# Papar maklumat projek
azd show

# Dapatkan titik akhir perkhidmatan
azd show --output json
```

## 📊 Pemantauan dan Diagnostik

### Papan Pemuka Pemantauan
```bash
# Buka papan pemuka pemantauan portal Azure
azd monitor

# Buka metrik langsung Application Insights
azd monitor --live

# Buka blad log Application Insights
azd monitor --logs

# Buka gambaran keseluruhan Application Insights
azd monitor --overview
```

### Melihat Log Kontena
```bash
# Lihat log melalui Azure CLI (untuk Aplikasi Kontena)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Ikuti log secara masa nyata
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Lihat log dari Portal Azure
azd monitor --logs
```

### Pertanyaan Analitik Log
```bash
# Akses Analitis Log melalui Portal Azure
azd monitor --logs

# Pertanyaan log menggunakan Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Arahan Penyelenggaraan

### Pembersihan
```bash
# Buang semua sumber Azure
azd down

# Paksa hapus tanpa pengesahan
azd down --force

# Buang sumber yang dipadam sementara
azd down --purge

# Pembersihan lengkap
azd down --force --purge
```

### Kemas Kini
```bash
# Semak kemas kini azd
azd version

# Dapatkan versi semasa
azd version

# Lihat konfigurasi semasa
azd config list
```

## 🔧 Arahan Lanjutan

### Saluran dan CI/CD
```bash
# Konfigurasikan GitHub Actions
azd pipeline config

# Konfigurasikan Azure DevOps
azd pipeline config --provider azdo

# Paparkan konfigurasi saluran paip
azd pipeline show
```

### Pengurusan Infrastruktur
```bash
# Jana templat infrastruktur
azd infra generate

# 🧪 Pratonton & Perancangan Infrastruktur
azd provision --preview
# Mensimulasikan penyediaan infrastruktur tanpa melaksanakan
# Menganalisis templat Bicep/Terraform dan menunjukkan:
# - Sumber yang akan ditambah (hijau +)
# - Sumber yang akan diubah suai (kuning ~)
# - Sumber yang akan dipadamkan (merah -)
# Selamat untuk dijalankan - tiada perubahan sebenar dilakukan ke persekitaran Azure

# Sintesis infrastruktur daripada azure.yaml
azd infra synth
```

### Maklumat Projek
```bash
# Tunjukkan status projek dan titik akhir
azd show

# Tunjukkan maklumat projek terperinci sebagai JSON
azd show --output json

# Dapatkan titik akhir perkhidmatan
azd show --output json | jq '.services'
```

## 🎯 Aliran Kerja Pantas

### Aliran Kerja Pembangunan
```bash
# Mulakan projek baru
azd init --template todo-nodejs-mongo
cd my-project

# Sebarkan ke pembangunan
azd env new dev
azd up

# Buat perubahan dan sebarkan semula
azd deploy

# Buka papan pemuka pemantauan
azd monitor --live
```

### Aliran Kerja Pelbagai Persekitaran
```bash
# Sediakan persekitaran
azd env new dev
azd env new staging  
azd env new production

# Lancarkan ke dev
azd env select dev
azd up

# Uji dan promosikan ke staging
azd env select staging
azd up

# Lancarkan ke pengeluaran
azd env select production
azd up
```

### Aliran Kerja Penyelesaian Masalah
```bash
# Aktifkan mod debug
export AZD_DEBUG=true

# Semak status penyebaran
azd show

# Sahkan konfigurasi
azd config list

# Buka papan pemuka pemantauan untuk log
azd monitor --logs

# Semak status sumber daya
azd show --output json
```

## 🔍 Arahan Debugging

### Maklumat Debug
```bash
# Hidupkan output debug
export AZD_DEBUG=true
azd <command> --debug

# Lumpuhkan telemetri untuk output yang lebih bersih
export AZD_DISABLE_TELEMETRY=true

# Semak konfigurasi semasa
azd config list

# Semak status pengesahan
az account show
```

### Debug Template
```bash
# Senaraikan templat yang tersedia dengan butiran
azd template list --output json

# Paparkan maklumat templat
azd template show <template-name>

# Sahkan templat sebelum memulakan
azd template validate <template-name>
```

## 📁 Arahan Fail dan Direktori

### Struktur Projek
```bash
# Paparkan struktur direktori semasa
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigasi ke akar projek azd
cd $(azd root)

# Paparkan direktori konfigurasi azd
echo $AZD_CONFIG_DIR  # Biasanya ~/.azd
```

## 🎨 Format Output

### Output JSON
```bash
# Dapatkan output JSON untuk penulisan skrip
azd show --output json
azd env list --output json
azd config list --output json

# Parse dengan jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Jadual
```bash
# Format sebagai jadual
azd env list --output table

# Lihat perkhidmatan yang telah ditempatkan
azd show --output json | jq '.services | keys'
```

## 🔧 Gabungan Arahan Biasa

### Skrip Semakan Kesihatan
```bash
#!/bin/bash
# Pemeriksaan kesihatan cepat
azd show
azd env show
azd monitor --logs
```

### Pengesahan Penyebaran
```bash
#!/bin/bash
# Pengesahan sebelum pelaksanaan
azd show
azd provision --preview  # Pratonton perubahan sebelum melaksanakan
az account show
```

### Perbandingan Persekitaran
```bash
#!/bin/bash
# Bandingkan persekitaran
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skrip Pembersihan Sumber
```bash
#!/bin/bash
# Bersihkan persekitaran lama
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Pembolehubah Persekitaran

### Pembolehubah Persekitaran Biasa
```bash
# Konfigurasi Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Konfigurasi AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Konfigurasi aplikasi
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Arahan Kecemasan

### Pembetulan Pantas
```bash
# Tetapkan semula pengesahan
az account clear
az login

# Paksa segar semula persekitaran
azd env refresh

# Pasang semula semua perkhidmatan
azd deploy

# Semak status pemasangan
azd show --output json
```

### Arahan Pemulihan
```bash
# Pulihkan dari pelaksanaan yang gagal - bersihkan dan lancarkan semula
azd down --force --purge
azd up

# Sediakan semula infrastruktur sahaja
azd provision

# Lancarkan semula aplikasi sahaja
azd deploy
```

## 💡 Petua Profesional

### Alias untuk Aliran Kerja Lebih Pantas
```bash
# Tambah ke .bashrc atau .zshrc anda
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Pintasan Fungsi
```bash
# Pertukaran persekitaran pantas
azd-env() {
    azd env select $1 && azd show
}

# Penyebaran pantas dengan pemantauan
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status persekitaran
azd-status() {
    echo "Current environment:"
    azd env show
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

# Bantuan khusus arahan
azd up --help
azd env --help
azd config --help

# Papar maklumat versi dan binaan
azd version
azd version --output json
```

### Pautan Dokumentasi
```bash
# Buka dokumentasi dalam pelayar
azd docs

# Paparkan dokumentasi templat
azd template show <template-name> --docs
```

---

**Petua**: Tandakan lembaran cheat ini dan gunakan `Ctrl+F` untuk mencari arahan yang anda perlukan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Pemeriksaan Pra-Penerbangan](../docs/pre-deployment/preflight-checks.md)
- **Pelajaran Seterusnya**: [Glosari](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk mencapai ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau tafsiran yang salah yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->