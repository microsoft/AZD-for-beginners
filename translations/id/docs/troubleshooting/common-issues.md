<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T21:48:32+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "id"
}
-->
# Masalah Umum & Solusi

## Pendahuluan

Panduan pemecahan masalah yang komprehensif ini mencakup masalah yang paling sering ditemui saat menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, memecahkan masalah, dan menyelesaikan masalah umum terkait autentikasi, deployment, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap masalah mencakup gejala, penyebab utama, dan prosedur penyelesaian langkah demi langkah.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Menguasai teknik diagnostik untuk masalah Azure Developer CLI
- Memahami masalah umum terkait autentikasi dan izin serta solusinya
- Menyelesaikan kegagalan deployment, kesalahan penyediaan infrastruktur, dan masalah konfigurasi
- Menerapkan strategi pemantauan dan debugging secara proaktif
- Menggunakan metodologi pemecahan masalah yang sistematis untuk masalah kompleks
- Mengonfigurasi logging dan pemantauan yang tepat untuk mencegah masalah di masa depan

## Hasil Pembelajaran

Setelah menyelesaikan panduan ini, Anda akan dapat:
- Mendiagnosis masalah Azure Developer CLI menggunakan alat diagnostik bawaan
- Menyelesaikan masalah terkait autentikasi, langganan, dan izin secara mandiri
- Memecahkan kegagalan deployment dan kesalahan penyediaan infrastruktur secara efektif
- Debug masalah konfigurasi aplikasi dan masalah spesifik lingkungan
- Menerapkan pemantauan dan peringatan untuk mengidentifikasi potensi masalah secara proaktif
- Menggunakan praktik terbaik untuk logging, debugging, dan alur kerja penyelesaian masalah

## Diagnostik Cepat

Sebelum masuk ke masalah spesifik, jalankan perintah berikut untuk mengumpulkan informasi diagnostik:

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

## Masalah Autentikasi

### Masalah: "Gagal mendapatkan token akses"
**Gejala:**
- `azd up` gagal dengan kesalahan autentikasi
- Perintah mengembalikan "unauthorized" atau "access denied"

**Solusi:**
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

### Masalah: "Hak istimewa tidak mencukupi" selama deployment
**Gejala:**
- Deployment gagal dengan kesalahan izin
- Tidak dapat membuat sumber daya Azure tertentu

**Solusi:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Masalah: Masalah autentikasi multi-tenant
**Solusi:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Kesalahan Penyediaan Infrastruktur

### Masalah: Konflik nama sumber daya
**Gejala:**
- Kesalahan "Nama sumber daya sudah ada"
- Deployment gagal saat pembuatan sumber daya

**Solusi:**
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

### Masalah: Lokasi/Region tidak tersedia
**Gejala:**
- "Lokasi 'xyz' tidak tersedia untuk jenis sumber daya"
- SKU tertentu tidak tersedia di region yang dipilih

**Solusi:**
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

### Masalah: Kesalahan kuota terlampaui
**Gejala:**
- "Kuota terlampaui untuk jenis sumber daya"
- "Jumlah maksimum sumber daya tercapai"

**Solusi:**
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

### Masalah: Kesalahan template Bicep
**Gejala:**
- Validasi template gagal
- Kesalahan sintaks dalam file Bicep

**Solusi:**
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

## 🚀 Kegagalan Deployment

### Masalah: Kegagalan build
**Gejala:**
- Aplikasi gagal dibangun selama deployment
- Kesalahan instalasi paket

**Solusi:**
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

### Masalah: Kegagalan deployment container
**Gejala:**
- Aplikasi container gagal dimulai
- Kesalahan pengambilan gambar

**Solusi:**
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

### Masalah: Kegagalan koneksi database
**Gejala:**
- Aplikasi tidak dapat terhubung ke database
- Kesalahan waktu koneksi habis

**Solusi:**
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

## 🔧 Masalah Konfigurasi

### Masalah: Variabel lingkungan tidak berfungsi
**Gejala:**
- Aplikasi tidak dapat membaca nilai konfigurasi
- Variabel lingkungan tampak kosong

**Solusi:**
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

### Masalah: Masalah sertifikat SSL/TLS
**Gejala:**
- HTTPS tidak berfungsi
- Kesalahan validasi sertifikat

**Solusi:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Masalah: Masalah konfigurasi CORS
**Gejala:**
- Frontend tidak dapat memanggil API
- Permintaan lintas asal diblokir

**Solusi:**
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

## 🌍 Masalah Manajemen Lingkungan

### Masalah: Masalah pergantian lingkungan
**Gejala:**
- Lingkungan yang salah digunakan
- Konfigurasi tidak berganti dengan benar

**Solusi:**
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

### Masalah: Kerusakan lingkungan
**Gejala:**
- Lingkungan menunjukkan status tidak valid
- Sumber daya tidak sesuai dengan konfigurasi

**Solusi:**
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

## 🔍 Masalah Performa

### Masalah: Waktu deployment lambat
**Gejala:**
- Deployment memakan waktu terlalu lama
- Waktu habis selama deployment

**Solusi:**
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

### Masalah: Masalah performa aplikasi
**Gejala:**
- Waktu respons lambat
- Penggunaan sumber daya tinggi

**Solusi:**
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

## 🛠️ Alat dan Perintah Pemecahan Masalah

### Perintah Debug
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

### Investigasi Sumber Daya
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Mendapatkan Bantuan Tambahan

### Kapan Harus Meningkatkan Masalah
- Masalah autentikasi tetap ada setelah mencoba semua solusi
- Masalah infrastruktur dengan layanan Azure
- Masalah terkait penagihan atau langganan
- Kekhawatiran atau insiden keamanan

### Saluran Dukungan
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

### Informasi yang Harus Dikumpulkan
Sebelum menghubungi dukungan, kumpulkan:
- Output `azd version`
- Output `azd info`
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

## 📊 Pencegahan Masalah

### Daftar Periksa Pra-deployment
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

### Pengaturan Pemantauan
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

### Pemeliharaan Rutin
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## Sumber Daya Terkait

- [Panduan Debugging](debugging.md) - Teknik debugging lanjutan
- [Penyediaan Sumber Daya](../deployment/provisioning.md) - Pemecahan masalah infrastruktur
- [Perencanaan Kapasitas](../pre-deployment/capacity-planning.md) - Panduan perencanaan sumber daya
- [Pemilihan SKU](../pre-deployment/sku-selection.md) - Rekomendasi tingkat layanan

---

**Tip**: Simpan panduan ini sebagai bookmark dan rujuk kapan pun Anda menghadapi masalah. Sebagian besar masalah telah pernah terjadi sebelumnya dan memiliki solusi yang sudah ditetapkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber Daya](../deployment/provisioning.md)
- **Pelajaran Selanjutnya**: [Panduan Debugging](debugging.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.