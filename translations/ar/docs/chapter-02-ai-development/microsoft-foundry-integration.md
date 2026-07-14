# تكامل Microsoft Foundry مع AZD

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير بتركيز على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

## نظرة عامة

يوضح هذا الدليل كيفية دمج خدمات Microsoft Foundry مع أداة Azure Developer CLI (AZD) لنشر تطبيقات الذكاء الاصطناعي بسلاسة. يوفر Microsoft Foundry منصة شاملة لبناء ونشر وإدارة تطبيقات الذكاء الاصطناعي، بينما يبسط AZD عملية البنية التحتية والنشر.

## ما هو Microsoft Foundry؟

Microsoft Foundry هي منصة موحدة من مايكروسوفت لتطوير الذكاء الاصطناعي تتضمن:

- **كتالوج النماذج**: الوصول إلى أحدث نماذج الذكاء الاصطناعي
- **تدفق الإرشادات**: مصمم بصري لعمليات سير عمل الذكاء الاصطناعي
- **بوابة Microsoft Foundry**: بيئة تطوير متكاملة لتطبيقات الذكاء الاصطناعي
- **خيارات النشر**: خيارات استضافة وتوسيع متنوعة
- **السلامة والأمان**: ميزات الذكاء الاصطناعي المسؤولة المدمجة

## AZD + Microsoft Foundry: أفضل معًا

| الميزة | Microsoft Foundry | فائدة التكامل مع AZD |
|---------|-----------------|------------------------|
| **نشر النموذج** | نشر يدوي عبر البوابة | نشرات تلقائية وقابلة للتكرار |
| **البنية التحتية** | توفير بنقرة واحدة | البنية التحتية ككود (Bicep) |
| **إدارة البيئة** | تركيز على بيئة واحدة | بيئات متعددة (تطوير/تجهيز/إنتاج) |
| **تكامل CI/CD** | محدود | دعم أصلي لـ GitHub Actions |
| **إدارة التكاليف** | مراقبة أساسية | تحسين التكاليف حسب البيئة |

## المتطلبات الأساسية

- اشتراك Azure مع الأذونات المناسبة
- تثبيت Azure Developer CLI
- الوصول إلى خدمات نماذج Microsoft Foundry
- إلمام أساسي بـ Microsoft Foundry

> **النسخة الأساسية الحالية لـ AZD:** تمت مراجعة هذه الأمثلة باستخدام `azd` النسخة `1.27.1`. بالنسبة لسير عمل وكيل الذكاء الاصطناعي، استخدم إصدار المعاينة الحالي للامتداد وتحقق من نسختك المثبتة قبل البدء.

## أنماط التكامل الأساسية

### النمط 1: تكامل نماذج Microsoft Foundry

**حالة الاستخدام**: نشر تطبيقات الدردشة باستخدام نماذج Microsoft Foundry Models

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

### النمط 2: تكامل الذكاء الاصطناعي والبحث + RAG

**حالة الاستخدام**: نشر تطبيقات الإنشاء المعزز بالاسترجاع (RAG)

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

### النمط 3: تكامل ذكاء الوثائق

**حالة الاستخدام**: سير عمل معالجة وتحليل الوثائق

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
# خدمات الذكاء الاصطناعي الأساسية
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# إعدادات النموذج
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# إعدادات الأداء
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**تكوين التطوير:**
```bash
# إعدادات محسّنة من حيث التكلفة للتطوير
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # الطبقة المجانية
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

### امتدادات AZD لـ Foundry

يوفر AZD امتدادات تضيف قدرات خاصة بالذكاء الاصطناعي للعمل مع خدمات Microsoft Foundry:

```bash
# تثبيت امتداد وكلاء Foundry
azd extension install azure.ai.agents

# تثبيت امتداد الضبط الدقيق
azd extension install azure.ai.finetune

# تثبيت امتداد النماذج المخصصة
azd extension install azure.ai.models

# عرض قائمة الامتدادات المثبتة
azd extension list --installed

# فحص إصدار امتداد الوكيل المثبت حاليًا
azd extension show azure.ai.agents
```

ما تزال امتدادات الذكاء الاصطناعي تتطور بسرعة في مرحلة المعاينة. إذا تصرف الأمر بطريقة مختلفة عن المعروض هنا، فقم بترقية الامتداد ذي الصلة قبل استكشاف المشروع نفسه.

### نشر الوكيل أولًا باستخدام `azd ai`

إذا كان لديك ملف تعريف الوكيل، استخدم الأمر `azd ai agent init` لتهيئة مشروع مرتبط بخدمة الوكيل في Foundry:

```bash
# التهيئة من ملف تعريف الوكيل
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# النشر إلى أزور
azd up
```

أصدرت إصدارات المعاينة الأخيرة لـ `azure.ai.agents` أيضًا دعم التهيئة باستخدام القوالب لـ `azd ai agent init`. إذا كنت تتبع عينات وكلاء أحدث، تحقق من مساعدة الامتداد للخيارات الدقيقة المتاحة في نسختك المثبتة.

راجع [أوامر AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) للمرجع الكامل للأوامر والعلمات.

### نشر الأمر الواحد

```bash
# نشر كل شيء بأمر واحد
azd up

# أو النشر بشكل تدريجي
azd provision  # البنية التحتية فقط
azd deploy     # التطبيق فقط

# لنشر تطبيقات الذكاء الاصطناعي طويلة الأمد في azd 1.23.11+
azd deploy --timeout 1800
```

### نشرات محددة حسب البيئة

```bash
# بيئة التطوير
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# بيئة الإنتاج
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

## 🔐 أفضل الممارسات الأمنية

### تكوين الهوية المدارة

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

### تكوين التوسع التلقائي

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

## استكشاف المشكلات الشائعة وإصلاحها

### المشكلة 1: تجاوز حصة OpenAI

**الأعراض:**
- فشل النشر مع أخطاء الحصة
- أخطاء 429 في سجلات التطبيق

**الحلول:**
```bash
# تحقق من استخدام الحصة الحالي
az cognitiveservices usage list --location eastus

# جرب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up

# قلل السعة مؤقتًا
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### المشكلة 2: فشل المصادقة

**الأعراض:**
- أخطاء 401/403 عند استدعاء خدمات الذكاء الاصطناعي
- رسائل "تم رفض الوصول"

**الحلول:**
```bash
# التحقق من تعيين الأدوار
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# التحقق من تكوين الهوية المُدارة
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# التحقق من وصول Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### المشكلة 3: مشاكل نشر النموذج

**الأعراض:**
- عدم توافر النماذج في النشر
- فشل إصدارات نماذج محددة

**الحلول:**
```bash
# سرد النماذج المتاحة حسب المنطقة
az cognitiveservices model list --location eastus

# تحديث إصدار النموذج في قالب بيسب
# التحقق من متطلبات سعة النموذج
```

## قوالب الأمثلة

### تطبيق دردشة RAG (بايثون)

**المستودع**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**الخدمات**: Azure OpenAI + Azure AI Search + تطبيقات الحاويات Azure + تخزين Azure Blob

**الوصف**: النموذج الأكثر شعبية للذكاء الاصطناعي في Azure — تطبيق دردشة RAG جاهز للإنتاج يتيح لك طرح الأسئلة على مستنداتك الخاصة. يستخدم GPT-4.1-mini للدردشة، و text-embedding-3-large للتضمينات، و Azure AI Search للاسترجاع. يدعم مستندات متعددة الوسائط، ومدخلات/مخرجات صوتية، ومصادقة Microsoft Entra، وتتبع Application Insights.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### تطبيق دردشة RAG (.NET)

**المستودع**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**الخدمات**: Azure OpenAI + Azure AI Search + تطبيقات الحاويات Azure + Semantic Kernel

**الوصف**: النسخة المكافئة لـ .NET/C# من نموذج دردشة RAG بلغة البايثون. مبني باستخدام ASP.NET Core Minimal API وواجهة Blazor WebAssembly. يشمل دردشة صوتية، ودعم GPT-4o-mini للرؤية، وعميل سطح مكتب/جوال هجين باستخدام .NET MAUI Blazor.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### تطبيق دردشة RAG (جافا)

**المستودع**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**الخدمات**: Azure OpenAI + Azure AI Search + تطبيقات الحاويات Azure / AKS + Langchain4J + Azure Cosmos DB

**الوصف**: النسخة الجافا من نموذج دردشة RAG مع استخدام Langchain4J لتنظيم الذكاء الاصطناعي. يدعم هندسة خدمية صغيرة event-driven، استراتيجيات بحث متعددة (نص، متجه، هجينة)، رفع المستندات باستخدام Azure Document Intelligence، ونشر على Azure Container Apps أو Azure Kubernetes Service.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### مساعد البيع بالتجزئة المؤسسي مع Microsoft Foundry

**المستودع**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**الخدمات**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + تطبيقات الحاويات Azure + Azure Cosmos DB

**الوصف**: مساعد RAG للتجزئة من البداية للنهاية باستخدام Microsoft Foundry و Prompty. روبوت دردشة لمتجر Contoso Outdoor يعتمد ردوده على بيانات كتالوج المنتجات وطلبات العملاء. يعرض كامل سير عمل GenAIOps — النموذج الأولي مع Prompty، التقييم بمساعدات الذكاء الاصطناعي، والنشر عبر AZD إلى تطبيقات الحاويات.

**بدء سريع**:
```bash
azd init --template contoso-chat
azd up
```

### تطبيق الكتابة الإبداعية متعدد الوكلاء

**المستودع**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**الخدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + تطبيقات الحاويات Azure

**الوصف**: نموذج متعدد الوكلاء يعرض تنسيق وكلاء الذكاء الاصطناعي مع Prompty. يستخدم وكيل بحث (Bing Grounding في خدمة Azure AI Agent)، وكيل منتج (Azure AI Search)، وكيل كاتب، ووكيل محرر لإنتاج مقالات موثوقة بالتعاون. يشمل CI/CD مع التقييم في GitHub Actions.

**بدء سريع**:
```bash
azd init --template contoso-creative-writer
azd up
```

### دردشة RAG بدون خادم (JavaScript/TypeScript)

**المستودع**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**الخدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB لـ NoSQL + LangChain.js

**الوصف**: روبوت دردشة RAG بدون خادم بكامل الوظائف باستخدام LangChain.js مع Azure Functions للواجهة البرمجية واستضافة Azure Static Web Apps. يستخدم Azure Cosmos DB كمخزن متجه وقاعدة بيانات سجل الدردشة. يدعم التطوير المحلي مع Ollama لاختبار بدون تكلفة.

**بدء سريع**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### مسرع حل الدردشة مع بياناتك

**المستودع**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**الوصف**: مسرع حل RAG لمؤسسات مع بوابة إدارة الوثائق، خيارات منسق متعددة (Semantic Kernel, LangChain, Prompt Flow)، تحويل الكلام إلى نص، تكامل Microsoft Teams، واختيار قاعدة بيانات PostgreSQL أو Cosmos DB. مصمم كنقطة انطلاق قابلة للتخصيص لسيناريوهات RAG للإنتاج.

**بدء سريع**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### وكلاء سفر الذكاء الاصطناعي - تنسيق MCP متعدد الوكلاء

**المستودع**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**الخدمات**: Azure OpenAI + Microsoft Foundry + تطبيقات الحاويات Azure + خوادم MCP (.NET, Python, Java, TypeScript)

**الوصف**: تطبيق مرجعي لتنظيم الذكاء الاصطناعي متعدد الوكلاء باستخدام ثلاث أطر (LangChain.js, LlamaIndex.TS, و Microsoft Agent Framework). يتضمن خوادم MCP (بروتوكول سياق النموذج) بأربع لغات تم نشرها كتطبيقات حاويات Azure بدون خادم مع مراقبة OpenTelemetry.

**بدء سريع**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### المبتدئ في Azure AI

**المستودع**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**الخدمات**: خدمات Azure AI + Azure OpenAI

**الوصف**: قالب Bicep بسيط ينشر خدمات Azure AI مع نماذج تعلم آلي مكونة. نقطة انطلاق خفيفة عندما تحتاج فقط إلى توفير بنية تحتية Azure AI دون كومة تطبيق كاملة.

**بدء سريع**:
```bash
azd init --template azd-ai-starter
azd up
```

> **تصفح المزيد من القوالب**: زوروا معرض [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) الذي يحتوي على أكثر من 80 قالبًا خاصًا بالذكاء الاصطناعي لـ AZD عبر اللغات والسيناريوهات.

## الخطوات التالية

1. **جرّب الأمثلة**: ابدأ بقالب مبني مسبقًا يتناسب مع حالة الاستخدام لديك
2. **خصص حسب حاجتك**: عدّل البنية التحتية وكود التطبيق
3. **أضف المراقبة**: نفّذ المراقبة الشاملة
4. **حسن التكاليف**: ضبط التكوينات وفق ميزانيتك
5. **أمّن نشر تطبيقك**: نفّذ أنماط الأمان المؤسسية
6. **وسع للإنتاج**: أضف ميزات تعدد المناطق وتوفر عالي

## 🎯 تمارين عملية

### التمرين 1: نشر تطبيق دردشة نماذج Microsoft Foundry (30 دقيقة)
**الهدف**: نشر واختبار تطبيق دردشة ذكاء اصطناعي جاهز للإنتاج

```bash
# تهيئة النموذج
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# تعيين متغيرات البيئة
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# النشر
azd up

# اختبار التطبيق
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# مراقبة عمليات الذكاء الاصطناعي
azd monitor

# التنظيف
azd down --force --purge
```

**معايير النجاح:**
- [ ] إتمام النشر دون أخطاء حصة
- [ ] الوصول إلى واجهة الدردشة في المتصفح
- [ ] القدرة على طرح الأسئلة والحصول على ردود مدعومة بالذكاء الاصطناعي
- [ ] عرض بيانات التتبع في Application Insights
- [ ] تنظيف الموارد بنجاح

**التكلفة المقدرة**: 5-10 دولارات لاختبار 30 دقيقة

### التمرين 2: تكوين نشر نماذج متعددة (45 دقيقة)
**الهدف**: نشر عدة نماذج ذكاء اصطناعي بتكوينات مختلفة

```bash
# إنشاء تكوين Bicep مخصص
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

# النشر والتحقق
azd provision
azd show
```

**معايير النجاح:**
- [ ] نشر نماذج متعددة بنجاح
- [ ] تطبيق إعدادات سعة مختلفة
- [ ] الوصول إلى النماذج عبر API
- [ ] القدرة على استدعاء كلا النموذجين من التطبيق

### التمرين 3: تنفيذ مراقبة التكاليف (20 دقيقة)
**الهدف**: إعداد تنبيهات الميزانية وتتبع التكاليف

```bash
# أضف تنبيه الميزانية إلى Bicep
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

# نشر تنبيه الميزانية
azd provision

# تحقق من التكاليف الحالية
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**معايير النجاح:**
- [ ] إنشاء تنبيه ميزانية في Azure
- [ ] تكوين إشعارات البريد الإلكتروني
- [ ] إمكانية عرض بيانات التكاليف في بوابة Azure
- [ ] ضبط عتبات الميزانية بشكل مناسب

## 💡 الأسئلة الشائعة

<details>
<summary><strong>كيف أُقلل تكاليف نماذج Microsoft Foundry أثناء التطوير؟</strong></summary>

1. **استخدم الطبقة المجانية**: توفر نماذج Microsoft Foundry 50,000 رمز مميز/شهر مجانًا
2. **قلل السعة**: اضبط السعة على 10 TPM بدلاً من 30+ للتطوير
3. **استخدم azd down**: تحرير الموارد عندما لا تكون في وضع التطوير النشط
4. **خزن الردود مؤقتًا**: نفّذ تخزين مؤقت Redis للاستعلامات المتكررة
5. **استخدم هندسة الإرشادات**: قلل استهلاك الرموز المميزة عبر إرشادات فعالة


```bash
# تكوين التطوير
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ما الفرق بين نماذج Microsoft Foundry و OpenAI API؟</strong></summary>

**نماذج Microsoft Foundry**:
- أمان المؤسسة والامتثال
- تكامل الشبكة الخاصة
- ضمانات اتفاقية مستوى الخدمة (SLA)
- مصادقة الهوية المدارة
- حصص أعلى متاحة

**OpenAI API**:
- وصول أسرع إلى النماذج الجديدة
- إعداد أبسط
- حاجز دخول أقل
- الإنترنت العام فقط

للتطبيقات الإنتاجية، **يوصى باستخدام نماذج Microsoft Foundry**.
</details>

<details>
<summary><strong>كيف أتعامل مع أخطاء تجاوز حصة نماذج Microsoft Foundry؟</strong></summary>

```bash
# تحقق من الحصة الحالية
az cognitiveservices usage list --location eastus2

# جرّب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up

# قلل السعة مؤقتًا
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# اطلب زيادة الحصة
# اذهب إلى بوابة أزور > الحصص > اطلب زيادة
```
</details>

<details>
<summary><strong>هل يمكنني استخدام بياناتي الخاصة مع نماذج Microsoft Foundry؟</strong></summary>

نعم! استخدم **Azure AI Search** لـ RAG (التوليد المدعم بالاسترجاع):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

اطلع على نموذج [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>كيف أحمي نقاط نهاية نموذج الذكاء الاصطناعي؟</strong></summary>

**أفضل الممارسات**:
1. استخدام الهوية المدارة (بدون مفاتيح API)
2. تمكين النقاط النهائية الخاصة
3. تكوين مجموعات أمان الشبكة
4. تطبيق تحديد المعدل
5. استخدام Azure Key Vault لإدارة الأسرار

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

## المجتمع والدعم

- **ديسكورد Microsoft Foundry**: [قناة #Azure](https://discord.gg/microsoft-azure)
- **مستودع GitHub الخاص بـ AZD**: [المشكلات والمناقشات](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [التوثيق الرسمي](https://learn.microsoft.com/azure/ai-studio/)
- **مهارات الوكيل**: [مهارة Microsoft Foundry على skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ثبت مهارات وكلاء Azure + Foundry في محررك باستخدام `npx skills add microsoft/github-copilot-for-azure`

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المعتمد على الذكاء الاصطناعي أولاً
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**هل تحتاج المساعدة؟** انضم إلى مناقشات المجتمع أو افتح تذكرة في المستودع. مجتمع Azure AI + AZD هنا لمساعدتك على النجاح!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->