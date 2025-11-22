<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-22T09:39:50+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ms"
}
-->
# Isu dan Penyelesaian Biasa

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Debugging
- **⬅️ Bab Sebelumnya**: [Bab 6: Pemeriksaan Pra-penerbangan](../pre-deployment/preflight-checks.md)
- **➡️ Seterusnya**: [Panduan Debugging](debugging.md)
- **🚀 Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Enterprise](../microsoft-foundry/production-ai-practices.md)

## Pengenalan

Panduan penyelesaian masalah ini merangkumi isu-isu yang paling kerap berlaku semasa menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, menyelesaikan masalah, dan menangani isu-isu biasa berkaitan pengesahan, penerapan, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap isu disertakan dengan simptom, punca utama, dan langkah-langkah penyelesaian secara terperinci.

## Matlamat Pembelajaran

Dengan melengkapkan panduan ini, anda akan:
- Menguasai teknik diagnostik untuk isu Azure Developer CLI
- Memahami masalah pengesahan dan kebenaran biasa serta penyelesaiannya
- Menyelesaikan kegagalan penerapan, kesilapan penyediaan infrastruktur, dan isu konfigurasi
- Melaksanakan strategi pemantauan dan debugging secara proaktif
- Mengaplikasikan metodologi penyelesaian masalah secara sistematik untuk masalah yang kompleks
- Mengkonfigurasi log dan pemantauan yang betul untuk mencegah isu di masa hadapan

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Mendiagnosis isu Azure Developer CLI menggunakan alat diagnostik terbina
- Menyelesaikan masalah pengesahan, langganan, dan kebenaran secara berdikari
- Menyelesaikan kegagalan penerapan dan kesilapan penyediaan infrastruktur dengan berkesan
- Debug isu konfigurasi aplikasi dan masalah khusus persekitaran
- Melaksanakan pemantauan dan amaran untuk mengenal pasti isu yang berpotensi secara proaktif
- Mengaplikasikan amalan terbaik untuk log, debugging, dan aliran kerja penyelesaian masalah

## Diagnostik Pantas

Sebelum menyelami isu tertentu, jalankan arahan ini untuk mengumpul maklumat diagnostik:

```bash
# Periksa versi azd dan kesihatan
azd version
azd config list

# Sahkan pengesahan Azure
az account show
az account list

# Periksa persekitaran semasa
azd env show
azd env get-values

# Aktifkan log debug
export AZD_DEBUG=true
azd <command> --debug
```

## Isu Pengesahan

### Isu: "Gagal mendapatkan token akses"
**Simptom:**
- `azd up` gagal dengan ralat pengesahan
- Arahan mengembalikan "tidak dibenarkan" atau "akses ditolak"

**Penyelesaian:**
```bash
# 1. Pengesahan semula dengan Azure CLI
az login
az account show

# 2. Kosongkan kelayakan yang disimpan dalam cache
az account clear
az login

# 3. Gunakan aliran kod peranti (untuk sistem tanpa kepala)
az login --use-device-code

# 4. Tetapkan langganan secara eksplisit
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Isu: "Kebenaran tidak mencukupi" semasa penerapan
**Simptom:**
- Penerapan gagal dengan ralat kebenaran
- Tidak dapat mencipta sumber Azure tertentu

**Penyelesaian:**
```bash
# 1. Periksa tugasan peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Pastikan anda mempunyai peranan yang diperlukan
# - Penyumbang (untuk penciptaan sumber)
# - Pentadbir Akses Pengguna (untuk tugasan peranan)

# 3. Hubungi pentadbir Azure anda untuk kebenaran yang betul
```

### Isu: Masalah pengesahan multi-penyewa
**Penyelesaian:**
```bash
# 1. Log masuk dengan penyewa tertentu
az login --tenant "your-tenant-id"

# 2. Tetapkan penyewa dalam konfigurasi
azd config set auth.tenantId "your-tenant-id"

# 3. Kosongkan cache penyewa jika menukar penyewa
az account clear
```

## 🏗️ Kesilapan Penyediaan Infrastruktur

### Isu: Konflik nama sumber
**Simptom:**
- Ralat "Nama sumber sudah wujud"
- Penerapan gagal semasa penciptaan sumber

**Penyelesaian:**
```bash
# 1. Gunakan nama sumber unik dengan token
# Dalam templat Bicep anda:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Tukar nama persekitaran
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Bersihkan sumber sedia ada
azd down --force --purge
```

### Isu: Lokasi/Region tidak tersedia
**Simptom:**
- "Lokasi 'xyz' tidak tersedia untuk jenis sumber"
- SKU tertentu tidak tersedia di region yang dipilih

**Penyelesaian:**
```bash
# 1. Periksa lokasi yang tersedia untuk jenis sumber daya
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gunakan wilayah yang biasa tersedia
azd config set defaults.location eastus2
# atau
azd env set AZURE_LOCATION eastus2

# 3. Periksa ketersediaan perkhidmatan mengikut wilayah
# Lawati: https://azure.microsoft.com/global-infrastructure/services/
```

### Isu: Ralat kuota melebihi
**Simptom:**
- "Kuota melebihi untuk jenis sumber"
- "Bilangan maksimum sumber telah dicapai"

**Penyelesaian:**
```bash
# 1. Periksa penggunaan kuota semasa
az vm list-usage --location eastus2 -o table

# 2. Mohon peningkatan kuota melalui portal Azure
# Pergi ke: Langganan > Penggunaan + kuota

# 3. Gunakan SKU yang lebih kecil untuk pembangunan
# Dalam main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Bersihkan sumber yang tidak digunakan
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Isu: Ralat templat Bicep
**Simptom:**
- Kegagalan pengesahan templat
- Ralat sintaks dalam fail Bicep

**Penyelesaian:**
```bash
# 1. Sahkan sintaks Bicep
az bicep build --file infra/main.bicep

# 2. Gunakan linter Bicep
az bicep lint --file infra/main.bicep

# 3. Semak sintaks fail parameter
cat infra/main.parameters.json | jq '.'

# 4. Pratonton perubahan pengedaran
azd provision --preview
```

## 🚀 Kegagalan Penerapan

### Isu: Kegagalan binaan
**Simptom:**
- Aplikasi gagal dibina semasa penerapan
- Ralat pemasangan pakej

**Penyelesaian:**
```bash
# 1. Periksa log binaan
azd logs --service web
azd deploy --service web --debug

# 2. Uji binaan secara tempatan
cd src/web
npm install
npm run build

# 3. Periksa keserasian versi Node.js/Python
node --version  # Harus sepadan dengan tetapan azure.yaml
python --version

# 4. Kosongkan cache binaan
rm -rf node_modules package-lock.json
npm install

# 5. Periksa Dockerfile jika menggunakan kontena
docker build -t test-image .
docker run --rm test-image
```

### Isu: Kegagalan penerapan kontena
**Simptom:**
- Aplikasi kontena gagal dimulakan
- Ralat pengambilan imej

**Penyelesaian:**
```bash
# 1. Uji binaan Docker secara tempatan
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Semak log kontena
azd logs --service api --follow

# 3. Sahkan akses ke daftar kontena
az acr login --name myregistry

# 4. Semak konfigurasi aplikasi kontena
az containerapp show --name my-app --resource-group my-rg
```

### Isu: Kegagalan sambungan pangkalan data
**Simptom:**
- Aplikasi tidak dapat menyambung ke pangkalan data
- Ralat tamat masa sambungan

**Penyelesaian:**
```bash
# 1. Periksa peraturan firewall pangkalan data
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Uji kesambungan dari aplikasi
# Tambahkan ke aplikasi anda buat sementara waktu:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Sahkan format rentetan sambungan
azd env get-values | grep DATABASE

# 4. Periksa status pelayan pangkalan data
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Isu Konfigurasi

### Isu: Pembolehubah persekitaran tidak berfungsi
**Simptom:**
- Aplikasi tidak dapat membaca nilai konfigurasi
- Pembolehubah persekitaran kelihatan kosong

**Penyelesaian:**
```bash
# 1. Sahkan pembolehubah persekitaran telah ditetapkan
azd env get-values
azd env get DATABASE_URL

# 2. Semak nama pembolehubah dalam azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Mulakan semula aplikasi
azd deploy --service web

# 4. Semak konfigurasi perkhidmatan aplikasi
az webapp config appsettings list --name myapp --resource-group myrg
```

### Isu: Masalah sijil SSL/TLS
**Simptom:**
- HTTPS tidak berfungsi
- Ralat pengesahan sijil

**Penyelesaian:**
```bash
# 1. Periksa status sijil SSL
az webapp config ssl list --resource-group myrg

# 2. Aktifkan HTTPS sahaja
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Tambah domain tersuai (jika perlu)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isu: Masalah konfigurasi CORS
**Simptom:**
- Frontend tidak dapat memanggil API
- Permintaan silang asal disekat

**Penyelesaian:**
```bash
# 1. Konfigurasikan CORS untuk App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Kemas kini API untuk mengendalikan CORS
# Dalam Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Periksa jika berjalan pada URL yang betul
azd show
```

## 🌍 Isu Pengurusan Persekitaran

### Isu: Masalah penukaran persekitaran
**Simptom:**
- Persekitaran yang salah digunakan
- Konfigurasi tidak bertukar dengan betul

**Penyelesaian:**
```bash
# 1. Senaraikan semua persekitaran
azd env list

# 2. Pilih persekitaran secara eksplisit
azd env select production

# 3. Sahkan persekitaran semasa
azd env show

# 4. Cipta persekitaran baru jika rosak
azd env new production-new
azd env select production-new
```

### Isu: Keruntuhan persekitaran
**Simptom:**
- Persekitaran menunjukkan keadaan tidak sah
- Sumber tidak sepadan dengan konfigurasi

**Penyelesaian:**
```bash
# 1. Segarkan keadaan persekitaran
azd env refresh

# 2. Tetapkan semula konfigurasi persekitaran
azd env new production-reset
# Salin pembolehubah persekitaran yang diperlukan
azd env set DATABASE_URL "your-value"

# 3. Import sumber sedia ada (jika boleh)
# Kemas kini secara manual .azure/production/config.json dengan ID sumber
```

## 🔍 Isu Prestasi

### Isu: Masa penerapan yang perlahan
**Simptom:**
- Penerapan mengambil masa terlalu lama
- Tamat masa semasa penerapan

**Penyelesaian:**
```bash
# 1. Aktifkan penyebaran selari
azd config set deploy.parallelism 5

# 2. Gunakan penyebaran secara berperingkat
azd deploy --incremental

# 3. Optimumkan proses binaan
# Dalam package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Periksa lokasi sumber (gunakan wilayah yang sama)
azd config set defaults.location eastus2
```

### Isu: Masalah prestasi aplikasi
**Simptom:**
- Masa respons yang perlahan
- Penggunaan sumber yang tinggi

**Penyelesaian:**
```bash
# 1. Tingkatkan sumber daya
# Kemas kini SKU dalam main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktifkan pemantauan Application Insights
azd monitor

# 3. Periksa log aplikasi untuk mengenal pasti halangan
azd logs --service api --follow

# 4. Laksanakan caching
# Tambahkan cache Redis ke infrastruktur anda
```

## 🛠️ Alat dan Arahan Penyelesaian Masalah

### Arahan Debug
```bash
# Penyahpepijatan yang komprehensif
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Periksa maklumat sistem
azd info

# Sahkan konfigurasi
azd config validate

# Uji kesambungan
curl -v https://myapp.azurewebsites.net/health
```

### Analisis Log
```bash
# Log aplikasi
azd logs --service web --follow
azd logs --service api --since 1h

# Log sumber Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Log kontena (untuk Aplikasi Kontena)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Penyiasatan Sumber
```bash
# Senaraikan semua sumber
az resource list --resource-group myrg -o table

# Periksa status sumber
az webapp show --name myapp --resource-group myrg --query state

# Diagnostik rangkaian
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Mendapatkan Bantuan Tambahan

### Bila Perlu Meningkatkan
- Masalah pengesahan berterusan selepas mencuba semua penyelesaian
- Masalah infrastruktur dengan perkhidmatan Azure
- Isu berkaitan bil atau langganan
- Kebimbangan atau insiden keselamatan

### Saluran Sokongan
```bash
# 1. Periksa Kesihatan Perkhidmatan Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Cipta tiket sokongan Azure
# Pergi ke: https://portal.azure.com -> Bantuan + sokongan

# 3. Sumber komuniti
# - Stack Overflow: tag azure-developer-cli
# - Isu GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Maklumat untuk Dikumpul
Sebelum menghubungi sokongan, kumpulkan:
- Output `azd version`
- Output `azd info`
- Mesej ralat (teks penuh)
- Langkah-langkah untuk menghasilkan semula isu
- Butiran persekitaran (`azd env show`)
- Garis masa bila isu bermula

### Skrip Pengumpulan Log
```bash
#!/bin/bash
# kumpul-maklumat-debug.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Pencegahan Isu

### Senarai Semak Pra-penerapan
```bash
# 1. Sahkan pengesahan
az account show

# 2. Periksa kuota dan had
az vm list-usage --location eastus2

# 3. Sahkan templat
az bicep build --file infra/main.bicep

# 4. Uji secara tempatan terlebih dahulu
npm run build
npm run test

# 5. Gunakan penyebaran dry-run
azd provision --preview
```

### Persediaan Pemantauan
```bash
# Aktifkan Application Insights
# Tambah ke main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Tetapkan amaran
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Penyelenggaraan Berkala
```bash
# Pemeriksaan kesihatan mingguan
./scripts/health-check.sh

# Semakan kos bulanan
az consumption usage list --billing-period-name 202401

# Semakan keselamatan suku tahunan
az security assessment list --resource-group myrg
```

## Sumber Berkaitan

- [Panduan Debugging](debugging.md) - Teknik debugging lanjutan
- [Penyediaan Sumber](../deployment/provisioning.md) - Penyelesaian masalah infrastruktur
- [Perancangan Kapasiti](../pre-deployment/capacity-planning.md) - Panduan perancangan sumber
- [Pemilihan SKU](../pre-deployment/sku-selection.md) - Cadangan peringkat perkhidmatan

---

**Petua**: Simpan panduan ini sebagai penanda buku dan rujuk apabila anda menghadapi masalah. Kebanyakan isu telah pernah berlaku sebelum ini dan mempunyai penyelesaian yang telah ditetapkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber](../deployment/provisioning.md)
- **Pelajaran Seterusnya**: [Panduan Debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->