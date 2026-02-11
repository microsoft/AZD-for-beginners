# AI Workshop Lab: Membuat Solusi AI Anda Dapat Dideploy dengan AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD untuk Pemula](../../README.md)
- **📖 Current Chapter**: Bab 2 - Pengembangan Berbasis AI
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Workshop Overview

Lab praktik ini memandu pengembang melalui proses mengambil template AI yang sudah ada dan mendeploy-nya menggunakan Azure Developer CLI (AZD). Anda akan mempelajari pola penting untuk deployment AI produksi menggunakan layanan Microsoft Foundry.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Pengetahuan dasar Azure, familiaritas dengan konsep AI/ML

## 🎓 Learning Objectives

Pada akhir workshop ini, Anda akan mampu:
- ✅ Mengonversi aplikasi AI yang ada untuk menggunakan template AZD
- ✅ Mengonfigurasi layanan Microsoft Foundry dengan AZD
- ✅ Menerapkan manajemen kredensial yang aman untuk layanan AI
- ✅ Mendeploy aplikasi AI siap produksi dengan pemantauan
- ✅ Memecahkan masalah umum deployment AI

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) terpasang
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) terpasang
- [Git](https://git-scm.com/) terpasang
- Editor kode (disarankan VS Code)

### Azure Resources
- Langganan Azure dengan akses contributor
- Akses ke layanan Azure OpenAI (atau kemampuan untuk mengajukan akses)
- Izin pembuatan resource group

### Knowledge Prerequisites
- Pemahaman dasar layanan Azure
- Familiaritas dengan antarmuka baris perintah
- Konsep dasar AI/ML (API, model, prompt)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# Periksa instalasi AZD
azd version

# Periksa Azure CLI
az --version

# Masuk ke Azure
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Jelajahi file-file kunci dalam template AZD yang siap AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- Definisi layanan untuk komponen AI
- Pemetaan variabel lingkungan
- Konfigurasi host

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- Provisioning layanan Azure OpenAI
- Integrasi Cognitive Search
- Manajemen kunci yang aman
- Konfigurasi keamanan jaringan

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: Aplikasi AI sering memerlukan beberapa layanan yang terkoordinasi
- **Security**: Kunci API dan endpoint perlu dikelola dengan aman
- **Scalability**: Beban kerja AI memiliki kebutuhan penskalaan yang unik
- **Cost Management**: Layanan AI bisa mahal jika tidak dikonfigurasi dengan benar

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# Atur wilayah Azure pilihan Anda
azd env set AZURE_LOCATION eastus

# Opsional: Tetapkan model OpenAI tertentu
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ Mem-provision layanan Azure OpenAI
- ✅ Membuat layanan Cognitive Search
- ✅ Menyiapkan App Service untuk aplikasi web
- ✅ Mengonfigurasi jaringan dan keamanan
- ✅ Mendeploy kode aplikasi
- ✅ Menyiapkan pemantauan dan logging

2. **Monitor the deployment progress** dan catat resource yang dibuat.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - Arahkan ke aplikasi web
   - Coba kueri sampel
   - Verifikasi respons AI berfungsi

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: Deployment Anda sukses tetapi AI tidak merespons.

**Common issues to check:**
1. **OpenAI API keys**: Verifikasi mereka sudah diatur dengan benar
2. **Model availability**: Periksa apakah region Anda mendukung model tersebut
3. **Network connectivity**: Pastikan layanan dapat berkomunikasi
4. **RBAC permissions**: Verifikasi aplikasi dapat mengakses OpenAI

**Debugging commands:**
```bash
# Periksa variabel lingkungan
azd env get-values

# Lihat log penyebaran
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Periksa status penyebaran OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# Ganti ke model lain (jika tersedia di wilayah Anda)
azd env set AZURE_OPENAI_MODEL gpt-4

# Terapkan ulang dengan konfigurasi baru
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` untuk menambahkan Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Step 3.2: Environment-Specific Configurations

**Best Practice**: Konfigurasi berbeda untuk development vs production.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# Produksi biasanya menggunakan SKU yang lebih tinggi
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Aktifkan fitur keamanan tambahan
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: Konfigurasikan template agar hemat biaya untuk development.

**Tasks:**
1. Identifikasi SKU mana yang bisa disetel ke tier gratis/basic
2. Konfigurasikan variabel lingkungan untuk biaya minimal
3. Deploy dan bandingkan biaya dengan konfigurasi produksi

**Solution hints:**
- Gunakan tier F0 (gratis) untuk Cognitive Services saat memungkinkan
- Gunakan tier Basic untuk Search Service saat development
- Pertimbangkan menggunakan Consumption plan untuk Functions

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: Banyak aplikasi AI menyimpan kunci API secara hardcode atau menggunakan penyimpanan yang tidak aman.

**AZD Solution**: Managed Identity + integrasi Key Vault.

1. **Review the security configuration in your template:**
```bash
# Cari konfigurasi Key Vault dan Identitas Terkelola
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# Periksa apakah aplikasi web memiliki konfigurasi identitas yang benar
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (jika belum dikonfigurasi):

Tambahkan ke template bicep Anda:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights seharusnya dikonfigurasi secara otomatis
# Periksa konfigurasi:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Tambahkan metrik kustom untuk operasi AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab Exercise 4.1: Security Audit**

**Task**: Tinjau deployment Anda untuk praktik keamanan terbaik.

**Checklist:**
- [ ] Tidak ada secret yang hardcoded dalam kode atau konfigurasi
- [ ] Managed Identity digunakan untuk otentikasi service-to-service
- [ ] Key Vault menyimpan konfigurasi sensitif
- [ ] Akses jaringan dibatasi dengan benar
- [ ] Pemantauan dan logging diaktifkan

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, jawab pertanyaan-pertanyaan ini:

1. **Application Architecture:**
   - Layanan AI apa yang digunakan aplikasi Anda?
   - Sumber daya komputasi apa yang dibutuhkannya?
   - Apakah memerlukan database?
   - Apa saja dependensi antar layanan?

2. **Security Requirements:**
   - Data sensitif apa yang ditangani aplikasi Anda?
   - Persyaratan kepatuhan apa yang Anda miliki?
   - Apakah Anda memerlukan jaringan privat?

3. **Scaling Requirements:**
   - Berapa beban yang diharapkan?
   - Apakah memerlukan auto-scaling?
   - Apakah ada kebutuhan regional?

### Step 5.2: Create Your AZD Template

**Ikuti pola ini untuk mengonversi aplikasi Anda:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inisialisasi template AZD
azd init --template minimal
```

2. **Create azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Create infrastructure templates:**

**infra/main.bicep** - Template utama:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Modul OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: Buat template AZD untuk aplikasi AI pemrosesan dokumen.

**Requirements:**
- Azure OpenAI untuk analisis konten
- Document Intelligence untuk OCR
- Storage Account untuk unggahan dokumen
- Function App untuk logika pemrosesan
- Web app untuk antarmuka pengguna

**Bonus points:**
- Tambahkan penanganan error yang tepat
- Sertakan estimasi biaya
- Siapkan dashboard pemantauan

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** Deployment gagal dengan error kuota
**Solutions:**
```bash
# Periksa kuota saat ini
az cognitiveservices usage list --location eastus

# Minta peningkatan kuota atau coba wilayah yang berbeda
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** Respons AI gagal atau error deployment model
**Solutions:**
```bash
# Periksa ketersediaan model berdasarkan wilayah
az cognitiveservices model list --location eastus

# Perbarui ke model yang tersedia
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** Error 403 Forbidden saat memanggil layanan AI
**Solutions:**
```bash
# Periksa penugasan peran
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Tambahkan peran yang hilang
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. Periksa Application Insights untuk metrik performa
2. Tinjau metrik layanan OpenAI di portal Azure
3. Verifikasi konektivitas jaringan dan latensi

**Solutions:**
- Terapkan caching untuk kueri yang sering
- Gunakan model OpenAI yang sesuai untuk kasus penggunaan Anda
- Pertimbangkan read replicas untuk skenario beban tinggi

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: Deployment Anda sukses, tetapi aplikasi mengembalikan error 500.

**Debugging tasks:**
1. Periksa log aplikasi
2. Verifikasi konektivitas layanan
3. Uji otentikasi
4. Tinjau konfigurasi

**Tools to use:**
- `azd show` untuk overview deployment
- Azure portal untuk log layanan yang detail
- Application Insights untuk telemetri aplikasi

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

Arahkan ke portal Azure dan buat dashboard dengan:
- Jumlah dan latensi permintaan OpenAI
- Tingkat error aplikasi
- Pemanfaatan sumber daya
- Pelacakan biaya

2. **Set up alerts:**
```bash
# Peringatan untuk tingkat kesalahan yang tinggi
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# Gunakan Azure CLI untuk mendapatkan data biaya
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- Atur alert anggaran
- Gunakan kebijakan autoscaling
- Terapkan caching permintaan
- Pantau penggunaan token untuk OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: Optimalkan aplikasi AI Anda untuk performa dan biaya.

**Metrics to improve:**
- Kurangi rata-rata waktu respons sebesar 20%
- Kurangi biaya bulanan sebesar 15%
- Pertahankan uptime 99.9%

**Strategies to try:**
- Terapkan caching respons
- Optimalkan prompt untuk efisiensi token
- Gunakan SKU komputasi yang sesuai
- Siapkan autoscaling yang tepat

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Anda ditugaskan membuat chatbot layanan pelanggan bertenaga AI siap produksi dengan persyaratan berikut:

**Functional Requirements:**
- Antarmuka web untuk interaksi pelanggan
- Integrasi dengan Azure OpenAI untuk respons
- Kemampuan pencarian dokumen menggunakan Cognitive Search
- Integrasi dengan database pelanggan yang sudah ada
- Dukungan multi-bahasa

**Non-Functional Requirements:**
- Menangani 1000 pengguna simultan
- SLA uptime 99.9%
- Kepatuhan SOC 2
- Biaya di bawah $500/bulan
- Dideploy ke beberapa environment (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: Apakah memenuhi semua persyaratan?
- ✅ **Security**: Apakah praktik terbaik diimplementasikan?
- ✅ **Scalability**: Dapatkah menangani beban?
- ✅ **Maintainability**: Apakah kode dan infrastruktur terorganisir dengan baik?
- ✅ **Cost**: Apakah tetap dalam anggaran?

## Additional Resources

### Microsoft Documentation
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Dokumentasi Layanan Azure OpenAI](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Dokumentasi Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Aplikasi Obrolan Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate
Selamat! Anda telah menyelesaikan AI Workshop Lab. Anda sekarang seharusnya dapat:

- ✅ Mengonversi aplikasi AI yang ada menjadi template AZD
- ✅ Menyebarkan aplikasi AI yang siap untuk produksi
- ✅ Menerapkan praktik terbaik keamanan untuk beban kerja AI
- ✅ Memantau dan mengoptimalkan kinerja aplikasi AI
- ✅ Memecahkan masalah penyebaran yang umum

### Langkah Selanjutnya
1. Terapkan pola-pola ini pada proyek AI Anda sendiri
2. Kontribusikan template kembali ke komunitas
3. Bergabung dengan Microsoft Foundry Discord untuk dukungan berkelanjutan
4. Jelajahi topik lanjutan seperti penyebaran multi-wilayah

---

**Umpan Balik Workshop**: Bantu kami meningkatkan workshop ini dengan membagikan pengalaman Anda di [saluran #Azure di Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Navigasi Bab:**
- **📚 Beranda Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Saat Ini**: Bab 2 - Pengembangan Berfokus pada AI
- **⬅️ Sebelumnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **➡️ Selanjutnya**: [Praktik Terbaik AI Produksi](production-ai-practices.md)
- **🚀 Bab Berikutnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Bergabunglah dengan komunitas kami untuk dukungan dan diskusi tentang AZD dan penyebaran AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diingat bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->