# Integrasi Microsoft Foundry dengan AZD

**Navigasi Bab:**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Ejen AI](agents.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

## Gambaran Keseluruhan

Panduan ini menunjukkan cara mengintegrasikan perkhidmatan Microsoft Foundry dengan Azure Developer CLI (AZD) untuk penyebaran aplikasi AI yang lebih lancar. Microsoft Foundry menyediakan platform menyeluruh untuk membina, menyebarkan, dan mengurus aplikasi AI, manakala AZD mempermudah proses infrastruktur dan penyebaran.

## Apakah Microsoft Foundry?

Microsoft Foundry adalah platform bersatu Microsoft untuk pembangunan AI yang merangkumi:

- **Katalog Model**: Akses kepada model AI tercanggih
- **Prompt Flow**: Pereka visual untuk aliran kerja AI
- **Portal Microsoft Foundry**: Persekitaran pembangunan bersepadu untuk aplikasi AI
- **Pilihan Penyebaran**: Pelbagai pilihan hosting dan skala
- **Keselamatan dan Keselamatan**: Ciri AI bertanggungjawab terbina dalam

## AZD + Microsoft Foundry: Lebih Baik Bersama

| Ciri | Microsoft Foundry | Manfaat Integrasi AZD |
|---------|-----------------|------------------------|
| **Penyebaran Model** | Penyebaran portal manual | Penyebaran automatik, boleh diulang |
| **Infrastruktur** | Konfigurasi projek dan sumber | Mula dari `azure.yaml`; keluarkan Bicep atau Terraform apabila diperlukan |
| **Pengurusan Persekitaran** | Fokus persekitaran tunggal | Multi-persekitaran (dev/staging/prod) |
| **Integrasi CI/CD** | Perkhidmatan penyebaran dan penilaian | Guna semula konfigurasi dalam GitHub Actions atau Azure DevOps |
| **Pengurusan Kos** | Pemantauan asas | Pengoptimuman kos khusus persekitaran |

## Prasyarat

- Langganan Azure dengan kebenaran yang sesuai
- Azure Developer CLI 1.37.0 atau lebih baru untuk aliran kerja GA Foundry
- Akses ke perkhidmatan Model Microsoft Foundry
- Kefahaman asas tentang Microsoft Foundry

> **Kemas kini Foundry GA (2026-11-09):** Gumpalan peluasan `microsoft.foundry` telah mencapai versi 1.0 dan ketersediaan umum pada [5 November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Panduan di bawah mengikuti pengumuman itu dan panduan pantas Microsoft Learn yang dipautkan. Ini adalah semakan dokumentasi, bukan pengesahan penyebaran langsung. Ciri pratonton pilihan dan peluasan yang dikeluarkan secara bebas mengekalkan status keluaran mereka sendiri.

**Hasil pembelajaran:** Pasang gumpalan GA, semak `azure.yaml` ejen, bandingkan respons tempatan dan yang disebarkan, dan terangkan sempadan penilaian, CI/CD, dan pembersihan. Untuk penyebaran ejen langkah demi langkah, pergi ke [panduan hos-ejen](#hosted-agent-walkthrough-ga). Pecahan sumber di bawah menerangkan corak integrasi lain.

## Corak Integrasi Teras

**Skop contoh:** Bicep di bawah mengandungi pecahan sumber ilustrasi, bukan templat lengkap yang boleh disebarkan. Templat induk mesti menentukan nama, `location`, sumber dirujuk, identiti, output, dan hosting aplikasi. Gunakan sampel berlink sebagai titik permulaan boleh jalankan. Contoh Bash memerlukan pengesahan Azure CLI secara berasingan dari `azd auth login`.

### Corak 1: Integrasi Model Microsoft Foundry

**Kes Penggunaan**: Menyebarkan aplikasi sembang dengan model Azure OpenAI dalam Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Pemanggil memerlukan identiti terurus terpasang dan `Cognitive Services OpenAI User` pada skop akaun; melumpuhkan kekunci tidak memberikan akses. Sahkan ketersediaan wilayah/model/SKU dan kuota sebelum penyebaran.

### Corak 2: Integrasi Carian AI + RAG

**Kes Penggunaan**: Menyebarkan aplikasi generasi berpandukan pengambilan (RAG)

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

```

Tiada sumber ARM `Microsoft.Search/searchServices/dataConnections` untuk integrasi ini. Konfigurasikan indeks Carian, sumber data, indexer/skillset atau vectorizer melalui API lapangan-data Carian yang disokong. Jika Carian memanggil model embedding, aktifkan identiti terurusnya, beri peranan model berkaitan, dan konfigurasikan kemahiran embedding/vectorizernya. Lihat [vektorisasi bersepadu](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

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

### Penyediaan Pembolehubah Persekitaran

Kecuali untuk tetapan AZD yang didokumentasikan seperti `AZURE_LOCATION`, ini adalah **nama input templat tersuai**. Ia tidak memberi kesan melainkan templat/aplikasi menggunakannya melalui parameter dan peta persekitaran hos. Untuk `azure-search-openai-demo`, gunakan nama sebenar seperti `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` dan `AZURE_SEARCH_SERVICE_SKU` sebagai gantinya. Kapasiti model bukan SKU akaun.

**Konfigurasi Pengeluaran:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Konfigurasi Pembangunan:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Konfigurasi Selamat dengan Key Vault

Utamakan Entra ID dengan pengesahan kunci tempatan dilumpuhkan. Berikut hanya **alternatif pengesahan kunci legacy** untuk aplikasi yang memerlukan kunci: ia memerlukan akaun dengan pengesahan kunci diaktifkan, identiti aplikasi dipasang pada hosnya, dan akses/ketersambungan Key Vault yang berfungsi. Jangan gabungkan pengambilan kunci dengan `disableLocalAuth: true` dan jangka panggilan berasaskan kunci akan berfungsi.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

### Sambungan AZD untuk Foundry

Untuk aliran kerja GA, pasang gumpalan `microsoft.foundry` dan bukannya menyusun peluasan teras satu-persatu:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Gumpalan memasang ejen, sambungan, pemeriksa, projek, rutin, kemahiran, dan kotak alat. Ia tidak menambah kumpulan arahan `microsoft.foundry`. Penilaian, set data, penalaan halus, dan model tersuai dipasang berasingan apabila diperlukan. Lihat [rujukan pembungkusan peluasan](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Panduan Hosted-Agent (GA)

**Hosted agent** menjalankan kod ejen anda pada pengkomputeran yang diurus Foundry. Latihan ini menggunakan sampel API Respons Rangka Kerja Ejen Python asas huluan, bukan serpihan SDK Perkhidmatan Ejen klasik dalam pelajaran lain.

#### 1. Sediakan dan inisialisasikan

Gunakan direktori kosong di luar checkout kursus ini. Pasang Python 3.13 atau lebih baru dan [rilis uv terkini](https://docs.astral.sh/uv/getting-started/installation/). Pemasangan uv berdiri sendiri boleh menggunakan `uv self update`. Periksa [kebenaran hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), ketersediaan model, dan kuota dalam langganan serta wilayah anda sebelum menyediakan. Sumber Azure dan panggilan model tempatan dikenakan bayaran.

Lengkapkan pemasangan `azd auth login` dan gumpalan di atas. Kod sampel tempatan menggunakan `DefaultAzureCredential`; jika menggunakan kelayakan Azure CLI, daftar masuk dengan `az login` menggunakan akaun dan penyewa yang sama dengan AZD. Daftar masuk AZD sahaja bukanlah daftar masuk Azure CLI.

Jalankan arahan satu baris ini dalam Bash atau PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Pilih projek Foundry baru atau sedia ada dan langganan serta wilayah yang dikehendaki. Untuk menggunakan semula penyebaran model, tambah `--model-deployment <existing-deployment-name>` kepada arahan inisialisasi **sebelum menjalankannya**, dan pilih projek sedia ada. Kekal di direktori yang mengandungi `azure.yaml` yang dijana untuk arahan selebihnya.

#### 2. Semak definisi penyebaran

Buka `azure.yaml` dan cari tetapan ini dalam [sampel huluan](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Tetapan | Apa yang perlu disemak |
|---------|---------------|
| `host: azure.ai.project` dan `deployments` | Projek Foundry dan nama model yang dimaksudkan, versi, SKU penyebaran, dan kapasiti |
| `host: azure.ai.agent` dan `project` | Hosted agent dan direktori yang mengandungi sumbernya |
| `codeConfiguration` | Runtime Python dan titik masuk; sampel yang disemak menggunakan `python_3_13` dan `main.py` |
| `uses` | Kebergantungan pada perkhidmatan projek Foundry |
| `container.resources` | Peruntukan CPU dan memori, walaupun kod dibina secara jauh |
| `env` | Pemetaan penyebaran model dan `PYTHONNOUSERSITE: "1"` untuk melumpuhkan pemuatan pakej tapak pengguna |
| `infra.provider` | `microsoft.foundry`, yang mensintesis infrastruktur yang diperlukan |

Komitkan `azure.yaml` dan kod ejen yang disemak bersama-sama. Tiada infrastruktur bertulis tangan diperlukan untuk bermula; apabila anda memerlukan fail penyediaan boleh edit, ikut [pengeksporan infrastruktur](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) untuk Bicep atau Terraform dan teruskan menggunakan `azd provision`. Jangan komit kelayakan atau keadaan persekitaran `.azure/`.

#### 3. Sediakan dan uji secara tempatan

```bash
azd provision
azd ai agent run
```

Penyediaan boleh mencipta penyebaran model yang hilang **walaupun dalam projek yang digunakan semula**. Semak prompt model dan pilih jenis penyebaran dalam talian yang tersedia seperti Global Standard atau Data Zone Standard; kuota dan sokongan wilayah berbeza-beza.

Larian tempatan menyediakan kebergantungan dan membuka **Agent Inspector**, di mana anda boleh memeriksa permintaan, respons, dan aktiviti alat/model. Biarkan ia berjalan dan buka terminal kedua dalam direktori projek yang sama:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Pemeriksaan:** Sahkan anda menerima respons yang relevan dan boleh memeriksa aktiviti tempatan yang berkaitan. Pelaksanaan tempatan masih memanggil penyebaran model Azure anda; ini bukan ujian luar talian atau percuma. Gunakan prompt sintetik dan elakkan mendedahkan rahsia atau data sensitif dalam keluaran pemeriksa.

#### 4. Sebar dan bandingkan

Hentikan larian tempatan dengan Ctrl+C apabila selesai. Sebelum panggilan jauh, konfigurasikan atau sahkan [sambungan Application Insights projek dan akses bacaan jejak](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing).

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

Dalam mod penyebaran kod, AZD memuat naik sumber untuk binaan Foundry jauh; anda tidak memerlukan binaan bekas tempatan untuk laluan ini. Output penyebaran menyediakan pautan taman permainan dan titik akhir. Sahkan respons dari ejen yang disebarkan dan jejak awannya; acara pemeriksa tempatan sahaja tidak membuktikan jejak awan berfungsi.

Untuk perubahan selanjutnya, semak konfigurasi hosted-agent yang disokong dengan `azd deploy --preview`. Alir aliran log dengan `azd ai agent monitor --follow`, atau diagnosis masalah persediaan dan akses dengan `azd ai agent doctor`. Pratonton penyebaran bukan semakan lengkap infrastruktur atau keselamatan.

#### 5. Tambah semakan kualiti boleh ulang

Pasang peluasan penilaian yang dikeluarkan secara bebas, kemudian jana aset ujian draf:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Terangkan tingkah laku yang dimaksudkan bagi ejen dan pilih **Set Data dan Penilai**, kemudian **Turn**. Semak dan sunting kes dan rubrik gred yang dijana, termasuk kes soalan tidak disokong, sebelum mengkonfigurasi penilaian:

```bash
azd ai eval init --name quality
```

Pilih set data dan rubrik yang disemak dan sahkan penyebaran model hakim. Periksa `evals/azure.eval.yaml` dan rujukan perkhidmatan penilaiannya dalam `azure.yaml`, kemudian daftar aset dan jalankan:

```bash
azd up
azd ai eval run start --eval quality
```

Periksa skor dan kes gagal atau ralat; penilaian selesai tidak secara automatik bermakna lulus kualiti. Penjanaan dan penilaian juga mengenakan bayaran model. Komit konfigurasi bukan rahsia, set data, dan rubrik supaya rakan sekerja dapat membandingkan perubahan. `azd ai agent optimize` boleh guna semula penilaian serasi sebagai garis dasar, tetapi semak calon sebelum secara eksplisit menyebarkan satu. Lihat [gerbang kualiti dan migrasi](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) untuk projek lama dan CI.

#### 6. Guna semula aliran kerja dalam CI/CD

Selepas `azd up` berjaya, jalankan `azd pipeline config` dan semak aliran kerja GitHub Actions atau Azure DevOps yang dijana. Pasang `microsoft.foundry` pada pelari, serta `azure.ai.evaluations` jika menjalankan penilaian. Kekalkan tetapan checkout, daftar masuk, dan persekitaran yang dijana; pemasangan sahaja tidak mengesahkan talian paip.

Gunakan persekitaran AZD berasingan bagi setiap peringkat, beri identiti talian paip kebenaran sumber dan Foundry yang diperlukan, dan simpan kelayakan dalam rahsia talian paip atau gunakan identiti federasi. Komit aset penilaian dan sahkan identiti boleh mengakses set data/penilai dirujuk. Lihat [contoh talian paip kursus](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) dan [panduan Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Bersihkan dengan sengaja

Untuk **projek baru yang dibuat oleh persekitaran ini**, semak sumber yang disenaraikan oleh `azd down` sebelum mengesahkan: ia memadam kumpulan sumber dan segala isinya.

Untuk **projek yang digunakan semula**, `azd down` meninggalkan projek, hosted agent, dan sumber lain di tempat. Buang hanya sumber tidak diingini yang anda miliki menggunakan [panduan pembersihan cepat](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); jangan padam kumpulan sumber berkongsi untuk membersihkan satu latihan.

**Semakan penyelesaian:** Terangkan tetapan mana yang mengawal tingkah laku tempatan dan awan, tunjukkan respons tempatan dan disebarkan, semak keputusan penilaian, dan kenal pasti sumber yang kekal selepas pembersihan.

### Pilihan: Bingkai dengan Kemahiran Microsoft Foundry

Pasang [Kemahiran Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) untuk host ejen pengkodan anda, kemudian buka folder kosong berasingan. Minta ia membingkai sampel API Respons Rangka Kerja Ejen Python asas dalam mod penyebaran kod, terangkan `azure.yaml` yang dijana, dan cadangkan langganan, wilayah, projek, dan penyebaran model. Perlukan kelulusan **sebelum mencipta sumber Azure**, minta ujian tempatan, dan berhenti sebelum penyebaran. Semak outputnya dan teruskan dengan langkah penyebaran di atas hanya bila sudah bersedia.

Untuk projek sedia ada, `--template`/`-t` menggantikan ejaan usang `--manifest`/`-m`; menukar bendera tidak memindahkan manifest warisan atau konfigurasi agen bersarang. Lihat [rujukan AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Penghantaran Perintah Tunggal

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Penghantaran Khusus Persekitaran

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Pemantauan dan Kebolehperhatan

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
```

Ini menyediakan sumber Insights, bukan instrumentasi telemetri. Setelah aplikasi anda menghantar span panggilan model keluar, jalankan pertanyaan ilustrasi ini dalam Application Insights Logs (sesuaikan penapis kepada nama span sebenar anda):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Pemantauan Kos

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Gunakan penerima sebenar dan sahkan kebenaran skop pengebilan. Belanjawan menghantar amaran; ia bukan had perbelanjaan.

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

Fragmen titik akhir ini juga memerlukan zon/kumpulan DNS peribadi, pautan VNet, kesambungan VNet aplikasi, dan dasar akses awam yang jelas. Mewujudkan titik akhir peribadi sahaja tidak mematikan akses awam.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Azure Cache untuk Redis Basic/Standard/Premium berada dalam [laluan persaraan](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); gunakan Azure Managed Redis untuk penghantaran baru dan ikuti panduan templat/pengesahan semasanya. Skopkan respons AI cache mengikut kebenaran, model/arahan, dan versi data, dengan tarikh luput; jangan pernah berkongsi respons peribadi hanya menggunakan teks pertanyaan.

### Konfigurasi Penskalaaran Automatik

**Sumber separa:** gabungkan tetapan skala/ingress ini ke dalam Aplikasi Kontena lengkap dengan persekitaran terurus, imej kontena, dan had sumber. Salinan lebih banyak tidak meningkatkan kuota model.

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

### Isu 1: Kuota OpenAI Terlebih

**Gejala:**
- Penghantaran gagal dengan ralat kuota
- Ralat 429 dalam log aplikasi

**Penyelesaian:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Pembolehubah kapasiti di atas hanya terpakai kepada templat tersuai yang disambungkan untuk menggunakannya. Untuk contoh RAG, gunakan `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Jangan tukar `AZURE_LOCATION` untuk memindahkan sumber sedia ada; buat persekitaran berasingan untuk rantau baru dan rancangkan migrasi/pembersihan.

### Isu 2: Kegagalan Pengesahan

**Gejala:**
- Ralat 401/403 semasa memanggil perkhidmatan AI
- Mesej "Akses ditolak"

**Penyelesaian:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Isu 3: Masalah Penghantaran Model

**Gejala:**
- Model tidak tersedia dalam penghantaran
- Versi model tertentu gagal

**Penyelesaian:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Templat Contoh

Ini adalah alternatif, bukan perintah berturutan. Mulakan setiap satu dalam direktori kosong yang berasingan. Destinasi `.` yang jelas mengekalkan inisialisasi dalam direktori semasa anda; jika tidak AZD semasa boleh mencipta direktori anak bernama templat tanpa mengubah direktori kerja shell anda.

### Aplikasi Chat RAG (Python)

**Repositori**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Penerangan**: Aplikasi rujukan chat RAG untuk soalan atas dokumen anda, dengan carian Azure AI Search. Semak model disokong contoh semasa, ciri pilihan, panduan kos, dan pengukuhan pengeluaran sebelum digunakan; menghantar contoh tidak menjadikan aplikasi siap produksi.

**Mula Cepat**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplikasi Chat RAG (.NET)

**Repositori**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Penerangan**: Setara .NET/C# untuk contoh chat RAG Python. Dibina dengan ASP.NET Core Minimal API dan frontend Blazor WebAssembly. Termasuk chat suara, sokongan GPT-4o-mini vision, dan klien meja kerja mudah alih desktop .NET MAUI Blazor Hybrid.

**Mula Cepat**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplikasi Chat RAG (Java)

**Repositori**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Perkhidmatan**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Penerangan**: Versi Java contoh chat RAG menggunakan Langchain4J untuk orkestrasi AI. Menyokong seni bina acara microservice, pelbagai strategi carian (teks, vektor, hibrid), muat naik dokumen dengan Azure Document Intelligence, dan penghantaran sama ada di Azure Container Apps atau Azure Kubernetes Service.

**Mula Cepat**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Co-pilot Peruncitan Enterprise dengan Microsoft Foundry

**Repositori**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Perkhidmatan**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Penerangan**: Co-pilot runcit RAG hujung ke hujung menggunakan Microsoft Foundry dan Prompty. Chatbot peruncit Contoso Outdoor yang mendasarkan respons pada katalog produk dan data pesanan pelanggan. Menunjukkan aliran kerja GenAIOps penuh — prototaip dengan Prompty, nilai dengan penilai terbantu AI, dan hantar melalui AZD ke Container Apps.

**Mula Cepat**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplikasi Penulisan Kreatif Multi-Agen

**Repositori**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Perkhidmatan**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Penerangan**: Contoh multi-agen menunjukkan orkestrasi agen AI dengan Prompty. Menggunakan agen penyelidikan (Bing Grounding dalam Azure AI Agent Service), agen produk (Azure AI Search), agen penulis, dan agen editor untuk menghasilkan artikel yang diselidik dengan baik secara bersama. Termasuk CI/CD dengan penilaian dalam GitHub Actions.

**Mula Cepat**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Tanpa Pelayan (JavaScript/TypeScript)

**Repositori**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Perkhidmatan**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB untuk NoSQL + LangChain.js

**Penerangan**: Chatbot RAG sepenuhnya tanpa pelayan menggunakan LangChain.js dengan Azure Functions untuk API dan Azure Static Web Apps untuk hosting. Menggunakan Azure Cosmos DB sebagai stor vektor dan pangkalan data sejarah chat. Menyokong pembangunan tempatan dengan Ollama untuk ujian kos sifar.

**Mula Cepat**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Penyelesaian Percepat Chat dengan Data Anda

**Repositori**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Perkhidmatan**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search dengan Cosmos DB, atau PostgreSQL dengan pgvector

**Penerangan**: Pecut chat berasaskan dokumen dengan kutipan. Contoh semasa menghoskan frontend React, backend FastAPI, dan pekerja ingestion Functions pada Container Apps; pilihan orkestrator adalah Agent Framework dan LangGraph. Pilihan pangkalan data/pemulihan dipilih semasa penghantaran. Ia adalah titik permulaan, bukan sistem produksi turnkey; jangan anggap varian App Service lama, Semantic Kernel, atau Prompt Flow menggambarkan lalai semasa.

**Mula Cepat**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Ejen Perjalanan AI — Orkestrasi Multi-Agen MCP

**Repositori**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Perkhidmatan**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Server MCP (.NET, Python, Java, TypeScript)

**Penerangan**: Aplikasi rujukan untuk orkestrasi AI multi-agen menggunakan tiga rangka kerja (LangChain.js, LlamaIndex.TS, dan Microsoft Agent Framework). Mempunyai pelayan MCP (Model Context Protocol) dalam empat bahasa dihantar sebagai Azure Container Apps tanpa pelayan dengan pemantauan OpenTelemetry.

**Mula Cepat**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Layari lebih banyak templat**: Lawati [Galeri Templat AI AZD Hebat](https://azure.github.io/awesome-azd/?tags=ai) untuk templat tersedia kini merentasi bahasa dan senario. Setiap contoh berpaut adalah repositori luaran, bukan contoh tempatan yang dibekalkan oleh kursus ini; periksa prasyarat dan panduan produksi semasanya sebelum penghantaran.

## Langkah Seterusnya

1. **Cuba Contoh**: Mulakan dengan templat terbina yang sesuai dengan kes penggunaan anda
2. **Sesuaikan untuk Keperluan Anda**: Ubahsuai infrastruktur dan kod aplikasi
3. **Tambah Pemantauan**: Laksanakan kebolehperhatan menyeluruh
4. **Optimakan Kos**: Laraskan konfigurasi mengikut bajet anda
5. **Amankan Penghantaran Anda**: Laksanakan corak keselamatan perusahaan
6. **Skala ke Produksi**: Tambah ciri pelbagai rantau dan ketersediaan tinggi

## 🎯 Latihan Amali

### Latihan 1: Hantar Aplikasi Chat Model Microsoft Foundry (30 minit)
**Matlamat**: Hantar dan uji aplikasi rujukan chat AI

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Kriteria Kejayaan:**
- [ ] Penghantaran lengkap tanpa ralat kuota
- [ ] Boleh akses antara muka chat dalam pelayar
- [ ] Boleh bertanya soalan dan dapatkan respons dikuasakan AI
- [ ] Application Insights menunjukkan data telemetri
- [ ] Sumber berjaya dibersihkan

**Kos:** Semak panduan kos semasa dan SKU dipilih sebelum penghantaran. Pengebilan berterusan sehingga sumber dipadam; tiada anggaran 30 minit tetap untuk setiap konfigurasi.

### Latihan 2: Konfigurasikan Penghantaran Multi-Model (45 minit)
**Matlamat**: Hantar pelbagai model AI dengan konfigurasi berbeza

**Titik permulaan:** Akaun Azure OpenAI sedia ada dan modul kumpulan sumber AZD yang boleh memanggil fail ini. Cipta `infra/ai-models.bicep` dengan kandungan berikut menggunakan penyunting anda. Ia tidak dihantar secara automatik hanya kerana ia di bawah `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Dari modul bertema kumpulan sumber yang memiliki akaun, tambah panggilan modul (sesuaikan nama simbol kepada akaun sebenar anda):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Jangan isytiharkan penghantaran yang sama dalam kedua-dua modul. Jika titik masuk AZD bertema langganan, panggil ini dari modul anak bertema kumpulan sumber dan sesuaikan laluan relatif. Bina modul mengandungi itu dengan `az bicep build --file <path-to-containing-module>`, kemudian:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Kriteria Kejayaan:**
- [ ] Pelbagai model dihantar berjaya
- [ ] Tetapan kapasiti berbeza diterapkan
- [ ] Model boleh diakses melalui API
- [ ] Boleh panggil kedua-dua model dari aplikasi

### Latihan 3: Laksanakan Pemantauan Kos (20 minit)
**Matlamat**: Tetapkan amaran bajet dan penjejakan kos

**Titik permulaan:** Corak bajet di atas dan modul infrastruktur bertema kumpulan sumber. Tambah sumber ini menggunakan penyunting anda; hantar `budgetStartDate` dari pemetaan parameter anda (jangan gandakan parameter jika sudah diisytiharkan). Gantikan penerima dan sahkan anda mempunyai akses menulis bajet.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Dijangka: respons mengandungi `amount: 200`, kedua-dua ambang, dan penerima anda. Periksa Pengurusan Kos dalam portal untuk caj sebenar; data kos tertangguh dan amaran tak semestinya dipicu semasa latihan pendek.

**Kriteria Kejayaan:**
- [ ] Amaran bajet dicipta dalam Azure
- [ ] Pemberitahuan email dikonfigurasikan
- [ ] Boleh lihat data kos dalam Portal Azure
- [ ] Ambang bajet ditetapkan dengan sesuai

## 💡 Soalan Lazim

<details>
<summary><strong>Bagaimana saya mengurangkan kos Model Microsoft Foundry semasa pembangunan?</strong></summary>

1. **Periksa harga**: Tiada elaun bulanan universal 50,000 token percuma untuk model Azure OpenAI
2. **Saiz kapasiti dengan betul**: Kapasiti `10` biasanya mewakili 10,000 TPM untuk model teks Standard ini, bukan 10 TPM. Mengurangkan had kadar ini tidak mengurangkan harga per token
3. **Gunakan azd down**: Padam sumber pakai buang apabila tidak dalam pembangunan aktif (ini bukan penamatan)
4. **Cache Respons**: Laksanakan cache Redis untuk pertanyaan berulang
5. **Gunakan Kejuruteraan Prompt**: Kurangkan penggunaan token dengan prompt cekap

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Apa beza antara Model Microsoft Foundry dan OpenAI API?</strong></summary>

**Model Microsoft Foundry**:
- Keselamatan dan pematuhan perusahaan
- Integrasi rangkaian peribadi
- Jaminan SLA
- Pengesahan identiti terurus
- Kuota lebih tinggi tersedia

**OpenAI API**: Penyedia/API berasingan dengan ketersediaan model, harga, pengesahan, dan pilihan hubungan perusahaan tersendiri. Bandingkan tawaran semasa dan jangan anggap hanya internet awam atau sentiasa menghantar model dahulu.

Pilih berdasarkan keperluan organisasi anda; contoh identiti terurus khusus Azure dan pautan peribadi dalam kursus ini terpakai kepada perkhidmatan Azure-hosted, bukan setiap model/penyedia dalam katalog Foundry.
</details>

<details>
<summary><strong>Bagaimana saya mengendalikan ralat kuota Microsoft Foundry Models terlebih?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Bolehkah saya menggunakan data sendiri dengan Model Microsoft Foundry?</strong></summary>

Ya! Gunakan **Azure AI Search** untuk RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Lihat templat [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Bagaimana saya melindungi titik akhir model AI?</strong></summary>

**Amalan Terbaik**:
1. Gunakan Identiti Terurus (tanpa kunci API)
2. Aktifkan Titik Akhir Peribadi
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

- **Microsoft Foundry Discord**: [saluran #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Isu dan perbincangan](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Dokumentasi rasmi](https://learn.microsoft.com/azure/ai-studio/)
- **Kemahiran Ejen**: [Kemahiran Microsoft Foundry di skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Pasang kemahiran ejen Azure + Foundry dalam penyunting anda dengan `npx skills add microsoft/github-copilot-for-azure`

---

**Navigasi Bab:**
- **📚 Rumah Kursus**: [AZD Untuk Pemula](../../README.md)
- **📖 Bab Semasa**: Bab 2 - Pembangunan AI-Pertama
- **⬅️ Bab Sebelumnya**: [Bab 1: Projek Pertama Anda](../chapter-01-foundation/first-project.md)
- **➡️ Seterusnya**: [Ejen AI](agents.md)
- **🚀 Bab Seterusnya**: [Bab 3: Konfigurasi](../chapter-03-configuration/configuration.md)

**Perlukan Bantuan?** Sertai perbincangan komuniti kami atau buka isu dalam repositori. Komuniti Azure AI + AZD di sini untuk membantu anda berjaya!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->