<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T21:43:10+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "th"
}
-->
# การผสานรวม Azure AI Foundry กับ AZD

**ก่อนหน้า:** [โครงการแรก](../getting-started/first-project.md) | **ถัดไป:** [การปรับใช้โมเดล AI](ai-model-deployment.md)

## ภาพรวม

คู่มือนี้แสดงวิธีการผสานรวมบริการ Azure AI Foundry กับ Azure Developer CLI (AZD) เพื่อการปรับใช้แอปพลิเคชัน AI ที่ง่ายขึ้น Azure AI Foundry เป็นแพลตฟอร์มที่ครอบคลุมสำหรับการสร้าง ปรับใช้ และจัดการแอปพลิเคชัน AI ในขณะที่ AZD ช่วยลดความซับซ้อนของกระบวนการโครงสร้างพื้นฐานและการปรับใช้

## Azure AI Foundry คืออะไร?

Azure AI Foundry เป็นแพลตฟอร์มรวมของ Microsoft สำหรับการพัฒนา AI ซึ่งประกอบด้วย:

- **Model Catalog**: การเข้าถึงโมเดล AI ที่ล้ำสมัย
- **Prompt Flow**: เครื่องมือออกแบบเวิร์กโฟลว์ AI แบบภาพ
- **AI Foundry Portal**: สภาพแวดล้อมการพัฒนาที่ผสานรวมสำหรับแอปพลิเคชัน AI
- **Deployment Options**: ตัวเลือกการโฮสต์และการปรับขนาดที่หลากหลาย
- **Safety and Security**: คุณสมบัติ AI ที่รับผิดชอบในตัว

## AZD + Azure AI Foundry: การทำงานร่วมกันที่ดียิ่งขึ้น

| คุณสมบัติ | Azure AI Foundry | ประโยชน์จากการผสานรวม AZD |
|-----------|------------------|-----------------------------|
| **การปรับใช้โมเดล** | การปรับใช้ผ่านพอร์ทัลแบบแมนนวล | การปรับใช้แบบอัตโนมัติและทำซ้ำได้ |
| **โครงสร้างพื้นฐาน** | การจัดเตรียมผ่านการคลิก | โครงสร้างพื้นฐานเป็นโค้ด (Bicep) |
| **การจัดการสภาพแวดล้อม** | มุ่งเน้นที่สภาพแวดล้อมเดียว | หลายสภาพแวดล้อม (dev/staging/prod) |
| **การผสานรวม CI/CD** | จำกัด | รองรับ GitHub Actions โดยตรง |
| **การจัดการต้นทุน** | การตรวจสอบขั้นพื้นฐาน | การปรับต้นทุนให้เหมาะสมตามสภาพแวดล้อม |

## ข้อกำหนดเบื้องต้น

- การสมัครใช้งาน Azure พร้อมสิทธิ์ที่เหมาะสม
- ติดตั้ง Azure Developer CLI
- การเข้าถึงบริการ Azure OpenAI
- ความคุ้นเคยพื้นฐานกับ Azure AI Foundry

## รูปแบบการผสานรวมหลัก

### รูปแบบที่ 1: การผสานรวม Azure OpenAI

**กรณีการใช้งาน**: ปรับใช้แอปพลิเคชันแชทด้วยโมเดล Azure OpenAI

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

**โครงสร้างพื้นฐาน (main.bicep):**
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

### รูปแบบที่ 2: การผสานรวม AI Search + RAG

**กรณีการใช้งาน**: ปรับใช้แอปพลิเคชัน retrieval-augmented generation (RAG)

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

### รูปแบบที่ 3: การผสานรวม Document Intelligence

**กรณีการใช้งาน**: เวิร์กโฟลว์การประมวลผลและวิเคราะห์เอกสาร

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

## 🔧 รูปแบบการกำหนดค่า

### การตั้งค่าตัวแปรสภาพแวดล้อม

**การกำหนดค่าการผลิต:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**การกำหนดค่าการพัฒนา:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### การกำหนดค่าที่ปลอดภัยด้วย Key Vault

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

## เวิร์กโฟลว์การปรับใช้

### การปรับใช้ด้วยคำสั่งเดียว

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### การปรับใช้ตามสภาพแวดล้อม

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

## การตรวจสอบและการสังเกตการณ์

### การผสานรวม Application Insights

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

### การตรวจสอบต้นทุน

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

## 🔐 แนวทางปฏิบัติด้านความปลอดภัยที่ดีที่สุด

### การกำหนดค่าตัวตนที่มีการจัดการ

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

### ความปลอดภัยของเครือข่าย

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

## การเพิ่มประสิทธิภาพ

### กลยุทธ์การแคช

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

### การกำหนดค่า Auto-scaling

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

## การแก้ไขปัญหาทั่วไป

### ปัญหา 1: โควตา OpenAI เกิน

**อาการ:**
- การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควตา
- ข้อผิดพลาด 429 ในบันทึกแอปพลิเคชัน

**วิธีแก้ไข:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ปัญหา 2: การตรวจสอบสิทธิ์ล้มเหลว

**อาการ:**
- ข้อผิดพลาด 401/403 เมื่อเรียกใช้บริการ AI
- ข้อความ "Access denied"

**วิธีแก้ไข:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ปัญหา 3: ปัญหาการปรับใช้โมเดล

**อาการ:**
- โมเดลไม่พร้อมใช้งานในการปรับใช้
- เวอร์ชันโมเดลเฉพาะล้มเหลว

**วิธีแก้ไข:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## เทมเพลตตัวอย่าง

### แอปพลิเคชันแชทพื้นฐาน

**ที่เก็บ:** [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**บริการ:** Azure OpenAI + Cognitive Search + App Service

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### ท่อประมวลผลเอกสาร

**ที่เก็บ:** [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**บริการ:** Document Intelligence + Storage + Functions

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template ai-document-processing
azd up
```

### แชทองค์กรด้วย RAG

**ที่เก็บ:** [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**บริการ:** Azure OpenAI + Search + Container Apps + Cosmos DB

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template contoso-chat
azd up
```

## ขั้นตอนถัดไป

1. **ลองใช้ตัวอย่าง**: เริ่มต้นด้วยเทมเพลตที่สร้างไว้ล่วงหน้าที่ตรงกับกรณีการใช้งานของคุณ
2. **ปรับแต่งตามความต้องการของคุณ**: แก้ไขโครงสร้างพื้นฐานและโค้ดแอปพลิเคชัน
3. **เพิ่มการตรวจสอบ**: ใช้การสังเกตการณ์ที่ครอบคลุม
4. **ปรับต้นทุนให้เหมาะสม**: ปรับแต่งการกำหนดค่าให้เหมาะกับงบประมาณของคุณ
5. **รักษาความปลอดภัยในการปรับใช้ของคุณ**: ใช้รูปแบบความปลอดภัยระดับองค์กร
6. **ปรับขนาดสู่การผลิต**: เพิ่มคุณสมบัติหลายภูมิภาคและความพร้อมใช้งานสูง

## ชุมชนและการสนับสนุน

- **Azure AI Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ปัญหาและการอภิปราย](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/azure/ai-studio/)

---

**ก่อนหน้า:** [โครงการแรก](../getting-started/first-project.md) | **ถัดไป:** [การปรับใช้โมเดล AI](ai-model-deployment.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมการอภิปรายในชุมชนของเราหรือเปิดปัญหาในที่เก็บ ชุมชน Azure AI + AZD พร้อมช่วยให้คุณประสบความสำเร็จ!

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้