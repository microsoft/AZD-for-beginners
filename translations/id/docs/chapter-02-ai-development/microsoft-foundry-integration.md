# Integrasi Microsoft Foundry dengan AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Bab 2 - Pengembangan Berorientasi AI
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Ikhtisar

Panduan ini menunjukkan cara mengintegrasikan layanan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk penyebaran aplikasi AI yang lebih efisien. Microsoft Foundry menyediakan platform komprehensif untuk membangun, menyebarkan, dan mengelola aplikasi AI, sementara AZD menyederhanakan proses infrastruktur dan penyebaran.

## Apa itu Microsoft Foundry?

Microsoft Foundry adalah platform terpadu Microsoft untuk pengembangan AI yang mencakup:

- **Model Catalog**: Akses ke model-model AI mutakhir
- **Prompt Flow**: Perancang visual untuk alur kerja AI
- **AI Foundry Portal**: Lingkungan pengembangan terintegrasi untuk aplikasi AI
- **Deployment Options**: Berbagai opsi hosting dan penskalaan
- **Safety and Security**: Fitur AI bertanggung jawab bawaan

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Prasyarat

- Langganan Azure dengan izin yang sesuai
- Azure Developer CLI terpasang
- Akses ke layanan Azure OpenAI
- Familiaritas dasar dengan Microsoft Foundry

## Pola Integrasi Inti

### Pola 1: Integrasi Azure OpenAI

**Kasus Penggunaan**: Menerapkan aplikasi chat dengan model Azure OpenAI

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Infrastructure (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Pola 2: Integrasi AI Search + RAG

**Kasus Penggunaan**: Menerapkan aplikasi retrieval-augmented generation (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Pola 3: Integrasi Document Intelligence

**Kasus Penggunaan**: Alur kerja pemrosesan dan analisis dokumen

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Pola Konfigurasi

### Pengaturan Variabel Lingkungan

**Produksi Konfigurasi:**
```bash
# Layanan inti Kecerdasan Buatan
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurasi model
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Pengaturan kinerja
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurasi Pengembangan:**
```bash
# Pengaturan yang dioptimalkan untuk biaya pengembangan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tingkat gratis
```

### Konfigurasi Aman dengan Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Alur Kerja Penyebaran

### Penyebaran dengan Satu Perintah

```bash
# Terapkan semuanya dengan satu perintah
azd up

# Atau terapkan secara bertahap
azd provision  # Hanya infrastruktur
azd deploy     # Hanya aplikasi
```

### Penyebaran Khusus Lingkungan

```bash
# Lingkungan pengembangan
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Lingkungan produksi
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Pemantauan dan Observabilitas

### Integrasi Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Pemantauan Biaya

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 Praktik Keamanan Terbaik

### Konfigurasi Managed Identity

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Keamanan Jaringan

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
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

## Optimisasi Kinerja

### Strategi Caching

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### Konfigurasi Penskalaan Otomatis

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Memecahkan Masalah Umum

### Masalah 1: Kuota OpenAI Terlampaui

**Gejala:**
- Penyebaran gagal dengan kesalahan kuota
- Kesalahan 429 di log aplikasi

**Solusi:**
```bash
# Periksa penggunaan kuota saat ini
az cognitiveservices usage list --location eastus

# Coba wilayah lain
azd env set AZURE_LOCATION westus2
azd up

# Kurangi kapasitas sementara
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Masalah 2: Kegagalan Otentikasi

**Gejala:**
- Kesalahan 401/403 saat memanggil layanan AI
- Pesan "Access denied"

**Solusi:**
```bash
# Verifikasi penetapan peran
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Periksa konfigurasi identitas terkelola
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validasi akses ke Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Masalah 3: Masalah Penyebaran Model

**Gejala:**
- Model tidak tersedia dalam penyebaran
- Versi model tertentu gagal

**Solusi:**
```bash
# Daftar model yang tersedia per wilayah
az cognitiveservices model list --location eastus

# Perbarui versi model dalam template bicep
# Periksa persyaratan kapasitas model
```

## Template Contoh

### Aplikasi Chat Dasar

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Layanan**: Azure OpenAI + Cognitive Search + App Service

**Mulai Cepat**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline Pemrosesan Dokumen

**Repository**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Layanan**: Document Intelligence + Storage + Functions

**Mulai Cepat**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Perusahaan dengan RAG

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Layanan**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Mulai Cepat**:
```bash
azd init --template contoso-chat
azd up
```

## Langkah Selanjutnya

1. **Coba Contoh**: Mulai dengan template bawaan yang sesuai dengan kasus penggunaan Anda
2. **Sesuaikan untuk Kebutuhan Anda**: Ubah infrastruktur dan kode aplikasi
3. **Tambahkan Pemantauan**: Terapkan observabilitas yang komprehensif
4. **Optimalkan Biaya**: Sesuaikan konfigurasi untuk anggaran Anda
5. **Amankan Penyebaran Anda**: Terapkan pola keamanan perusahaan
6. **Skalakan ke Produksi**: Tambahkan fitur multi-region dan ketersediaan tinggi

## 🎯 Latihan Praktik

### Latihan 1: Menyebarkan Aplikasi Chat Azure OpenAI (30 menit)
**Tujuan**: Menyebarkan dan menguji aplikasi chat AI yang siap produksi

```bash
# Inisialisasi template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Atur variabel lingkungan
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Terapkan
azd up

# Uji aplikasi
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Pantau operasi AI
azd monitor

# Bersihkan
azd down --force --purge
```

**Kriteria Keberhasilan:**
- [ ] Penyebaran selesai tanpa kesalahan kuota
- [ ] Dapat mengakses antarmuka chat di browser
- [ ] Dapat mengajukan pertanyaan dan mendapatkan respons berbasis AI
- [ ] Application Insights menampilkan data telemetri
- [ ] Berhasil membersihkan sumber daya

**Perkiraan Biaya**: $5-10 untuk 30 menit pengujian

### Latihan 2: Konfigurasikan Penyebaran Multi-Model (45 menit)
**Tujuan**: Menyebarkan beberapa model AI dengan konfigurasi berbeda

```bash
# Buat konfigurasi Bicep khusus
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Terapkan dan verifikasi
azd provision
azd show
```

**Kriteria Keberhasilan:**
- [ ] Beberapa model berhasil disebarkan
- [ ] Pengaturan kapasitas yang berbeda diterapkan
- [ ] Model dapat diakses melalui API
- [ ] Dapat memanggil kedua model dari aplikasi

### Latihan 3: Terapkan Pemantauan Biaya (20 menit)
**Tujuan**: Mengatur peringatan anggaran dan pelacakan biaya

```bash
# Tambahkan peringatan anggaran ke Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Terapkan peringatan anggaran
azd provision

# Periksa biaya saat ini
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteria Keberhasilan:**
- [ ] Peringatan anggaran dibuat di Azure
- [ ] Notifikasi email dikonfigurasi
- [ ] Dapat melihat data biaya di Azure Portal
- [ ] Ambang batas anggaran diatur dengan tepat

## 💡 Pertanyaan yang Sering Diajukan

<details>
<summary><strong>Bagaimana cara mengurangi biaya Azure OpenAI selama pengembangan?</strong></summary>

1. **Gunakan Tingkat Gratis**: Azure OpenAI menawarkan 50.000 token/bulan gratis
2. **Kurangi Kapasitas**: Atur kapasitas ke 10 TPM daripada 30+ untuk pengembangan
3. **Gunakan azd down**: Deallocasikan sumber daya saat tidak sedang mengembangkan
4. **Cache Respons**: Terapkan cache Redis untuk kueri berulang
5. **Gunakan Prompt Engineering**: Kurangi penggunaan token dengan prompt yang efisien

```bash
# Konfigurasi pengembangan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Apa perbedaan antara Azure OpenAI dan OpenAI API?</strong></summary>

**Azure OpenAI**:
- Keamanan dan kepatuhan tingkat perusahaan
- Integrasi jaringan privat
- Jaminan SLA
- Otentikasi managed identity
- Kuota lebih tinggi tersedia

**OpenAI API**:
- Akses lebih cepat ke model baru
- Pengaturan lebih sederhana
- Hambatan masuk lebih rendah
- Hanya internet publik

Untuk aplikasi produksi, **Azure OpenAI direkomendasikan**.
</details>

<details>
<summary><strong>Bagaimana cara menangani kesalahan kuota Azure OpenAI yang terlampaui?</strong></summary>

```bash
# Periksa kuota saat ini
az cognitiveservices usage list --location eastus2

# Coba wilayah lain
azd env set AZURE_LOCATION westus2
azd up

# Kurangi kapasitas sementara
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Ajukan peningkatan kuota
# Buka Azure Portal > Kuota > Ajukan peningkatan
```
</details>

<details>
<summary><strong>Bisakah saya menggunakan data sendiri dengan Azure OpenAI?</strong></summary>

Ya! Gunakan **Azure AI Search** untuk RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Lihat template [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Bagaimana cara mengamankan endpoint model AI?</strong></summary>

**Praktik Terbaik**:
1. Gunakan Managed Identity (tanpa kunci API)
2. Aktifkan Private Endpoints
3. Konfigurasikan network security groups
4. Terapkan pembatasan tingkat (rate limiting)
5. Gunakan Azure Key Vault untuk rahasia

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Komunitas dan Dukungan

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Bab 2 - Pengembangan Berorientasi AI
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Bergabunglah dalam diskusi komunitas kami atau buka isu di repositori. Komunitas Azure AI + AZD siap membantu Anda berhasil!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang sangat penting, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas segala kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->