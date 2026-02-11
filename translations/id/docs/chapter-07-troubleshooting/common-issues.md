# Masalah Umum dan Solusi

**Navigasi Bab:**
- **📚 Course Home**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 7 - Pemecahan Masalah & Debugging
- **⬅️ Bab Sebelumnya**: [Bab 6: Pemeriksaan Pra-penerapan](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Berikutnya**: [Panduan Debugging](debugging.md)
- **🚀 Bab Berikutnya**: [Bab 8: Pola Produksi & Perusahaan](../chapter-08-production/production-ai-practices.md)

## Pendahuluan

Panduan pemecahan masalah komprehensif ini mencakup masalah yang paling sering ditemui saat menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, memecahkan masalah, dan menyelesaikan masalah umum terkait autentikasi, penerapan, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap masalah mencakup gejala terperinci, penyebab akar, dan prosedur penyelesaian langkah demi langkah.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Menguasai teknik diagnosis untuk masalah Azure Developer CLI
- Memahami masalah umum autentikasi dan izin serta solusinya
- Menyelesaikan kegagalan penerapan, kesalahan penyediaan infrastruktur, dan masalah konfigurasi
- Menerapkan strategi pemantauan dan debugging proaktif
- Menerapkan metodologi pemecahan masalah sistematis untuk masalah kompleks
- Mengonfigurasi logging dan pemantauan yang tepat untuk mencegah masalah di masa depan

## Hasil Pembelajaran

Setelah menyelesaikan, Anda akan mampu:
- Mendiagnosis masalah Azure Developer CLI menggunakan alat diagnostik bawaan
- Menyelesaikan masalah terkait autentikasi, langganan, dan izin secara mandiri
- Menangani kegagalan penerapan dan kesalahan penyediaan infrastruktur secara efektif
- Debug masalah konfigurasi aplikasi dan masalah spesifik lingkungan
- Menerapkan pemantauan dan pemberitahuan untuk mengidentifikasi potensi masalah secara proaktif
- Menerapkan praktik terbaik untuk logging, debugging, dan alur kerja penyelesaian masalah

## Diagnostik Cepat

Sebelum masuk ke masalah spesifik, jalankan perintah ini untuk mengumpulkan informasi diagnostik:

```bash
# Periksa versi azd dan status kesehatan
azd version
azd config list

# Verifikasi autentikasi Azure
az account show
az account list

# Periksa lingkungan saat ini
azd env show
azd env get-values

# Aktifkan pencatatan debug
export AZD_DEBUG=true
azd <command> --debug
```

## Masalah Autentikasi

### Masalah: "Gagal mendapatkan access token"
**Gejala:**
- `azd up` gagal dengan kesalahan autentikasi
- Perintah mengembalikan "unauthorized" atau "access denied"

**Solusi:**
```bash
# 1. Autentikasi ulang dengan Azure CLI
az login
az account show

# 2. Hapus kredensial yang disimpan di cache
az account clear
az login

# 3. Gunakan alur kode perangkat (untuk sistem tanpa antarmuka)
az login --use-device-code

# 4. Tetapkan langganan secara eksplisit
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Masalah: "Insufficient privileges" saat penerapan
**Gejala:**
- Penerapan gagal dengan kesalahan izin
- Tidak dapat membuat beberapa sumber daya Azure

**Solusi:**
```bash
# 1. Periksa penugasan peran Azure Anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Pastikan Anda memiliki peran yang diperlukan
# - Contributor (untuk pembuatan sumber daya)
# - User Access Administrator (untuk penugasan peran)

# 3. Hubungi administrator Azure Anda untuk mendapatkan izin yang sesuai
```

### Masalah: Masalah autentikasi multi-tenant
**Solusi:**
```bash
# 1. Masuk dengan tenant tertentu
az login --tenant "your-tenant-id"

# 2. Atur tenant dalam konfigurasi
azd config set auth.tenantId "your-tenant-id"

# 3. Bersihkan cache tenant jika beralih tenant
az account clear
```

## 🏗️ Kesalahan Penyediaan Infrastruktur

### Masalah: Konflik nama sumber daya
**Gejala:**
- Kesalahan "The resource name already exists"
- Penerapan gagal saat pembuatan sumber daya

**Solusi:**
```bash
# 1. Gunakan nama sumber daya unik dengan token
# Dalam template Bicep Anda:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Ubah nama lingkungan
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Bersihkan sumber daya yang ada
azd down --force --purge
```

### Masalah: Lokasi/Region tidak tersedia
**Gejala:**
- Kesalahan "The location 'xyz' is not available for resource type"
- Beberapa SKU tidak tersedia di region yang dipilih

**Solusi:**
```bash
# 1. Periksa lokasi yang tersedia untuk jenis sumber daya
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gunakan wilayah yang umum tersedia
azd config set defaults.location eastus2
# atau
azd env set AZURE_LOCATION eastus2

# 3. Periksa ketersediaan layanan berdasarkan wilayah
# Kunjungi: https://azure.microsoft.com/global-infrastructure/services/
```

### Masalah: Kesalahan kuota terlampaui
**Gejala:**
- Kesalahan "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Solusi:**
```bash
# 1. Periksa penggunaan kuota saat ini
az vm list-usage --location eastus2 -o table

# 2. Minta peningkatan kuota melalui portal Azure
# Buka: Langganan > Penggunaan + kuota

# 3. Gunakan SKU yang lebih kecil untuk pengembangan
# Di main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Bersihkan sumber daya yang tidak terpakai
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Masalah: Kesalahan template Bicep
**Gejala:**
- Kegagalan validasi template
- Kesalahan sintaks di file Bicep

**Solusi:**
```bash
# 1. Validasi sintaks Bicep
az bicep build --file infra/main.bicep

# 2. Gunakan linter Bicep
az bicep lint --file infra/main.bicep

# 3. Periksa sintaks file parameter
cat infra/main.parameters.json | jq '.'

# 4. Pratinjau perubahan penyebaran
azd provision --preview
```

## 🚀 Kegagalan Penerapan

### Masalah: Kegagalan build
**Gejala:**
- Aplikasi gagal dibangun selama penerapan
- Kesalahan instalasi paket

**Solusi:**
```bash
# 1. Periksa hasil build dengan flag debug
azd deploy --service web --debug

# 2. Lihat status layanan yang dideploy
azd show

# 3. Uji build secara lokal
cd src/web
npm install
npm run build

# 3. Periksa kompatibilitas versi Node.js/Python
node --version  # Harus sesuai dengan pengaturan azure.yaml
python --version

# 4. Bersihkan cache build
rm -rf node_modules package-lock.json
npm install

# 5. Periksa Dockerfile jika menggunakan kontainer
docker build -t test-image .
docker run --rm test-image
```

### Masalah: Kegagalan penerapan kontainer
**Gejala:**
- Aplikasi kontainer gagal mulai
- Kesalahan pull image

**Solusi:**
```bash
# 1. Uji pembuatan Docker secara lokal
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Periksa log container menggunakan Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Pantau aplikasi melalui azd
azd monitor --logs

# 3. Verifikasi akses registri container
az acr login --name myregistry

# 4. Periksa konfigurasi aplikasi container
az containerapp show --name my-app --resource-group my-rg
```

### Masalah: Kegagalan koneksi database
**Gejala:**
- Aplikasi tidak dapat terhubung ke database
- Kesalahan timeout koneksi

**Solusi:**
```bash
# 1. Periksa aturan firewall database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Uji konektivitas dari aplikasi
# Tambahkan ke aplikasi Anda sementara:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifikasi format string koneksi
azd env get-values | grep DATABASE

# 4. Periksa status server database
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Masalah Konfigurasi

### Masalah: Variabel lingkungan tidak berfungsi
**Gejala:**
- Aplikasi tidak dapat membaca nilai konfigurasi
- Variabel lingkungan terlihat kosong

**Solusi:**
```bash
# 1. Verifikasi variabel lingkungan sudah disetel
azd env get-values
azd env get DATABASE_URL

# 2. Periksa nama variabel di azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Mulai ulang aplikasi
azd deploy --service web

# 4. Periksa konfigurasi layanan aplikasi
az webapp config appsettings list --name myapp --resource-group myrg
```

### Masalah: Masalah sertifikat SSL/TLS
**Gejala:**
- HTTPS tidak berfungsi
- Kesalahan validasi sertifikat

**Solusi:**
```bash
# 1. Periksa status sertifikat SSL
az webapp config ssl list --resource-group myrg

# 2. Aktifkan hanya HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Tambahkan domain kustom (jika perlu)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Masalah: Masalah konfigurasi CORS
**Gejala:**
- Frontend tidak dapat memanggil API
- Permintaan lintas asal diblokir

**Solusi:**
```bash
# 1. Konfigurasikan CORS untuk App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Perbarui API untuk menangani CORS
# Di Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Periksa apakah berjalan pada URL yang benar
azd show
```

## 🌍 Masalah Manajemen Lingkungan

### Masalah: Pergantian lingkungan
**Gejala:**
- Lingkungan yang salah digunakan
- Konfigurasi tidak berpindah dengan benar

**Solusi:**
```bash
# 1. Daftar semua lingkungan
azd env list

# 2. Pilih lingkungan secara eksplisit
azd env select production

# 3. Verifikasi lingkungan saat ini
azd env show

# 4. Buat lingkungan baru jika rusak
azd env new production-new
azd env select production-new
```

### Masalah: Kerusakan lingkungan
**Gejala:**
- Lingkungan menunjukkan status tidak valid
- Sumber daya tidak sesuai dengan konfigurasi

**Solusi:**
```bash
# 1. Segarkan status lingkungan
azd env refresh

# 2. Atur ulang konfigurasi lingkungan
azd env new production-reset
# Salin variabel lingkungan yang diperlukan
azd env set DATABASE_URL "your-value"

# 3. Impor sumber daya yang ada (jika memungkinkan)
# Perbarui secara manual .azure/production/config.json dengan ID sumber daya
```

## 🔍 Masalah Performa

### Masalah: Waktu penerapan lambat
**Gejala:**
- Penerapan memakan waktu terlalu lama
- Timeout selama penerapan

**Solusi:**
```bash
# 1. Terapkan layanan tertentu untuk iterasi yang lebih cepat
azd deploy --service web
azd deploy --service api

# 2. Gunakan penyebaran hanya kode ketika infrastruktur tidak berubah
azd deploy  # Lebih cepat daripada azd up

# 3. Optimalkan proses build
# Di package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Periksa lokasi sumber daya (gunakan wilayah yang sama)
azd config set defaults.location eastus2
```

### Masalah: Masalah performa aplikasi
**Gejala:**
- Waktu respons lambat
- Penggunaan sumber daya tinggi

**Solusi:**
```bash
# 1. Tingkatkan sumber daya
# Perbarui SKU di main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktifkan pemantauan Application Insights
azd monitor --overview

# 3. Periksa log aplikasi di Azure
az webapp log tail --name myapp --resource-group myrg
# atau untuk Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Terapkan caching
# Tambahkan cache Redis ke infrastruktur Anda
```

## 🛠️ Alat dan Perintah Pemecahan Masalah

### Perintah Debug
```bash
# Debugging komprehensif
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Periksa versi azd
azd version

# Lihat konfigurasi saat ini
azd config list

# Uji konektivitas
curl -v https://myapp.azurewebsites.net/health
```

### Analisis Log
```bash
# Log aplikasi melalui Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Pantau aplikasi dengan azd
azd monitor --logs
azd monitor --live

# Log sumber daya Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Log container (untuk Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Investigasi Sumber Daya
```bash
# Daftar semua sumber daya
az resource list --resource-group myrg -o table

# Periksa status sumber daya
az webapp show --name myapp --resource-group myrg --query state

# Diagnostik jaringan
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Mendapatkan Bantuan Tambahan

### Kapan Harus Eskalasi
- Masalah autentikasi tetap ada setelah mencoba semua solusi
- Masalah infrastruktur pada layanan Azure
- Masalah terkait tagihan atau langganan
- Kekhawatiran atau insiden keamanan

### Saluran Dukungan
```bash
# 1. Periksa Kesehatan Layanan Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Buat tiket dukungan Azure
# Buka: https://portal.azure.com -> Bantuan + dukungan

# 3. Sumber daya komunitas
# - Stack Overflow: tag azure-developer-cli
# - Isu GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informasi yang Perlu Dikumpulkan
Sebelum menghubungi dukungan, kumpulkan:
- `azd version` keluaran
- `azd config list` keluaran
- `azd show` keluaran (status penerapan saat ini)
- Pesan kesalahan (teks lengkap)
- Langkah-langkah untuk mereproduksi masalah
- Detail lingkungan (`azd env show`)
- Garis waktu kapan masalah dimulai

### Skrip Pengumpulan Log
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Pencegahan Masalah

### Daftar Periksa Pra-penerapan
```bash
# 1. Validasi otentikasi
az account show

# 2. Periksa kuota dan batasan
az vm list-usage --location eastus2

# 3. Validasi templat
az bicep build --file infra/main.bicep

# 4. Uji secara lokal terlebih dahulu
npm run build
npm run test

# 5. Gunakan penyebaran uji coba
azd provision --preview
```

### Pengaturan Pemantauan
```bash
# Aktifkan Application Insights
# Tambahkan ke main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Siapkan peringatan
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Pemeliharaan Rutin
```bash
# Pemeriksaan kesehatan mingguan
./scripts/health-check.sh

# Tinjauan biaya bulanan
az consumption usage list --billing-period-name 202401

# Tinjauan keamanan triwulanan
az security assessment list --resource-group myrg
```

## Sumber Daya Terkait

- [Panduan Debugging](debugging.md) - Teknik debugging lanjutan
- [Penyediaan Sumber Daya](../chapter-04-infrastructure/provisioning.md) - Pemecahan masalah infrastruktur
- [Perencanaan Kapasitas](../chapter-06-pre-deployment/capacity-planning.md) - Panduan perencanaan sumber daya
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Rekomendasi tingkat layanan

---

**Tip**: Simpan panduan ini di bookmark dan rujuk saat Anda menemui masalah. Sebagian besar masalah pernah terjadi sebelumnya dan memiliki solusi yang sudah ditetapkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber Daya](../chapter-04-infrastructure/provisioning.md)
- **Pelajaran Berikutnya**: [Panduan Debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha seakurat mungkin, harap diketahui bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas segala kesalahpahaman atau salah tafsir yang timbul akibat penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->