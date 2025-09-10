<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T21:48:53+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ms"
}
-->
# Isu & Penyelesaian Umum

## Pengenalan

Panduan penyelesaian masalah yang komprehensif ini merangkumi isu yang paling kerap berlaku semasa menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, menyelesaikan masalah, dan menangani isu biasa berkaitan pengesahan, penyebaran, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap isu disertakan dengan simptom terperinci, punca utama, dan langkah-langkah penyelesaian.

## Matlamat Pembelajaran

Dengan melengkapkan panduan ini, anda akan:
- Menguasai teknik diagnostik untuk isu Azure Developer CLI
- Memahami masalah pengesahan dan kebenaran yang biasa serta penyelesaiannya
- Menyelesaikan kegagalan penyebaran, kesilapan penyediaan infrastruktur, dan isu konfigurasi
- Melaksanakan strategi pemantauan dan penyahpepijat secara proaktif
- Mengaplikasikan metodologi penyelesaian masalah secara sistematik untuk isu kompleks
- Mengkonfigurasi log dan pemantauan yang betul untuk mencegah isu di masa hadapan

## Hasil Pembelajaran

Selepas melengkapkan panduan ini, anda akan dapat:
- Mendiagnosis isu Azure Developer CLI menggunakan alat diagnostik terbina
- Menyelesaikan masalah pengesahan, langganan, dan kebenaran secara berdikari
- Menyelesaikan kegagalan penyebaran dan kesilapan penyediaan infrastruktur dengan berkesan
- Menyahpepijat isu konfigurasi aplikasi dan masalah spesifik persekitaran
- Melaksanakan pemantauan dan amaran untuk mengenal pasti isu yang berpotensi secara proaktif
- Mengaplikasikan amalan terbaik untuk log, penyahpepijat, dan aliran kerja penyelesaian masalah

## Diagnostik Pantas

Sebelum menyelami isu tertentu, jalankan arahan berikut untuk mengumpul maklumat diagnostik:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## Isu Pengesahan

### Isu: "Gagal mendapatkan token akses"
**Simptom:**
- `azd up` gagal dengan kesilapan pengesahan
- Arahan mengembalikan "tidak dibenarkan" atau "akses ditolak"

**Penyelesaian:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Isu: "Kebenaran tidak mencukupi" semasa penyebaran
**Simptom:**
- Penyebaran gagal dengan kesilapan kebenaran
- Tidak dapat mencipta sumber Azure tertentu

**Penyelesaian:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Isu: Masalah pengesahan multi-penyewa
**Penyelesaian:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Kesilapan Penyediaan Infrastruktur

### Isu: Konflik nama sumber
**Simptom:**
- Kesilapan "Nama sumber sudah wujud"
- Penyebaran gagal semasa penciptaan sumber

**Penyelesaian:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### Isu: Lokasi/Region tidak tersedia
**Simptom:**
- "Lokasi 'xyz' tidak tersedia untuk jenis sumber"
- SKU tertentu tidak tersedia di region yang dipilih

**Penyelesaian:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### Isu: Kesilapan kuota melebihi
**Simptom:**
- "Kuota melebihi untuk jenis sumber"
- "Bilangan maksimum sumber telah dicapai"

**Penyelesaian:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Isu: Kesilapan templat Bicep
**Simptom:**
- Kegagalan pengesahan templat
- Kesilapan sintaks dalam fail Bicep

**Penyelesaian:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 Kegagalan Penyebaran

### Isu: Kegagalan binaan
**Simptom:**
- Aplikasi gagal dibina semasa penyebaran
- Kesilapan pemasangan pakej

**Penyelesaian:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Isu: Kegagalan penyebaran kontena
**Simptom:**
- Aplikasi kontena gagal dimulakan
- Kesilapan menarik imej

**Penyelesaian:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Isu: Kegagalan sambungan pangkalan data
**Simptom:**
- Aplikasi tidak dapat menyambung ke pangkalan data
- Kesilapan tamat masa sambungan

**Penyelesaian:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Isu Konfigurasi

### Isu: Pembolehubah persekitaran tidak berfungsi
**Simptom:**
- Aplikasi tidak dapat membaca nilai konfigurasi
- Pembolehubah persekitaran kelihatan kosong

**Penyelesaian:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Isu: Masalah sijil SSL/TLS
**Simptom:**
- HTTPS tidak berfungsi
- Kesilapan pengesahan sijil

**Penyelesaian:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Isu: Masalah konfigurasi CORS
**Simptom:**
- Frontend tidak dapat memanggil API
- Permintaan rentas asal disekat

**Penyelesaian:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 Isu Pengurusan Persekitaran

### Isu: Masalah penukaran persekitaran
**Simptom:**
- Persekitaran yang salah digunakan
- Konfigurasi tidak bertukar dengan betul

**Penyelesaian:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Isu: Kerosakan persekitaran
**Simptom:**
- Persekitaran menunjukkan keadaan tidak sah
- Sumber tidak sepadan dengan konfigurasi

**Penyelesaian:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 Isu Prestasi

### Isu: Masa penyebaran yang perlahan
**Simptom:**
- Penyebaran mengambil masa terlalu lama
- Tamat masa semasa penyebaran

**Penyelesaian:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### Isu: Masalah prestasi aplikasi
**Simptom:**
- Masa tindak balas yang perlahan
- Penggunaan sumber yang tinggi

**Penyelesaian:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Alat dan Arahan Penyelesaian Masalah

### Arahan Debug
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Analisis Log
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Penyiasatan Sumber
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Mendapatkan Bantuan Tambahan

### Bila Perlu Meningkatkan Isu
- Masalah pengesahan berterusan selepas mencuba semua penyelesaian
- Masalah infrastruktur dengan perkhidmatan Azure
- Isu berkaitan bil atau langganan
- Kebimbangan atau insiden keselamatan

### Saluran Sokongan
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Maklumat untuk Dikumpul
Sebelum menghubungi sokongan, kumpulkan:
- Output `azd version`
- Output `azd info`
- Mesej kesilapan (teks penuh)
- Langkah untuk menghasilkan semula isu
- Butiran persekitaran (`azd env show`)
- Garis masa bila isu bermula

### Skrip Pengumpulan Log
```bash
#!/bin/bash
# collect-debug-info.sh

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

### Senarai Semak Pra-Penyebaran
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### Persediaan Pemantauan
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Penyelenggaraan Berkala
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Sumber Berkaitan

- [Panduan Penyahpepijat](debugging.md) - Teknik penyahpepijat lanjutan
- [Penyediaan Sumber](../deployment/provisioning.md) - Penyelesaian masalah infrastruktur
- [Perancangan Kapasiti](../pre-deployment/capacity-planning.md) - Panduan perancangan sumber
- [Pemilihan SKU](../pre-deployment/sku-selection.md) - Cadangan peringkat perkhidmatan

---

**Tip**: Simpan panduan ini sebagai penanda buku dan rujuk apabila anda menghadapi isu. Kebanyakan masalah telah pernah berlaku sebelum ini dan mempunyai penyelesaian yang telah ditetapkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber](../deployment/provisioning.md)
- **Pelajaran Seterusnya**: [Panduan Penyahpepijat](debugging.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat yang kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.