# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: فصل ۲ - توسعه با اولویت هوش مصنوعی
- **⬅️ Previous Chapter**: [فصل ۱: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [استقرار مدل‌های هوش مصنوعی](ai-model-deployment.md)
- **🚀 Next Chapter**: [فصل ۳: پیکربندی](../chapter-03-configuration/configuration.md)

## Overview

این راهنما نشان می‌دهد چگونه خدمات Microsoft Foundry را با Azure Developer CLI (AZD) ادغام کنید تا استقرار برنامه‌های هوش مصنوعی ساده‌تر شود. Microsoft Foundry یک پلتفرم جامع برای ساخت، استقرار و مدیریت برنامه‌های هوش مصنوعی فراهم می‌کند، در حالی که AZD فرایند زیرساخت و استقرار را ساده‌تر می‌سازد.

## What is Microsoft Foundry?

Microsoft Foundry پلتفرم یکپارچه مایکروسافت برای توسعه هوش مصنوعی است که شامل موارد زیر می‌باشد:

- **Model Catalog**: دسترسی به مدل‌های پیشرفته هوش مصنوعی
- **Prompt Flow**: طراحی‌کننده دیداری برای جریان‌های کاری هوش مصنوعی
- **Microsoft Foundry Portal**: محیط توسعه یکپارچه برای برنامه‌های هوش مصنوعی
- **Deployment Options**: گزینه‌های متنوع میزبانی و مقیاس‌دهی
- **Safety and Security**: قابلیت‌های مسئولانه هوش مصنوعی به‌صورت داخلی

## AZD + Microsoft Foundry: Better Together

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | استقرار دستی از طریق پورتال | استقرارهای خودکار و تکرارشونده |
| **Infrastructure** | تأمین منابع با کلیک | زیرساخت به‌عنوان کد (Bicep) |
| **Environment Management** | تمرکز بر یک محیط واحد | چند-محیطی (dev/staging/prod) |
| **CI/CD Integration** | محدود | پشتیبانی بومی از GitHub Actions |
| **Cost Management** | مانیتورینگ پایه | بهینه‌سازی هزینه مخصوص هر محیط |

## Prerequisites

- اشتراک Azure با مجوزهای مناسب
- Azure Developer CLI نصب‌شده
- دسترسی به سرویس‌های Microsoft Foundry Models
- آشنایی پایه با Microsoft Foundry

> **Current AZD baseline:** این مثال‌ها بر پایه `azd` نسخه‌ی `1.23.12` بررسی شده‌اند. برای جریان کاری عامل‌های هوش مصنوعی، از نسخه‌ی پیش‌نمایش افزونه‌ی جاری استفاده کنید و قبل از شروع نسخه‌ی نصب‌شده‌تان را بررسی کنید.

## Core Integration Patterns

### Pattern 1: Microsoft Foundry Models Integration

**Use Case**: استقرار برنامه‌های چت با مدل‌های Microsoft Foundry

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

**Use Case**: استقرار برنامه‌های تولید تقویت‌شده با بازیابی (RAG)

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

**Use Case**: جریان‌های کاری پردازش و تحلیل اسناد

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
# خدمات اصلی هوش مصنوعی
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# پیکربندی‌های مدل
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# تنظیمات عملکرد
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Development Configuration:**
```bash
# تنظیمات بهینه‌شده از نظر هزینه برای توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # طرح رایگان
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

AZD افزونه‌هایی ارائه می‌دهد که قابلیت‌های مخصوص هوش مصنوعی را برای کار با سرویس‌های Microsoft Foundry اضافه می‌کنند:

```bash
# افزونهٔ Foundry agents را نصب کنید
azd extension install azure.ai.agents

# افزونهٔ تنظیم دقیق را نصب کنید
azd extension install azure.ai.finetune

# افزونهٔ مدل‌های سفارشی را نصب کنید
azd extension install azure.ai.models

# افزونه‌های نصب‌شده را فهرست کنید
azd extension list --installed

# نسخهٔ افزونهٔ عامل نصب‌شدهٔ فعلی را بررسی کنید
azd extension show azure.ai.agents
```

افزونه‌های هوش مصنوعی هنوز در پیش‌نمایش به‌سرعت در حال تحول هستند. اگر یک فرمان رفتار متفاوتی نسبت به آنچه در اینجا نشان داده شده دارد، قبل از عیب‌یابی پروژه، افزونه‌ی مربوطه را به‌روزرسانی کنید.

### Agent-First Deployment with `azd ai`

اگر یک manifest عامل دارید، از `azd ai agent init` برای ایجاد اسکلت پروژه‌ای که به Foundry Agent Service متصل است استفاده کنید:

```bash
# از مانیفست عامل مقداردهی اولیه کنید
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# به آژور مستقر کنید
azd up
```

نسخه‌های پیش‌نمایش اخیر `azure.ai.agents` همچنین پشتیبانی از مقداردهی اولیه مبتنی بر قالب برای `azd ai agent init` را اضافه کرده‌اند. اگر از نمونه‌های عامل جدیدتر پیروی می‌کنید، کمک افزونه را برای علامت‌های دقیق موجود در نسخه‌ی نصب‌شده بررسی کنید.

به [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) مراجعه کنید برای مرجع کامل فرمان‌ها و علامت‌ها.

### Single Command Deployment

```bash
# همه‌چیز را با یک دستور مستقر کنید
azd up

# یا به‌صورت مرحله‌ای مستقر کنید
azd provision  # فقط زیرساخت‌ها
azd deploy     # فقط برنامه

# برای استقرار برنامه‌های هوش مصنوعی بلندمدت در azd 1.23.11+
azd deploy --timeout 1800
```

### Environment-Specific Deployments

```bash
# محیط توسعه
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# محیط تولید
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
- استقرار با خطاهای سهمیه مواجه می‌شود
- خطاهای 429 در لاگ‌های برنامه

**Solutions:**
```bash
# ‎استفاده فعلی از سهمیه را بررسی کنید
az cognitiveservices usage list --location eastus

# ‎منطقه دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up

# ‎ظرفیت را موقتاً کاهش دهید
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Issue 2: Authentication Failures

**Symptoms:**
- خطاهای 401/403 هنگام فراخوانی سرویس‌های هوش مصنوعی
- پیام‌های "Access denied"

**Solutions:**
```bash
# تخصیص نقش‌ها را تأیید کنید
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# پیکربندی هویت مدیریت‌شده را بررسی کنید
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# دسترسی به مخزن کلید را تأیید کنید
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Issue 3: Model Deployment Issues

**Symptoms:**
- مدل‌ها در استقرار در دسترس نیستند
- نسخه‌های خاص مدل با خطا مواجه می‌شوند

**Solutions:**
```bash
# مدل‌های موجود را بر اساس منطقه فهرست کنید
az cognitiveservices model list --location eastus

# نسخهٔ مدل را در قالب Bicep به‌روزرسانی کنید
# نیازمندی‌های ظرفیت مدل را بررسی کنید
```

## Example Templates

### RAG Chat Application (Python)

**Repository**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Description**: محبوب‌ترین نمونه Azure AI — یک اپ گفتگویی RAG آماده برای تولید که به شما امکان می‌دهد سوالات خود را درباره‌ی اسنادتان بپرسید. از GPT-4.1-mini برای چت، text-embedding-3-large برای امبدینگ‌ها و Azure AI Search برای بازیابی استفاده می‌کند. از اسناد چندرسانه‌ای، ورودی/خروجی گفتار، احراز هویت Microsoft Entra، و ردگیری Application Insights پشتیبانی می‌کند.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Repository**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Description**: معادل .NET/C# نمونه‌ی RAG پایتون. ساخته‌شده با ASP.NET Core Minimal API و رابط کاربری Blazor WebAssembly. شامل چت صوتی، پشتیبانی از GPT-4o-mini vision، و یک کلاینت دسکتاپ/موبایل ترکیبی .NET MAUI Blazor همراه است.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Repository**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Services**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Description**: نسخه‌ی جاوا از نمونه‌ی RAG که از Langchain4J برای ارکستراسیون هوش مصنوعی استفاده می‌کند. از معماری میکروسرویس رویداد-محور، استراتژی‌های مختلف جستجو (متنی، برداری، ترکیبی)، بارگذاری اسناد با Azure Document Intelligence، و استقرار روی Azure Container Apps یا Azure Kubernetes Service پشتیبانی می‌کند.

**Quick Start**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Enterprise Retail Copilot with Microsoft Foundry

**Repository**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Services**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Description**: یک کاپیلوت خرده‌فروشی انتها-به-انتها با استفاده از Microsoft Foundry و Prompty. یک چت‌بات فروشگاه بیرونی Contoso که پاسخ‌ها را بر اساس کاتالوگ محصولات و داده‌های سفارش مشتری پایه‌گذاری می‌کند. جریان کامل GenAIOps را نشان می‌دهد — نمونه‌سازی با Prompty، ارزیابی با ارزیاب‌های کمک‌شده توسط هوش مصنوعی، و استقرار از طریق AZD به Container Apps.

**Quick Start**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Repository**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Services**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Description**: نمونه‌ی چندعامله که ارکستراسیون عامل‌های هوش مصنوعی را با Prompty نشان می‌دهد. از یک عامل پژوهشی (Bing Grounding در Azure AI Agent Service)، یک عامل محصول (Azure AI Search)، یک عامل نویسنده، و یک عامل ویرایشگر برای تولید مقالات پژوهشی‌شده به‌صورت مشارکتی استفاده می‌کند. شامل CI/CD با ارزیابی در GitHub Actions است.

**Quick Start**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Repository**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Services**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Description**: چت‌بات RAG کاملاً بدون سرور با استفاده از LangChain.js و Azure Functions برای API و Azure Static Web Apps برای میزبانی. از Azure Cosmos DB به‌عنوان ذخیره‌ساز برداری و پایگاه تاریخچه چت استفاده می‌کند. از توسعه محلی با Ollama برای تست بدون هزینه پشتیبانی می‌کند.

**Quick Start**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Chat with Your Data Solution Accelerator

**Repository**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Services**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Description**: شتاب‌دهنده راه‌حل RAG سطح سازمانی با پرتال مدیریت اسناد برای آپلود/مدیریت اسناد، گزینه‌های متعدد ارکستراتور (Semantic Kernel، LangChain، Prompt Flow)، تبدیل گفتار به متن، یکپارچگی با Microsoft Teams، و انتخاب PostgreSQL یا Cosmos DB به‌عنوان بک‌اند. به‌عنوان نقطه شروع قابل تنظیم برای سناریوهای RAG تولیدی طراحی شده است.

**Quick Start**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Multi-Agent MCP Orchestration

**Repository**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Services**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Description**: برنامه مرجع برای ارکستراسیون چندعامله هوش مصنوعی با استفاده از سه فریم‌ورک (LangChain.js، LlamaIndex.TS، و Microsoft Agent Framework). شامل سرورهای MCP (Model Context Protocol) در چهار زبان است که به‌صورت بدون‌سرور روی Azure Container Apps مستقر شده‌اند و مانیتورینگ OpenTelemetry دارند.

**Quick Start**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repository**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Services**: Azure AI Services + Azure OpenAI

**Description**: قالب Bicep کمینه که سرویس‌های Azure AI را همراه با مدل‌های یادگیری ماشینی پیکربندی‌شده مستقر می‌کند. نقطه شروع سبک‌وزنی زمانی که فقط به تأمین زیرساخت Azure AI بدون پشته کامل برنامه نیاز دارید.

**Quick Start**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Browse more templates**: به [گالری قالب‌های عالی AZD AI](https://azure.github.io/awesome-azd/?tags=ai) مراجعه کنید برای بیش از 80 قالب مخصوص AI برای AZD در زبان‌ها و سناریوهای مختلف.

## Next Steps

1. **Try the Examples**: با یک قالب از پیش‌ساخته که با مورد استفاده‌ی شما مطابقت دارد شروع کنید
2. **Customize for Your Needs**: زیرساخت و کد اپلیکیشن را سفارشی کنید
3. **Add Monitoring**: قابل‌مشاهده بودن جامع را پیاده‌سازی کنید
4. **Optimize Costs**: پیکربندی‌ها را برای بودجه‌ی خود بهینه کنید
5. **Secure Your Deployment**: الگوهای امنیتی سازمانی را پیاده‌سازی کنید
6. **Scale to Production**: ویژگی‌های چندمنطقه‌ای و دسترس‌پذیری بالا را اضافه کنید

## 🎯 Hands-On Exercises

### Exercise 1: Deploy Microsoft Foundry Models Chat App (30 minutes)
**Goal**: استقرار و تست یک برنامه گفتگویی هوش مصنوعی آماده برای تولید

```bash
# قالب را مقداردهی اولیه کنید
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# متغیرهای محیطی را تنظیم کنید
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# مستقر کنید
azd up

# برنامه را آزمایش کنید
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# بر عملیات هوش مصنوعی نظارت کنید
azd monitor

# پاکسازی کنید
azd down --force --purge
```

**Success Criteria:**
- [ ] استقرار بدون خطاهای سهمیه تکمیل شود
- [ ] بتوان به رابط گفت‌وگو در مرورگر دسترسی داشت
- [ ] بتوان سوال پرسید و پاسخ‌های توانمند‌شده توسط هوش مصنوعی دریافت کرد
- [ ] Application Insights داده‌های تلِمتری را نشان دهد
- [ ] منابع به‌درستی پاک‌سازی شده باشند

**Estimated Cost**: $5-10 برای 30 دقیقه تست

### Exercise 2: Configure Multi-Model Deployment (45 minutes)
**Goal**: استقرار چندین مدل هوش مصنوعی با پیکربندی‌های متفاوت

```bash
# ایجاد پیکربندی Bicep سفارشی
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

# استقرار و تأیید
azd provision
azd show
```

**Success Criteria:**
- [ ] چندین مدل با موفقیت مستقر شده باشند
- [ ] تنظیمات ظرفیت متفاوت اعمال شده باشد
- [ ] مدل‌ها از طریق API در دسترس باشند
- [ ] بتوان هر دو مدل را از اپلیکیشن فراخوانی کرد

### Exercise 3: Implement Cost Monitoring (20 minutes)
**Goal**: تنظیم هشدارهای بودجه و ردیابی هزینه

```bash
# افزودن هشدار بودجه به Bicep
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

# استقرار هشدار بودجه
azd provision

# بررسی هزینه‌های فعلی
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Success Criteria:**
- [ ] هشدار بودجه در Azure ایجاد شده باشد
- [ ] اعلان‌های ایمیلی پیکربندی شده باشند
- [ ] بتوان داده‌های هزینه را در Azure Portal مشاهده کرد
- [ ] آستانه‌های بودجه به‌درستی تنظیم شده باشند

## 💡 Frequently Asked Questions

<details>
<summary><strong>چگونه هزینه‌های Microsoft Foundry Models را در طول توسعه کاهش دهم؟</strong></summary>

1. **Use Free Tier**: Microsoft Foundry Models به‌صورت رایگان 50,000 توکن در ماه ارائه می‌دهد
2. **Reduce Capacity**: ظرفیت را برای توسعه به 10 TPM به‌جای 30+ تنظیم کنید
3. **Use azd down**: زمانی که به‌طور فعال توسعه نمی‌کنید منابع را آزاد کنید
4. **Cache Responses**: برای پرسش‌های تکراری از Redis cache استفاده کنید
5. **Use Prompt Engineering**: با پرامپت‌های کارآمد مصرف توکن را کاهش دهید


```bash
# پیکربندی توسعه
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>تفاوت بین Microsoft Foundry Models و OpenAI API چیست؟</strong></summary>

**Microsoft Foundry Models**:
- امنیت شرکتی و انطباق
- ادغام با شبکه خصوصی
- تضمین‌های SLA
- احراز هویت Managed Identity
- سهمیه‌های بالاتر در دسترس

**OpenAI API**:
- دسترسی سریع‌تر به مدل‌های جدید
- راه‌اندازی ساده‌تر
- مانع ورود کمتر
- فقط از طریق اینترنت عمومی

برای برنامه‌های تولیدی، **Microsoft Foundry Models توصیه می‌شود**.
</details>

<details>
<summary><strong>چگونه با خطاهای تجاوز از سهمیه Microsoft Foundry Models برخورد کنم؟</strong></summary>

```bash
# سهمیه فعلی را بررسی کنید
az cognitiveservices usage list --location eastus2

# منطقه دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up

# ظرفیت را به‌طور موقت کاهش دهید
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# درخواست افزایش سهمیه دهید
# به پورتال Azure > سهمیه‌ها > درخواست افزایش بروید
```
</details>

<details>
<summary><strong>آیا می‌توانم از داده‌های خودم با Microsoft Foundry Models استفاده کنم؟</strong></summary>

بله! از **Azure AI Search** برای RAG (تولید تقویت‌شده با بازیابی) استفاده کنید:

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

قالب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) را ببینید.
</details>

<details>
<summary><strong>چگونه نقاط انتهایی مدل‌های هوش مصنوعی را ایمن کنم؟</strong></summary>

**بهترین شیوه‌ها**:
1. از Managed Identity استفاده کنید (بدون API keys)
2. Private Endpoints را فعال کنید
3. network security groups را پیکربندی کنید
4. محدودسازی نرخ (rate limiting) را پیاده‌سازی کنید
5. از Azure Key Vault برای مدیریت اسرار استفاده کنید

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

## جامعه و پشتیبانی

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [مسائل و بحث‌ها](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [مستندات رسمی](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [مهارت Microsoft Foundry در skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - مهارت‌های عامل Azure + Foundry را با دستور `npx skills add microsoft/github-copilot-for-azure` در ویرایشگر خود نصب کنید.

---

**ناوبری فصل:**
- **📚 صفحه اصلی دوره**: [AZD For Beginners](../../README.md)
- **📖 فصل جاری**: فصل 2 - توسعه محور هوش مصنوعی
- **⬅️ فصل قبلی**: [فصل 1: اولین پروژه شما](../chapter-01-foundation/first-project.md)
- **➡️ بعدی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **🚀 فصل بعدی**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

**به کمک نیاز دارید؟** به بحث‌های جامعه ما بپیوندید یا یک موضوع (issue) در مخزن باز کنید. جامعه Azure AI + AZD اینجاست تا به موفقیت شما کمک کند!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->