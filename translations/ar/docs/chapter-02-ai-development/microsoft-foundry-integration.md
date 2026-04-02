# Microsoft Foundry Integration with AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: الفصل 2 - تطوير موجه بالذكاء الاصطناعي
- **⬅️ Previous Chapter**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## نظرة عامة

يشرح هذا الدليل كيفية دمج خدمات Microsoft Foundry مع Azure Developer CLI (AZD) لنشر تطبيقات الذكاء الاصطناعي بسلاسة. يوفر Microsoft Foundry منصة شاملة لبناء ونشر وإدارة تطبيقات الذكاء الاصطناعي، بينما يبسط AZD عملية البنية التحتية والنشر.

## ما هو Microsoft Foundry؟

Microsoft Foundry هو منصة مايكروسوفت الموحدة لتطوير الذكاء الاصطناعي والتي تشمل:

- **Model Catalog**: الوصول إلى أحدث نماذج الذكاء الاصطناعي
- **Prompt Flow**: مصمم بصري لتدفقات عمل الذكاء الاصطناعي
- **Microsoft Foundry Portal**: بيئة تطوير متكاملة لتطبيقات الذكاء الاصطناعي
- **Deployment Options**: خيارات استضافة وتحجيم متعددة
- **Safety and Security**: ميزات الذكاء الاصطناعي المسؤولة المدمجة

## AZD + Microsoft Foundry: أفضل معًا

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## المتطلبات الأساسية

- اشتراك Azure مع الأذونات المناسبة
- Azure Developer CLI مثبت
- الوصول إلى خدمات Microsoft Foundry Models
- معرفة أساسية بـ Microsoft Foundry

> **Current AZD baseline:** تمت مراجعة هذه الأمثلة مقابل `azd` `1.23.12`. بالنسبة لتدفق عمل وكيل الذكاء الاصطناعي، استخدم إصدار الإضافة التجريبي الحالي وتحقق من الإصدار المثبت قبل أن تبدأ.

## أنماط التكامل الأساسية

### النمط 1: تكامل نماذج Microsoft Foundry

**حالة الاستخدام**: نشر تطبيقات دردشة باستخدام نماذج Microsoft Foundry

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

### النمط 2: تكامل البحث الذكي + RAG

**حالة الاستخدام**: نشر تطبيقات الاستدلال المعزز بالاسترجاع (RAG)

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

### النمط 3: تكامل ذكاء المستندات

**حالة الاستخدام**: تدفقات عمل معالجة وتحليل المستندات

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

# تكوينات النماذج
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

### تكوين آمن باستخدام Key Vault

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

## تدفقات النشر

### امتدادات AZD لـ Microsoft Foundry

توفر AZD امتدادات تضيف قدرات خاصة بالذكاء الاصطناعي للعمل مع خدمات Microsoft Foundry:

```bash
# تثبيت امتداد وكلاء Foundry
azd extension install azure.ai.agents

# تثبيت امتداد الضبط الدقيق
azd extension install azure.ai.finetune

# تثبيت امتداد النماذج المخصصة
azd extension install azure.ai.models

# عرض الامتدادات المثبتة
azd extension list --installed

# عرض إصدار امتداد الوكيل المثبت حاليًا
azd extension show azure.ai.agents
```

لا تزال امتدادات الذكاء الاصطناعي تتطور بسرعة في النسخة التجريبية. إذا تصرّف أمر ما بشكل مختلف عما هو موضح هنا، قم بترقية الإضافة ذات الصلة قبل استكشاف المشروع نفسه.

### النشر الموجه بالوكلاء باستخدام `azd ai`

إذا كان لديك مُعرّف وكيل (agent manifest)، استخدم `azd ai agent init` لإنشاء مشروع منظم لخدمة وكلاء Foundry:

```bash
# التهيئة من ملف تعريف الوكيل
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# نشر إلى أزور
azd up
```

أصدرت الإصدارات التجريبية الأخيرة من `azure.ai.agents` أيضًا دعم التهيئة المستندة إلى القوالب لـ `azd ai agent init`. إذا كنت تتبع أمثلة وكلاء أحدث، فتحقق من مساعدة الإضافة للأعلام المتاحة في الإصدار المثبت لديك.

انظر [AZD AI CLI Commands](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) للمرجع الكامل للأوامر والأعلام.

### النشر بأمر واحد

```bash
# انشر كل شيء بأمر واحد
azd up

# أو انشر تدريجيًا
azd provision  # البنية التحتية فقط
azd deploy     # التطبيق فقط

# لنشر تطبيقات الذكاء الاصطناعي طويلة الأمد باستخدام azd 1.23.11+
azd deploy --timeout 1800
```

### نشر مخصص لكل بيئة

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

## المراقبة وقابلية الملاحظة

### التكامل مع Application Insights

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

### تكوين التحجيم التلقائي

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
- يفشل النشر بأخطاء متعلقة بالحصة
- أخطاء 429 في سجلات التطبيق

**الحلول:**
```bash
# تحقق من استخدام الحصة الحالية
az cognitiveservices usage list --location eastus

# جرّب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up

# تقليل السعة مؤقتًا
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### المشكلة 2: فشل المصادقة

**الأعراض:**
- أخطاء 401/403 عند استدعاء خدمات الذكاء الاصطناعي
- رسائل "Access denied"

**الحلول:**
```bash
# تحقق من تعيينات الأدوار
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# تحقق من تكوين الهوية المدارة
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# تحقق من صلاحية الوصول إلى مخزن المفاتيح
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### المشكلة 3: مشاكل نشر النماذج

**الأعراض:**
- النماذج غير متاحة في النشر
- فشل إصدارات نموذج محددة

**الحلول:**
```bash
# سرد النماذج المتاحة حسب المنطقة
az cognitiveservices model list --location eastus

# تحديث إصدار النموذج في قالب bicep
# التحقق من متطلبات سعة النموذج
```

## أمثلة على القوالب

### تطبيق دردشة RAG (Python)

**المستودع**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**الوصف**: العينة الأكثر شيوعًا في Azure AI — تطبيق دردشة RAG جاهز للإنتاج يتيح لك طرح أسئلة حول مستنداتك الخاصة. يستخدم GPT-4.1-mini للدردشة، وtext-embedding-3-large للتضمينات، وAzure AI Search للاسترجاع. يدعم المستندات متعددة الوسائط، وإدخال/إخراج صوتي، ومصادقة Microsoft Entra، وتتبع Application Insights.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### تطبيق دردشة RAG (.NET)

**المستودع**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**الوصف**: المعادل لـ Python لتطبيق دردشة RAG. مبني باستخدام ASP.NET Core Minimal API وواجهة أمامية Blazor WebAssembly. يتضمن دردشة صوتية، ودعم GPT-4o-mini للرؤية، وعميل سطح مكتب/جوال مصاحب باستخدام .NET MAUI Blazor Hybrid.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### تطبيق دردشة RAG (Java)

**المستودع**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**الوصف**: نسخة جافا لعينة دردشة RAG تستخدم Langchain4J لتنفيذ أوركسترة الذكاء الاصطناعي. تدعم بنية خدمات مصغرة قائمة على الأحداث، واستراتيجيات بحث متعددة (نص، متجه، هجينة)، ورفع المستندات باستخدام Azure Document Intelligence، والنشر إما على Azure Container Apps أو Azure Kubernetes Service.

**بدء سريع**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### مساعد مبيعات المؤسسات باستخدام Azure AI Foundry

**المستودع**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**الخدمات**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**الوصف**: مساعد مبيعات متكامل من نوع RAG باستخدام Azure AI Foundry وPrompty. روبوت دردشة لبائع تجزئة Contoso Outdoor يؤسس إجاباته على كتالوج المنتجات وبيانات طلبات العملاء. يوضح مسار GenAIOps الكامل — النموذج الأولي باستخدام Prompty، التقييم بمساعدات الذكاء الاصطناعي، والنشر عبر AZD إلى Container Apps.

**بدء سريع**:
```bash
azd init --template contoso-chat
azd up
```

### تطبيق كتابة إبداعية متعدد الوكلاء

**المستودع**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**الخدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**الوصف**: عينة متعددة الوكلاء توضح أوركسترة وكلاء الذكاء الاصطناعي باستخدام Prompty. تستخدم وكيل بحث (Bing Grounding في Azure AI Agent Service)، وكيل منتج (Azure AI Search)، وكيل كاتب، ووكيل محرر للتعاون في إنتاج مقالات مدروسة جيدًا. تتضمن تكامل CI/CD مع التقييم في GitHub Actions.

**بدء سريع**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG بدون خوادم دردشة (JavaScript/TypeScript)

**المستودع**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**الخدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**الوصف**: روبوت دردشة RAG خالٍ تمامًا من الخوادم باستخدام LangChain.js مع Azure Functions للـ API وAzure Static Web Apps للاستضافة. يستخدم Azure Cosmos DB كمخزن متجه وسجل دردشة. يدعم التطوير المحلي باستخدام Ollama للاختبار بدون تكلفة.

**بدء سريع**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### الدردشة مع بياناتك - مسرّع الحلول

**المستودع**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**الوصف**: مسرّع حل RAG بمستوى الشركات مع بوابة إدارة لتحميل/إدارة المستندات، وخيارات منسق متعددة (Semantic Kernel، LangChain، Prompt Flow)، وتحويل الكلام إلى نص، وتكامل Microsoft Teams، وخيار PostgreSQL أو Cosmos DB كقاعدة خلفية. مصمم كنقطة بداية قابلة للتخصيص لسيناريوهات RAG الإنتاجية.

**بدء سريع**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### وكلاء السفر بالذكاء الاصطناعي — أوركسترة MCP متعددة الوكلاء

**المستودع**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**الخدمات**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**الوصف**: تطبيق مرجعي لأوركسترة الذكاء الاصطناعي متعددة الوكلاء باستخدام ثلاث أطر (LangChain.js، LlamaIndex.TS، وMicrosoft Agent Framework). يتميز بخوادم MCP (Model Context Protocol) بأربع لغات تُنشر كـ Azure Container Apps بدون خادم مع مراقبة OpenTelemetry.

**بدء سريع**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**المستودع**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**الخدمات**: Azure AI Services + Azure OpenAI

**الوصف**: قالب Bicep بسيط ينشر خدمات Azure AI مع نماذج تعلم آلي مُكوّنة. نقطة بداية خفيفة عندما تحتاج فقط إلى توفير بنية Azure AI دون حزمة تطبيق كاملة.

**بدء سريع**:
```bash
azd init --template azd-ai-starter
azd up
```

> **تصفح مزيد من القوالب**: قم بزيارة [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) لمشاهدة أكثر من 80 قالب AZD مخصّص للذكاء الاصطناعي عبر لغات وسيناريوهات متعددة.

## الخطوات التالية

1. **جرّب الأمثلة**: ابدأ بقالب جاهز يتطابق مع حالة الاستخدام الخاصة بك
2. **خصّص لاحتياجاتك**: عدّل البنية التحتية وكود التطبيق
3. **أضف المراقبة**: نفّذ قابلية ملاحظة شاملة
4. **حسّن التكاليف**: ضبّط التكوينات بما يتناسب مع ميزانيتك
5. **أمّن النشر**: نفّذ أنماط أمان مؤسسية
6. **وسع للإنتاج**: أضف ميزات التوزيع عبر مناطق وتوفّر عالي

## 🎯 تمارين عملية

### التمرين 1: نشر تطبيق دردشة بنماذج Microsoft Foundry (30 دقيقة)
**الهدف**: نشر واختبار تطبيق دردشة ذكاء اصطناعي جاهز للإنتاج

```bash
# تهيئة القالب
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
- [ ] يكتمل النشر دون أخطاء متعلقة بالحصة
- [ ] يمكن الوصول إلى واجهة الدردشة في المتصفح
- [ ] يمكن طرح الأسئلة والحصول على إجابات مدعومة بالذكاء الاصطناعي
- [ ] تُظهر Application Insights بيانات القياس
- [ ] تم تنظيف الموارد بنجاح

**التكلفة التقديرية**: $5-10 لمدة 30 دقيقة من الاختبار

### التمرين 2: تكوين نشر متعدد النماذج (45 دقيقة)
**الهدف**: نشر نماذج ذكاء اصطناعي متعددة بتكوينات مختلفة

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

# نشر والتحقق
azd provision
azd show
```

**معايير النجاح:**
- [ ] تم نشر نماذج متعددة بنجاح
- [ ] تم تطبيق إعدادات سعة مختلفة
- [ ] النماذج قابلة للوصول عبر API
- [ ] يمكن استدعاء كلا النموذجين من التطبيق

### التمرين 3: تنفيذ مراقبة التكاليف (20 دقيقة)
**الهدف**: إعداد تنبيهات الميزانية وتتبع التكلفة

```bash
# أضف تنبيهًا للميزانية إلى Bicep
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

# انشر تنبيه الميزانية
azd provision

# تحقق من التكاليف الحالية
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**معايير النجاح:**
- [ ] تم إنشاء تنبيه ميزانية في Azure
- [ ] تم تكوين إشعارات البريد الإلكتروني
- [ ] يمكن عرض بيانات التكلفة في بوابة Azure
- [ ] تم تعيين حدود الميزانية بشكل مناسب

## 💡 الأسئلة الشائعة

<details>
<summary><strong>كيف أُقلل تكاليف نماذج Microsoft Foundry أثناء التطوير؟</strong></summary>

1. **استخدم الطبقة المجانية**: توفر Microsoft Foundry Models 50,000 توكن شهريًا مجانًا
2. **خفض السعة**: اضبط السعة إلى 10 TPM بدلاً من 30+ لبيئة التطوير
3. **استخدم azd down**: قم بإلغاء تخصيص الموارد عندما لا تكون في مرحلة تطوير نشطة
4. **تخزين الردود مؤقتًا**: نفّذ ذاكرة مؤقتة Redis للاستعلامات المتكررة
5. **استخدم هندسة المطالبات (Prompt Engineering)**: قلل استخدام التوكنات بمطالبات فعّالة

</details>
```bash
# تكوين التطوير
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ما الفرق بين نماذج Microsoft Foundry وواجهة برمجة تطبيقات OpenAI؟</strong></summary>

**Microsoft Foundry Models**:
- أمان المؤسسات والامتثال
- تكامل مع الشبكات الخاصة
- ضمانات اتفاقية مستوى الخدمة (SLA)
- المصادقة باستخدام الهوية المدارة
- حصص أعلى متاحة

**OpenAI API**:
- وصول أسرع إلى النماذج الجديدة
- إعداد أبسط
- حاجز دخول أقل
- الإنترنت العام فقط

بالنسبة للتطبيقات الإنتاجية، **Microsoft Foundry Models is recommended**.
</details>

<details>
<summary><strong>كيف أتعامل مع أخطاء تجاوز الحصص في Microsoft Foundry Models؟</strong></summary>

```bash
# تحقق من الحصة الحالية
az cognitiveservices usage list --location eastus2

# جرّب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up

# تقليل السعة مؤقتًا
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# طلب زيادة الحصة
# انتقل إلى بوابة Azure > الحصص > طلب زيادة
```
</details>

<details>
<summary><strong>هل يمكنني استخدام بياناتي الخاصة مع Microsoft Foundry Models؟</strong></summary>

نعم! استخدم **Azure AI Search** لـ RAG (التوليد المعزز بالاسترجاع):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

انظر القالب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>كيف أحمي نقاط نهاية نماذج الذكاء الاصطناعي؟</strong></summary>

**أفضل الممارسات**:
1. استخدم Managed Identity (بدون مفاتيح API)
2. قم بتمكين نقاط النهاية الخاصة
3. قم بتكوين مجموعات أمان الشبكة
4. نفّذ تحديد المعدل
5. استخدم Azure Key Vault لتخزين الأسرار

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [المشكلات والنقاشات](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [التوثيق الرسمي](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [مهارة Microsoft Foundry على skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - قم بتثبيت مهارات الوكيل لـ Azure + Foundry في محرر الأكواد الخاص بك باستخدام `npx skills add microsoft/github-copilot-for-azure`

---

**التنقل بين الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD For Beginners](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - تطوير قائم على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [نشر نماذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

**هل تحتاج مساعدة؟** انضم إلى مناقشات المجتمع أو افتح مشكلة في المستودع. مجتمع Azure AI + AZD هنا لمساعدتك على النجاح!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة الآلية [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار الوثيقة الأصلية بلغتها الأصلية المصدر الموثوق. بالنسبة للمعلومات الحرجة، يُنصح بالاستعانة بترجمة بشرية مهنية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة ناتجة عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->