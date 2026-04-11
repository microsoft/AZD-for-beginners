# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Overview

คู่มือนี้สาธิตวิธีการรวมบริการ Microsoft Foundry เข้ากับ Azure Developer CLI (AZD) เพื่อการปรับใช้แอปพลิเคชัน AI ที่ราบรื่น Microsoft Foundry มอบแพลตฟอร์มครบวงจรสำหรับการสร้าง ปรับใช้ และจัดการแอปพลิเคชัน AI ขณะที่ AZD ช่วยให้ง่ายต่อการจัดการโครงสร้างพื้นฐานและขั้นตอนการปรับใช้

## What is Microsoft Foundry?

Microsoft Foundry คือแพลตฟอร์มรวมของ Microsoft สำหรับการพัฒนา AI ที่ประกอบด้วย:

- **Model Catalog**: การเข้าถึงโมเดล AI ขั้นสูง
- **Prompt Flow**: เครื่องมือออกแบบเวิร์กโฟลว์ AI แบบภาพ
- **Microsoft Foundry Portal**: สภาพแวดล้อมการพัฒนาร่วมสำหรับแอป AI
- **Deployment Options**: ตัวเลือกโฮสติ้งและปรับขนาดหลากหลาย
- **Safety and Security**: ฟีเจอร์ AI ที่รับผิดชอบในตัว

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | ปรับใช้ด้วยพอร์ทัลด้วยตนเอง | การปรับใช้อัตโนมัติและทำซ้ำได้ |
| **Infrastructure** | การจัดหาแบบคลิกผ่าน | โครงสร้างพื้นฐานเป็นโค้ด (Bicep) |
| **Environment Management** | มุ่งเน้นสภาพแวดล้อมเดียว | หลายสภาพแวดล้อม (dev/staging/prod) |
| **CI/CD Integration** | จำกัด | รองรับ GitHub Actions โดยตรง |
| **Cost Management** | การตรวจสอบพื้นฐาน | การปรับแต่งค่าใช้จ่ายตามสภาพแวดล้อม |

## Prerequisites

- การสมัครใช้งาน Azure ที่มีสิทธิ์เหมาะสม
- ติดตั้ง Azure Developer CLI
- เข้าถึงบริการ Microsoft Foundry Models
- ความคุ้นเคยพื้นฐานกับ Microsoft Foundry

> **Current AZD baseline:** ตัวอย่างเหล่านี้ถูกทดสอบกับ `azd` `1.23.12` สำหรับเวิร์กโฟลว์ตัวแทน AI ให้ใช้เวอร์ชันพรีวิวล่าสุดและตรวจสอบเวอร์ชันที่ติดตั้งก่อนเริ่ม

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: ปรับใช้แอปแชทด้วยโมเดล Microsoft Foundry Models

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

### Pattern 2: AI Search + RAG Integration

**Use Case**: ปรับใช้แอปการสร้างแบบเสริมการดึงข้อมูล (RAG)

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

### Pattern 3: Document Intelligence Integration

**Use Case**: เวิร์กโฟลว์การประมวลผลและวิเคราะห์เอกสาร

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

## 🔧 Configuration Patterns

### Environment Variables Setup

**Production Configuration:**
```bash
# บริการ AI แกนหลัก
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

**Development Configuration:**
```bash
# การตั้งค่าที่เหมาะสมด้านต้นทุนสำหรับการพัฒนา
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # ระดับฟรี
```

### Secure Configuration with Key Vault

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

## Deployment Workflows

### AZD Extensions for Foundry

AZD ให้ส่วนขยายที่เพิ่มความสามารถเฉพาะด้าน AI สำหรับการทำงานกับบริการ Microsoft Foundry:

```bash
# ติดตั้งส่วนขยายเอเจนต์ Foundry
azd extension install azure.ai.agents

# ติดตั้งส่วนขยายการปรับแต่งละเอียด
azd extension install azure.ai.finetune

# ติดตั้งส่วนขยายโมเดลที่กำหนดเอง
azd extension install azure.ai.models

# แสดงรายการส่วนขยายที่ติดตั้ง
azd extension list --installed

# ตรวจสอบเวอร์ชันส่วนขยายเอเจนต์ที่ติดตั้งในปัจจุบัน
azd extension show azure.ai.agents
```

ส่วนขยาย AI ยังคงพัฒนาอย่างรวดเร็วในช่วงพรีวิว หากคำสั่งทำงานแตกต่างจากที่แสดง ให้ทำการอัปเกรดส่วนขยายที่เกี่ยวข้องก่อนแก้ไขปัญหาโปรเจกต์

### Agent-First Deployment with `azd ai`

หากคุณมีแผ่นกำกับตัวแทน ใช้ `azd ai agent init` เพื่อสร้างโครงโปรเจกต์ที่เชื่อมต่อกับ Foundry Agent Service:

```bash
# เริ่มต้นจากตัวระบุเอเย่นต์
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ติดตั้งไปยัง Azure
azd up
```

การเปิดตัวพรีวิวล่าสุดของ `azure.ai.agents` ยังเพิ่มการรองรับการเริ่มต้นด้วยเทมเพลตสำหรับ `azd ai agent init` หากคุณกำลังติดตามตัวอย่างตัวแทนรุ่นใหม่ ตรวจสอบความช่วยเหลือของส่วนขยายเพื่อดูธงที่มีในเวอร์ชันที่ติดตั้ง

ดูที่ [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) สำหรับเอกสารคำสั่งและธงทั้งหมด

### Single Command Deployment

```bash
# ใช้คำสั่งเดียวในการปรับใช้ทั้งหมด
azd up

# หรือปรับใช้อย่างค่อยเป็นค่อยไป
azd provision  # แค่โครงสร้างพื้นฐานเท่านั้น
azd deploy     # แค่แอปพลิเคชันเท่านั้น

# สำหรับการปรับใช้งานแอป AI ที่ทำงานยาวนานใน azd 1.23.11+
azd deploy --timeout 1800
```

### Environment-Specific Deployments

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

## Monitoring and Observability

### Application Insights Integration

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

### Cost Monitoring

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

## 🔐 Security Best Practices

### Managed Identity Configuration

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

### Network Security

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

## Performance Optimization

### Caching Strategies

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

### Auto-scaling Configuration

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

## Troubleshooting Common Issues

### Issue 1: OpenAI Quota Exceeded

**Symptoms:**
- การปรับใช้ล้มเหลวด้วยข้อผิดพลาดโควตา
- ข้อผิดพลาด 429 ในบันทึกแอปพลิเคชัน

**Solutions:**
```bash
# ตรวจสอบการใช้งานโควตาปัจจุบัน
az cognitiveservices usage list --location eastus

# ลองใช้ภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up

# ลดความจุชั่วคราว
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- ข้อผิดพลาด 401/403 เมื่อเรียกบริการ AI
- ข้อความ "Access denied"

**Solutions:**
```bash
# ตรวจสอบการกำหนดบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# ตรวจสอบการกำหนดค่าบัญชีตัวตนที่จัดการ
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# ตรวจสอบการเข้าถึง Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- โมเดลไม่พร้อมใช้งานในปรับใช้
- เวอร์ชันโมเดลบางตัวล้มเหลว

**Solutions:**
```bash
# แสดงรายการโมเดลที่มีตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเวอร์ชันโมเดลในเทมเพลต bicep
# ตรวจสอบความต้องการความจุของโมเดล
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: ตัวอย่าง Azure AI ยอดนิยมที่สุด — แอปแชท RAG ที่พร้อมใช้งานจริงซึ่งให้คุณถามคำถามกับเอกสารของคุณเอง ใช้ GPT-4.1-mini สำหรับแชท, text-embedding-3-large สำหรับ embeddings, และ Azure AI Search สำหรับการดึงข้อมูล รองรับเอกสารหลายรูปแบบ, การป้อน/ส่งเสียง, การตรวจสอบสิทธิ์ Microsoft Entra, และการติดตามด้วย Application Insights

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: เทียบเท่าของ .NET/C# ของตัวอย่าง RAG chat ใน Python สร้างด้วย ASP.NET Core Minimal API และ Blazor WebAssembly frontend มีการแชทด้วยเสียง, รองรับ GPT-4o-mini vision และไคลเอนต์ .NET MAUI Blazor Hybrid สำหรับเดสก์ท็อป/มือถือ

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: เวอร์ชัน Java ของตัวอย่าง RAG chat ใช้ Langchain4J สำหรับการจัดการ AI รองรับสถาปัตยกรรมอีเวนต์ไมโครเซอร์วิส, กลยุทธ์การค้นหาหลายแบบ (ข้อความ, เวกเตอร์, ไฮบริด), การอัปโหลดเอกสารด้วย Azure Document Intelligence, และปรับใช้บน Azure Container Apps หรือ Azure Kubernetes Service

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Azure AI Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: โคไพลอต RAG สำหรับธุรกิจค้าปลีกครบวงจร ใช้ Azure AI Foundry และ Prompty แชทบอท Contoso Outdoor ที่ยึดคำตอบกับข้อมูลแคตตาล็อกสินค้าและคำสั่งซื้อผู้ใช้ แสดงเวิร์กโฟลว์ GenAIOps ทั้งหมด — ต้นแบบกับ Prompty, ประเมินด้วยผู้ช่วย AI, และปรับใช้ผ่าน AZD ไปยัง Container Apps

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: ตัวอย่าง multi-agent ที่แสดงการจัดการตัวแทน AI ด้วย Prompty ใช้ตัวแทนวิจัย (Bing Grounding ใน Azure AI Agent Service), ตัวแทนผลิตภัณฑ์ (Azure AI Search), ตัวแทนผู้เขียน และตัวแทนบรรณาธิการ ทำงานร่วมกันสร้างบทความที่มีการวิจัยดี รวม CI/CD ด้วยการประเมินใน GitHub Actions

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: แชทบอท RAG แบบไม่มีเซิร์ฟเวอร์เต็มรูปแบบ ใช้ LangChain.js กับ Azure Functions สำหรับ API และ Azure Static Web Apps สำหรับโฮสต์ ใช้ Azure Cosmos DB เป็นทั้งที่เก็บเวกเตอร์และฐานข้อมูลประวัติการแชท รองรับการพัฒนาท้องถิ่นด้วย Ollama สำหรับการทดสอบฟรี

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: ตัวเร่งความเร็วโซลูชัน RAG ระดับองค์กร พร้อมพอร์ทัลผู้ดูแลระบบสำหรับอัปโหลด/จัดการเอกสาร, ตัวเลือกออร์เคสเตรเตอร์หลายแบบ (Semantic Kernel, LangChain, Prompt Flow), การพูดเป็นข้อความ, การผสานกับ Microsoft Teams, และเลือกใช้ฐานข้อมูล PostgreSQL หรือ Cosmos DB ออกแบบเป็นจุดเริ่มต้นที่ปรับแต่งได้สำหรับสถานการณ์ RAG ในการผลิต

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: แอปอ้างอิงสำหรับการจัดการตัวแทน AI หลายตัว ใช้สามเฟรมเวิร์ก (LangChain.js, LlamaIndex.TS และ Microsoft Agent Framework) มีเซิร์ฟเวอร์ MCP (Model Context Protocol) สี่ภาษา ปรับใช้เป็น Azure Container Apps แบบไม่มีเซิร์ฟเวอร์ พร้อมการตรวจสอบด้วย OpenTelemetry

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: เทมเพลต Bicep ขั้นต่ำที่ปรับใช้บริการ Azure AI พร้อมโมเดลการเรียนรู้เครื่องที่ตั้งค่าไว้ จุดเริ่มต้นน้ำหนักเบาสำหรับเมื่อคุณต้องการแค่โครงสร้างพื้นฐาน Azure AI โดยไม่ต้องมีสแตกแอปเต็มรูปแบบ

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: เยี่ยมชม [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) สำหรับเทมเพลต AZD เฉพาะ AI กว่า 80 แบบ ครอบคลุมหลายภาษาและสถานการณ์

## Next Steps

1. **Try the Examples**: เริ่มด้วยเทมเพลตที่สร้างไว้แล้วซึ่งตรงกับกรณีใช้งานของคุณ
2. **Customize for Your Needs**: ปรับแต่งโครงสร้างพื้นฐานและโค้ดแอปพลิเคชัน
3. **Add Monitoring**: นำการสังเกตการณ์ครบวงจรมาใช้
4. **Optimize Costs**: ปรับแต่งการตั้งค่าสำหรับงบประมาณของคุณ
5. **Secure Your Deployment**: นำรูปแบบความปลอดภัยในองค์กรมาใช้
6. **Scale to Production**: เพิ่มฟีเจอร์หลายภูมิภาคและความพร้อมใช้งานสูง

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: ปรับใช้และทดสอบแอปแชท AI พร้อมใช้ในสภาพแวดล้อมจริง

```bash
# เริ่มต้นเทมเพลต
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

**Success Criteria:**
- [ ] ปรับใช้สำเร็จโดยไม่มีข้อผิดพลาดโควตา
- [ ] สามารถเข้าถึงอินเทอร์เฟซแชทในเบราว์เซอร์
- [ ] สามารถถามคำถามและได้รับคำตอบจาก AI
- [ ] Application Insights แสดงข้อมูลโทรมาตร
- [ ] ล้างทรัพยากรสำเร็จ

**Estimated Cost**: $5-10 สำหรับการทดสอบ 30 นาที

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: ปรับใช้โมเดล AI หลายตัวโดยใช้การตั้งค่าที่แตกต่าง

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

# นำไปใช้และตรวจสอบ
azd provision
azd show
```

**Success Criteria:**
- [ ] โมเดลหลายตัวถูกปรับใช้สำเร็จ
- [ ] กำหนดความจุต่างกันได้
- [ ] โมเดลเข้าถึงได้ผ่าน API
- [ ] สามารถเรียกใช้ทั้งสองโมเดลจากแอปพลิเคชัน

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: ตั้งค่าการแจ้งเตือนงบประมาณและติดตามค่าใช้จ่าย

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

**Success Criteria:**
- [ ] สร้างการแจ้งเตือนงบประมาณใน Azure สำเร็จ
- [ ] ตั้งค่าการแจ้งเตือนทางอีเมล
- [ ] สามารถดูข้อมูลค่าใช้จ่ายใน Azure Portal
- [ ] ตั้งค่าขีดจำกัดงบประมาณเหมาะสม

## 💡 Frequently Asked Questions

<details>
<summary><strong>ฉันจะลดค่าใช้จ่าย Microsoft Foundry Models ในช่วงพัฒนาระบบได้อย่างไร?</strong></summary>

1. **ใช้ Free Tier**: Microsoft Foundry Models ให้โทเค็นฟรี 50,000 โทเค็น/เดือน
2. **ลดความจุ**: ตั้งค่าความจุเป็น 10 TPM แทน 30+ ในช่วงพัฒนา
3. **ใช้ azd down**: ปลดทรัพยากรเมื่อตอนไม่ได้พัฒนา
4. **แคชการตอบกลับ**: ใช้ Redis cache สำหรับคำถามซ้ำๆ
5. **ใช้ Prompt Engineering**: ลดการใช้โทเค็นด้วยการตั้งค่าคำสั่งที่มีประสิทธิภาพ
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
- การรวมเครือข่ายส่วนตัว
- การรับประกัน SLA
- การพิสูจน์ตัวตนด้วย managed identity
- โควต้าที่สูงกว่า

**OpenAI API**:
- เข้าถึงโมเดลใหม่ได้เร็วกว่า
- การตั้งค่าง่ายกว่า
- ระดับการเข้าถึงต่ำกว่า
- ใช้งานได้ในอินเทอร์เน็ตสาธารณะเท่านั้น

สำหรับแอปพลิเคชันในระดับการผลิต **แนะนำให้ใช้ Microsoft Foundry Models**.
</details>

<details>
<summary><strong>ฉันจะแก้ไขข้อผิดพลาดโควต้าที่เกินของ Microsoft Foundry Models ได้อย่างไร?</strong></summary>

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
# ไปที่ Azure Portal > Quotas > ขอเพิ่มโควต้า
```
</details>

<details>
<summary><strong>ฉันสามารถใช้ข้อมูลของตัวเองกับ Microsoft Foundry Models ได้ไหม?</strong></summary>

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
<summary><strong>ฉันจะรักษาความปลอดภัยของ AI model endpoints ได้อย่างไร?</strong></summary>

**แนวทางปฏิบัติที่ดีที่สุด**:
1. ใช้ Managed Identity (ไม่ใช้คีย์ API)
2. เปิดใช้งาน Private Endpoints
3. กำหนดค่า network security groups
4. ใช้การจำกัดอัตรา (rate limiting)
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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [ปัญหาและการอภิปราย](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [เอกสารอย่างเป็นทางการ](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [ทักษะ Microsoft Foundry บน skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ติดตั้งทักษะ Azure + Foundry agent ในตัวแก้ไขของคุณด้วยคำสั่ง `npx skills add microsoft/github-copilot-for-azure`

---

**การนำทางบท:**
- **📚 หน้าแรกหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ บทก่อนหน้า**: [บทที่ 1: โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมการอภิปรายชุมชนของเราหรือเปิดประเด็นปัญหาในที่เก็บโค้ด ชุมชน Azure AI + AZD พร้อมช่วยให้คุณประสบความสำเร็จ!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อปฏิเสธความรับผิดชอบ**:  
เอกสารฉบับนี้ได้ถูกแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ข้อมูลถูกต้องที่สุด โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ควรใช้การแปลโดยมืออาชีพที่มีความชำนาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดพลาดใด ๆ ที่อาจเกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->