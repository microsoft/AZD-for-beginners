# Integrasi Microsoft Foundry dengan AZD

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berfokus AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan

Panduan ini menunjukkan cara mengintegrasikan perkhidmatan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk penyebaran aplikasi AI yang lebih lancar. Microsoft Foundry menyediakan platform komprehensif untuk membina, menyebarkan, dan mengurus aplikasi AI, manakala AZD memudahkan proses infrastruktur dan penyebaran.

## Apa itu Microsoft Foundry?

Microsoft Foundry adalah platform bersepadu Microsoft untuk pembangunan AI yang merangkumi:

- **Model Catalog**: Akses kepada model AI terkini
- **Prompt Flow**: Pereka visual untuk aliran kerja AI
- **AI Foundry Portal**: Persekitaran pembangunan yang bersepadu untuk aplikasi AI
- **Pilihan Penyebaran**: Pelbagai pilihan penghosan dan penskalaan
- **Keselamatan dan Keselamatan**: Ciri bertanggungjawab AI terbina dalam

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Ciri | Microsoft Foundry | Manfaat Integrasi AZD |
|---------|-----------------|------------------------|
| **Penyebaran Model** | Penyebaran portal manual | Penyebaran automatik dan boleh diulang |
| **Infrastruktur** | Penyediaan klik-lewat | Infrastruktur sebagai Kod (Bicep) |
| **Pengurusan Persekitaran** | Fokus pada satu persekitaran | Pelbagai persekitaran (dev/staging/prod) |
| **Integrasi CI/CD** | Terhad | Sokongan GitHub Actions asli |
| **Pengurusan Kos** | Pemantauan asas | Pengoptimuman kos khusus per persekitaran |

## Prasyarat

- Langganan Azure dengan kebenaran yang sesuai
- Azure Developer CLI dipasang
- Akses ke perkhidmatan Azure OpenAI
- Kefahaman asas tentang Microsoft Foundry

## Corak Integrasi Teras

### Corak 1: Integrasi Azure OpenAI

**Kes Penggunaan**: Sebarkan aplikasi sembang dengan model Azure OpenAI

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

**Infrastruktur (main.bicep):**
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

### Corak 2: Integrasi AI Search + RAG

**Kes Penggunaan**: Sebarkan aplikasi retrieval-augmented generation (RAG)

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

### Corak 3: Integrasi Document Intelligence

**Kes Penggunaan**: Aliran kerja pemprosesan dan analisis dokumen

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

## 🔧 Corak Konfigurasi

### Penyediaan Pembolehubah Persekitaran

**Konfigurasi Pengeluaran:**
```bash
# Perkhidmatan AI teras
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Konfigurasi model
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Tetapan prestasi
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurasi Pembangunan:**
```bash
# Tetapan dioptimumkan dari segi kos untuk pembangunan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Peringkat percuma
```

### Konfigurasi Selamat dengan Key Vault

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

## Aliran Kerja Penyebaran

### Penyebaran Satu Perintah

```bash
# Lancarkan semuanya dengan satu arahan
azd up

# Atau lancarkan secara berperingkat
azd provision  # Hanya infrastruktur
azd deploy     # Hanya aplikasi
```

### Penyebaran Spesifik Persekitaran

```bash
# Persekitaran pembangunan
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Persekitaran pengeluaran
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Pemantauan dan Kebolehamatan

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

### Pemantauan Kos

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

## 🔐 Amalan Keselamatan Terbaik

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

### Keselamatan Rangkaian

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

## Pengoptimuman Prestasi

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

### Konfigurasi Skala Automatik

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

## Menyelesaikan Isu Biasa

### Isu 1: Kuota OpenAI Dicapai

**Gejala:**
- Penyebaran gagal dengan ralat kuota
- Ralat 429 dalam log aplikasi

**Penyelesaian:**
```bash
# Semak penggunaan kuota semasa
az cognitiveservices usage list --location eastus

# Cuba rantau lain
azd env set AZURE_LOCATION westus2
azd up

# Kurangkan kapasiti buat sementara
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Isu 2: Kegagalan Pengesahan

**Gejala:**
- Ralat 401/403 apabila memanggil perkhidmatan AI
- Mesej "Access denied"

**Penyelesaian:**
```bash
# Sahkan penugasan peranan
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Semak konfigurasi identiti terurus
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Sahkan akses ke Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isu 3: Isu Penyebaran Model

**Gejala:**
- Model tidak tersedia dalam penyebaran
- Versi model tertentu gagal

**Penyelesaian:**
```bash
# Senaraikan model yang tersedia mengikut rantau
az cognitiveservices model list --location eastus

# Kemas kini versi model dalam templat bicep
# Semak keperluan kapasiti model
```

## Templat Contoh

### Aplikasi Chat Asas

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Perkhidmatan**: Azure OpenAI + Cognitive Search + App Service

**Permulaan Pantas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Saluran Pemprosesan Dokumen

**Repositori**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Perkhidmatan**: Document Intelligence + Penyimpanan + Functions

**Permulaan Pantas**:
```bash
azd init --template ai-document-processing
azd up
```

### Sembang Perusahaan dengan RAG

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Perkhidmatan**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Permulaan Pantas**:
```bash
azd init --template contoso-chat
azd up
```

## Langkah Seterusnya

1. **Cuba Templat**: Mulakan dengan templat pra-bina yang sesuai dengan kes penggunaan anda
2. **Sesuaikan Mengikut Keperluan**: Ubah suai infrastruktur dan kod aplikasi
3. **Tambah Pemantauan**: Laksanakan kebolehamatan menyeluruh
4. **Optimumkan Kos**: Laraskan konfigurasi mengikut bajet anda
5. **Amankan Penyebaran Anda**: Laksanakan corak keselamatan perusahaan
6. **Skala ke Produksi**: Tambah ciri multi-wilayah dan kebolehcapaian tinggi

## 🎯 Latihan Amali

### Latihan 1: Sebarkan Aplikasi Chat Azure OpenAI (30 minit)
**Matlamat**: Sebarkan dan uji aplikasi chat AI yang sedia untuk produksi

```bash
# Inisialisasi templat
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Tetapkan pembolehubah persekitaran
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Sebarkan
azd up

# Uji aplikasi
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Pantau operasi AI
azd monitor

# Bersihkan
azd down --force --purge
```

**Kriteria Kejayaan:**
- [ ] Penyebaran lengkap tanpa ralat kuota
- [ ] Boleh mengakses antara muka sembang dalam pelayar
- [ ] Boleh mengajukan soalan dan menerima jawapan berkuasa AI
- [ ] Application Insights menunjukkan data telemetri
- [ ] Berjaya membersihkan sumber

**Anggaran Kos**: $5-10 untuk 30 minit ujian

### Latihan 2: Konfigurasi Penyebaran Berbilang-Model (45 minit)
**Matlamat**: Sebarkan berbilang model AI dengan konfigurasi berbeza

```bash
# Cipta konfigurasi Bicep tersuai
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

# Terapkan dan sahkan
azd provision
azd show
```

**Kriteria Kejayaan:**
- [ ] Berbilang model berjaya disebarkan
- [ ] Tetapan kapasiti berbeza telah diterapkan
- [ ] Model boleh diakses melalui API
- [ ] Boleh memanggil kedua-dua model dari aplikasi

### Latihan 3: Laksanakan Pemantauan Kos (20 minit)
**Matlamat**: Sediakan amaran bajet dan penjejakan kos

```bash
# Tambah amaran bajet ke Bicep
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

# Terapkan amaran bajet
azd provision

# Semak kos semasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteria Kejayaan:**
- [ ] Amaran bajet dicipta dalam Azure
- [ ] Pemberitahuan e-mel dikonfigurasikan
- [ ] Boleh melihat data kos dalam Azure Portal
- [ ] Ambang bajet ditetapkan dengan sesuai

## 💡 Soalan Lazim

<details>
<summary><strong>Bagaimana saya mengurangkan kos Azure OpenAI semasa pembangunan?</strong></summary>

1. **Gunakan Tier Percuma**: Azure OpenAI menawarkan 50,000 token/bulan percuma
2. **Kurangkan Kapasiti**: Tetapkan kapasiti kepada 10 TPM bukannya 30+ untuk pembangunan
3. **Gunakan azd down**: Nyah-aloqkan sumber apabila tidak sedang membangunkan
4. **Cache Tindak Balas**: Laksanakan cache Redis untuk pertanyaan berulang
5. **Gunakan Kejuruteraan Prompt**: Kurangkan penggunaan token dengan prompt yang cekap

```bash
# Konfigurasi pembangunan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Apakah perbezaan antara Azure OpenAI dan OpenAI API?</strong></summary>

**Azure OpenAI**:
- Keselamatan perusahaan dan pematuhan
- Integrasi rangkaian peribadi
- Jaminan SLA
- Pengesahan managed identity
- Kuota lebih tinggi tersedia

**OpenAI API**:
- Akses lebih pantas ke model baru
- Persediaan lebih ringkas
- Halangan masuk lebih rendah
- Hanya melalui internet awam

Untuk aplikasi produksi, **Azure OpenAI disyorkan**.
</details>

<details>
<summary><strong>Bagaimana saya mengendalikan ralat kuota Azure OpenAI yang melebihi had?</strong></summary>

```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus2

# Cuba rantau lain
azd env set AZURE_LOCATION westus2
azd up

# Kurangkan kapasiti sementara
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Mohon peningkatan kuota
# Pergi ke Azure Portal > Kuota > Mohon peningkatan
```
</details>

<details>
<summary><strong>Bolehkah saya menggunakan data sendiri dengan Azure OpenAI?</strong></summary>

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

Lihat templat [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Bagaimana saya mengamankan titik akhir model AI?</strong></summary>

**Amalan Terbaik**:
1. Gunakan Managed Identity (tanpa kunci API)
2. Aktifkan Private Endpoints
3. Konfigurasikan kumpulan keselamatan rangkaian
4. Laksanakan pembatasan kadar
5. Gunakan Azure Key Vault untuk rahsia

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

## Komuniti dan Sokongan

- **Microsoft Foundry Discord**: [Saluran #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Isu dan perbincangan](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi rasmi](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berfokus AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Penyebaran Model AI](ai-model-deployment.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlu Bantuan?** Sertai perbincangan komuniti kami atau buka isu dalam repositori. Komuniti Azure AI + AZD sedia membantu anda berjaya!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang muktamad. Untuk maklumat yang kritikal, disyorkan agar terjemahan dilakukan oleh penterjemah profesional. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->