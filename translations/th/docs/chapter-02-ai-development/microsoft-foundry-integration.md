# การผสานรวม Microsoft Foundry กับ AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โครงการแรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

## ภาพรวม

ไกด์นี้สาธิตวิธีการผสานรวมบริการ Microsoft Foundry กับ Azure Developer CLI (AZD) เพื่อการปรับใช้แอปพลิเคชัน AI ที่ง่ายขึ้น Microsoft Foundry ให้แพลตฟอร์มครบวงจรสำหรับการสร้าง ปรับใช้ และจัดการแอปพลิเคชัน AI ขณะที่ AZD ช่วยทำให้กระบวนการโครงสร้างพื้นฐานและการปรับใช้เป็นเรื่องง่าย

## Microsoft Foundry คืออะไร?

Microsoft Foundry คือแพลตฟอร์มรวมของ Microsoft สำหรับการพัฒนา AI ซึ่งประกอบด้วย:

- **แคตตาล็อกโมเดล**: เข้าถึงโมเดล AI ที่ทันสมัย
- **Prompt Flow**: เครื่องมือออกแบบภาพสำหรับเวิร์กโฟลว์ AI
- **Microsoft Foundry Portal**: สภาพแวดล้อมการพัฒนาแบบรวมสำหรับแอป AI
- **ตัวเลือกการปรับใช้**: ตัวเลือกโฮสติ้งและสเกลหลายแบบ
- **ความปลอดภัยและความรับผิดชอบ**: ฟีเจอร์ AI ที่ปลอดภัยในตัว

## AZD + Microsoft Foundry: ดีกว่ารวมกัน

| ฟีเจอร์ | Microsoft Foundry | ประโยชน์การผสาน AZD |
|---------|-----------------|------------------------|
| **การปรับใช้โมเดล** | ปรับใช้ผ่านพอร์ทัลด้วยตนเอง | ปรับใช้โดยอัตโนมัติและทำซ้ำได้ |
| **โครงสร้างพื้นฐาน** | การจัดการผ่านคลิก | โครงสร้างพื้นฐานเป็นโค้ด (Bicep) |
| **การจัดการสภาพแวดล้อม** | เน้นสภาพแวดล้อมเดียว | หลายสภาพแวดล้อม (dev/staging/prod) |
| **การผสาน CI/CD** | จำกัด | รองรับ GitHub Actions โดยตรง |
| **การจัดการค่าใช้จ่าย** | การตรวจสอบพื้นฐาน | การปรับแต่งต้นทุนเฉพาะสภาพแวดล้อม |

## ข้อกำหนดเบื้องต้น

- การสมัครสมาชิก Azure ที่มีสิทธิ์เหมาะสม
- ติดตั้ง Azure Developer CLI แล้ว
- เข้าถึงบริการ Microsoft Foundry Models
- ความคุ้นเคยพื้นฐานกับ Microsoft Foundry

> **ฐาน AZD ปัจจุบัน:** ตัวอย่างเหล่านี้ตรวจสอบกับ `azd` `1.27.1` สำหรับเวิร์กโฟลว์ AI agent ใช้การเปิดตัวตัวอย่างล่าสุดของ extension และตรวจสอบเวอร์ชันที่ติดตั้งก่อนเริ่ม

## รูปแบบการผสานรวมหลัก

### รูปแบบที่ 1: การผสานรวม Microsoft Foundry Models

**กรณีใช้งาน**: ปรับใช้แอปแชทด้วยโมเดล Microsoft Foundry Models

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

### รูปแบบที่ 2: การผสานรวม AI Search + RAG

**กรณีใช้งาน**: ปรับใช้แอปการสร้างที่ได้รับข้อมูลยืนยัน (RAG)

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

**กรณีใช้งาน**: เวิร์กโฟลว์การประมวลผลและวิเคราะห์เอกสาร

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

### การตั้งค่าสิ่งแวดล้อมด้วย Environment Variables

**การกำหนดค่าใน Production:**
```bash
# บริการปัญญาประดิษฐ์หลัก
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# การกำหนดค่ารูปแบบ
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# การตั้งค่าประสิทธิภาพ
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**การกำหนดค่าใน Development:**
```bash
# การตั้งค่าที่ปรับให้เหมาะสมด้านต้นทุนสำหรับการพัฒนา
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

AZD มีส่วนขยายที่เพิ่มความสามารถเฉพาะทาง AI สำหรับการทำงานกับบริการ Microsoft Foundry:

```bash
# ติดตั้งส่วนขยายตัวแทน Foundry
azd extension install azure.ai.agents

# ติดตั้งส่วนขยายการปรับแต่งละเอียด
azd extension install azure.ai.finetune

# ติดตั้งส่วนขยายโมเดลที่กำหนดเอง
azd extension install azure.ai.models

# แสดงรายการส่วนขยายที่ติดตั้ง
azd extension list --installed

# ตรวจสอบเวอร์ชันส่วนขยายตัวแทนที่ติดตั้งอยู่ในปัจจุบัน
azd extension show azure.ai.agents
```

ส่วนขยาย AI ยังอยู่ในระหว่างการพัฒนาอย่างรวดเร็วในสถานะตัวอย่าง หากคำสั่งทำงานต่างจากที่แสดง ให้ทำการอัปเกรดส่วนขยายก่อนแก้ไขปัญหาในโครงการเอง

### การปรับใช้ที่เน้น Agent ด้วย `azd ai`

หากคุณมีไฟล์ agent manifest ใช้ `azd ai agent init` เพื่อสร้างโครงสร้างโปรเจกต์ที่เชื่อมต่อกับ Foundry Agent Service:

```bash
# เริ่มต้นจากแผนผังของตัวแทน
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ปรับใช้ไปยัง Azure
azd up
```

การเปิดตัวตัวอย่างล่าสุดของ `azure.ai.agents` ยังเพิ่มการรองรับการเริ่มต้นตามเทมเพลตใน `azd ai agent init` หากคุณกำลังติดตามตัวอย่าง agent ใหม่กว่า ให้ตรวจสอบความช่วยเหลือส่วนขยายสำหรับธงคำสั่งที่ใช้ได้ในเวอร์ชันที่ติดตั้ง

ดู [คำสั่ง AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) สำหรับรายการคำสั่งและธงทั้งหมด

### การปรับใช้ด้วยคำสั่งเดียว

```bash
# ติดตั้งทุกอย่างด้วยคำสั่งเดียว
azd up

# หรือ ติดตั้งทีละขั้นตอน
azd provision  # เฉพาะโครงสร้างพื้นฐาน
azd deploy     # เฉพาะแอปพลิเคชัน

# สำหรับการติดตั้งแอป AI ที่รันระยะยาวใน azd 1.23.11+
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

## การมอนิเตอร์และการสังเกตการณ์

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

### การติดตามค่าใช้จ่าย

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

### การกำหนดค่า Managed Identity

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

### ความปลอดภัยเครือข่าย

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

## การปรับปรุงประสิทธิภาพ

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

### การกำหนดค่าอัตโนมัติสเกล

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

## การแก้ไขปัญหาที่พบบ่อย

### ปัญหา 1: เกินโควต้า OpenAI

**อาการ:**
- การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควต้า
- ข้อผิดพลาด 429 ในบันทึกแอปพลิเคชัน

**วิธีแก้ปัญหา:**
```bash
# ตรวจสอบการใช้งานโควตาปัจจุบัน
az cognitiveservices usage list --location eastus

# ลองภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ปัญหา 2: การตรวจสอบสิทธิ์ล้มเหลว

**อาการ:**
- ข้อผิดพลาด 401/403 เมื่อเรียกใช้บริการ AI
- ข้อความ "การเข้าถึงถูกปฏิเสธ"

**วิธีแก้ปัญหา:**
```bash
# ตรวจสอบการมอบหมายบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ตรวจสอบการกำหนดค่าบัญชีตัวตนที่จัดการ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ยืนยันการเข้าถึง Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### ปัญหา 3: ปัญหาการปรับใช้โมเดล

**อาการ:**
- โมเดลไม่พร้อมใช้งานในการปรับใช้
- เวอร์ชันโมเดลเฉพาะล้มเหลว

**วิธีแก้ปัญหา:**
```bash
# รายการรุ่นที่มีอยู่ตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเวอร์ชันของรุ่นในเทมเพลต bicep
# ตรวจสอบความจุที่จำเป็นของรุ่น
```

## ตัวอย่างเทมเพลต

### แอปแชท RAG (Python)

**รีโพซิทอรี**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**คำอธิบาย**: ตัวอย่าง Azure AI ที่ได้รับความนิยมสูงสุด — แอปแชท RAG ที่พร้อมใช้งานสำหรับผลิตจริง ให้คุณถามคำถามจากเอกสารของคุณเอง ใช้ GPT-4.1-mini สำหรับแชท, text-embedding-3-large สำหรับการฝังข้อมูล และ Azure AI Search สำหรับการค้นคืน รองรับเอกสารมัลติมอดัล, อินพุต/เอาต์พุตเสียง, การตรวจสอบสิทธิ์ Microsoft Entra และการติดตามข้อมูล Application Insights

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### แอปแชท RAG (.NET)

**รีโพซิทอรี**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**คำอธิบาย**: เทียบเท่าของ .NET/C# ของตัวอย่างแชท RAG Python สร้างด้วย ASP.NET Core Minimal API และ Blazor WebAssembly frontend รวมถึงแชทเสียง, รองรับ GPT-4o-mini vision และไคลเอนต์เดสก์ท็อป/มือถือล้วนโดย .NET MAUI Blazor Hybrid

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### แอปแชท RAG (Java)

**รีโพซิทอรี**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**คำอธิบาย**: เวอร์ชัน Java ของตัวอย่างแชท RAG ใช้ Langchain4J สำหรับการจัดการ AI รองรับสถาปัตยกรรมไมโครเซอร์วิสที่ขับเคลื่อนด้วยเหตุการณ์, กลยุทธ์การค้นหาหลายแบบ (ข้อความ, เวกเตอร์, ไฮบริด), อัปโหลดเอกสารด้วย Azure Document Intelligence และการปรับใช้บน Azure Container Apps หรือ Azure Kubernetes Service

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot กับ Microsoft Foundry

**รีโพซิทอรี**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**บริการ**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**คำอธิบาย**: ระบบคอปปิโลท์ RAG สำหรับค้าปลีกที่ครบวงจรโดยใช้ Microsoft Foundry และ Prompty แชทบอทร้านค้ากลางแจ้งของ Contoso ที่อิงการตอบสนองจากแคตตาล็อกสินค้าและข้อมูลคำสั่งซื้อของลูกค้า สาธิตเวิร์กโฟลว์ GenAIOps ครบวงจร — สร้างต้นแบบด้วย Prompty, ประเมินด้วยตัวประเมินช่วย AI และปรับใช้ผ่าน AZD ไปยัง Container Apps

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template contoso-chat
azd up
```

### แอปหลายเอเยนต์สำหรับการเขียนเชิงสร้างสรรค์

**รีโพซิทอรี**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**บริการ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**คำอธิบาย**: ตัวอย่างหลายเอเยนต์ที่สาธิตการจัดการ AI agent ด้วย Prompty ใช้เอเยนต์วิจัย (Bing Grounding ใน Azure AI Agent Service), เอเยนต์สินค้า (Azure AI Search), เอเยนต์ผู้เขียน และเอเยนต์บรรณาธิการ เพื่อร่วมกันผลิตบทความที่วิจัยอย่างดี รวม CI/CD พร้อมการประเมินใน GitHub Actions

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template contoso-creative-writer
azd up
```

### แชท RAG แบบไม่มีเซิร์ฟเวอร์ (JavaScript/TypeScript)

**รีโพซิทอรี**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**บริการ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB สำหรับ NoSQL + LangChain.js

**คำอธิบาย**: แชทบอท RAG แบบไม่มีเซิร์ฟเวอร์เต็มรูปแบบ ใช้ LangChain.js กับ Azure Functions สำหรับ API และ Azure Static Web Apps สำหรับโฮสติ้ง ใช้ Azure Cosmos DB เป็นทั้งที่เก็บเวกเตอร์และฐานข้อมูลประวัติการแชท รองรับการพัฒนาในเครื่องด้วย Ollama สำหรับการทดสอบฟรี

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### ตัวเร่งความเร็วโซลูชัน Chat with Your Data

**รีโพซิทอรี**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**บริการ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**คำอธิบาย**: ตัวเร่งความเร็วโซลูชัน RAG สำหรับองค์กรพร้อมพอร์ทัลผู้ดูแลระบบสำหรับอัปโหลด/จัดการเอกสาร ตัวจัดการหลายแบบ (Semantic Kernel, LangChain, Prompt Flow) ฟีเจอร์ speech-to-text, การผสาน Microsoft Teams และเลือกใช้ PostgreSQL หรือ Cosmos DB เป็นแบ็คเอนด์ ออกแบบเป็นจุดเริ่มต้นที่ปรับแต่งได้สำหรับสถานการณ์การใช้ RAG ในการผลิต

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### เอเยนต์การเดินทาง AI — การจัดการหลายเอเยนต์ MCP

**รีโพซิทอรี**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**บริการ**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**คำอธิบาย**: แอปอ้างอิงสำหรับการจัดการ AI หลายเอเยนต์โดยใช้สามเฟรมเวิร์ก (LangChain.js, LlamaIndex.TS, และ Microsoft Agent Framework) มีเซิร์ฟเวอร์ MCP (Model Context Protocol) สี่ภาษา พัฒนาเป็น Azure Container Apps แบบไม่มีเซิร์ฟเวอร์ พร้อมการมอนิเตอร์ OpenTelemetry

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**รีโพซิทอรี**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**บริการ**: Azure AI Services + Azure OpenAI

**คำอธิบาย**: เทมเพลต Bicep ที่เรียบง่ายซึ่งปรับใช้บริการ Azure AI พร้อมโมเดลแมชชีนเลิร์นนิงที่ตั้งค่าไว้ เป็นจุดเริ่มต้นที่น้ำหนักเบาเมื่อคุณต้องการเพียงโครงสร้างพื้นฐาน Azure AI โดยไม่มีสแตกแอปพลิเคชันเต็มรูปแบบ

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azd-ai-starter
azd up
```

> **เรียกดูเทมเพลตเพิ่มเติม**: เยี่ยมชม [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) สำหรับเทมเพลต AZD เฉพาะ AI กว่า 80 รายการในหลายภาษาและสถานการณ์

## ขั้นตอนถัดไป

1. **ลองตัวอย่าง**: เริ่มจากเทมเพลตที่สร้างไว้ล่วงหน้าที่ตรงกับกรณีใช้งานของคุณ
2. **ปรับแต่งตามความต้องการ**: แก้ไขโครงสร้างพื้นฐานและโค้ดแอปพลิเคชัน
3. **เพิ่มการมอนิเตอร์**: นำการสังเกตการณ์ที่ครอบคลุมเข้ามาใช้
4. **ปรับค่าใช้จ่าย**: ปรับแต่งการตั้งค่าสำหรับงบประมาณของคุณ
5. **รักษาความปลอดภัยการปรับใช้**: นำรูปแบบความปลอดภัยระดับองค์กรเข้ามาใช้
6. **ขยายสู่การผลิต**: เพิ่มฟีเจอร์หลายภูมิภาคและความพร้อมใช้งานสูง

## 🎯 แบบฝึกหัดเชิงปฏิบัติ

### แบบฝึกหัดที่ 1: ปรับใช้แอปแชท Microsoft Foundry Models (30 นาที)
**เป้าหมาย**: ปรับใช้และทดสอบแอปแชท AI พร้อมใช้งานจริง

```bash
# เริ่มต้นแม่แบบ
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ตั้งค่าตัวแปรสภาพแวดล้อม
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# ปล่อยใช้งาน
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
- [ ] เข้าถึงอินเทอร์เฟซแชทในเบราว์เซอร์ได้
- [ ] สามารถถามคำถามและได้รับคำตอบขับเคลื่อนด้วย AI
- [ ] Application Insights แสดงข้อมูลโทรเมทรี
- [ ] ทำความสะอาดทรัพยากรสำเร็จ

**ต้นทุนโดยประมาณ**: $5-10 สำหรับการทดสอบ 30 นาที

### แบบฝึกหัดที่ 2: กำหนดค่าการปรับใช้โมเดลหลายแบบ (45 นาที)
**เป้าหมาย**: ปรับใช้โมเดล AI หลายตัวด้วยการกำหนดค่าที่แตกต่างกัน

```bash
# สร้างการกำหนดค่าบีเซปแบบกำหนดเอง
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
- [ ] โมเดลหลายตัวปรับใช้สำเร็จ
- [ ] ใช้การตั้งค่าความจุแตกต่างกัน
- [ ] โมเดลเข้าถึงผ่าน API ได้
- [ ] เรียกใช้ทั้งสองโมเดลจากแอปได้

### แบบฝึกหัดที่ 3: นำการติดตามค่าใช้จ่ายมาใช้ (20 นาที)
**เป้าหมาย**: ตั้งค่าการแจ้งเตือนงบประมาณและการติดตามค่าใช้จ่าย

```bash
# เพิ่มการแจ้งเตือนงบประมาณใน Bicep
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

# ปรับใช้การแจ้งเตือนงบประมาณ
azd provision

# ตรวจสอบค่าใช้จ่ายปัจจุบัน
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างการแจ้งเตือนงบประมาณใน Azure
- [ ] ตั้งค่าการแจ้งเตือนทางอีเมล
- [ ] ดูข้อมูลค่าใช้จ่ายในพอร์ทัล Azure ได้
- [ ] ตั้งค่าเกณฑ์งบประมาณอย่างเหมาะสม

## 💡 คำถามที่พบบ่อย

<details>
<summary><strong>ฉันจะลดค่าใช้จ่าย Microsoft Foundry Models ระหว่างการพัฒนาได้อย่างไร?</strong></summary>

1. **ใช้ระดับฟรี**: Microsoft Foundry Models ให้ 50,000 โทเค็นต่อเดือนฟรี
2. **ลดความจุ**: ตั้งค่าความจุเป็น 10 TPM แทน 30+ สำหรับการพัฒนา
3. **ใช้ azd down**: ยกเลิกการจัดสรรทรัพยากรเมื่อไม่ได้พัฒนาอย่างจริงจัง
4. **แคชคำตอบ**: ใช้ Redis cache สำหรับคำถามซ้ำ
5. **ใช้ Prompt Engineering**: ลดการใช้โทเค็นด้วย prompt ที่มีประสิทธิภาพ


```bash
# การกำหนดค่าการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ความแตกต่างระหว่าง Microsoft Foundry Models กับ OpenAI API คืออะไร?</strong></summary>

**Microsoft Foundry Models**:
- ความปลอดภัยและการปฏิบัติตามข้อกำหนดสำหรับองค์กร
- การรวมเข้ากับเครือข่ายส่วนตัว
- การรับประกัน SLA
- การตรวจสอบตัวตนแบบ Managed Identity
- มีโควต้าที่สูงกว่า

**OpenAI API**:
- เข้าถึงโมเดลใหม่ได้เร็วกว่า
- การตั้งค่าที่ง่ายกว่า
- อุปสรรคในการเข้าใช้ต่ำกว่า
- ใช้ได้เฉพาะบนอินเทอร์เน็ตสาธารณะเท่านั้น

สำหรับแอปที่ใช้งานจริง, **แนะนำให้ใช้ Microsoft Foundry Models**.
</details>

<details>
<summary><strong>ฉันจะจัดการกับข้อผิดพลาดโควต้าของ Microsoft Foundry Models เกินได้อย่างไร?</strong></summary>

```bash
# ตรวจสอบโควตาปัจจุบัน
az cognitiveservices usage list --location eastus2

# ลองเขตพื้นที่อื่น
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
<summary><strong>ฉันสามารถใช้ข้อมูลของตัวเองกับ Microsoft Foundry Models ได้ไหม?</strong></summary>

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

ดูตัวอย่างเทมเพลต [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)
</details>

<details>
<summary><strong>ฉันจะปกป้องจุดเชื่อมต่อของโมเดล AI อย่างไร?</strong></summary>

**แนวทางปฏิบัติที่ดีที่สุด**:
1. ใช้ Managed Identity (ไม่ใช้คีย์ API)
2. เปิดใช้งาน Private Endpoints
3. กำหนดค่ากลุ่มความปลอดภัยของเครือข่าย
4. ดำเนินการจำกัดความถี่การใช้งาน
5. ใช้ Azure Key Vault สำหรับจัดการความลับ

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

- **Microsoft Foundry Discord**: [#ช่อง Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ปัญหาและการสนทนา](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [เอกสารทางการ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [ทักษะ Microsoft Foundry บน skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ติดตั้งทักษะ Azure + Foundry agent ในตัวแก้ไขของคุณด้วย `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทเรียนปัจจุบัน**: บทที่ 2 - การพัฒนาโดย AI เป็นหลัก
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [การนำโมเดล AI ไปใช้](ai-model-deployment.md)
- **🚀 บทต่อไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมการสนทนาในชุมชนหรือเปิดปัญหาในที่เก็บโค้ด ชุมชน Azure AI + AZD พร้อมช่วยคุณให้ประสบความสำเร็จ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->