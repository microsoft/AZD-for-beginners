<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T18:20:33+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "ar"
}
-->
# دمج Azure AI Foundry مع AZD

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الثاني - تطوير يعتمد على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل الأول: مشروعك الأول](../getting-started/first-project.md)
- **➡️ التالي**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 الفصل التالي**: [الفصل الثالث: التكوين](../getting-started/configuration.md)

## نظرة عامة

يشرح هذا الدليل كيفية دمج خدمات Azure AI Foundry مع Azure Developer CLI (AZD) لتسهيل عمليات نشر تطبيقات الذكاء الاصطناعي. يوفر Azure AI Foundry منصة شاملة لبناء وإدارة تطبيقات الذكاء الاصطناعي، بينما يبسط AZD عملية البنية التحتية والنشر.

## ما هو Azure AI Foundry؟

Azure AI Foundry هو منصة موحدة من مايكروسوفت لتطوير الذكاء الاصطناعي وتشمل:

- **كتالوج النماذج**: الوصول إلى نماذج الذكاء الاصطناعي المتقدمة
- **Prompt Flow**: مصمم بصري لتدفقات العمل الخاصة بالذكاء الاصطناعي
- **بوابة AI Foundry**: بيئة تطوير متكاملة لتطبيقات الذكاء الاصطناعي
- **خيارات النشر**: خيارات متعددة للاستضافة والتوسع
- **السلامة والأمان**: ميزات الذكاء الاصطناعي المسؤول المدمجة

## AZD + Azure AI Foundry: الأفضل معًا

| الميزة | Azure AI Foundry | فائدة التكامل مع AZD |
|--------|------------------|-----------------------|
| **نشر النماذج** | النشر اليدوي عبر البوابة | عمليات نشر مؤتمتة وقابلة للتكرار |
| **البنية التحتية** | التوفير عبر النقرات | البنية التحتية ككود (Bicep) |
| **إدارة البيئة** | التركيز على بيئة واحدة | بيئات متعددة (تطوير/اختبار/إنتاج) |
| **تكامل CI/CD** | محدود | دعم أصلي لـ GitHub Actions |
| **إدارة التكاليف** | مراقبة أساسية | تحسين التكاليف حسب البيئة |

## المتطلبات الأساسية

- اشتراك Azure مع الأذونات المناسبة
- تثبيت Azure Developer CLI
- الوصول إلى خدمات Azure OpenAI
- معرفة أساسية بـ Azure AI Foundry

## أنماط التكامل الأساسية

### النمط الأول: تكامل Azure OpenAI

**حالة الاستخدام**: نشر تطبيقات الدردشة باستخدام نماذج Azure OpenAI

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

**البنية التحتية (main.bicep):**
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

### النمط الثاني: تكامل البحث + RAG

**حالة الاستخدام**: نشر تطبيقات استرجاع البيانات المعززة (RAG)

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

### النمط الثالث: تكامل الذكاء الوثائقي

**حالة الاستخدام**: تدفقات العمل لتحليل ومعالجة الوثائق

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

## 🔧 أنماط التكوين

### إعداد متغيرات البيئة

**تكوين الإنتاج:**
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

**تكوين التطوير:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### التكوين الآمن باستخدام Key Vault

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

## سير عمل النشر

### النشر بأمر واحد

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### عمليات النشر حسب البيئة

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

## المراقبة والرصد

### تكامل Application Insights

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

### مراقبة التكاليف

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

## 🔐 أفضل ممارسات الأمان

### إعداد الهوية المُدارة

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

### أمان الشبكة

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

## تحسين الأداء

### استراتيجيات التخزين المؤقت

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

### إعداد التوسع التلقائي

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

## استكشاف المشكلات الشائعة

### المشكلة الأولى: تجاوز حصة OpenAI

**الأعراض:**
- فشل النشر بسبب أخطاء الحصة
- أخطاء 429 في سجلات التطبيق

**الحلول:**
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

### المشكلة الثانية: فشل المصادقة

**الأعراض:**
- أخطاء 401/403 عند الاتصال بخدمات الذكاء الاصطناعي
- رسائل "تم رفض الوصول"

**الحلول:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### المشكلة الثالثة: مشكلات نشر النماذج

**الأعراض:**
- النماذج غير متوفرة في النشر
- فشل إصدارات معينة من النماذج

**الحلول:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## قوالب أمثلة

### تطبيق دردشة أساسي

**المستودع**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**الخدمات**: Azure OpenAI + البحث المعرفي + خدمة التطبيقات

**البدء السريع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### خط معالجة الوثائق

**المستودع**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**الخدمات**: الذكاء الوثائقي + التخزين + الوظائف

**البدء السريع**:
```bash
azd init --template ai-document-processing
azd up
```

### دردشة المؤسسات مع RAG

**المستودع**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**الخدمات**: Azure OpenAI + البحث + تطبيقات الحاويات + Cosmos DB

**البدء السريع**:
```bash
azd init --template contoso-chat
azd up
```

## الخطوات التالية

1. **جرب الأمثلة**: ابدأ بقالب جاهز يناسب حالتك
2. **خصص حسب احتياجاتك**: عدّل البنية التحتية وكود التطبيق
3. **أضف المراقبة**: قم بتنفيذ الرصد الشامل
4. **حسّن التكاليف**: قم بضبط التكوينات وفق ميزانيتك
5. **أمّن النشر الخاص بك**: قم بتنفيذ أنماط الأمان المؤسسية
6. **التوسع للإنتاج**: أضف ميزات متعددة المناطق وتوافر عالي

## المجتمع والدعم

- **Discord الخاص بـ Azure AI Foundry**: [قناة #Azure](https://discord.gg/microsoft-azure)
- **GitHub الخاص بـ AZD**: [المشكلات والمناقشات](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [التوثيق الرسمي](https://learn.microsoft.com/azure/ai-studio/)

---

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل الثاني - تطوير يعتمد على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل الأول: مشروعك الأول](../getting-started/first-project.md)
- **➡️ التالي**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 الفصل التالي**: [الفصل الثالث: التكوين](../getting-started/configuration.md)

**تحتاج إلى مساعدة؟** انضم إلى مناقشات المجتمع أو افتح مشكلة في المستودع. مجتمع Azure AI + AZD هنا لمساعدتك على النجاح!

---

**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو معلومات غير دقيقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي. للحصول على معلومات حاسمة، يُوصى بالاستعانة بترجمة بشرية احترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.