# Isu dan Penyelesaian Biasa

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 7 - Penyelesaian Masalah & Pengesanan Ralat
- **⬅️ Bab Sebelumnya**: [Bab 6: Semakan Pra-penerbangan](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Seterusnya**: [Panduan Pengesanan Ralat](debugging.md)
- **🚀 Bab Seterusnya**: [Bab 8: Corak Pengeluaran & Perusahaan](../chapter-08-production/production-ai-practices.md)

## Pengenalan

Panduan penyelesaian masalah yang menyeluruh ini merangkumi isu yang paling kerap ditemui semasa menggunakan Azure Developer CLI. Pelajari cara mendiagnosis, menyelesaikan masalah, dan memperbaiki masalah biasa berkaitan pengesahan, penyebaran, penyediaan infrastruktur, dan konfigurasi aplikasi. Setiap isu termasuk simptom terperinci, punca utama, dan prosedur penyelesaian langkah demi langkah.

## Matlamat Pembelajaran

Dengan menyelesaikan panduan ini, anda akan:
- Menguasai teknik diagnostik untuk isu Azure Developer CLI
- Memahami masalah biasa pengesahan dan kebenaran serta penyelesaiannya
- Menyelesaikan kegagalan penyebaran, ralat penyediaan infrastruktur, dan isu konfigurasi
- Melaksanakan strategi pemantauan dan pengesanan ralat secara proaktif
- Menggunakan metodologi penyelesaian masalah yang sistematik untuk masalah kompleks
- Mengkonfigurasi log dan pemantauan dengan betul untuk mengelakkan masalah masa depan

## Hasil Pembelajaran

Setelah selesai, anda akan dapat:
- Mendiagnosis isu Azure Developer CLI menggunakan alat diagnostik terbina dalam
- Menyelesaikan masalah pengesahan, langganan, dan kebenaran secara berdikari
- Menyelesaikan kegagalan penyebaran dan ralat penyediaan infrastruktur dengan berkesan
- Mengesan isu konfigurasi aplikasi dan masalah persekitaran khusus
- Melaksanakan pemantauan dan pemberitahuan untuk mengenal pasti masalah berpotensi secara proaktif
- Mengaplikasikan amalan terbaik untuk log, pengesanan ralat, dan aliran kerja penyelesaian masalah

## Diagnostik Pantas

> Gantikan nama/ID contoh dengan nilai persekitaran anda. Fragmen Bash, Bicep, JavaScript, dan fail parameter dilabelkan berasingan di bawah; mereka bukan satu skrip boleh jalankan. Semak operasi pemusnah dan sembunyikan rahsia sebelum berkongsi diagnostik. `azd monitor --logs` membuka pelayar; ia tidak menyiarkan log terminal.

Sebelum menyelami isu khusus, jalankan arahan ini untuk mengumpul maklumat diagnostik:

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

## Isu Pengesahan

### Isu: "Gagal mendapatkan token akses"
**Simptom:**
- `azd up` gagal dengan ralat pengesahan
- Arahan memulangkan "tidak dibenarkan" atau "akses ditolak"

**Penyelesaian:**
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

### Isu: "Kebenaran tidak mencukupi" semasa penyebaran
**Simptom:**
- Penyebaran gagal dengan ralat kebenaran
- Tidak boleh mencipta sumber Azure tertentu

**Penyelesaian:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### Isu: Masalah pengesahan berbilang penyewa
**Penyelesaian:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ Ralat Penyediaan Infrastruktur

### Isu: Konflik nama sumber
**Simptom:**
- "Nama sumber sudah wujud" ralat
- Penyebaran gagal semasa penciptaan sumber

**Penyelesaian:**
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

### Isu: Lokasi/Region tidak tersedia
**Simptom:**
- "Lokasi 'xyz' tidak tersedia untuk jenis sumber"
- SKU tertentu tidak tersedia di kawasan yang dipilih

**Penyelesaian:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

Menukar pemboleh ubah lokasi tidak memindahkan sumber sedia ada. Kumpulan sumber atau sumber sedia ada mungkin menolak perubahan lokasi; gunakan persekitaran berasingan untuk penyebaran semula serantau.

### Isu: Ralat kuota terlampau
**Simptom:**
- "Kuota terlampau untuk jenis sumber"
- "Bilangan maksimum sumber telah dicapai"

**Penyelesaian:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

Untuk pembangunan, pilih SKU yang lebih kecil dan disokong dalam `infra/main.parameters.json`:

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

### Isu: Ralat templat Bicep
**Simptom:**
- Kegagalan pengesahan templat
- Ralat sintaks dalam fail Bicep

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

### Isu: Kegagalan bina
**Simptom:**
- Aplikasi gagal dibina semasa penyebaran
- Ralat pemasangan pakej

**Penyelesaian:**
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

### Isu: Kegagalan penyebaran kontena
**Simptom:**
- Aplikasi kontena gagal untuk dimulakan
- Ralat tarik imej

**Penyelesaian:**
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

### Isu: Kegagalan sambungan pangkalan data
**Simptom:**
- Aplikasi tidak boleh menyambung ke pangkalan data
- Ralat tamat masa sambungan

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

### Isu: Pemboleh ubah persekitaran tidak berfungsi
**Simptom:**
- Aplikasi tidak boleh membaca nilai konfigurasi
- Pemboleh ubah persekitaran nampak kosong

**Penyelesaian:**
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

### Isu: Masalah sijil SSL/TLS
**Simptom:**
- HTTPS tidak berfungsi
- Ralat pengesahan sijil

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
- Frontend tidak boleh memanggil API
- Permintaan lintas asal disekat

**Penyelesaian:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. Kemas kini aplikasi Express sedia ada anda (dengan `cors` diimport):

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

## 🌍 Isu Pengurusan Persekitaran

### Isu: Masalah penukaran persekitaran
**Simptom:**
- Persekitaran salah digunakan
- Konfigurasi tidak ditukar dengan betul

**Penyelesaian:**
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

### Isu: Kerusakan persekitaran
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

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 Isu Prestasi

### Isu: Masa penyebaran perlahan
**Simptom:**
- Penyebaran mengambil masa terlalu lama
- Tamat masa semasa penyebaran

**Penyelesaian:**
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

### Isu: Masalah prestasi aplikasi
**Simptom:**
- Masa tindak balas perlahan
- Penggunaan sumber yang tinggi

**Penyelesaian:**
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

## 🛠️ Alat dan Arahan Penyelesaian Masalah

### Arahan Pengesanan Ralat
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

### Bila untuk Eskalasi
- Isu pengesahan berterusan selepas mencuba semua penyelesaian
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
Sebelum menghubungi sokongan, kumpul:
- output `azd version`
- output `azd config show`
- output `azd show` (status penyebaran semasa)
- Mesej ralat (teks penuh)
- Langkah untuk menghasilkan semula isu
- Butiran persekitaran yang disunting (jangan pernah kongsi `azd env get-values` mentah, yang mungkin mengandungi rahsia)
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
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Pencegahan Isu

### Senarai Semak Pra-penyebaran
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

### Penetapan Pemantauan
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

### Penyelenggaraan Berkala
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## Sumber Berkaitan

- [Panduan Pengesanan Ralat](debugging.md) - Teknik pengesanan ralat lanjutan
- [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md) - Penyelesaian masalah infrastruktur
- [Perancangan Kapasiti](../chapter-06-pre-deployment/capacity-planning.md) - Panduan perancangan sumber
- [Pemilihan SKU](../chapter-06-pre-deployment/sku-selection.md) - Cadangan tier perkhidmatan

---

**Petua**: Simpan panduan ini dalam penanda buku dan rujuk semasa menghadapi isu. Kebanyakan masalah telah ditemui sebelumnya dan mempunyai penyelesaian yang telah ditetapkan!

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Penyediaan Sumber](../chapter-04-infrastructure/provisioning.md)
- **Pelajaran Seterusnya**: [Panduan Pengesanan Ralat](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->