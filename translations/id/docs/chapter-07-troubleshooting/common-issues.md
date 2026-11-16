# Masalah Umum dan Solusi

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 7 - Pemecahan Masalah & Debugging
- **⬅️ Bab Sebelumnya**: [Bab 6: Pemeriksaan Awal](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Berikutnya**: [Panduan Debugging](debugging.md)
- **🚀 Bab Berikutnya**: [Bab 8: Pola Produksi & Enterprise](../chapter-08-production/production-ai-practices.md)

## Pendahuluan

Panduan pemecahan masalah komprehensif ini mencakup masalah yang paling sering ditemui saat menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, memecahkan masalah, dan menyelesaikan masalah umum dengan otentikasi, penyebaran, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap masalah mencakup gejala rinci, penyebab utama, dan prosedur penyelesaian langkah demi langkah.

## Tujuan Pembelajaran

Dengan menyelesaikan panduan ini, Anda akan:
- Menguasai teknik diagnostik untuk masalah Azure Developer CLI
- Memahami masalah umum otentikasi dan izin serta solusinya
- Menyelesaikan kegagalan penyebaran, kesalahan penyediaan infrastruktur, dan masalah konfigurasi
- Menerapkan strategi pemantauan dan debugging proaktif
- Menerapkan metodologi pemecahan masalah sistematis untuk masalah kompleks
- Mengkonfigurasi pencatatan dan pemantauan yang tepat untuk mencegah masalah di masa depan

## Hasil Pembelajaran

Setelah menyelesaikan, Anda akan mampu:
- Mendiagnosis masalah Azure Developer CLI menggunakan alat diagnostik bawaan
- Menyelesaikan masalah otentikasi, langganan, dan izin secara mandiri
- Memecahkan masalah kegagalan penyebaran dan kesalahan penyediaan infrastruktur secara efektif
- Debug masalah konfigurasi aplikasi dan masalah khusus lingkungan
- Menerapkan pemantauan dan pemberitahuan untuk mengidentifikasi masalah potensial secara proaktif
- Menerapkan praktik terbaik untuk pencatatan, debugging, dan alur kerja penyelesaian masalah

## Diagnostik Cepat

> Ganti nama/ID contoh dengan nilai lingkungan Anda. Fragmen Bash, Bicep, JavaScript, dan file parameter dilabeli terpisah di bawah; mereka bukan satu skrip yang dapat dieksekusi. Tinjau operasi destruktif dan hapus data rahasia sebelum membagikan diagnostik. `azd monitor --logs` membuka browser; itu tidak menampilkan log terminal secara langsung.

Sebelum masuk ke masalah spesifik, jalankan perintah ini untuk mengumpulkan informasi diagnostik:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## Masalah Otentikasi

### Masalah: "Gagal mendapatkan token akses"
**Gejala:**
- `azd up` gagal dengan kesalahan otentikasi
- Perintah mengembalikan "tidak sah" atau "akses ditolak"

**Solusi:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### Masalah: "Hak istimewa tidak cukup" selama penyebaran
**Gejala:**
- Penyebaran gagal dengan kesalahan izin
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

### Masalah: Masalah otentikasi multi-tenant
**Solusi:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Kesalahan Penyediaan Infrastruktur

### Masalah: Konflik nama sumber daya
**Gejala:**
- Kesalahan "Nama sumber daya sudah ada"
- Penyebaran gagal saat pembuatan sumber daya

**Solusi:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### Masalah: Lokasi/Region tidak tersedia
**Gejala:**
- "Lokasi 'xyz' tidak tersedia untuk jenis sumber daya"
- SKU tertentu tidak tersedia di region yang dipilih

**Solusi:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Mengubah variabel lokasi tidak memindahkan sumber daya yang ada. Grup sumber daya atau sumber daya yang ada mungkin menolak perubahan lokasi; gunakan lingkungan terpisah untuk penyebaran regional ulang.

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

```

Untuk pengembangan, pilih SKU kecil yang didukung di `infra/main.parameters.json`:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Masalah: Kesalahan template Bicep
**Gejala:**
- Kegagalan validasi template
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

## 🚀 Kegagalan Penyebaran

### Masalah: Kegagalan build
**Gejala:**
- Aplikasi gagal dibangun saat penyebaran
- Kesalahan instalasi paket

**Solusi:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### Masalah: Kegagalan penyebaran kontainer
**Gejala:**
- Aplikasi kontainer gagal mulai
- Kesalahan penarikan image

**Solusi:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### Masalah: Kegagalan koneksi basis data
**Gejala:**
- Aplikasi tidak dapat terhubung ke basis data
- Kesalahan batas waktu koneksi

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
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

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

```

2. Perbarui aplikasi Express Anda yang sudah ada (dengan `cors` diimpor):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
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
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### Masalah: Korupsi lingkungan
**Gejala:**
- Lingkungan menunjukkan status tidak valid
- Sumber daya tidak cocok dengan konfigurasi

**Solusi:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Masalah Kinerja

### Masalah: Waktu penyebaran lambat
**Gejala:**
- Penyebaran memakan waktu terlalu lama
- Timeout selama penyebaran

**Solusi:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### Masalah: Masalah kinerja aplikasi
**Gejala:**
- Waktu respons lambat
- Penggunaan sumber daya tinggi

**Solusi:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ Alat dan Perintah Pemecahan Masalah

### Perintah Debug
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### Analisis Log
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

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

### Kapan Harus Menaikkan Masalah
- Masalah otentikasi berlanjut setelah mencoba semua solusi
- Masalah infrastruktur dengan layanan Azure
- Masalah terkait tagihan atau langganan
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
- Output `azd config show`
- Output `azd show` (status penyebaran saat ini)
- Pesan kesalahan (teks lengkap)
- Langkah untuk mereproduksi masalah
- Detail lingkungan yang disunting (jangan pernah membagikan `azd env get-values` mentah, yang mungkin berisi rahasia)
- Kronologi kapan masalah mulai terjadi

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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Pencegahan Masalah

### Daftar Periksa Pra-penyebaran
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
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### Pemeliharaan Rutin
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Sumber Daya Terkait

- [Panduan Debugging](debugging.md) - Teknik debugging lanjutan
- [Penyediaan Sumber Daya](../chapter-04-infrastructure/provisioning.md) - Pemecahan masalah infrastruktur
- [Perencanaan Kapasitas](../chapter-06-pre-deployment/capacity-planning.md) - Panduan perencanaan sumber daya
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Rekomendasi tingkat layanan

---

**Tip**: Simpan panduan ini dalam bookmark dan rujuk setiap kali Anda menghadapi masalah. Sebagian besar masalah sudah pernah muncul sebelumnya dan memiliki solusi yang sudah mapan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber Daya](../chapter-04-infrastructure/provisioning.md)
- **Pelajaran Selanjutnya**: [Panduan Debugging](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->