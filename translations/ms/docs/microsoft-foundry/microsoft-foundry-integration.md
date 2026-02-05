# Integrasi Microsoft Foundry dengan AZD

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../getting-started/first-project.md)
- **➡️ Seterusnya**: [Penggunaan Model AI](ai-model-deployment.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

## Gambaran Keseluruhan

Panduan ini menunjukkan cara untuk mengintegrasikan perkhidmatan Microsoft Foundry dengan Azure Developer CLI (AZD) bagi memudahkan penggunaan aplikasi AI. Microsoft Foundry menyediakan platform menyeluruh untuk membina, menggunakan, dan mengurus aplikasi AI, manakala AZD mempermudahkan proses infrastruktur dan penggunaan.

## Apa itu Microsoft Foundry?

Microsoft Foundry adalah platform bersatu Microsoft untuk pembangunan AI yang merangkumi:

- **Katalog Model**: Akses kepada model AI terkini
- **Prompt Flow**: Pereka visual untuk aliran kerja AI
- **Portal AI Foundry**: Persekitaran pembangunan bersepadu untuk aplikasi AI
- **Pilihan Penggunaan**: Pelbagai pilihan hosting dan penskalaan
- **Keselamatan dan Sekuriti**: Ciri AI bertanggungjawab yang terbina dalam

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Ciri | Microsoft Foundry | Manfaat Integrasi AZD |
|------|--------------------|-----------------------|
| **Penggunaan Model** | Penggunaan portal manual | Penggunaan automatik dan berulang |
| **Infrastruktur** | Penyediaan melalui klik | Infrastruktur sebagai Kod (Bicep) |
| **Pengurusan Persekitaran** | Fokus pada satu persekitaran | Pelbagai persekitaran (dev/staging/prod) |
| **Integrasi CI/CD** | Terhad | Sokongan GitHub Actions asli |
| **Pengurusan Kos** | Pemantauan asas | Pengoptimuman kos berdasarkan persekitaran |

## Prasyarat

- Langganan Azure dengan kebenaran yang sesuai
- Azure Developer CLI dipasang
- Akses kepada perkhidmatan Azure OpenAI
- Pengetahuan asas tentang Microsoft Foundry

## Corak Integrasi Teras

### Corak 1: Integrasi Azure OpenAI

**Kegunaan**: Menggunakan aplikasi sembang dengan model Azure OpenAI

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

**Kegunaan**: Menggunakan aplikasi retrieval-augmented generation (RAG)

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

**Kegunaan**: Aliran kerja pemprosesan dan analisis dokumen

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

### Tetapan Pembolehubah Persekitaran

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
# Tetapan kos-optimum untuk pembangunan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tahap percuma
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

## Aliran Kerja Penggunaan

### Penggunaan dengan Satu Perintah

```bash
# Sebarkan semuanya dengan satu arahan
azd up

# Atau sebarkan secara berperingkat
azd provision  # Infrastruktur sahaja
azd deploy     # Aplikasi sahaja
```

### Penggunaan Berdasarkan Persekitaran

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

## Pemantauan dan Pemerhatian

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

## 🔐 Amalan Terbaik Keselamatan

### Konfigurasi Identiti Terurus

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

### Konfigurasi Auto-scaling

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

## Penyelesaian Masalah Biasa

### Isu 1: Kuota OpenAI Melebihi Had

**Gejala:**
- Penggunaan gagal dengan ralat kuota
- Ralat 429 dalam log aplikasi

**Penyelesaian:**
```bash
# Semak penggunaan kuota semasa
az cognitiveservices usage list --location eastus

# Cuba kawasan yang berbeza
azd env set AZURE_LOCATION westus2
azd up

# Kurangkan kapasiti buat sementara waktu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Isu 2: Kegagalan Pengesahan

**Gejala:**
- Ralat 401/403 semasa memanggil perkhidmatan AI
- Mesej "Akses ditolak"

**Penyelesaian:**
```bash
# Sahkan tugasan peranan
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Periksa konfigurasi identiti terurus
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Sahkan akses Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isu 3: Masalah Penggunaan Model

**Gejala:**
- Model tidak tersedia dalam penggunaan
- Versi model tertentu gagal

**Penyelesaian:**
```bash
# Senaraikan model yang tersedia mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini versi model dalam templat bicep
# Semak keperluan kapasiti model
```

## Contoh Templat

### Aplikasi Sembang Asas

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Perkhidmatan**: Azure OpenAI + Cognitive Search + App Service

**Permulaan Pantas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Saluran Pemprosesan Dokumen

**Repositori**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Perkhidmatan**: Document Intelligence + Storage + Functions

**Permulaan Pantas**:
```bash
azd init --template ai-document-processing
azd up
```

### Sembang Korporat dengan RAG

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Perkhidmatan**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Permulaan Pantas**:
```bash
azd init --template contoso-chat
azd up
```

## Langkah Seterusnya

1. **Cuba Contoh**: Mulakan dengan templat sedia ada yang sesuai dengan kes penggunaan anda
2. **Sesuaikan untuk Keperluan Anda**: Ubah suai infrastruktur dan kod aplikasi
3. **Tambah Pemantauan**: Laksanakan pemerhatian yang menyeluruh
4. **Optimumkan Kos**: Laraskan konfigurasi mengikut bajet anda
5. **Amankan Penggunaan Anda**: Laksanakan corak keselamatan perusahaan
6. **Skala ke Pengeluaran**: Tambah ciri multi-region dan ketersediaan tinggi

## 🎯 Latihan Praktikal

### Latihan 1: Gunakan Aplikasi Sembang Azure OpenAI (30 minit)
**Matlamat**: Gunakan dan uji aplikasi sembang AI sedia pengeluaran

```bash
# Inisialisasi templat
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Tetapkan pembolehubah persekitaran
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Laksanakan
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
- [ ] Penggunaan selesai tanpa ralat kuota
- [ ] Boleh mengakses antara muka sembang dalam pelayar
- [ ] Boleh bertanya soalan dan mendapat jawapan berasaskan AI
- [ ] Application Insights menunjukkan data telemetri
- [ ] Berjaya membersihkan sumber

**Anggaran Kos**: $5-10 untuk 30 minit ujian

### Latihan 2: Konfigurasi Penggunaan Multi-Model (45 minit)
**Matlamat**: Gunakan pelbagai model AI dengan konfigurasi berbeza

```bash
# Buat konfigurasi Bicep tersuai
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

# Laksanakan dan sahkan
azd provision
azd show
```

**Kriteria Kejayaan:**
- [ ] Pelbagai model berjaya digunakan
- [ ] Tetapan kapasiti berbeza diterapkan
- [ ] Model boleh diakses melalui API
- [ ] Boleh memanggil kedua-dua model dari aplikasi

### Latihan 3: Laksanakan Pemantauan Kos (20 minit)
**Matlamat**: Tetapkan amaran bajet dan penjejakan kos

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

# Sebarkan amaran bajet
azd provision

# Semak kos semasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteria Kejayaan:**
- [ ] Amaran bajet dicipta dalam Azure
- [ ] Pemberitahuan e-mel dikonfigurasi
- [ ] Boleh melihat data kos dalam Portal Azure
- [ ] Ambang bajet ditetapkan dengan sesuai

## 💡 Soalan Lazim

<details>
<summary><strong>Bagaimana saya mengurangkan kos Azure OpenAI semasa pembangunan?</strong></summary>

1. **Gunakan Tier Percuma**: Azure OpenAI menawarkan 50,000 token/bulan percuma
2. **Kurangkan Kapasiti**: Tetapkan kapasiti kepada 10 TPM berbanding 30+ untuk pembangunan
3. **Gunakan azd down**: Nyahaktifkan sumber apabila tidak aktif membangun
4. **Cache Respons**: Laksanakan cache Redis untuk pertanyaan berulang
5. **Gunakan Prompt Engineering**: Kurangkan penggunaan token dengan prompt yang efisien

```bash
# Konfigurasi pembangunan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Apakah perbezaan antara Azure OpenAI dan OpenAI API?</strong></summary>

**Azure OpenAI**:
- Keselamatan dan pematuhan perusahaan
- Integrasi rangkaian peribadi
- Jaminan SLA
- Pengesahan identiti terurus
- Kuota lebih tinggi tersedia

**OpenAI API**:
- Akses lebih pantas kepada model baharu
- Persediaan lebih mudah
- Halangan kemasukan lebih rendah
- Hanya internet awam

Untuk aplikasi pengeluaran, **Azure OpenAI adalah disyorkan**.
</details>

<details>
<summary><strong>Bagaimana saya menangani ralat kuota melebihi Azure OpenAI?</strong></summary>

```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus2

# Cuba kawasan lain
azd env set AZURE_LOCATION westus2
azd up

# Kurangkan kapasiti buat sementara waktu
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Mohon peningkatan kuota
# Pergi ke Portal Azure > Kuota > Mohon peningkatan
```
</details>

<details>
<summary><strong>Bolehkah saya menggunakan data saya sendiri dengan Azure OpenAI?</strong></summary>

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
<summary><strong>Bagaimana saya mengamankan endpoint model AI?</strong></summary>

**Amalan Terbaik**:
1. Gunakan Identiti Terurus (tanpa kunci API)
2. Aktifkan Private Endpoints
3. Konfigurasi kumpulan keselamatan rangkaian
4. Laksanakan had kadar
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Isu dan perbincangan](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi rasmi](https://learn.microsoft.com/azure/ai-studio/)

---

**Navigasi Bab:**
- **📚 Kursus Utama**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan Berasaskan AI
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../getting-started/first-project.md)
- **➡️ Seterusnya**: [Penggunaan Model AI](ai-model-deployment.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../getting-started/configuration.md)

**Perlukan Bantuan?** Sertai perbincangan komuniti kami atau buka isu dalam repositori. Komuniti Azure AI + AZD sedia membantu anda berjaya!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->