# Lembaran Cheat Perintah - Perintah AZD Penting

**Rujukan Pantas untuk Semua Bab**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Pantas**: [Bab 1: Asas & Mula Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pembangunan Utama AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pengenalan

Lembaran cheat lengkap ini menyediakan rujukan pantas untuk perintah Azure Developer CLI yang paling kerap digunakan, disusun mengikut kategori dengan contoh praktikal. Sesuai untuk rujukan cepat semasa pembangunan, penyelesaian masalah, dan operasi harian dengan projek azd.

## Matlamat Pembelajaran

Dengan menggunakan lembaran cheat ini, anda akan:
- Mempunyai akses segera kepada perintah dan sintaks Azure Developer CLI penting
- Memahami organisasi perintah mengikut kategori fungsi dan kes penggunaan
- Merujuk contoh praktikal untuk senario pembangunan dan penyebaran biasa
- Mengakses perintah penyelesaian masalah untuk penyelesaian isu pantas
- Menemui pilihan konfigurasi dan penyesuaian lanjutan dengan cekap
- Menemui perintah pengurusan persekitaran dan aliran kerja pelbagai persekitaran

## Hasil Pembelajaran

Dengan rujukan berkala kepada lembaran cheat ini, anda akan dapat:
- Melaksanakan perintah azd dengan yakin tanpa merujuk dokumentasi penuh
- Menyelesaikan isu biasa dengan cepat menggunakan perintah diagnostik yang sesuai
- Mengurus pelbagai persekitaran dan senario penyebaran dengan cekap
- Mengaplikasikan ciri dan pilihan konfigurasi azd lanjutan mengikut keperluan
- Menyelesaikan isu penyebaran menggunakan urutan perintah yang sistematik
- Mengoptimumkan aliran kerja melalui penggunaan pintasan dan pilihan azd yang berkesan

## Perintah Permulaan

### Pengesahan
```bash
# Log masuk ke Azure melalui AZD
azd auth login

# Log masuk ke Azure CLI (AZD menggunakan ini secara dalaman)
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

# Mulakan dari templat
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Mulakan dalam direktori semasa
azd init .

# Mulakan dengan nama tersuai
azd init --template todo-nodejs-mongo my-awesome-app
```

## Perintah Penyebaran Teras

### Aliran Kerja Penyebaran Lengkap
```bash
# Edar segala-galanya (sediakan + edar)
azd up

# Edar dengan arahan pengesahan dimatikan
azd up --confirm-with-no-prompt

# Edar ke persekitaran tertentu
azd up --environment production

# Edar dengan parameter khusus
azd up --parameter location=westus2
```

### Infrastruktur Sahaja
```bash
# Menyediakan sumber Azure
azd provision

# 🧪 Pratonton perubahan infrastruktur
azd provision --preview
# Menunjukkan paparan coba-jalankan mengenai sumber yang akan dicipta/diubah/dihapus
# Serupa dengan 'terraform plan' atau 'bicep what-if' - selamat untuk dijalankan, tiada perubahan dilakukan
```

### Aplikasi Sahaja
```bash
# Mengedarkan kod aplikasi
azd deploy

# Mengedarkan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Mengedarkan semua perkhidmatan
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

# Paparkan persekitaran semasa
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

# Alih keluar pembolehubah persekitaran
azd env unset DEBUG
```

## ⚙️ Perintah Konfigurasi

### Konfigurasi Global
```bash
# Senaraikan semua konfigurasi
azd config list

# Tetapkan lalai global
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Buang konfigurasi
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

# Buka blade log Application Insights
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

# Lihat log dari Pusat Azure
azd monitor --logs
```

### Pertanyaan Analitis Log
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

# Paksa hapus tanpa pengesahan
azd down --force

# Padam sumber yang dipadam secara lembut
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

## 🔧 Perintah Lanjutan

### Saluran Paip dan CI/CD
```bash
# Konfigurasikan GitHub Actions
azd pipeline config

# Konfigurasikan Azure DevOps
azd pipeline config --provider azdo

# Papar konfigurasi aliran kerja
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
# - Sumber yang akan diubah (kuning ~)
# - Sumber yang akan dipadam (merah -)
# Selamat dijalankan - tiada perubahan sebenar dibuat pada persekitaran Azure

# Sintesis infrastruktur dari azure.yaml
azd infra synth
```

### Maklumat Projek
```bash
# Papar status projek dan titik akhir
azd show

# Papar maklumat projek terperinci sebagai JSON
azd show --output json

# Dapatkan titik akhir perkhidmatan
azd show --output json | jq '.services'
```

## 🤖 Perintah AI & Sambungan

### Sambungan AZD
```bash
# Senaraikan semua sambungan yang tersedia (termasuk AI)
azd extension list

# Pasang sambungan agen Foundry
azd extension install azure.ai.agents

# Pasang sambungan penyempurnaan
azd extension install azure.ai.finetune

# Pasang sambungan model tersuai
azd extension install azure.ai.models

# Naik taraf semua sambungan yang dipasang
azd extension upgrade --all
```

### Perintah Ejen AI
```bash
# Mulakan projek ejen dari manifest
azd ai agent init -m <manifest-path-or-uri>

# Sasarkan projek Foundry tertentu
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Nyatakan direktori sumber ejen
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pilih sasaran penghosan
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### Pelayan MCP (Alpha)
```bash
# Mulakan pelayan MCP untuk projek anda
azd mcp start

# Uruskan persetujuan alat untuk operasi MCP
azd mcp consent
```

### Penjanaan Infrastruktur
```bash
# Jana fail IaC daripada definisi projek anda
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

# Lancarkan ke pembangunan
azd env new dev
azd up

# Buat perubahan dan lancarkan semula
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

# Uji dan tingkatkan ke staging
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

## 🔍 Perintah Debug

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

### Debug Templat
```bash
# Senaraikan templat tersedia dengan butiran
azd template list --output json

# Tunjukkan maklumat templat
azd template show <template-name>

# Sahkan templat sebelum inisiasi
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
azd config list --output json

# Parse dengan jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Jadual
```bash
# Format sebagai jadual
azd env list --output table

# Lihat perkhidmatan yang telah diterapkan
azd show --output json | jq '.services | keys'
```

## 🔧 Gabungan Perintah Biasa

### Skrip Semak Kesihatan
```bash
#!/bin/bash
# Pemeriksaan kesihatan pantas
azd show
azd env show
azd monitor --logs
```

### Pengesahan Penyebaran
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

## 🚨 Perintah Kecemasan

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

### Perintah Pemulihan
```bash
# Pulihkan dari pemasangan yang gagal - bersihkan dan pasang semula
azd down --force --purge
azd up

# Peruntukkan semula infrastruktur sahaja
azd provision

# Pasang semula aplikasi sahaja
azd deploy
```

## 💡 Petua Pro

### Alias untuk Aliran Kerja Lebih Cepat
```bash
# Tambah ke dalam .bashrc atau .zshrc anda
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Pintasan Fungsi
```bash
# Penukaran persekitaran yang pantas
azd-env() {
    azd env select $1 && azd show
}

# Penghantaran pantas dengan pemantauan
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

# Papar dokumentasi templat
azd template show <template-name> --docs
```

---

**Petua**: Tandai lembaran cheat ini dan gunakan `Ctrl+F` untuk mencari perintah yang anda perlukan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Semakan Pratonton](../docs/pre-deployment/preflight-checks.md)
- **Pelajaran Seterusnya**: [Glosari](glossary.md)

---

> **💡 Mahu bantuan perintah Azure dalam editor anda?** Pasang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) dengan `npx skills add microsoft/github-copilot-for-azure` — 37 kemahiran untuk AI, Foundry, penyebaran, diagnostik, dan banyak lagi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang kekeliruan atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->