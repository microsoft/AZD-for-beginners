# การรวม Microsoft Foundry กับ AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI เป็นอันดับแรก
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โครงการแรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

## ภาพรวม

คู่มือฉบับนี้แสดงวิธีการรวมบริการ Microsoft Foundry กับ Azure Developer CLI (AZD) เพื่อการปรับใช้แอป AI อย่างราบรื่น Microsoft Foundry เป็นแพลตฟอร์มครบวงจรสำหรับการสร้าง การปรับใช้ และการจัดการแอป AI ในขณะที่ AZD ช่วยให้ง่ายต่อการจัดการโครงสร้างพื้นฐานและกระบวนการปรับใช้

## Microsoft Foundry คืออะไร?

Microsoft Foundry เป็นแพลตฟอร์มรวมของ Microsoft สำหรับการพัฒนา AI ที่ประกอบด้วย:

- **แคตตาล็อกโมเดล**: การเข้าถึงโมเดล AI ที่ล้ำสมัย
- **Prompt Flow**: ตัวออกแบบเวิร์กโฟลว์ AI แบบภาพ
- **พอร์ทัล Microsoft Foundry**: สภาพแวดล้อมการพัฒนารวมสำหรับแอป AI
- **ตัวเลือกการปรับใช้**: โฮสติ้งและการปรับสเกลหลากหลายตัวเลือก
- **ความปลอดภัยและความมั่นคง**: ฟีเจอร์ AI ที่รับผิดชอบในตัว

## AZD + Microsoft Foundry: ร่วมกันดีกว่า

| คุณสมบัติ | Microsoft Foundry | ประโยชน์จากการรวม AZD |
|---------|-----------------|------------------------|
| **การปรับใช้โมเดล** | ปรับใช้แบบพอร์ทัลด้วยตนเอง | การปรับใช้อัตโนมัติที่ทำซ้ำได้ |
| **โครงสร้างพื้นฐาน** | การจัดเตรียมแบบคลิกผ่าน | โครงสร้างพื้นฐานเป็นโค้ด (Bicep) |
| **การจัดการสภาพแวดล้อม** | เน้นสภาพแวดล้อมเดียว | หลายสภาพแวดล้อม (dev/staging/prod) |
| **การรวม CI/CD** | จำกัด | รองรับ GitHub Actions เนทีฟ |
| **การจัดการค่าใช้จ่าย** | การตรวจสอบเบื้องต้น | ปรับค่าใช้จ่ายตามสภาพแวดล้อม |

## ข้อกำหนดเบื้องต้น

- การสมัครสมาชิก Azure พร้อมสิทธิ์ที่เหมาะสม
- ติดตั้ง Azure Developer CLI
- เข้าถึงบริการ Microsoft Foundry Models
- คุ้นเคยกับ Microsoft Foundry เบื้องต้น

> **พื้นฐาน AZD ปัจจุบัน:** ตัวอย่างเหล่านี้ได้รับการตรวจสอบกับ `azd` `1.23.12` สำหรับเวิร์กโฟลว์ AI agent ใช้รุ่นพรีวิวส่วนขยายปัจจุบันและตรวจสอบเวอร์ชันที่ติดตั้งก่อนเริ่มต้น

## รูปแบบการรวมหลัก

### รูปแบบที่ 1: การรวม Microsoft Foundry Models

**กรณีการใช้งาน**: ปรับใช้แอปแชทด้วยโมเดล Microsoft Foundry Models

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
```

### รูปแบบที่ 2: การค้นหา AI + การผสมผสาน RAG

**กรณีการใช้งาน**: ปรับใช้แอปสร้างผลลัพธ์โดยใช้การดึงข้อมูลแบบเพิ่ม (RAG)

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

### รูปแบบที่ 3: การรวม Document Intelligence

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

**การกำหนดค่าผลิตจริง:**
```bash
# บริการ AI หลัก
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# การตั้งค่าโมเดล
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# การตั้งค่าประสิทธิภาพ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**การกำหนดค่าการพัฒนา:**
```bash
# การตั้งค่าที่เหมาะสมด้านต้นทุนสำหรับการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ระดับฟรี
```

### การกำหนดค่าความปลอดภัยด้วย Key Vault

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

### ส่วนขยาย AZD สำหรับ Foundry

AZD มีส่วนขยายที่เพิ่มความสามารถเฉพาะ AI สำหรับการทำงานร่วมกับบริการ Microsoft Foundry:

```bash
# ติดตั้งส่วนขยายตัวแทน Foundry
azd extension install azure.ai.agents

# ติดตั้งส่วนขยายการปรับแต่งละเอียด
azd extension install azure.ai.finetune

# ติดตั้งส่วนขยายนายแบบที่กำหนดเอง
azd extension install azure.ai.models

# แสดงรายการส่วนขยายที่ติดตั้ง
azd extension list --installed

# ตรวจสอบเวอร์ชันส่วนขยายตัวแทนที่ติดตั้งในขณะนี้
azd extension show azure.ai.agents
```

ส่วนขยาย AI ยังคงพัฒนาอย่างรวดเร็วในเวอร์ชันพรีวิว หากคำสั่งทำงานแตกต่างจากที่แสดงที่นี่ ให้ทำการอัปเกรดส่วนขยายที่เกี่ยวข้องก่อนทำการแก้ไขปัญหาโครงการเอง

### การปรับใช้แบบ Agent-First ด้วย `azd ai`

หากคุณมีเอกสาร manifest ของเอเจนต์ ใช้คำสั่ง `azd ai agent init` เพื่อสร้างโครงร่างโปรเจกต์ที่เชื่อมต่อกับ Foundry Agent Service:

```bash
# เริ่มต้นจากตัวแทนแสดงรายการ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ติดตั้งไปยัง Azure
azd up
```

รุ่นพรีวิวล่าสุดของ `azure.ai.agents` ยังเพิ่มการสนับสนุนการเริ่มต้นด้วยเทมเพลตสำหรับ `azd ai agent init` หากคุณกำลังติดตามตัวอย่างเอเจนต์ใหม่ๆ ให้ตรวจสอบความช่วยเหลือของส่วนขยายสำหรับแฟล็กที่มีในเวอร์ชันที่ติดตั้งของคุณ

ดูที่ [คำสั่ง AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) สำหรับเอกสารคำสั่งเต็มรูปแบบและแฟล็ก

### การปรับใช้ด้วยคำสั่งเดียว

```bash
# ปรับใช้ทุกอย่างด้วยคำสั่งเดียว
azd up

# หรือปรับใช้อย่างต่อเนื่อง
azd provision  # เฉพาะโครงสร้างพื้นฐาน
azd deploy     # เฉพาะแอปพลิเคชัน

# สำหรับการปรับใช้แอป AI ที่ใช้งานยาวนานใน azd 1.23.11+
azd deploy --timeout 1800
```

### การปรับใช้เฉพาะสภาพแวดล้อม

```bash
# สภาพแวดล้อมการพัฒนา
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# สภาพแวดล้อมการผลิต
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## การตรวจสอบและการสังเกตการณ์

### การรวม Application Insights

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

### การตรวจสอบค่าใช้จ่าย

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

## 🔐 แนวปฏิบัติด้านความปลอดภัยที่ดีที่สุด

### การกำหนด Managed Identity

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

### ความปลอดภัยทางเครือข่าย

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

## การเพิ่มประสิทธิภาพการทำงาน

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

### การกำหนดค่าการปรับขนาดอัตโนมัติ

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

### ปัญหา 1: โควต้า OpenAI เกิน

**อาการ:**
- การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควต้า
- ข้อผิดพลาด 429 ในบันทึกแอปพลิเคชัน

**วิธีแก้ไข:**
```bash
# ตรวจสอบการใช้งานโควตาปัจจุบัน
az cognitiveservices usage list --location eastus

# ลองใช้ภูมิภาคที่ต่างกัน
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ปัญหา 2: การพิสูจน์ตัวตนล้มเหลว

**อาการ:**
- ข้อผิดพลาด 401/403 เมื่อติดต่อบริการ AI
- ข้อความ "การเข้าถึงถูกปฏิเสธ"

**วิธีแก้ไข:**
```bash
# ตรวจสอบการมอบหมายบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ตรวจสอบการกำหนดค่าบัญชีตัวตนที่จัดการ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ตรวจสอบการเข้าถึง Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ปัญหา 3: ปัญหาการปรับใช้โมเดล

**อาการ:**
- โมเดลไม่พร้อมใช้งานในการปรับใช้
- เวอร์ชันเฉพาะของโมเดลล้มเหลว

**วิธีแก้ไข:**
```bash
# แสดงรายการโมเดลที่มีตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเวอร์ชันโมเดลในเทมเพลตบีเซป
# ตรวจสอบข้อกำหนดความจุของโมเดล
```

## ตัวอย่างเทมเพลต

### แอป RAG Chat (Python)

**ที่เก็บรหัส**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**คำอธิบาย**: ตัวอย่าง Azure AI ที่ได้รับความนิยมสูงสุด — แอป RAG chat พร้อมใช้งานในระดับโปรดักชันที่ให้คุณถามคำถามจากเอกสารของคุณเอง ใช้ GPT-4.1-mini สำหรับแชท, text-embedding-3-large สำหรับฝังข้อมูล, และ Azure AI Search สำหรับการค้นคืน รองรับเอกสารหลายโหมด, การป้อน/ออกเสียง, การพิสูจน์ตัวตน Microsoft Entra, และการติดตามด้วย Application Insights

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template azure-search-openai-demo
azd up
```

### แอป RAG Chat (.NET)

**ที่เก็บรหัส**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**คำอธิบาย**: ตัวอย่าง RAG chat เวอร์ชัน .NET/C# เทียบเท่ากับ Python สร้างด้วย ASP.NET Core Minimal API และ Blazor WebAssembly frontend มีแชทเสียง, รองรับ GPT-4o-mini vision และไคลเอนต์เดสก์ท็อป/มือถือ .NET MAUI Blazor Hybrid

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### แอป RAG Chat (Java)

**ที่เก็บรหัส**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**คำอธิบาย**: เวอร์ชัน Java ของตัวอย่าง RAG chat ใช้ Langchain4J สำหรับการจัดการ AI รองรับสถาปัตยกรรมไมโครเซอร์วิสแบบอีเวนต์ไดรฟ์, กลยุทธ์การค้นหาหลากหลาย (ข้อความ, เวกเตอร์, ผสม), การอัปโหลดเอกสารด้วย Azure Document Intelligence, และปรับใช้บน Azure Container Apps หรือ Azure Kubernetes Service

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot กับ Microsoft Foundry

**ที่เก็บรหัส**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**บริการ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**คำอธิบาย**: ริชาร์ท RAG copilot สำหรับค้าปลีกโดยใช้ Microsoft Foundry และ Prompty แชทบอทร้านค้าปลีก Contoso Outdoor ที่ตอบคำถามโดยอิงจากแคตตาล็อกสินค้าและข้อมูลคำสั่งซื้อของลูกค้า สาธิตเวิร์กโฟลว์ GenAIOps ครบวงจร — สร้างต้นแบบด้วย Prompty, ประเมินผลด้วย evaluators ช่วย AI, และปรับใช้ผ่าน AZD สู่ Container Apps

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template contoso-chat
azd up
```

### แอป Multi-Agent สำหรับการเขียนเชิงสร้างสรรค์

**ที่เก็บรหัส**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**บริการ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**คำอธิบาย**: ตัวอย่าง multi-agent ที่แสดงการจัดการเอเจนต์ AI ด้วย Prompty ใช้ agent วิจัย (Bing Grounding ใน Azure AI Agent Service), agent ผลิตภัณฑ์ (Azure AI Search), writer agent, และ editor agent เพื่อสร้างบทความวิจัยร่วมกัน รวม CI/CD พร้อมการประเมินใน GitHub Actions

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG Chat แบบ Serverless (JavaScript/TypeScript)

**ที่เก็บรหัส**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**บริการ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**คำอธิบาย**: แชทบอท RAG แบบ serverless ใช้ LangChain.js ร่วมกับ Azure Functions สำหรับ API และ Azure Static Web Apps สำหรับโฮสติ้ง ใช้ Azure Cosmos DB เป็นทั้งแหล่งเก็บเวกเตอร์และฐานข้อมูลประวัติแชท รองรับการพัฒนาท้องถิ่นด้วย Ollama สำหรับการทดสอบที่ไม่มีค่าใช้จ่าย

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### ตัวเร่งความเร็วโซลูชัน Chat with Your Data

**ที่เก็บรหัส**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**บริการ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**คำอธิบาย**: ตัวเร่งความเร็วโซลูชัน RAG ระดับองค์กรพร้อมพอร์ทัลผู้ดูแลระบบสำหรับการอัปโหลด/จัดการเอกสาร, ตัวเลือก orchestrator หลากหลาย (Semantic Kernel, LangChain, Prompt Flow), การเปลี่ยนเสียงเป็นข้อความ, การรวม Microsoft Teams และตัวเลือกใช้ PostgreSQL หรือ Cosmos DB เป็น backend ออกแบบให้เป็นจุดเริ่มต้นที่ปรับแต่งได้สำหรับสถานการณ์ RAG ในโปรดักชัน

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — การจัดการ MCP หลายเอเจนต์

**ที่เก็บรหัส**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**บริการ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**คำอธิบาย**: แอปอ้างอิงสำหรับการจัดการ AI หลายเอเจนต์โดยใช้สามเฟรมเวิร์ก (LangChain.js, LlamaIndex.TS, และ Microsoft Agent Framework) มี MCP (Model Context Protocol) เซิร์ฟเวอร์ในสี่ภาษา ปรับใช้เป็น serverless Azure Container Apps พร้อมการตรวจสอบ OpenTelemetry

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**ที่เก็บรหัส**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**บริการ**: บริการ Azure AI + Azure OpenAI

**คำอธิบาย**: เทมเพลต Bicep ขั้นพื้นฐานที่ปรับใช้บริการ Azure AI พร้อมโมเดลแมชชีนเลิร์นนิงที่กำหนดค่าไว้ จุดเริ่มต้นน้ำหนักเบาสำหรับเมื่อต้องการเฉพาะโครงสร้างพื้นฐาน AI ของ Azure โดยไม่ต้องมีสแตกแอปพลิเคชันเต็มรูปแบบ

**เริ่มต้นอย่างรวดเร็ว:**
```bash
azd init --template azd-ai-starter
azd up
```

> **เรียกดูเทมเพลตเพิ่มเติม**: เยี่ยมชม [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) สำหรับเทมเพลต AZD เฉพาะ AI กว่า 80 รายการในหลายภาษาและสถานการณ์

## ขั้นตอนถัดไป

1. **ลองตัวอย่าง**: เริ่มด้วยเทมเพลตที่สร้างไว้ล่วงหน้าซึ่งตรงกับกรณีการใช้งานของคุณ
2. **ปรับแต่งให้เหมาะกับความต้องการ**: แก้ไขโครงสร้างพื้นฐานและโค้ดแอปพลิเคชัน
3. **เพิ่มการตรวจสอบ**: นำการสังเกตการณ์มาใช้ครบถ้วน
4. **เพิ่มประสิทธิภาพค่าใช้จ่าย**: ปรับแต่งการกำหนดค่าให้เหมาะกับงบประมาณของคุณ
5. **รักษาความปลอดภัยการปรับใช้**: ใช้รูปแบบความปลอดภัยในองค์กร
6. **ปรับสเกลสู่การผลิต**: เพิ่มฟีเจอร์หลายภูมิภาคและความพร้อมใช้งานสูง

## 🎯 แบบฝึกหัดปฏิบัติ

### แบบฝึกหัด 1: ปรับใช้แอปแชท Microsoft Foundry Models (30 นาที)
**เป้าหมาย**: ปรับใช้และทดสอบแอปแชท AI พร้อมใช้งานในโปรดักชัน

```bash
# เริ่มต้นแม่แบบ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ตั้งค่าตัวแปรสภาพแวดล้อม
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ปรับใช้
azd up

# ทดสอบแอปพลิเคชัน
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# ตรวจสอบการทำงานของ AI
azd monitor

# ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้เสร็จสมบูรณ์โดยไม่มีข้อผิดพลาดโควต้า
- [ ] สามารถเข้าถึงอินเทอร์เฟซแชทในเบราว์เซอร์
- [ ] สามารถถามคำถามและรับคำตอบที่ขับเคลื่อนด้วย AI
- [ ] Application Insights แสดงข้อมูลโทรเมทรี
- [ ] ล้างทรัพยากรสำเร็จ

**ค่าประมาณค่าใช้จ่าย**: $5-10 สำหรับการทดสอบ 30 นาที

### แบบฝึกหัด 2: กำหนดค่าการปรับใช้โมเดลหลายตัว (45 นาที)
**เป้าหมาย**: ปรับใช้โมเดล AI หลายตัวโดยมีการกำหนดค่าที่แตกต่างกัน

```bash
# สร้างการกำหนดค่าที่กำหนดเองสำหรับ Bicep
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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# ปรับใช้และตรวจสอบ
azd provision
azd show
```

**เกณฑ์ความสำเร็จ:**
- [ ] ปรับใช้โมเดลหลายตัวสำเร็จ
- [ ] ใช้การตั้งค่าความจุต่างกันได้
- [ ] โมเดลเข้าถึงผ่าน API
- [ ] สามารถเรียกทั้งสองโมเดลจากแอปพลิเคชัน

### แบบฝึกหัด 3: ใช้งานการตรวจสอบค่าใช้จ่าย (20 นาที)
**เป้าหมาย**: ตั้งค่าการแจ้งเตือนงบประมาณและติดตามค่าใช้จ่าย

```bash
# เพิ่มการแจ้งเตือนงบประมาณลงใน Bicep
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

# ติดตั้งการแจ้งเตือนงบประมาณ
azd provision

# ตรวจสอบค่าใช้จ่ายปัจจุบัน
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างการแจ้งเตือนงบประมาณใน Azure
- [ ] ตั้งค่าการแจ้งเตือนทางอีเมล
- [ ] ดูข้อมูลค่าใช้จ่ายใน Azure Portal ได้
- [ ] กำหนดเกณฑ์งบประมาณอย่างเหมาะสม

## 💡 คำถามที่พบบ่อย

<details>
<summary><strong>ฉันจะลดค่าใช้จ่าย Microsoft Foundry Models ในระหว่างการพัฒนาได้อย่างไร?</strong></summary>

1. **ใช้ระดับฟรี**: Microsoft Foundry Models ให้โทเค็นฟรี 50,000 ต่อเดือน
2. **ลดความจุ**: ตั้งค่าความจุเป็น 10 TPM แทน 30+ สำหรับการพัฒนา
3. **ใช้คำสั่ง azd down**: ปลดทรัพยากรเมื่อไม่ได้พัฒนาอย่างจริงจัง
4. **แคชการตอบกลับ**: ใช้ Redis cache สำหรับคำถามที่ซ้ำกัน
5. **ใช้วิศวกรรมคำสั่ง (Prompt Engineering)**: ลดการใช้โทเค็นด้วย prompt ที่มีประสิทธิภาพ

</details>
```bash
# การกำหนดค่าการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ความแตกต่างระหว่าง Microsoft Foundry Models และ OpenAI API คืออะไร?</strong></summary>

**Microsoft Foundry Models**:
- ความปลอดภัยและการปฏิบัติตามมาตรฐานระดับองค์กร
- การผสานรวมเครือข่ายส่วนตัว
- การรับประกัน SLA
- การรับรองความถูกต้องด้วย Managed identity
- โควต้าที่สูงขึ้น

**OpenAI API**:
- การเข้าถึงโมเดลใหม่ได้เร็วกว่า
- การติดตั้งที่ง่ายกว่า
- ระดับการเข้าถึงต่ำกว่า
- ใช้งานได้กับอินเทอร์เน็ตสาธารณะเท่านั้น

สำหรับแอปพลิเคชันที่ใช้ในระดับการผลิต, **แนะนำ Microsoft Foundry Models**.
</details>

<details>
<summary><strong>ฉันจะแก้ไขข้อผิดพลาดโควต้าของ Microsoft Foundry Models ที่เกินได้อย่างไร?</strong></summary>

```bash
# ตรวจสอบโควต้าปัจจุบัน
az cognitiveservices usage list --location eastus2

# ลองภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ขอเพิ่มโควต้า
# ไปที่ Azure Portal > โควต้า > ขอเพิ่มโควต้า
```
</details>

<details>
<summary><strong>ฉันสามารถใช้ข้อมูลของฉันเองกับ Microsoft Foundry Models ได้หรือไม่?</strong></summary>

ได้! ใช้ **Azure AI Search** สำหรับ RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

ดูเทมเพลต [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)
</details>

<details>
<summary><strong>ฉันจะรักษาความปลอดภัยของจุดเชื่อมต่อโมเดล AI ได้อย่างไร?</strong></summary>

**แนวทางปฏิบัติที่ดีที่สุด**:
1. ใช้ Managed Identity (ไม่ใช้ API keys)
2. เปิดใช้งาน Private Endpoints
3. กำหนดค่ากลุ่มความปลอดภัยเครือข่าย
4. ดำเนินการจำกัดอัตราการใช้งาน
5. ใช้ Azure Key Vault สำหรับเก็บความลับ

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

## ชุมชนและการสนับสนุน

- **Microsoft Foundry Discord**: [ช่อง #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ประเด็นและการสนทนา](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [ทักษะ Microsoft Foundry บน skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ติดตั้งทักษะ Azure + Foundry agent ในโปรแกรมแก้ไขของคุณด้วยคำสั่ง `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาด้วย AI เป็นหลัก
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โปรเจ็กต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ต่อไป**: [การเปิดใช้งานโมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมการสนทนาในชุมชนของเราหรือเปิดประเด็นในที่เก็บข้อมูล Azure AI + AZD พร้อมช่วยคุณประสบความสำเร็จ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->