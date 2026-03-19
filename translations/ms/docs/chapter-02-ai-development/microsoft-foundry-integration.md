# Integrasi Microsoft Foundry dengan AZD

**Navigasi Bab:**
- **📚 Laman Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Penghantaran Model AI](ai-model-deployment.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan

Panduan ini menunjukkan cara mengintegrasikan perkhidmatan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk penghantaran aplikasi AI yang dipermudahkan. Microsoft Foundry menyediakan platform menyeluruh untuk membina, menyebarkan, dan mengurus aplikasi AI, manakala AZD merumitkan proses infrastruktur dan penghantaran.

## Apakah Microsoft Foundry?

Microsoft Foundry ialah platform bersatu Microsoft untuk pembangunan AI yang merangkumi:

- **Katalog Model**: Akses kepada model AI terkini
- **Prompt Flow**: Pereka visual untuk aliran kerja AI
- **Portal Microsoft Foundry**: Persekitaran pembangunan bersepadu untuk aplikasi AI
- **Pilihan Penghantaran**: Pelbagai pilihan penghosan dan penskalaan
- **Keselamatan dan Keselamatan**: Ciri AI bertanggungjawab terbina dalam

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Ciri | Microsoft Foundry | Manfaat Integrasi AZD |
|---------|-----------------|------------------------|
| **Penghantaran Model** | Penghantaran portal manual | Penghantaran automatik, boleh diulang |
| **Infrastruktur** | Penyediaan klik | Infrastruktur sebagai Kod (Bicep) |
| **Pengurusan Persekitaran** | Fokus persekitaran tunggal | Multi-persekitaran (dev/staging/prod) |
| **Integrasi CI/CD** | Terhad | Sokongan GitHub Actions asli |
| **Pengurusan Kos** | Pemantauan asas | Pengoptimuman kos spesifik persekitaran |

## Prasyarat

- Langganan Azure dengan kebenaran sesuai
- Azure Developer CLI dipasang
- Akses kepada perkhidmatan Microsoft Foundry Models
- Kefahaman asas mengenai Microsoft Foundry

## Corak Integrasi Teras

### Corak 1: Integrasi Microsoft Foundry Models

**Kes Penggunaan**: Menyebarkan aplikasi sembang dengan model Microsoft Foundry Models

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
// Microsoft Foundry Models Account
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

**Kes Penggunaan**: Menyebarkan aplikasi generasi dipertingkatkan pengambilan (RAG)

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

### Corak 3: Integrasi Kecerdasan Dokumen

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

### Penetapan Pembolehubah Persekitaran

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
# Tetapan yang dioptimumkan untuk kos bagi pembangunan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Tingkat percuma
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

## Aliran Kerja Penghantaran

### Sambungan AZD untuk Foundry

AZD menyediakan sambungan yang menambah keupayaan khusus AI untuk bekerja dengan perkhidmatan Microsoft Foundry:

```bash
# Pasang sambungan ejen Foundry
azd extension install azure.ai.agents

# Pasang sambungan penalaan halus
azd extension install azure.ai.finetune

# Pasang sambungan model khusus
azd extension install azure.ai.models

# Senaraikan sambungan yang dipasang
azd extension list
```

### Penghantaran Agent-Pertama dengan `azd ai`

Jika anda mempunyai manifest agen, gunakan `azd ai agent init` untuk membuat projek yang disambungkan ke Foundry Agent Service:

```bash
# Inisialisasi dari manifest ejen
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Sebarkan ke Azure
azd up
```

Lihat [Perintah CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk rujukan lengkap perintah dan bendera.

### Penghantaran dengan Perintah Tunggal

```bash
# Sebarkan semuanya dengan satu arahan
azd up

# Atau sebarkan secara berperingkat
azd provision  # Infrastruktur sahaja
azd deploy     # Aplikasi sahaja
```

### Penghantaran Spesifik Persekitaran

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

## Pemantauan dan Kebolehan Pemerhatian

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

### Konfigurasi Identiti Terkelola

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

### Strategi Pihak Penimbal

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

### Konfigurasi Penskalalan Automatik

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
- Penghantaran gagal dengan ralat kuota
- Ralat 429 dalam log aplikasi

**Penyelesaian:**
```bash
# Semak penggunaan kuota semasa
az cognitiveservices usage list --location eastus

# Cuba wilayah berbeza
azd env set AZURE_LOCATION westus2
azd up

# Kurangkan kapasiti buat sementara waktu
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Isu 2: Kegagalan Pengesahan

**Gejala:**
- Ralat 401/403 ketika memanggil perkhidmatan AI
- Mesej "Akses ditolak"

**Penyelesaian:**
```bash
# Sahkan tugasan peranan
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Semak konfigurasi identiti yang diurus
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Sahkan akses Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Isu 3: Masalah Penghantaran Model

**Gejala:**
- Model tidak tersedia dalam penghantaran
- Versi model tertentu gagal

**Penyelesaian:**
```bash
# Senaraikan model yang tersedia mengikut wilayah
az cognitiveservices model list --location eastus

# Kemas kini versi model dalam templat bicep
# Semak keperluan kapasiti model
```

## Templat Contoh

### Aplikasi Sembang RAG (Python)

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Penerangan**: Contoh AI Azure paling popular — aplikasi sembang RAG sedia produksi yang membolehkan anda bertanya soalan melalui dokumen anda sendiri. Menggunakan GPT-4.1-mini untuk sembang, text-embedding-ada-002 untuk penyerapan, dan Azure AI Search untuk pengambilan. Menyokong dokumen multimodal, input/output pertuturan, pengesahan Microsoft Entra, dan jejak Application Insights.

**Mula Pantas**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplikasi Sembang RAG (.NET)

**Repositori**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Penerangan**: Setara .NET/C# dengan contoh sembang RAG Python. Dibina dengan ASP.NET Core Minimal API dan frontend Blazor WebAssembly. Termasuk sembang suara, sokongan visi GPT-4o-mini, dan klien desktop/mobile .NET MAUI Blazor Hybrid.

**Mula Pantas**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplikasi Sembang RAG (Java)

**Repositori**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Penerangan**: Versi Java contoh sembang RAG menggunakan Langchain4J untuk orkestrasi AI. Menyokong seni bina mikroservis berasaskan acara, pelbagai strategi carian (teks, vektor, hibrid), muat naik dokumen dengan Azure Document Intelligence, dan penghantaran pada Azure Container Apps atau Azure Kubernetes Service.

**Mula Pantas**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot Runcit Perusahaan dengan Azure AI Foundry

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Perkhidmatan**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Penerangan**: Copilot RAG runcit secara menyeluruh menggunakan Azure AI Foundry dan Prompty. Chatbot retailer Contoso Outdoor yang menyandarkan respons pada katalog produk dan data pesanan pelanggan. Menunjukkan aliran kerja penuh GenAIOps — prototaip dengan Prompty, nilai dengan penilai berpandu AI, dan hantar melalui AZD ke Container Apps.

**Mula Pantas**:
```bash
azd init --template contoso-chat
azd up
```

### Aplikasi Penulisan Kreatif Multi-Agen

**Repositori**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Perkhidmatan**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Penerangan**: Contoh multi-agen yang menunjukkan orkestrasi agen AI dengan Prompty. Menggunakan agen penyelidikan (Bing Grounding dalam Azure AI Agent Service), agen produk (Azure AI Search), agen penulis, dan agen editor untuk menghasilkan artikel berpenyelidikan dengan kerjasama. Termasuk CI/CD dengan penilaian di GitHub Actions.

**Mula Pantas**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Sembang RAG Tanpa Pelayan (JavaScript/TypeScript)

**Repositori**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Perkhidmatan**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB untuk NoSQL + LangChain.js

**Penerangan**: Chatbot RAG sepenuhnya tanpa pelayan menggunakan LangChain.js dengan Azure Functions untuk API dan Azure Static Web Apps sebagai hos. Menggunakan Azure Cosmos DB sebagai kedua-dua storan vektor dan pangkalan data sejarah sembang. Menyokong pembangunan setempat dengan Ollama untuk ujian kos sifar.

**Mula Pantas**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Pemecut Penyelesaian Chat dengan Data Anda

**Repositori**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Penerangan**: Pemecut penyelesaian RAG kelas perusahaan dengan portal pentadbir untuk muat naik/pengurusan dokumen, pelbagai pilihan pengaturcara (Semantic Kernel, LangChain, Prompt Flow), pertuturan ke teks, integrasi Microsoft Teams, dan pilihan backend PostgreSQL atau Cosmos DB. Direka sebagai titik permulaan yang boleh disesuaikan untuk senario RAG produksi.

**Mula Pantas**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Ejen Perjalanan AI — Orkestrasi MCP Multi-Agen

**Repositori**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Perkhidmatan**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Penerangan**: Aplikasi rujukan untuk orkestrasi AI multi-agen menggunakan tiga rangka kerja (LangChain.js, LlamaIndex.TS, dan Microsoft Agent Framework). Mempunyai pelayan MCP (Model Context Protocol) dalam empat bahasa dihantar sebagai Azure Container Apps tanpa pelayan dengan pemantauan OpenTelemetry.

**Mula Pantas**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Pemulaan Azure AI

**Repositori**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Perkhidmatan**: Perkhidmatan Azure AI + Azure OpenAI

**Penerangan**: Templat Bicep minimal yang menghantar perkhidmatan Azure AI dengan model pembelajaran mesin yang dikonfigurasi. Titik permulaan ringan apabila anda hanya memerlukan infrastruktur Azure AI disediakan tanpa keseluruhan tumpukan aplikasi.

**Mula Pantas**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Lihat lebih banyak templat**: Lawati [Galeri Templat AZD AI Hebat](https://azure.github.io/awesome-azd/?tags=ai) untuk 80+ templat AZD khusus AI merentas bahasa dan senario.

## Langkah Seterusnya

1. **Cuba Contoh**: Mulakan dengan templat siap guna yang sepadan dengan kes penggunaan anda
2. **Sesuaikan Mengikut Keperluan Anda**: Ubah infrastruktur dan kod aplikasi
3. **Tambah Pemantauan**: Laksanakan kebolehan pemerhatian menyeluruh
4. **Optimumkan Kos**: Laraskan konfigurasi mengikut bajet anda
5. **Amankan Penghantaran Anda**: Laksanakan corak keselamatan perusahaan
6. **Skalakan ke Pengeluaran**: Tambah ciri berbilang wilayah dan kebolehpercayaan tinggi

## 🎯 Latihan Praktikal

### Latihan 1: Hantar Aplikasi Sembang Model Microsoft Foundry (30 minit)
**Matlamat**: Hantar dan uji aplikasi sembang AI sedia produksi

```bash
# Inisialisasi templat
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Tetapkan pembolehubah persekitaran
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Lancarkan
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
- [ ] Penghantaran selesai tanpa ralat kuota
- [ ] Boleh akses antara muka sembang di pelayar
- [ ] Boleh tanya soalan dan dapatkan respons dikuasakan AI
- [ ] Application Insights menunjukkan data telemetri
- [ ] Sumber berjaya dibersihkan

**Anggaran Kos**: $5-10 untuk 30 minit ujian

### Latihan 2: Konfigurasi Penghantaran Pelbagai Model (45 minit)
**Matlamat**: Hantar pelbagai model AI dengan konfigurasi berbeza

```bash
# Cipta konfigurasi Bicep tersuai
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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

# Seterusnya dan sahkan
azd provision
azd show
```

**Kriteria Kejayaan:**
- [ ] Pelbagai model berjaya dihantar
- [ ] Tetapan kapasiti berbeza digunakan
- [ ] Model boleh diakses melalui API
- [ ] Boleh panggil kedua-dua model dari aplikasi

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

# Gunakan amaran bajet
azd provision

# Semak kos semasa
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Kriteria Kejayaan:**
- [ ] Amaran bajet dibuat di Azure
- [ ] Pemberitahuan e-mel dikonfigurasi
- [ ] Boleh lihat data kos di Portal Azure
- [ ] Ambang bajet ditetapkan dengan sesuai

## 💡 Soalan Lazim

<details>
<summary><strong>Bagaimana cara saya mengurangkan kos Microsoft Foundry Models semasa pembangunan?</strong></summary>

1. **Gunakan Tier Percuma**: Microsoft Foundry Models menawarkan 50,000 token/bulan percuma
2. **Kurangkan Kapasiti**: Tetapkan kapasiti kepada 10 TPM berbanding 30+ untuk pembangunan
3. **Gunakan azd down**: Nyahperuntuk sumber apabila tidak membangunkan secara aktif
4. **Cache Respons**: Laksanakan cache Redis untuk pertanyaan berulang
5. **Gunakan Kejuruteraan Prompt**: Kurangkan penggunaan token dengan prompt yang cekap

```bash
# Konfigurasi pembangunan
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Apa perbezaan antara Microsoft Foundry Models dan OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Keselamatan perusahaan dan pematuhan
- Integrasi rangkaian peribadi
- Jaminan SLA
- Pengesahan identiti terurus
- Kuota lebih tinggi tersedia

**OpenAI API**:
- Akses lebih pantas ke model baru
- Tetapan lebih mudah
- Halangan masuk lebih rendah
- Internet awam sahaja

Untuk aplikasi produksi, **Microsoft Foundry Models disyorkan**.
</details>

<details>
<summary><strong>Bagaimana saya mengendalikan ralat kuota Microsoft Foundry Models yang melebihi had?</strong></summary>

```bash
# Semak kuota semasa
az cognitiveservices usage list --location eastus2

# Cuba wilayah berbeza
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
<summary><strong>Bolehkah saya menggunakan data saya sendiri dengan Microsoft Foundry Models?</strong></summary>

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
1. Gunakan Managed Identity (tiada kunci API)
2. Aktifkan Private Endpoints
3. Konfigurasikan kumpulan keselamatan rangkaian
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
- **Agent Skills**: [Kemahiran Microsoft Foundry di skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Pasang kemahiran agen Azure + Foundry dalam editor anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Penghantaran Model AI](ai-model-deployment.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai perbincangan komuniti kami atau buka isu dalam repositori. Komuniti Azure AI + AZD ada di sini untuk membantu anda berjaya!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha mencapai ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat yang penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->