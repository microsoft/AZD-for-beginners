# Daftar Perintah Pintasan - Perintah AZD Penting

**Rujukan Pantas untuk Semua Bab**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Cepat**: [Bab 1: Asas & Mula Cepat](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Perintah AI**: [Bab 2: Pembangunan Utama AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Lanjutan**: [Bab 4: Infrastruktur sebagai Kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Pengenalan

Daftar pintasan menyeluruh ini menyediakan rujukan pantas untuk perintah Azure Developer CLI yang paling banyak digunakan, disusun mengikut kategori dengan contoh praktikal. Sesuai untuk rujukan pantas semasa pembangunan, penyelesaian masalah, dan operasi harian dengan projek azd.

## Matlamat Pembelajaran

Dengan menggunakan daftar pintasan ini, anda akan:
- Mendapat akses segera kepada perintah dan sintaks Azure Developer CLI yang penting
- Memahami organisasi perintah mengikut kategori fungsi dan kes penggunaan
- Merujuk contoh praktikal untuk senario pembangunan dan penyebaran biasa
- Mengakses perintah penyelesaian masalah untuk penyelesaian isu pantas
- Menemukan pilihan konfigurasi dan penyesuaian lanjutan dengan cekap
- Mengakses perintah pengurusan persekitaran dan aliran kerja berbilang persekitaran

## Hasil Pembelajaran

Dengan rujukan yang kerap kepada daftar pintasan ini, anda akan dapat:
- Melaksanakan perintah azd dengan yakin tanpa merujuk dokumentasi penuh
- Menyelesaikan isu biasa dengan cepat menggunakan perintah diagnostik yang sesuai
- Mengurus pelbagai persekitaran dan senario penyebaran dengan efisien
- Menerapkan ciri lanjutan azd dan pilihan konfigurasi apabila diperlukan
- Menyelesaikan masalah penyebaran menggunakan urutan perintah sistematik
- Mengoptimumkan aliran kerja melalui penggunaan pintasan dan pilihan azd secara berkesan

## Perintah Mula

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
# Sebarkan semua (sediakan + sebarkan)
azd up

# Sebarkan tanpa pengesahan pengesahan dilumpuhkan
azd up --confirm-with-no-prompt

# Sebarkan ke persekitaran tertentu
azd up --environment production

# Sebarkan dengan parameter tersuai
azd up --parameter location=westus2
```

### Infrastruktur Sahaja
```bash
# Menyediakan sumber Azure
azd provision

# 🧪 Pratonton perubahan infrastruktur
azd provision --preview
# Menunjukkan pandangan dry-run tentang sumber yang akan dibuat/diubah/dihapus
# Serupa dengan 'terraform plan' atau 'bicep what-if' - selamat dijalankan, tiada perubahan diterapkan
```

### Aplikasi Sahaja
```bash
# Menggunakan kod aplikasi
azd deploy

# Menggunakan perkhidmatan tertentu
azd deploy --service web
azd deploy --service api

# Menggunakan semua perkhidmatan
azd deploy --all
```

### Bina dan Pek
```bash
# Pulihkan (muat turun) pergantungan aplikasi
azd restore

# Pulihkan perkhidmatan tertentu
azd restore --service api

# Bina artifak yang boleh diterapkan tanpa menerapkannya
azd package

# Bina perkhidmatan tertentu
azd package --service api
```

> **`azd restore`** memuat turun kebergantungan aplikasi anda (npm, pip, NuGet, Maven, dll.). Ia dijalankan secara automatik semasa `azd package` dan `azd deploy`, jadi anda jarang memanggilnya secara langsung—jalankan secara manual untuk pra-muat kebergantungan (contohnya, untuk memanaskan cache CI atau bekerja secara luar talian selepas itu).

> **`azd package`** membina artifak yang boleh disebarkan (imej kontena atau zip) **tanpa** menolaknya ke Azure. Gunakannya secara berdiri sendiri untuk mengesahkan binaan berjaya, memeriksa output, atau menghasilkan artifak yang proses berasingan akan sebarkan kemudian. `azd deploy` membungkus secara automatik, jadi anda hanya perlukan `azd package` apabila anda mahu artifak tanpa penyebaran.


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

### Pembolehubah Persekitaran
```bash
# Tetapkan pembolehubah persekitaran
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Dapatkan pembolehubah persekitaran
azd env get API_KEY

# Senaraikan semua pembolehubah persekitaran
azd env get-values

# Buang pembolehubah persekitaran
azd env unset DEBUG
```

## ⚙️ Perintah Konfigurasi

### Konfigurasi Global
```bash
# Senaraikan semua konfigurasi
azd config show

# Tetapkan default global
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

# Tunjukkan maklumat projek
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

# Buka bilah log Application Insights
azd monitor --logs

# Buka tinjauan Application Insights
azd monitor --overview
```

### Melihat Log Kontena
```bash
# Lihat log melalui Azure CLI (untuk Aplikasi Kontena)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Ikuti log secara masa nyata
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Lihat log dari Azure Portal
azd monitor --logs
```

### Pertanyaan Analitik Log
```bash
# Akses Log Analytics melalui Azure Portal
azd monitor --logs

# Pertanyaan log menggunakan Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Perintah Penyelenggaraan

### Pembersihan
```bash
# Alih keluar semua sumber Azure
azd down

# Paksa hapus tanpa pengesahan
azd down --force

# Bersihkan sumber yang dipadam lembut
azd down --purge

# Pembersihan lengkap
azd down --force --purge
```

### Kemas Kini
```bash
# Periksa kemas kini azd
azd version

# Dapatkan versi semasa
azd version

# Lihat konfigurasi semasa
azd config show
```

## 🔧 Perintah Lanjutan

### Saluran dan CI/CD
```bash
# Konfigurasikan GitHub Actions
azd pipeline config

# Konfigurasikan Azure DevOps
azd pipeline config --provider azdo

# Paparkan konfigurasi pipeline
azd pipeline show
```

### Pengurusan Infrastruktur
```bash
# Hasilkan templat infrastruktur
azd infra generate

# 🧪 Pratonton & Perancangan Infrastruktur
azd provision --preview
# Mensimulasikan penyediaan infrastruktur tanpa melaksanakan
# Menganalisis templat Bicep/Terraform dan menunjukkan:
# - Sumber yang akan ditambah (hijau +)
# - Sumber yang akan diubah (kuning ~)
# - Sumber yang akan dipadam (merah -)
# Selamat untuk dijalankan - tiada perubahan sebenar dibuat pada persekitaran Azure

# Sintesis infrastruktur dari azure.yaml
azd infra synth
```

### Maklumat Projek
```bash
# Paparkan status projek dan titik hujung
azd show

# Paparkan maklumat projek terperinci sebagai JSON
azd show --output json

# Dapatkan titik hujung perkhidmatan
azd show --output json | jq '.services'
```

## 🤖 Perintah AI & Sambungan

### Sambungan AZD
```bash
# Senaraikan semua sambungan yang tersedia (termasuk AI)
azd extension list

# Pasang sambungan ejen Foundry
azd extension install azure.ai.agents

# Pasang sambungan kemahiran ejen (pratonton)
azd extension install azure.ai.skills

# Pasang sambungan sambungan Foundry (pratonton)
azd extension install azure.ai.connections

# Pasang sambungan penalaan halus
azd extension install azure.ai.finetune

# Pasang sambungan model tersuai
azd extension install azure.ai.models

# Tingkatkan semua sambungan yang dipasang
azd extension upgrade --all
```

### Perintah Ejen AI
```bash
# Inisialisasi projek ejen dari manifest
azd ai agent init -m <manifest-path-or-uri>

# Sasarkan projek Foundry tertentu
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Tentukan direktori sumber ejen
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Pilih sasaran hos
azd ai agent init -m agent-manifest.yaml --host containerapp

# Uji ejen yang telah dikerahkan (mencetak latensi + masa-ke-bait-pertama)
azd ai agent invoke

# Tunjukkan konfigurasi titik akhir secara langsung
azd ai agent endpoint show

# Jana set data penilaian, kemudian optimakan ejen
azd ai agent eval generate
azd ai agent optimize

# Muat turun sumber yang dikerahkan bagi ejen yang dihoskan berasaskan kod
azd ai agent code download

# Padamkan ejen yang dihoskan dan semua versinya (--force tamatkan sesi aktif)
azd ai agent delete --force
```

### Pelayan MCP (Alpha)
```bash
# Mulakan pelayan MCP untuk projek anda
azd mcp start

# Urus persetujuan alat untuk operasi MCP
azd copilot consent list
```

### Penghasilan Infrastruktur
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

# Lancarkan ke pembangunan
azd env new dev
azd up

# Buat perubahan dan lancarkan semula
azd deploy

# Buka papan pemuka pemantauan
azd monitor --live
```

### Aliran Kerja Berbilang Persekitaran
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

# Semak status sumber daya
azd show --output json
```

## 🔍 Perintah Pengesanan Ralat

### Maklumat Pengesanan Ralat
```bash
# Hidupkan output debug
export AZD_DEBUG=true
azd <command> --debug

# Nyahaktifkan telemetri untuk output yang lebih bersih
export AZD_DISABLE_TELEMETRY=true

# Semak konfigurasi semasa
azd config show

# Semak status pengesahan
az account show
```

### Pengesanan Ralat Templat
```bash
# Senaraikan templat yang tersedia dengan butiran
azd template list --output json

# Tunjukkan maklumat templat
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

# Parse dengan jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Output Jadual
```bash
# Format sebagai jadual
azd env list --output table

# Lihat perkhidmatan yang telah disebarkan
azd show --output json | jq '.services | keys'
```

## 🔧 Gabungan Perintah Lazim

### Skrip Pemeriksaan Kesihatan
```bash
#!/bin/bash
# Semakan kesihatan pantas
azd show
azd env get-values
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
# Pulihkan dari penyebaran yang gagal - bersihkan dan sebarkan semula
azd down --force --purge
azd up

# Sediakan semula infrastruktur sahaja
azd provision

# Sebarkan semula aplikasi sahaja
azd deploy
```

## 💡 Petua Pro

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

# Penempatan pantas dengan pemantauan
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

# Tunjukkan dokumentasi templat
azd template show <template-name> --docs
```

---

**Petua**: Tandakan senarai pintasan ini dan gunakan `Ctrl+F` untuk mencari perintah yang anda perlukan dengan cepat!

---

**Navigasi**
- **Pelajaran Sebelum**: [Semakan Preflight](../docs/pre-deployment/preflight-checks.md)
- **Pelajaran Seterusnya**: [Glosari](glossary.md)

---

> **💡 Mahu bantuan arahan Azure dalam penyunting anda?** Pasang [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) dengan `npx skills add microsoft/github-copilot-for-azure` — 37 kemahiran untuk AI, Foundry, penyebaran, diagnostik, dan banyak lagi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->