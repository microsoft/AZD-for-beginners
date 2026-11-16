# تكامل Microsoft Foundry مع AZD

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المعتمد على الذكاء الاصطناعي أولاً
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [وكلاء الذكاء الاصطناعي](agents.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)

## نظرة عامة

يوضح هذا الدليل كيفية دمج خدمات Microsoft Foundry مع Azure Developer CLI (AZD) لنشر تطبيقات الذكاء الاصطناعي بسلاسة. يوفر Microsoft Foundry منصة شاملة لبناء ونشر وإدارة تطبيقات الذكاء الاصطناعي، بينما يبسط AZD عملية البنية التحتية والنشر.

## ما هو Microsoft Foundry؟

Microsoft Foundry هو منصة موحدة من Microsoft لتطوير الذكاء الاصطناعي تتضمن:

- **كتالوج النماذج**: الوصول إلى أحدث نماذج الذكاء الاصطناعي
- **تدفق المطالبات**: مُصمم بصري لتدفقات عمل الذكاء الاصطناعي
- **بوابة Microsoft Foundry**: بيئة تطوير متكاملة لتطبيقات الذكاء الاصطناعي
- **خيارات النشر**: خيارات استضافة وتوسيع متعددة
- **السلامة والأمان**: ميزات الذكاء الاصطناعي المسؤولة المدمجة

## AZD + Microsoft Foundry: الأفضل معًا

| الميزة | Microsoft Foundry | فائدة تكامل AZD |
|---------|-----------------|------------------------|
| **نشر النموذج** | نشر يدوي عبر البوابة | نشرات آلية وقابلة للتكرار |
| **البنية التحتية** | إمداد بنقرات | البنية التحتية ككود (Bicep) |
| **إدارة البيئة** | تركيز على بيئة واحدة | بيئات متعددة (تطوير/اختبار/إنتاج) |
| **تكامل CI/CD** | محدود | دعم أصلي لـ GitHub Actions |
| **إدارة التكلفة** | مراقبة أساسية | تحسين تكلفة خاص بالبيئة |

## المتطلبات المسبقة

- اشتراك Azure مع الأذونات المناسبة
- تثبيت Azure Developer CLI
- الوصول إلى خدمات نماذج Microsoft Foundry
- معرفة أساسية بـ Microsoft Foundry

> **مراجعة الإصدار (2026-11-04):** تم التحقق من إرشادات AI CLI مقابل `azd` `1.37.2`، والوكلاء `1.0.0-beta.23`، والتقييمات `1.0.0-beta.2` وثائق/مصادر. استخدم `azd >= 1.37.0` لسير العمل المدمج. اطلع على [تغييرات وإصلاحات الإصدار](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)؛ هذه المراجعة لا تؤكد كل نموذج أو مثال SDK مقابل نشر مباشر.

## أنماط التكامل الأساسية

**نطاق الأمثلة:** يحتوي Bicep أدناه على أجزاء موارد توضيحية، وليس قالب نشر كامل. يجب أن يحدد القالب الحاوي الأسماء، `location`، الموارد المشار إليها، الهويات، المخرجات، واستضافة التطبيق. استخدم عينة مرتبطة كنقطة انطلاق قابلة للتشغيل. تتطلب أمثلة Bash مصادقة Azure CLI منفصلة عن `azd auth login`.

### النمط 1: تكامل نماذج Microsoft Foundry

**الحالة الاستخدامية**: نشر تطبيقات الدردشة باستخدام نماذج Azure OpenAI في Microsoft Foundry

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

يحتاج المتصل إلى هوية مُدارة مُرفقة و`Cognitive Services OpenAI User` على مستوى الحساب؛ تعطيل المفاتيح لا يمنح الوصول. تحقق من توفر المنطقة/النموذج/SKU والحصة قبل النشر.

### النمط 2: تكامل البحث بالذكاء الاصطناعي + RAG

**الحالة الاستخدامية**: نشر تطبيقات التوليد المعزز بالتجميع (RAG)

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

لا يوجد مورد `Microsoft.Search/searchServices/dataConnections` ARM لهذا التكامل. قم بتكوين فهرس البحث، مصدر البيانات، المفهرس/مجموعة المهارات أو الفكتورايزر عبر واجهات برمجة التطبيقات المدعومة لطبقة بيانات البحث. إذا استدعى البحث نموذج تضمين، فعّل هويته المُدارة، ومنح الدور المناسب للنموذج، وقم بتكوين مهارة التضمين/المُوجه. راجع [التوجيه المتكامل](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### النمط 3: تكامل ذكاء المستندات

**الحالة الاستخدامية**: سير عمل معالجة وتحليل المستندات

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

باستثناء إعدادات AZD الموثقة مثل `AZURE_LOCATION`، هذه هي **أسماء مدخلات قالب مخصصة**. ليس لها تأثير إلا إذا استهلكها القالب/التطبيق عبر تعيينات المعلمات وبيئة المضيف. لـ `azure-search-openai-demo`، استخدم أسمائها الفعلية مثل `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` و`AZURE_SEARCH_SERVICE_SKU` بدلاً من ذلك. سعة النموذج ليست SKU حساب.

**تكوين الإنتاج:**
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

**تكوين التطوير:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### التكوين الآمن مع Key Vault

يُفضل Entra ID مع تعطيل مصادقة المفاتيح المحلية. ما يلي هو فقط **بديل قديم للمصادقة بالمفاتيح** للتطبيقات التي تتطلب مفاتيح: يتطلب حسابًا ممكّنًا للمصادقة بالمفتاح، هوية التطبيق مُرفقة بمضيفه، و وصول/شبكة Key Vault عاملة. لا تدمج استرجاع المفتاح مع `disableLocalAuth: true` وتتوقع عمل الاتصالات المعتمدة على المفاتيح.

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

## سير عمل النشر

### امتدادات AZD لـ Foundry

يوفر AZD امتدادات تضيف قدرات مخصصة للذكاء الاصطناعي للعمل مع خدمات Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

لا تزال امتدادات الذكاء الاصطناعي تتطور بسرعة في المعاينة. إذا تصرف أمر بشكل مختلف عما هو مبين هنا، قم بترقية الامتداد ذي الصلة قبل استكشاف مشكلات المشروع نفسه.

### النشر المعتمد على الوكيل أولاً مع `azd ai`

استخدم `azd ai agent init` تفاعليًا، أو اعتمد قالب مشروع وكيل `azure.yaml` الحالي المتصل بـ Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` تحل محل التهجئة المهجورة `--manifest`/`-m`؛ لا يزال يتعين ترحيل الصيغة القديمة وتكوين الوكيل المتداخل. قيم الوكلاء باستخدام `azd ai eval` من `azure.ai.evaluations`، وليس سير العمل القديم المحذوف. اطلع على [ترحيل التقييم](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) للإعداد والتنفيذ والنتائج.

راجع [أوامر AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) للمرجع الكامل للأوامر والخيارات.

### نشر بأمر واحد

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### نشرات خاصة بالبيئة

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

## الرصد والمراقبة

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
```

هذا ينشئ مورد Insights، وليس أداة تتبع بيانات. بمجرد أن يرسل تطبيقك نطاقات مكالمات النموذج الصادرة، شغّل هذا الاستعلام التوضيحي في سجلات Application Insights (عدل الفلتر لأسماء النطاقات الفعلية الخاصة بك):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### مراقبة التكلفة

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

استخدم مستلمًا حقيقيًا وتحقق من أذونات نطاق الفوترة. الميزانية ترسل تنبيهات؛ ليست سقفًا للإنفاق.

## 🔐 ممارسات الأمان المثلى

### تكوين الهوية المُدارة

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

يتطلب جزء نقطة النهاية هذه أيضًا منطقة/مجموعة DNS خاصة، وصلات VNet، اتصال تطبيق بـ VNet، وسياسة وصول علني صريحة. إنشاء نقطة نهاية خاصة فقط لا يعطل الوصول العام.

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

Azure Cache for Redis Basic/Standard/Premium في [طريق التقاعد](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq)؛ استخدم Azure Managed Redis للنشرات الجديدة واتباع إرشادات القالب/المصادقة الحالية. نطاق استجابات الذكاء الاصطناعي المؤقتة حسب التفويض، النموذج/التعليمات، وإصدار البيانات، مع انتهاء صلاحية؛ لا تشارك الاستجابات الخاصة باستخدام نص الاستعلام فقط.

### تكوين التوسع التلقائي

**مورد جزئي:** دمج هذه الإعدادات الخاصة بالتوسع/الوصول في تطبيق حاوية كامل ببيئة مُدارة، صورة الحاوية، وحدود المورد. المزيد من النسخ لا يزيد من حصة النموذج.

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
- فشل النشر بأخطاء الحصة
- أخطاء 429 في سجلات التطبيق

**الحلول:**
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

المتغير السعة أعلاه ينطبق فقط على قالب مخصص موصول لاستهلاكه. للعينة RAG، استخدم `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. لا تغير `AZURE_LOCATION` لنقل الموارد الحالية؛ أنشئ بيئة منفصلة لمنطقة جديدة وخطط للهجرة/التنظيف.

### المشكلة 2: فشل المصادقة

**الأعراض:**
- أخطاء 401/403 عند الاتصال بخدمات الذكاء الاصطناعي
- رسائل "الوصول مرفوض"

**الحلول:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### المشكلة 3: مشكلات نشر النموذج

**الأعراض:**
- عدم توفر النماذج في النشر
- فشل إصدارات نموذج محددة

**الحلول:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## قوالب أمثلة

هذه بدائل، وليست أوامر متسلسلة. ابدأ كل منها في دليل فارغ منفصل. الوجهة `.` الصريحة تحتفظ بالتهيئة في دليلك الحالي؛ وإلا يمكن لـ AZD الحالي إنشاء دليل فرعي باسم القالب دون تغيير دليل العمل الخاص بالشل.

### تطبيق دردشة RAG (بايثون)

**المستودع**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**الوصف**: تطبيق مرجعي دردشة RAG للأسئلة على مستنداتك، مع استرجاع Azure AI Search. راجع النماذج المدعومة، الميزات الاختيارية، إرشادات التكلفة، وتعزيز الإنتاج للعينة الحالية قبل الاستخدام؛ نشر عينة لا يجعل التطبيق جاهزًا للإنتاج.

**البدء السريع**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### تطبيق دردشة RAG (.NET)

**المستودع**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**الوصف**: ما يعادل C#/NET لنموذج دردشة RAG البايثون. مبني بـ ASP.NET Core Minimal API وBlazor WebAssembly للواجهة الأمامية. يتضمن دردشة صوتية، دعم GPT-4o-mini للرؤية، وعميل سطح مكتب/جوال هجين .NET MAUI Blazor مرافق.

**البدء السريع**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### تطبيق دردشة RAG (جافا)

**المستودع**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**الخدمات**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**الوصف**: نسخة جافا من نموذج دردشة RAG باستخدام Langchain4J لتنسيق الذكاء الاصطناعي. يدعم بنية ميكروسيرفيس الحدثية، استراتيجيات بحث متعددة (نص، متجه، هجينة)، رفع المستندات مع Azure Document Intelligence، والنشر على Azure Container Apps أو Azure Kubernetes Service.

**البدء السريع**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### مساعد تجزئة مؤسسية مع Microsoft Foundry

**المستودع**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**الخدمات**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**الوصف**: مساعد تجزئة RAG شامل باستخدام Microsoft Foundry وPrompty. دردشة Contoso Outdoor retailer تستند استجاباته إلى كتالوج المنتج وبيانات طلبات العملاء. توضح سير عمل GenAIOps الكامل—النموذج الأولي بـ Prompty، التقييم بمساعدات الذكاء الاصطناعي، والنشر عبر AZD إلى Container Apps.

**البدء السريع**:
```bash
azd init --template contoso-chat .
azd up
```

### تطبيق كتابة إبداعية متعدد الوكلاء

**المستودع**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**الخدمات**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**الوصف**: نموذج متعدد الوكلاء يوضح تنسيق وكلاء الذكاء الاصطناعي مع Prompty. يستخدم وكيل بحث (Bing Grounding في Azure AI Agent Service)، وكيل منتج (Azure AI Search)، وكيل كاتب، ووكيل محرر لإنتاج مقالات بحثية بالتعاون. يشمل CI/CD مع تقييم في GitHub Actions.

**البدء السريع**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### دردشة RAG بدون خادم (JavaScript/TypeScript)

**المستودع**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**الخدمات**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB لـ NoSQL + LangChain.js

**الوصف**: دردشة RAG بالكامل بدون خادم باستخدام LangChain.js مع Azure Functions للواجهة البرمجية وAzure Static Web Apps للاستضافة. يستخدم Azure Cosmos DB كمخزن متجه وقاعدة بيانات تاريخ الدردشة. يدعم التطوير المحلي مع Ollama للاختبار بدون تكلفة.

**البدء السريع**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### مسرع حل دردشة مع بياناتك

**المستودع**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**الخدمات**: Microsoft Foundry + Azure Container Apps (ويب/واجهة برمجة التطبيقات/الاستيعاب) + Azure AI Search مع Cosmos DB، أو PostgreSQL مع pgvector

**الوصف**: مسرع دردشة يستند إلى مستندات مع اقتباسات. تستضيف العينة الحالية واجهة React أمامية، وFastAPI خلفية، وعامل استيعاب Functions على Container Apps؛ خيارات منسق هي Agent Framework و LangGraph. تم اختيار خيارات قاعدة البيانات/الاسترجاع عند النشر. إنه نقطة بداية، ليس نظام إنتاج متكامل؛ لا تفترض أن إصدارات App Service القديمة، Semantic Kernel، أو Prompt Flow تصف الإعداد الافتراضي الحالي.

**البدء السريع**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### وكلاء السفر بالذكاء الاصطناعي — تنسيق MCP متعدد الوكلاء

**المستودع**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**الخدمات**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + خوادم MCP (.NET، Python، Java، TypeScript)

**الوصف**: تطبيق مرجعي لتنسيق الذكاء الاصطناعي متعدد الوكلاء باستخدام ثلاث أُطُر عمل (LangChain.js، LlamaIndex.TS، وإطار عمل Microsoft Agent). يضم خوادم MCP (بروتوكول سياق النموذج) بأربع لغات موزعة كتطبيقات Azure Container بدون خادم مع مراقبة OpenTelemetry.

**البدء السريع**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **تصفح المزيد من النماذج**: زوروا [معرض نماذج AZD AI الرائع](https://azure.github.io/awesome-azd/?tags=ai) للاطلاع على النماذج المتوفرة حالياً عبر اللغات والسيناريوهات. كل مثال مرتبط هو مستودع خارجي وليس نموذجاً محلياً مقدمًا من هذه الدورة؛ تفحص متطلباته الحالية وإرشادات الإنتاج قبل النشر.

## الخطوات التالية

1. **جرّب الأمثلة**: ابدأ بنموذج مُعد مسبقاً يناسب حالتك
2. **خصص حسب احتياجاتك**: عدل البنية التحتية وكود التطبيق
3. **أضف المراقبة**: نفذ مراقبة شاملة
4. **حسّن التكاليف**: اضبط التكوينات بما يتناسب مع ميزانيتك
5. **أمّن النشر**: طبّق أنماط أمان المؤسسة
6. **وسع للإنتاج**: أضف ميزات تعدد المناطق والتوفر العالي

## 🎯 التمارين العملية

### التمرين 1: نشر تطبيق دردشة نماذج Microsoft Foundry (30 دقيقة)
**الهدف**: نشر واختبار تطبيق دردشة ذكي مرجعي

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

# Clean up
azd down --force --purge
```

**معايير النجاح:**
- [ ] يكتمل النشر بدون أخطاء حصة الاستخدام
- [ ] يمكن الوصول إلى واجهة الدردشة في المتصفح
- [ ] يمكن طرح الأسئلة والحصول على ردود مدعومة بالذكاء الاصطناعي
- [ ] تظهر بيانات قياس التطبيق في Application Insights
- [ ] تم تنظيف الموارد بنجاح

**التكلفة:** راجع دليل تكلفة العينة الحالي وحدد وحدات SKU قبل النشر. الفوترة مستمرة حتى حذف الموارد؛ لا تنطبق فترة 30 دقيقة الثابتة على كل التكوينات.

### التمرين 2: تكوين نشر متعدد النماذج (45 دقيقة)
**الهدف**: نشر نماذج ذكاء اصطناعي متعددة بتكوينات مختلفة

**نقطة الانطلاق:** حساب Azure OpenAI موجود ووحدة مجموعة الموارد AZD قادرة على استدعاء هذا الملف. أنشئ `infra/ai-models.bicep` بالمحتوى التالي باستخدام محررك. لا يُنشر هذا تلقائياً لمجرد كونه تحت `infra/`.

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

من الوحدة النطاقية لمجموعة الموارد التي تملك الحساب، أضف استدعاء وحدة (عدّل اسم الرمز حسب حسابك الفعلي):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

لا تُعلِن عن نفس عمليات النشر في كلا الوحدتين. إذا كانت نقطة دخول AZD على مستوى الاشتراك، نفذ ذلك من الوحدة التابعة لمجموعة الموارد واضبط المسار النسبي. ابنِ تلك الوحدة الحاوية باستخدام `az bicep build --file <path-to-containing-module>`، ثم:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**معايير النجاح:**
- [ ] تم نشر نماذج متعددة بنجاح
- [ ] تم تطبيق إعدادات سعة مختلفة
- [ ] النماذج متاحة عبر API
- [ ] يمكن الاتصال بالنموذجين من التطبيق

### التمرين 3: تنفيذ مراقبة التكاليف (20 دقيقة)
**الهدف**: إعداد تنبيهات الميزانية وتتبع التكاليف

**نقطة الانطلاق:** نمط الميزانية أعلاه ووحدة بنية تحتية تابعة لمجموعة الموارد. أضف هذا المورد باستخدام محررك؛ مرّر `budgetStartDate` من تخطيط المعلمات (لا تكرر المعلمة إذا كانت معلنة مسبقاً). استبدل المستلم وتأكد من وجود صلاحية كتابة الميزانية.

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

المتوقع: تحتوي الاستجابة على `amount: 200`، كلا العتبتين، ومستلمك. تحقق من إدارة التكلفة في البوابة للتحقق من الرسوم الفعلية؛ بيانات التكلفة متأخرة والتنبيه قد لا يعمل خلال تمرين قصير.

**معايير النجاح:**
- [ ] تم إنشاء تنبيه ميزانية في Azure
- [ ] تم تكوين إشعارات البريد الإلكتروني
- [ ] يمكن عرض بيانات التكلفة في بوابة Azure
- [ ] تم تعيين عتبات الميزانية بشكل مناسب

## 💡 الأسئلة المتكررة

<details>
<summary><strong>كيف أخفض تكاليف نماذج Microsoft Foundry أثناء التطوير؟</strong></summary>

1. **تحقق من التسعير**: لا توجد بدل شهري مجاني شامل بـ 50,000 رمز مميز لنماذج Azure OpenAI
2. **اختيار السعة المناسبة**: سعة `10` تمثل عادة 10,000 TPM لهذه النماذج النصية القياسية، وليس 10 TPM. تقليل حد المعدل لا يقلل من أسعار الرموز المميزة
3. **استخدم azd down**: احذف الموارد القابلة للتخلص منها عند عدم التطوير الفعّال (هذا ليس تفريغاً)
4. **تخزين الردود مؤقتًا**: نفّذ ذاكرة تخزين مؤقت Redis للاستعلامات المتكررة
5. **استخدم هندسة الموجهات**: قلل استخدام الرموز المميزة باستخدام الموجهات الفعالة

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>ما الفرق بين نماذج Microsoft Foundry وOpenAI API؟</strong></summary>

**نماذج Microsoft Foundry**:
- أمان والتزام مؤسسي
- تكامل شبكة خاصة
- ضمانات اتفاقية مستوى الخدمة (SLA)
- مصادقة بواسطة الهوية المدارة
- حصص أكبر متاحة

**OpenAI API**: مزود/واجهة برمجة تطبيقات منفصل بعروض نماذج وتسعير ومصادقة وخيارات اتصال مؤسسية خاصة به. قارن العروض الحالية بدلاً من افتراض أنها فقط على الإنترنت العام أو تأتي بالنماذج أولاً دائماً.

اختر بناءً على متطلبات مؤسستك؛ الأمثلة الخاصة بالهوية المدارة Azure والربط الخاص في هذه الدورة تنطبق على خدمات Azure المستضافة، وليس على كل نموذج/مزود في كتالوج Foundry.
</details>

<details>
<summary><strong>كيف أتعامل مع أخطاء تجاوز حصة نماذج Microsoft Foundry؟</strong></summary>

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
<summary><strong>هل يمكنني استخدام بياناتي الخاصة مع نماذج Microsoft Foundry؟</strong></summary>

نعم! استخدم **Azure AI Search** لتوليد التعزيز المسترجع (RAG):

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

شاهد نموذج [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>كيف أحمي نقاط نهاية نماذج الذكاء الاصطناعي؟</strong></summary>

**أفضل الممارسات**:
1. استخدم الهوية المدارة (بدون مفاتيح API)
2. فعّل نقاط النهاية الخاصة
3. اضبط مجموعات أمان الشبكة
4. نفّذ تحديد المعدل
5. استخدم Azure Key Vault لإدارة الأسرار

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
- **GitHub الخاص بـ AZD**: [المسائل والنقاشات](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [التوثيق الرسمي](https://learn.microsoft.com/azure/ai-studio/)
- **مهارات الوكيل**: [مهارة Microsoft Foundry على skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - ثبّت مهارات وكلاء Azure + Foundry في محررك باستخدام `npx skills add microsoft/github-copilot-for-azure`

---

**تنقل الفصل:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير المرتكز على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../chapter-01-foundation/first-project.md)
- **➡️ التالي**: [وكلاء الذكاء الاصطناعي](agents.md)
- **🚀 الفصل التالي**: [الفصل 3: التهيئة](../chapter-03-configuration/configuration.md)

**هل تحتاج إلى مساعدة؟** انضم إلى مناقشات المجتمع أو افتح مشكلة في المستودع. مجتمع Azure AI + AZD هنا لمساعدتك على النجاح!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->