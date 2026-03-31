# Command Cheat Sheet - Perintah AZD Penting

**Rujukan Pantas untuk Semua Bab**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Pantas**: [Bab 1: Asas & Mula Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pembangunan AI-Pertama](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pengenalan

Lembaran cheat ini menyediakan rujukan pantas untuk perintah Azure Developer CLI yang paling kerap digunakan, disusun mengikut kategori dengan contoh praktikal. Sesuai untuk rujukan cepat semasa pembangunan, penyelesaian masalah, dan operasi harian dengan projek azd.

## Matlamat Pembelajaran

Dengan menggunakan helaian cheat ini, anda akan:
- Mendapat akses serta-merta kepada perintah dan sintaks Azure Developer CLI yang penting
- Memahami organisasi perintah mengikut kategori fungsi dan kes penggunaan
- Merujuk contoh praktikal untuk senario pembangunan dan penerapan biasa
- Mendapat akses kepada perintah penyelesaian masalah untuk penyelesaian isu dengan cepat
- Menjumpai pilihan konfigurasi dan penyesuaian lanjutan dengan cekap
- Mencari perintah pengurusan persekitaran dan aliran kerja pelbagai persekitaran

## Hasil Pembelajaran

Dengan rujukan berkala pada helaian cheat ini, anda akan mampu:
- Melaksanakan perintah azd dengan yakin tanpa merujuk dokumentasi penuh
- Menyelesaikan masalah biasa dengan cepat menggunakan perintah diagnostik yang sesuai
- Menguruskan pelbagai persekitaran dan senario penerapan dengan cekap
- Mengaplikasi ciri azd lanjutan dan pilihan konfigurasi mengikut keperluan
- Menyelesaikan masalah penerapan menggunakan pendekatan perintah berurutan
- Mengoptimumkan aliran kerja melalui penggunaan pintasan dan pilihan azd yang berkesan

## Perintah Mula

### Pengesahan
```bash
# Log masuk ke Azure melalui AZD
azd auth login

# Log masuk ke Azure CLI (AZD menggunakan ini di dalam)
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

## Perintah Penerapan Teras

### Aliran Kerja Penerapan Lengkap
```bash
# Pasang semuanya (sediakan + pasang)
azd up

# Pasang tanpa prom pelbagai pengesahan
azd up --confirm-with-no-prompt

# Pasang ke persekitaran tertentu
azd up --environment production

# Pasang dengan parameter tersuai
azd up --parameter location=westus2
```

### Infrastruktur Sahaja
```bash
# Menyediakan sumber Azure
azd provision

# 🧪 Pratonton perubahan infrastruktur
azd provision --preview
# Menunjukkan pandangan ujian kering tentang sumber apa yang akan dibuat/dipinda/dihapuskan
# Serupa dengan 'terraform plan' atau 'bicep what-if' - selamat untuk dijalankan, tiada perubahan dikenakan
```

### Aplikasi Sahaja
```bash
# Sampaikan kod aplikasi
azd deploy

# Sampaikan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Sampaikan semua perkhidmatan
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

# Tunjukkan persekitaran yang tersedia
azd env list

# Segarkan keadaan persekitaran
azd env refresh
```

### Pemboleh Ubah Persekitaran
```bash
# Tetapkan pembolehubah persekitaran
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Dapatkan pembolehubah persekitaran
azd env get API_KEY

# Senaraikan semua pembolehubah persekitaran
azd env get-values

# Alih keluar pembolehubah persekitaran
azd env unset DEBUG
```

## ⚙️ Perintah Konfigurasi

### Konfigurasi Global
```bash
# Senaraikan semua konfigurasi
azd config show

# Tetapkan lalai global
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Keluarkan konfigurasi
azd config unset defaults.location

# Tetapkan semula semua konfigurasi
azd config reset
```

### Konfigurasi Projek
```bash
# Sahkan azure.yaml
azd config validate

# Tunjukkan maklumat projek
azd show

# Dapatkan titik hujung perkhidmatan
azd show --output json
```

## 📊 Pemantauan dan Diagnostik

### Papan Pemuka Pemantauan
```bash
# Buka papan pemuka pemantauan portal Azure
azd monitor

# Buka metrik langsung Application Insights
azd monitor --live

# Buka panel log Application Insights
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

### Pertanyaan Log Analitik
```bash
# Akses Log Analytics melalui Portal Azure
azd monitor --logs

# Kuiri log menggunakan Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Perintah Penyelenggaraan

### Pembersihan
```bash
# Buang semua sumber Azure
azd down

# Paksa padam tanpa pengesahan
azd down --force

# Bersihkan sumber yang dipadam lembut
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
azd config show
```

## 🔧 Perintah Lanjutan

### Saluran Paip dan CI/CD
```bash
# Konfigurasikan GitHub Actions
azd pipeline config

# Konfigurasikan Azure DevOps
azd pipeline config --provider azdo

# Paparkan konfigurasi paip
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
# Selamat untuk dijalankan - tiada perubahan sebenar dibuat pada persekitaran Azure

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

## 🤖 Perintah AI & Sambungan

### Sambungan AZD
```bash
# Senaraikan semua sambungan yang tersedia (termasuk AI)
azd extension list

# Pasang sambungan ejen Foundry
azd extension install azure.ai.agents

# Pasang sambungan penalaan halus
azd extension install azure.ai.finetune

# Pasang sambungan model tersuai
azd extension install azure.ai.models

# Tingkatkan semua sambungan yang dipasang
azd extension upgrade --all
```

### Perintah Ejen AI
```bash
# Mulakan projek agen dari manifest
azd ai agent init -m <manifest-path-or-uri>

# Sasarkan projek Foundry tertentu
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Tentukan direktori sumber agen
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pilih sasaran pengehosan
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Pelayan MCP (Alpha)
```bash
# Mulakan pelayan MCP untuk projek anda
azd mcp start

# Urus persetujuan alat untuk operasi MCP
azd copilot consent list
```

### Penjanaan Infrastruktur
```bash
# Hasilkan fail IaC daripada definisi projek anda
azd infra generate

# Sintesis infrastruktur daripada azure.yaml
azd infra synth
```

---

## 🎯 Aliran Kerja Pantas

### Aliran Kerja Pembangunan
```bash
# Mula projek baru
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
azd config show

# Buka papan pemuka pemantauan untuk log
azd monitor --logs

# Semak status sumber
azd show --output json
```

## 🔍 Perintah Penyahpepijatan

### Maklumat Penyahpepijatan
```bash
# Hidupkan output debug
export AZD_DEBUG=true
azd <command> --debug

# Matikan telemetri untuk output yang lebih bersih
export AZD_DISABLE_TELEMETRY=true

# Semak konfigurasi semasa
azd config show

# Semak status pengesahan
az account show
```

### Penyahpepijatan Templat
```bash
# Senaraikan templat yang tersedia dengan butiran
azd template list --output json

# Paparkan maklumat templat
azd template show <template-name>

# Sahkan templat sebelum inisialisasi
azd template validate <template-name>
```

## 📁 Perintah Fail dan Direktori

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
# Dapatkan output JSON untuk skrip
azd show --output json
azd env list --output json
azd config show --output json

# Huraikan dengan jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Jadual
```bash
# Format sebagai jadual
azd env list --output table

# Lihat perkhidmatan yang telah dipasang
azd show --output json | jq '.services | keys'
```

## 🔧 Gabungan Perintah Biasa

### Skrip Pemeriksaan Kesihatan
```bash
#!/bin/bash
# Semakan kesihatan pantas
azd show
azd env get-values
azd monitor --logs
```

### Validasi Penerapan
```bash
#!/bin/bash
# Pengesahan pra-penyebaran
azd show
azd provision --preview  # Pratonton perubahan sebelum menyebarkan
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

## 📝 Pemboleh Ubah Persekitaran

### Pemboleh Ubah Persekitaran Biasa
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

## 🚨 Perintah Kecemasan

### Pembaikan Pantas
```bash
# Tetapkan semula pengesahan
az account clear
az login

# Paksa segar semula persekitaran
azd env refresh

# Hantar semula semua perkhidmatan
azd deploy

# Semak status penghantaran
azd show --output json
```

### Perintah Pemulihan
```bash
# Pulihkan daripada penyebaran yang gagal - bersihkan dan sebarkannya semula
azd down --force --purge
azd up

# Menyediakan semula infrastruktur sahaja
azd provision

# Sebarkan semula aplikasi sahaja
azd deploy
```

## 💡 Petua Pro

### Alias untuk Aliran Kerja Lebih Pantas
```bash
# Tambah ke dalam .bashrc atau .zshrc anda
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

# Pelaksanaan pantas dengan pemantauan
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status persekitaran
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

# Bantuan khusus arahan
azd up --help
azd env --help
azd config --help

# Papar versi dan maklumat binaan
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

**Petua**: Tandakan helaian cheat ini dan gunakan `Ctrl+F` untuk mencari perintah yang anda perlukan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Semakan Preflight](../docs/pre-deployment/preflight-checks.md)
- **Pelajaran Seterusnya**: [Glosari](glossary.md)

---

> **💡 Mahu bantuan perintah Azure dalam editor anda?** Pasang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) dengan `npx skills add microsoft/github-copilot-for-azure` — 37 kemahiran untuk AI, Foundry, penerapan, diagnostik, dan banyak lagi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->