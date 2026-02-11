# Isu Biasa dan Penyelesaian

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD For Beginners](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Penyahpepijatan
- **⬅️ Bab Sebelumnya**: [Bab 6: Semakan Pra-penerbangan](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Seterusnya**: [Panduan Penyahpepijatan](debugging.md)
- **🚀 Bab Seterusnya**: [Bab 8: Corak Produksi & Perusahaan](../chapter-08-production/production-ai-practices.md)

## Pengenalan

Panduan penyelesaian masalah komprehensif ini merangkumi isu yang paling kerap dihadapi semasa menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, menyelesaikan masalah, dan membetulkan masalah biasa berkaitan pengesahan, penerapan, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap isu termasuk simptom terperinci, punca akar, dan prosedur penyelesaian langkah demi langkah.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Menguasai teknik diagnostik untuk isu Azure Developer CLI
- Memahami masalah umum pengesahan dan kebenaran serta penyelesaiannya
- Menyelesaikan kegagalan penerapan, ralat penyediaan infrastruktur, dan isu konfigurasi
- Melaksanakan strategi pemantauan dan penyahpepijatan proaktif
- Mengaplikasikan metodologi penyelesaian masalah sistematik untuk masalah kompleks
- Mengkonfigurasi log dan pemantauan yang betul untuk mengelakkan isu masa depan

## Hasil Pembelajaran

Selepas selesai, anda akan dapat:
- Mendiagnosis isu Azure Developer CLI menggunakan alat diagnostik terbina dalam
- Menyelesaikan masalah berkaitan pengesahan, langganan, dan kebenaran secara kendiri
- Menyelesaikan masalah kegagalan penerapan dan ralat penyediaan infrastruktur dengan berkesan
- Menyahpepijat isu konfigurasi aplikasi dan masalah khusus persekitaran
- Melaksanakan pemantauan dan amaran untuk mengesan potensi isu secara proaktif
- Mengamalkan amalan terbaik untuk pencatatan, penyahpepijatan, dan aliran kerja penyelesaian masalah

## Diagnostik Pantas

Sebelum meneroka isu tertentu, jalankan arahan berikut untuk mengumpul maklumat diagnostik:

```bash
# Periksa versi azd dan kesihatan
azd version
azd config list

# Sahkan pengesahan ke Azure
az account show
az account list

# Periksa persekitaran semasa
azd env show
azd env get-values

# Dayakan log debug
export AZD_DEBUG=true
azd <command> --debug
```

## Isu Pengesahan

### Isu: "Gagal mendapatkan token akses"
**Gejala:**
- `azd up` gagal dengan ralat pengesahan
- Arahan memulangkan "tidak dibenarkan" atau "akses ditolak"

**Solutions:**
```bash
# 1. Autentik semula dengan Azure CLI
az login
az account show

# 2. Kosongkan kredensial yang di-cache
az account clear
az login

# 3. Gunakan aliran kod peranti (untuk sistem tanpa antara muka pengguna)
az login --use-device-code

# 4. Tetapkan langganan secara eksplisit
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Isu: "Kebenaran tidak mencukupi" semasa penerapan
**Gejala:**
- Penerapan gagal dengan ralat kebenaran
- Tidak dapat membuat sumber Azure tertentu

**Solutions:**
```bash
# 1. Semak penugasan peranan Azure anda
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Pastikan anda mempunyai peranan yang diperlukan
# - Contributor (untuk penciptaan sumber)
# - User Access Administrator (untuk penugasan peranan)

# 3. Hubungi pentadbir Azure anda untuk kebenaran yang sesuai
```

### Isu: Masalah pengesahan berbilang penyewa
**Solutions:**
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
**Gejala:**
- Ralat "Nama sumber sudah wujud"
- Penerapan gagal semasa penciptaan sumber

**Solutions:**
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

### Isu: Lokasi/Wilayah tidak tersedia
**Gejala:**
- Ralat "Lokasi 'xyz' tidak tersedia untuk jenis sumber"
- SKU tertentu tidak tersedia di wilayah yang dipilih

**Solutions:**
```bash
# 1. Semak lokasi yang tersedia untuk jenis sumber
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gunakan rantau yang biasa tersedia
azd config set defaults.location eastus2
# atau
azd env set AZURE_LOCATION eastus2

# 3. Semak ketersediaan perkhidmatan mengikut rantau
# Lawati: https://azure.microsoft.com/global-infrastructure/services/
```

### Isu: Kuota melebihi had
**Gejala:**
- Ralat "Kuota melebihi had untuk jenis sumber"
- Ralat "Bilangan maksimum sumber telah dicapai"

**Solutions:**
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
**Gejala:**
- Kegagalan pengesahan templat
- Ralat sintaks dalam fail Bicep

**Solutions:**
```bash
# 1. Sahkan sintaks Bicep
az bicep build --file infra/main.bicep

# 2. Gunakan linter Bicep
az bicep lint --file infra/main.bicep

# 3. Semak sintaks fail parameter
cat infra/main.parameters.json | jq '.'

# 4. Pratonton perubahan penyebaran
azd provision --preview
```

## 🚀 Kegagalan Penerapan

### Isu: Kegagalan bina
**Gejala:**
- Aplikasi gagal dibina semasa penerapan
- Ralat pemasangan pakej

**Solutions:**
```bash
# 1. Semak keluaran binaan dengan bendera debug
azd deploy --service web --debug

# 2. Lihat status perkhidmatan yang dikerahkan
azd show

# 3. Uji binaan secara tempatan
cd src/web
npm install
npm run build

# 3. Semak keserasian versi Node.js/Python
node --version  # Perlu sepadan dengan tetapan azure.yaml
python --version

# 4. Kosongkan cache binaan
rm -rf node_modules package-lock.json
npm install

# 5. Periksa Dockerfile jika menggunakan kontena
docker build -t test-image .
docker run --rm test-image
```

### Isu: Kegagalan penerapan kontena
**Gejala:**
- Aplikasi kontena gagal dimulakan
- Ralat penarikan imej

**Solutions:**
```bash
# 1. Uji pembinaan Docker secara tempatan
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Periksa log kontena menggunakan Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Pantau aplikasi melalui azd
azd monitor --logs

# 3. Sahkan akses daftar kontena
az acr login --name myregistry

# 4. Periksa konfigurasi aplikasi kontena
az containerapp show --name my-app --resource-group my-rg
```

### Isu: Kegagalan sambungan pangkalan data
**Gejala:**
- Aplikasi tidak dapat menyambung ke pangkalan data
- Ralat tamat masa sambungan

**Solutions:**
```bash
# 1. Semak peraturan firewall pangkalan data
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Uji sambungan daripada aplikasi
# Tambah sementara ke aplikasi anda:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Sahkan format rentetan sambungan
azd env get-values | grep DATABASE

# 4. Semak status pelayan pangkalan data
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Isu Konfigurasi

### Isu: Pembolehubah persekitaran tidak berfungsi
**Gejala:**
- Aplikasi tidak dapat membaca nilai konfigurasi
- Pembolehubah persekitaran kelihatan kosong

**Solutions:**
```bash
# 1. Sahkan pembolehubah persekitaran telah ditetapkan
azd env get-values
azd env get DATABASE_URL

# 2. Periksa nama pembolehubah dalam azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Mulakan semula aplikasi
azd deploy --service web

# 4. Periksa konfigurasi App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Isu: Masalah sijil SSL/TLS
**Gejala:**
- HTTPS tidak berfungsi
- Ralat pengesahan sijil

**Solutions:**
```bash
# 1. Semak status sijil SSL
az webapp config ssl list --resource-group myrg

# 2. Dayakan hanya HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Tambah domain tersuai (jika perlu)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isu: Masalah konfigurasi CORS
**Gejala:**
- Frontend tidak dapat memanggil API
- Permintaan lintas asal disekat

**Solutions:**
```bash
# 1. Konfigurasikan CORS untuk App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Kemas kini API untuk mengendalikan CORS
# Dalam Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Semak sama ada dijalankan pada URL yang betul
azd show
```

## 🌍 Isu Pengurusan Persekitaran

### Isu: Masalah penukaran persekitaran
**Gejala:**
- Persekitaran yang salah digunakan
- Konfigurasi tidak bertukar dengan betul

**Solutions:**
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

### Isu: Persekitaran rosak
**Gejala:**
- Persekitaran menunjukkan keadaan tidak sah
- Sumber tidak sepadan dengan konfigurasi

**Solutions:**
```bash
# 1. Segarkan keadaan persekitaran
azd env refresh

# 2. Tetapkan semula konfigurasi persekitaran
azd env new production-reset
# Salin pembolehubah persekitaran yang diperlukan
azd env set DATABASE_URL "your-value"

# 3. Import sumber sedia ada (jika boleh)
# Kemas kini .azure/production/config.json secara manual dengan ID sumber
```

## 🔍 Isu Prestasi

### Isu: Masa penerapan perlahan
**Gejala:**
- Penerapan mengambil masa terlalu lama
- Tamat masa semasa penerapan

**Solutions:**
```bash
# 1. Sebarkan perkhidmatan tertentu untuk iterasi lebih pantas
azd deploy --service web
azd deploy --service api

# 2. Gunakan penyebaran kod sahaja apabila infrastruktur tidak berubah
azd deploy  # Lebih pantas daripada azd up

# 3. Optimumkan proses pembinaan
# Dalam package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Semak lokasi sumber (gunakan rantau yang sama)
azd config set defaults.location eastus2
```

### Isu: Masalah prestasi aplikasi
**Gejala:**
- Masa respons perlahan
- Penggunaan sumber yang tinggi

**Solutions:**
```bash
# 1. Tingkatkan sumber daya
# Kemas kini SKU dalam main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Dayakan pemantauan Application Insights
azd monitor --overview

# 3. Semak log aplikasi di Azure
az webapp log tail --name myapp --resource-group myrg
# atau untuk Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Laksanakan caching
# Tambah cache Redis ke infrastruktur anda
```

## 🛠️ Alat dan Arahan Penyelesaian Masalah

### Arahan Debug
```bash
# Penyahpepijatan menyeluruh
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Semak versi azd
azd version

# Lihat konfigurasi semasa
azd config list

# Uji sambungan
curl -v https://myapp.azurewebsites.net/health
```

### Analisis Log
```bash
# Log aplikasi melalui Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Pantau aplikasi dengan azd
azd monitor --logs
azd monitor --live

# Log sumber Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Log kontena (untuk Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Siasatan Sumber
```bash
# Senaraikan semua sumber
az resource list --resource-group myrg -o table

# Semak status sumber
az webapp show --name myapp --resource-group myrg --query state

# Diagnostik rangkaian
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Mendapatkan Bantuan Tambahan

### Bila Perlu Mengeskalasi
- Isu pengesahan berterusan selepas mencuba semua penyelesaian
- Masalah infrastruktur dengan perkhidmatan Azure
- Isu berkaitan bil atau langganan
- Kebimbangan keselamatan atau insiden

### Saluran Sokongan
```bash
# 1. Semak Kesihatan Perkhidmatan Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Buat tiket sokongan Azure
# Pergi ke: https://portal.azure.com -> Bantuan + sokongan

# 3. Sumber komuniti
# - Stack Overflow: tag azure-developer-cli
# - Isu GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Soalan & Jawapan: https://learn.microsoft.com/en-us/answers/
```

### Maklumat untuk Dikumpulkan
Sebelum menghubungi sokongan, kumpulkan:
- Keluaran `azd version`
- Keluaran `azd config list`
- Keluaran `azd show` (status penerapan semasa)
- Mesej ralat (teks penuh)
- Langkah untuk menghasilkan semula isu
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
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Pencegahan Isu

### Senarai Semak Pra-penerapan
```bash
# 1. Sahkan pengesahan
az account show

# 2. Semak kuota dan had
az vm list-usage --location eastus2

# 3. Sahkan templat
az bicep build --file infra/main.bicep

# 4. Uji secara tempatan dahulu
npm run build
npm run test

# 5. Gunakan penyebaran percubaan
azd provision --preview
```

### Tetapan Pemantauan
```bash
# Dayakan Application Insights
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

# Semakan kos bulanan
az consumption usage list --billing-period-name 202401

# Semakan keselamatan suku tahunan
az security assessment list --resource-group myrg
```

## Sumber Berkaitan

- [Panduan Penyahpepijatan](debugging.md) - Teknik penyahpepijatan lanjutan
- [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md) - Penyelesaian masalah infrastruktur
- [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md) - Panduan perancangan sumber
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Cadangan tahap perkhidmatan

---

**Petua**: Simpan panduan ini sebagai penanda halaman dan rujuk ia bila anda menghadapi isu. Kebanyakan masalah telah dilihat sebelum ini dan mempunyai penyelesaian yang telah ditetapkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md)
- **Pelajaran Seterusnya**: [Panduan Penyahpepijatan](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Walaupun kami berusaha mencapai ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber rujukan utama. Untuk maklumat penting, disarankan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->