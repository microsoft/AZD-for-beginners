# Isu dan Penyelesaian Biasa

**Navigasi Bab:**
- **📚 Rumah Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Pengesanan Ralat
- **⬅️ Bab Sebelumnya**: [Bab 6: Pemeriksaan Pra-penerbangan](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Seterusnya**: [Panduan Pengesanan Ralat](debugging.md)
- **🚀 Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Perniagaan](../chapter-08-production/production-ai-practices.md)

## Pengenalan

Panduan penyelesaian masalah yang menyeluruh ini merangkumi isu yang paling kerap ditemui apabila menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, menyelesaikan masalah, dan menyelesaikan masalah biasa dengan pengesahan, penerapan, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap isu merangkumi simptom terperinci, punca utama, dan prosedur penyelesaian langkah demi langkah.

## Matlamat Pembelajaran

Dengan melengkapkan panduan ini, anda akan:
- Menguasai teknik diagnostik untuk isu Azure Developer CLI
- Memahami masalah pengesahan dan kebenaran biasa serta penyelesaiannya
- Menyelesaikan kegagalan penerapan, ralat penyediaan infrastruktur, dan masalah konfigurasi
- Melaksanakan pemantauan dan strategi pengesanan ralat secara proaktif
- Mengaplikasikan metodologi penyelesaian masalah sistematik untuk masalah kompleks
- Mengkonfigurasi log dan pemantauan yang betul untuk mengelakkan masalah masa depan

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Mendiagnosis isu Azure Developer CLI menggunakan alat diagnostik terbina dalam
- Menyelesaikan masalah pengesahan, langganan, dan kebenaran secara berdikari
- Menyelesaikan masalah kegagalan penerapan dan ralat penyediaan infrastruktur dengan berkesan
- Mengesan masalah konfigurasi aplikasi dan masalah khusus persekitaran
- Melaksanakan pemantauan dan pemberitahuan untuk mengenal pasti potensi isu secara proaktif
- Mengaplikasikan amalan terbaik untuk pengendalian log, pengesanan ralat, dan aliran kerja penyelesaian masalah

## Diagnostik Pantas

Sebelum menyelami isu tertentu, jalankan arahan ini untuk mengumpul maklumat diagnostik:

```bash
# Semak versi dan kesihatan azd
azd version
azd config show

# Sahkan pengesahan Azure
az account show
az account list

# Semak persekitaran semasa
azd env list
azd env get-values

# Hidupkan log debug
export AZD_DEBUG=true
azd <command> --debug
```

## Isu Pengesahan

### Isu: "Gagal mendapat token akses"
**Simptom:**
- `azd up` gagal dengan ralat pengesahan
- Arahan memulangkan "tidak dibenarkan" atau "akses ditolak"

**Penyelesaian:**
```bash
# 1. Autentikasi semula dengan Azure CLI
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
- Tidak dapat membuat sumber Azure tertentu

**Penyelesaian:**
```bash
# 1. Semak penugasan peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Pastikan anda mempunyai peranan yang diperlukan
# - Penyumbang (untuk penciptaan sumber)
# - Pentadbir Akses Pengguna (untuk penugasan peranan)

# 3. Hubungi pentadbir Azure anda untuk kebenaran yang sesuai
```

### Isu: Masalah pengesahan multi-tenant
**Penyelesaian:**
```bash
# 1. Log masuk dengan penyewa tertentu
az login --tenant "your-tenant-id"

# 2. Tetapkan penyewa dalam konfigurasi
azd config set auth.tenantId "your-tenant-id"

# 3. Kosongkan cache penyewa jika menukar penyewa
az account clear
```

## 🏗️ Ralat Penyediaan Infrastruktur

### Isu: Konflik nama sumber
**Simptom:**
- Ralat "Nama sumber sudah wujud"
- Penerapan gagal semasa penciptaan sumber

**Penyelesaian:**
```bash
# 1. Gunakan nama sumber yang unik dengan token
# Dalam templat Bicep anda:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Tukar nama persekitaran
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Bersihkan sumber yang sedia ada
azd down --force --purge
```

### Isu: Lokasi/ Wilayah tidak tersedia
**Simptom:**
- "Lokasi 'xyz' tidak tersedia untuk jenis sumber"
- SKU tertentu tidak tersedia di wilayah yang dipilih

**Penyelesaian:**
```bash
# 1. Semak lokasi yang tersedia untuk jenis sumber
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gunakan wilayah yang biasa tersedia
azd config set defaults.location eastus2
# atau
azd env set AZURE_LOCATION eastus2

# 3. Semak ketersediaan perkhidmatan mengikut wilayah
# Lawati: https://azure.microsoft.com/global-infrastructure/services/
```

### Isu: Ralat kuota melebihi had
**Simptom:**
- "Kuota melebihi had untuk jenis sumber"
- "Bilangan maksimum sumber telah dicapai"

**Penyelesaian:**
```bash
# 1. Semak penggunaan kuota semasa
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

# 4. Pratonton perubahan penempatan
azd provision --preview
```

## 🚀 Kegagalan Penerapan

### Isu: Kegagalan bina
**Simptom:**
- Aplikasi gagal dibina semasa penerapan
- Ralat pemasangan pakej

**Penyelesaian:**
```bash
# 1. Semak hasil binaan dengan bendera debug
azd deploy --service web --debug

# 2. Lihat status perkhidmatan yang dipasang
azd show

# 3. Uji binaan secara tempatan
cd src/web
npm install
npm run build

# 3. Semak keserasian versi Node.js/Python
node --version  # Harus sepadan dengan tetapan azure.yaml
python --version

# 4. Kosongkan cache binaan
rm -rf node_modules package-lock.json
npm install

# 5. Semak Dockerfile jika menggunakan bekas
docker build -t test-image .
docker run --rm test-image
```

### Isu: Kegagalan penerapan kontena
**Simptom:**
- Aplikasi kontena gagal dimulakan
- Ralat tarik imej

**Penyelesaian:**
```bash
# 1. Uji binaan Docker secara tempatan
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Semak log kontena menggunakan Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Pantau aplikasi melalui azd
azd monitor --logs

# 3. Sahkan akses daftar kontena
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
# 1. Semak peraturan firewall pangkalan data
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Uji sambungan dari aplikasi
# Tambah ke aplikasi anda sementara waktu:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Sahkan format rentetan sambungan
azd env get-values | grep DATABASE

# 4. Semak status pelayan pangkalan data
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Isu Konfigurasi

### Isu: Pembolehubah persekitaran tidak berfungsi
**Simptom:**
- Aplikasi tidak dapat membaca nilai konfigurasi
- Pembolehubah persekitaran kelihatan kosong

**Penyelesaian:**
```bash
# 1. Sahkan pembolehubah persekitaran sudah ditetapkan
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
# 1. Semak status sijil SSL
az webapp config ssl list --resource-group myrg

# 2. Aktifkan hanya HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Tambah domain khusus (jika perlu)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isu: Masalah konfigurasi CORS
**Simptom:**
- Antara muka pengguna tidak dapat memanggil API
- Permintaan silang asal disekat

**Penyelesaian:**
```bash
# 1. Konfigurasikan CORS untuk Perkhidmatan Apl
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Kemas kini API untuk mengendalikan CORS
# Dalam Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Semak jika dijalankan pada URL yang betul
azd show
```

## 🌍 Isu Pengurusan Persekitaran

### Isu: Masalah penukaran persekitaran
**Simptom:**
- Persekitaran yang salah digunakan
- Konfigurasi tidak beralih dengan betul

**Penyelesaian:**
```bash
# 1. Senaraikan semua persekitaran
azd env list

# 2. Pilih persekitaran dengan jelas
azd env select production

# 3. Sahkan persekitaran semasa
azd env list

# 4. Cipta persekitaran baru jika rosak
azd env new production-new
azd env select production-new
```

### Isu: Kerosakan persekitaran
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
# 1. Lancarkan perkhidmatan tertentu untuk iterasi lebih pantas
azd deploy --service web
azd deploy --service api

# 2. Gunakan pelancaran kod sahaja apabila infrastruktur tidak berubah
azd deploy  # Lebih pantas daripada azd up

# 3. Optimumkan proses binaan
# Dalam package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Semak lokasi sumber (gunakan wilayah yang sama)
azd config set defaults.location eastus2
```

### Isu: Masalah prestasi aplikasi
**Simptom:**
- Masa tindak balas lambat
- Penggunaan sumber tinggi

**Penyelesaian:**
```bash
# 1. Tingkatkan sumber daya
# Kemas kini SKU dalam main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktifkan pemantauan Application Insights
azd monitor --overview

# 3. Semak log aplikasi di Azure
az webapp log tail --name myapp --resource-group myrg
# atau untuk Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Laksanakan caching
# Tambah Redis cache ke infrastruktur anda
```

## 🛠️ Alat dan Arahan Penyelesaian Masalah

### Arahan Penyahpepijatan
```bash
# Penyahpepijatan menyeluruh
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Semak versi azd
azd version

# Lihat konfigurasi semasa
azd config show

# Uji sambungan
curl -v https://myapp.azurewebsites.net/health
```

### Analisis Log
```bash
# Log aplikasi melalui Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Memantau aplikasi dengan azd
azd monitor --logs
azd monitor --live

# Log sumber Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Log bekas (untuk Aplikasi Bekas)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Penyiasatan Sumber
```bash
# Senaraikan semua sumber
az resource list --resource-group myrg -o table

# Semak status sumber
az webapp show --name myapp --resource-group myrg --query state

# Diagnostik rangkaian
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Mendapatkan Bantuan Tambahan

### Bila Perlu Dinaikkan
- Isu pengesahan berterusan selepas mencuba semua penyelesaian
- Masalah infrastruktur dengan perkhidmatan Azure
- Isu berkaitan bil dan langganan
- Kebimbangan atau insiden keselamatan

### Saluran Sokongan
```bash
# 1. Semak Kesihatan Perkhidmatan Azure
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
- Output `azd config show`
- Output `azd show` (status penerapan semasa)
- Mesej ralat (teks penuh)
- Langkah untuk menghasilkan isu
- Butiran persekitaran (`azd env get-values`)
- Garis masa bila isu bermula

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
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Pencegahan Isu

### Senarai Semak Pra-Penerapan
```bash
# 1. Sahkan pengesahan
az account show

# 2. Semak kuota dan had
az vm list-usage --location eastus2

# 3. Sahkan templat
az bicep build --file infra/main.bicep

# 4. Uji secara tempatan terlebih dahulu
npm run build
npm run test

# 5. Gunakan pelaksanaan percubaan suam
azd provision --preview
```

### Persediaan Pemantauan
```bash
# Hidupkan Application Insights
# Tambah ke main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Sediakan amaran
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

# Kajian kos bulanan
az consumption usage list --billing-period-name 202401

# Kajian keselamatan suku tahunan
az security assessment list --resource-group myrg
```

## Sumber Berkaitan

- [Panduan Pengesanan Ralat](debugging.md) - Teknik pengesanan ralat lanjutan
- [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md) - Penyelesaian masalah infrastruktur
- [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md) - Panduan perancangan sumber
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Cadangan tahap perkhidmatan

---

**Petua**: Simpan panduan ini sebagai penanda buku dan rujuk apabila menghadapi masalah. Kebanyakan masalah pernah ditemui sebelum ini dan sudah ada penyelesaian yang ditetapkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md)
- **Pelajaran Seterusnya**: [Panduan Pengesanan Ralat](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk mencapai ketepatan, sila sedari bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->