# การรวม Microsoft Foundry กับ AZD

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาที่เน้น AI เป็นหลัก
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โครงการแรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

## ภาพรวม

คำแนะนำนี้แสดงวิธีการรวมบริการ Microsoft Foundry กับ Azure Developer CLI (AZD) เพื่อให้งานปรับใช้แอปพลิเคชัน AI เป็นไปอย่างราบรื่น Microsoft Foundry เป็นแพลตฟอร์มครบวงจรสำหรับการสร้าง ปรับใช้ และจัดการแอปพลิเคชัน AI ขณะที่ AZD ช่วยให้การสร้างโครงสร้างพื้นฐานและกระบวนการปรับใช้เป็นเรื่องง่ายขึ้น

## Microsoft Foundry คืออะไร?

Microsoft Foundry คือแพลตฟอร์มรวมของ Microsoft สำหรับการพัฒนา AI ซึ่งประกอบด้วย:

- **Model Catalog**: การเข้าถึงโมเดล AI ขั้นสูง
- **Prompt Flow**: เครื่องมือออกแบบการทำงานของ AI แบบภาพ
- **Microsoft Foundry Portal**: สภาพแวดล้อมการพัฒนารวมสำหรับแอป AI
- **ตัวเลือกการปรับใช้**: ตัวเลือกโฮสติ้งและการปรับขนาดหลากหลาย
- **ความปลอดภัยและความรับผิดชอบ**: ฟีเจอร์ AI ที่มีความรับผิดชอบในตัว

## AZD + Microsoft Foundry: ดีกว่าที่จะใช้ร่วมกัน

| ฟีเจอร์ | Microsoft Foundry | ประโยชน์ของการรวมกับ AZD |
|---------|-----------------|------------------------|
| **การปรับใช้โมเดล** | ปรับใช้ผ่านพอร์ทัลด้วยมือ | ปรับใช้โดยอัตโนมัติและทำซ้ำได้ |
| **โครงสร้างพื้นฐาน** | การสร้างผ่านคลิก | โครงสร้างพื้นฐานเป็นโค้ด (Bicep) |
| **การจัดการสภาพแวดล้อม** | เน้นสภาพแวดล้อมเดียว | หลายสภาพแวดล้อม (dev/staging/prod) |
| **การผสานรวม CI/CD** | จำกัด | รองรับ GitHub Actions โดยตรง |
| **การจัดการค่าใช้จ่าย** | การตรวจสอบพื้นฐาน | การปรับค่าใช้จ่ายเฉพาะแต่ละสภาพแวดล้อม |

## ข้อกำหนดเบื้องต้น

- การสมัครใช้งาน Azure ที่มีสิทธิ์เหมาะสม
- ติดตั้ง Azure Developer CLI
- เข้าถึงบริการ Microsoft Foundry Models
- คุ้นเคยเบื้องต้นกับ Microsoft Foundry

## รูปแบบหลักของการรวม

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

### รูปแบบที่ 2: การรวม AI Search + RAG

**กรณีการใช้งาน**: ปรับใช้แอปการสร้างที่เสริมด้วยการค้นคืน (RAG)

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

# การกำหนดค่ารูปแบบ
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

AZD มีส่วนขยายที่เพิ่มความสามารถเฉพาะของ AI สำหรับการทำงานกับบริการ Microsoft Foundry:

```bash
# ติดตั้งส่วนขยายตัวแทน Foundry
azd extension install azure.ai.agents

# ติดตั้งส่วนขยายการปรับแต่งละเอียด
azd extension install azure.ai.finetune

# ติดตั้งส่วนขยายโมเดลที่กำหนดเอง
azd extension install azure.ai.models

# แสดงรายการส่วนขยายที่ติดตั้งแล้ว
azd extension list
```

### การปรับใช้แบบ Agent-First ด้วย `azd ai`

หากคุณมีไฟล์กำกับเอเยนต์ ให้ใช้คำสั่ง `azd ai agent init` เพื่อสร้างโครงงานที่เชื่อมต่อกับ Foundry Agent Service:

```bash
# เริ่มต้นจากแผนผังตัวแทน
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ปรับใช้ไปยัง Azure
azd up
```

ดู [คำสั่งและส่วนขยาย AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) สำหรับรายการคำสั่งและตัวเลือกทั้งหมด

### การปรับใช้ด้วยคำสั่งเดียว

```bash
# ปล่อยทุกอย่างด้วยคำสั่งเดียว
azd up

# หรือปล่อยแบบค่อยเป็นค่อยไป
azd provision  # เฉพาะโครงสร้างพื้นฐาน
azd deploy     # เฉพาะแอปพลิเคชัน
```

### การปรับใช้เฉพาะสภาพแวดล้อม

```bash
# สภาพแวดล้อมการพัฒนา
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# สภาพแวดล้อมการใช้งานจริง
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## การตรวจสอบและการสังเกต

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

## แก้ไขปัญหาที่พบได้บ่อย

### ปัญหา 1: เกินโควต้า OpenAI

**อาการ:**
- ปรับใช้ล้มเหลวพร้อมข้อความโควต้าผิดพลาด
- พบข้อผิดพลาด 429 ในล็อกแอป

**วิธีแก้ไข:**
```bash
# ตรวจสอบการใช้โควต้าปัจจุบัน
az cognitiveservices usage list --location eastus

# ลองใช้ภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### ปัญหา 2: การตรวจสอบสิทธิ์ล้มเหลว

**อาการ:**
- ข้อความผิดพลาด 401/403 เมื่อเรียกใช้บริการ AI
- ข้อความ "Access denied"

**วิธีแก้ไข:**
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
- โมเดลไม่สามารถใช้ได้ในการปรับใช้
- เวอร์ชันโมเดลเฉพาะไม่สำเร็จ

**วิธีแก้ไข:**
```bash
# แสดงรายการโมเดลที่มีอยู่ตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเวอร์ชันโมเดลในเทมเพลต bicep
# ตรวจสอบข้อกำหนดความจุของโมเดล
```

## ตัวอย่างเทมเพลต

### แอป RAG แชท (Python)

**คลังเก็บ**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**คำอธิบาย**: ตัวอย่าง Azure AI ที่นิยมที่สุด — แอปรวม RAG สำหรับแชทพร้อมสำหรับใช้งานในผลิตจริงที่ให้คุณถามคำถามเกี่ยวกับเอกสารของคุณเอง ใช้ GPT-4.1-mini สำหรับแชท, text-embedding-ada-002 สำหรับ embeddings และ Azure AI Search สำหรับการค้นคืน สนับสนุนเอกสารมัลติโมดัล, การป้อน/ส่งออกเสียง, การรับรองตัวตนด้วย Microsoft Entra และการติดตามด้วย Application Insights

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### แอป RAG แชท (.NET)

**คลังเก็บ**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**คำอธิบาย**: ตัวอย่าง RAG แชทแบบ .NET/C# ที่เทียบเท่ากับ Python สร้างด้วย ASP.NET Core Minimal API และ Blazor WebAssembly ฝั่งลูกค้า รวมแชทเสียง, รองรับ GPT-4o-mini vision และไคลเอนต์เดสก์ท็อป/มือถือ .NET MAUI Blazor Hybrid

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### แอป RAG แชท (Java)

**คลังเก็บ**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**บริการ**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**คำอธิบาย**: เวอร์ชัน Java ของตัวอย่าง RAG แชท ใช้ Langchain4J สำหรับการประสานงาน AI รองรับสถาปัตยกรรมไมโครเซอร์วิสเชิงเหตุการณ์, กลยุทธ์ค้นหาหลายแบบ (ข้อความ, เวกเตอร์, ไฮบริด), การอัปโหลดเอกสารด้วย Azure Document Intelligence และการปรับใช้บน Azure Container Apps หรือ Azure Kubernetes Service

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot กับ Azure AI Foundry

**คลังเก็บ**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**บริการ**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**คำอธิบาย**: โคพิลอต RAG สำหรับค้าปลีกครบวงจรใช้ Azure AI Foundry และ Prompty แชทบอทค้าปลีก Contoso Outdoor ที่อิงการตอบสนองจากแคตตาล็อกสินค้าและข้อมูลการสั่งซื้อของลูกค้า แสดงเวิร์กโฟลว์ GenAIOps ทั้งหมด — สร้างต้นแบบด้วย Prompty, ประเมินด้วยผู้ประเมิน AI ช่วย และปรับใช้ผ่าน AZD สู่ Container Apps

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template contoso-chat
azd up
```

### แอปเขียนสร้างสรรค์แบบหลายเอเยนต์

**คลังเก็บ**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**บริการ**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**คำอธิบาย**: ตัวอย่างหลายเอเยนต์แสดงการประสานงาน AI Agent ด้วย Prompty ใช้เอเยนต์วิจัย (Bing Grounding ใน Azure AI Agent Service), เอเยนต์ผลิตภัณฑ์ (Azure AI Search), เอเยนต์นักเขียน และเอเยนต์บรรณาธิการ ร่วมสร้างบทความที่วิจัยอย่างละเอียด รวม CI/CD พร้อมการประเมินใน GitHub Actions

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG แชทแบบ Serverless (JavaScript/TypeScript)

**คลังเก็บ**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**บริการ**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**คำอธิบาย**: แชทบอท RAG แบบเซิร์ฟเวอร์เลสเต็มรูปแบบใช้ LangChain.js กับ Azure Functions สำหรับ API และ Azure Static Web Apps สำหรับโฮสติ้ง ใช้ Azure Cosmos DB เป็นทั้งฐานข้อมูลเวกเตอร์และประวัติแชท รองรับการพัฒนาในเครื่องด้วย Ollama สำหรับการทดสอบแบบไม่มีค่าใช้จ่าย

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### ตัวเร่งความเร็วโซลูชัน Chat with Your Data

**คลังเก็บ**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**บริการ**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**คำอธิบาย**: ตัวเร่งโซลูชัน RAG มาตรฐานระดับองค์กรพร้อมพอร์ทัลแอดมินสำหรับอัปโหลด/จัดการเอกสาร ตัวประสานงานหลายตัวเลือก (Semantic Kernel, LangChain, Prompt Flow) ฟีเจอร์แปลงเสียงเป็นข้อความ, การผสาน Microsoft Teams, และฐานข้อมูล PostgreSQL หรือ Cosmos DB ออกแบบมาเป็นจุดเริ่มต้นที่ปรับแต่งได้สำหรับสถานการณ์ RAG ในการผลิต

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### ตัวแทนท่องเที่ยว AI — การประสานงานเอเยนต์ MCP แบบหลายตัว

**คลังเก็บ**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**บริการ**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**คำอธิบาย**: แอปตัวอย่างสำหรับการประสานงาน AI หลายเอเยนต์ ใช้สามเฟรมเวิร์ก (LangChain.js, LlamaIndex.TS, และ Microsoft Agent Framework) มี MCP (Model Context Protocol) เซิร์ฟเวอร์ในสี่ภาษา ปรับใช้เป็น Azure Container Apps แบบเซิร์ฟเวอร์เลส พร้อมการตรวจสอบ OpenTelemetry

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**คลังเก็บ**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**บริการ**: บริการ Azure AI + Azure OpenAI

**คำอธิบาย**: เทมเพลต Bicep แบบเรียบง่ายสำหรับปรับใช้บริการ Azure AI พร้อมโมเดลแมชชีนเลิร์นนิงที่กำหนดค่าแล้ว จุดเริ่มต้นที่น้ำหนักเบาเมื่อคุณต้องการเพียงโครงสร้างพื้นฐาน AI ของ Azure โดยไม่ต้องมีสแต็กแอปเต็มรูปแบบ

**เริ่มต้นอย่างรวดเร็ว**:
```bash
azd init --template azd-ai-starter
azd up
```

> **เรียกดูเทมเพลตเพิ่มเติม**: เยี่ยมชม [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) สำหรับเทมเพลต AZD เฉพาะ AI กว่า 80 ตัวในหลายภาษาและสถานการณ์

## ขั้นตอนถัดไป

1. **ลองตัวอย่าง**: เริ่มด้วยเทมเพลตที่สร้างไว้ล่วงหน้าซึ่งตรงกับกรณีการใช้งานของคุณ
2. **ปรับแต่งตามความต้องการ**: แก้ไขโครงสร้างพื้นฐานและโค้ดแอปพลิเคชัน
3. **เพิ่มการตรวจสอบ**: นำระบบการสังเกตอย่างครบวงจรมาปรับใช้
4. **ปรับปรุงค่าใช้จ่าย**: ปรับแต่งการกำหนดค่าสำหรับงบประมาณของคุณ
5. **รักษาความปลอดภัยการปรับใช้**: ใช้แนวทางความปลอดภัยระดับองค์กร
6. **ขยายสู่การผลิต**: เพิ่มฟีเจอร์หลายภูมิภาคและความพร้อมใช้งานสูง

## 🎯 แบบฝึกหัดเชิงปฏิบัติ

### แบบฝึกหัด 1: ปรับใช้ Microsoft Foundry Models Chat App (30 นาที)
**เป้าหมาย**: ปรับใช้และทดสอบแอปแชท AI ที่พร้อมใช้จริง

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

# ล้างข้อมูล
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] การปรับใช้เสร็จสมบูรณ์โดยไม่มีข้อผิดพลาดโควต้า
- [ ] เข้าถึงอินเทอร์เฟซแชทในเบราว์เซอร์ได้
- [ ] สามารถถามคำถามและรับคำตอบที่ขับเคลื่อนด้วย AI
- [ ] Application Insights แสดงข้อมูลเทเลเมทรี
- [ ] ล้างทรัพยากรเรียบร้อยแล้ว

**ต้นทุนประมาณการ**: $5-10 สำหรับการทดสอบ 30 นาที

### แบบฝึกหัด 2: กำหนดค่าการปรับใช้โมเดลหลายตัว (45 นาที)
**เป้าหมาย**: ปรับใช้โมเดล AI หลายตัวด้วยการกำหนดค่าที่แตกต่าง

```bash
# สร้างการกำหนดค่า Bicep ที่กำหนดเอง
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

# ติดตั้งและตรวจสอบ
azd provision
azd show
```

**เกณฑ์ความสำเร็จ:**
- [ ] โมเดลหลายตัวถูกปรับใช้สำเร็จ
- [ ] ตั้งค่าความจุที่แตกต่างถูกนำไปใช้
- [ ] สามารถเข้าถึงโมเดลผ่าน API
- [ ] สามารถเรียกใช้โมเดลทั้งสองจากแอปพลิเคชันได้

### แบบฝึกหัด 3: นำการตรวจสอบค่าใช้จ่ายมาใช้ (20 นาที)
**เป้าหมาย**: ตั้งค่าการแจ้งเตือนงบประมาณและติดตามค่าใช้จ่าย

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

# ใช้งานการแจ้งเตือนงบประมาณ
azd provision

# ตรวจสอบค่าใช้จ่ายปัจจุบัน
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างการแจ้งเตือนงบประมาณใน Azure
- [ ] กำหนดค่าการแจ้งเตือนทางอีเมล
- [ ] ดูข้อมูลค่าใช้จ่ายใน Azure Portal ได้
- [ ] ตั้งค่าขีดจำกัดงบประมาณอย่างเหมาะสม

## 💡 คำถามที่พบบ่อย

<details>
<summary><strong>ฉันจะลดค่าใช้จ่าย Microsoft Foundry Models ในระหว่างการพัฒนาอย่างไร?</strong></summary>

1. **ใช้ระดับฟรี**: Microsoft Foundry Models มี 50,000 โทเค็น/เดือนฟรี
2. **ลดความจุ**: ตั้งความจุเป็น 10 TPM แทน 30+ สำหรับการพัฒนา
3. **ใช้ azd down**: ปล่อยทรัพยากรออกเมื่อไม่พัฒนางาน
4. **แคชการตอบกลับ**: นำ Redis cache มาใช้สำหรับคำถามที่ซ้ำกัน
5. **ใช้ Prompt Engineering**: ลดการใช้โทเค็นด้วยพรอมต์ที่มีประสิทธิภาพ

```bash
# การกำหนดค่าการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ความแตกต่างระหว่าง Microsoft Foundry Models กับ OpenAI API คืออะไร?</strong></summary>

**Microsoft Foundry Models**:
- ความปลอดภัยและการปฏิบัติตามข้อกำหนดระดับองค์กร
- การรวมเครือข่ายส่วนตัว
- การรับประกัน SLA
- การตรวจสอบสิทธิ์ด้วย Managed Identity
- มีโควต้าระดับสูง

**OpenAI API**:
- เข้าถึงโมเดลใหม่ได้เร็วกว่า
- การตั้งค่าง่ายกว่า
- กำแพงในการเข้าสู่งานต่ำกว่า
- ใช้งานผ่านอินเทอร์เน็ตสาธารณะเท่านั้น

สำหรับแอปในผลิตจริง, **แนะนำใช้ Microsoft Foundry Models**.
</details>

<details>
<summary><strong>ฉันจะแก้ไขข้อผิดพลาดการเกินโควต้า Microsoft Foundry Models อย่างไร?</strong></summary>

```bash
# ตรวจสอบโควตาปัจจุบัน
az cognitiveservices usage list --location eastus2

# ลองภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# ขอเพิ่มโควตา
# ไปที่ Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>ฉันสามารถใช้ข้อมูลของตัวเองกับ Microsoft Foundry Models ได้หรือไม่?</strong></summary>

ได้เลย! ใช้ **Azure AI Search** สำหรับ RAG (Retrieval Augmented Generation):

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
1. ใช้ Managed Identity (ไม่มีคีย์ API)
2. เปิดใช้งาน Private Endpoints
3. กำหนดค่ากลุ่มความปลอดภัยเครือข่าย
4. ใช้การจำกัดอัตราการเรียกใช้งาน
5. ใช้ Azure Key Vault สำหรับจัดเก็บความลับ

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
- **AZD GitHub**: [ประเด็นและอภิปราย](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [ทักษะ Microsoft Foundry บน skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ติดตั้งทักษะ Azure + Foundry agent ในตัวแก้ไขของคุณด้วย `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบท:**
- **📚 หน้าแรกหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โครงการแรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [การปรับใช้งานโมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมการอภิปรายในชุมชนของเราหรือเปิดประเด็นในที่เก็บโค้ด ชุมชน Azure AI + AZD พร้อมช่วยให้คุณประสบความสำเร็จ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**: เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้องสูงสุด แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญด้านภาษาอย่างมืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->