# تكامل Microsoft Foundry مع AZD

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير القائم على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../getting-started/first-project.md)
- **➡️ التالي**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../getting-started/configuration.md)

## نظرة عامة

يوضح هذا الدليل كيفية دمج خدمات Microsoft Foundry مع Azure Developer CLI (AZD) لتبسيط عمليات نشر تطبيقات الذكاء الاصطناعي. يوفر Microsoft Foundry منصة شاملة لبناء ونشر وإدارة تطبيقات الذكاء الاصطناعي، بينما يسهل AZD عملية البنية التحتية والنشر.

## ما هو Microsoft Foundry؟

Microsoft Foundry هو منصة موحدة من مايكروسوفت لتطوير الذكاء الاصطناعي، وتشمل:

- **كتالوج النماذج**: الوصول إلى نماذج الذكاء الاصطناعي المتقدمة
- **تدفق التعليمات**: مصمم مرئي لتدفقات عمل الذكاء الاصطناعي
- **بوابة AI Foundry**: بيئة تطوير متكاملة لتطبيقات الذكاء الاصطناعي
- **خيارات النشر**: خيارات استضافة وتوسيع متعددة
- **السلامة والأمان**: ميزات الذكاء الاصطناعي المسؤول المدمجة

## AZD + Microsoft Foundry: معًا بشكل أفضل

| الميزة | Microsoft Foundry | فائدة التكامل مع AZD |
|---------|-----------------|------------------------|
| **نشر النماذج** | النشر اليدوي عبر البوابة | عمليات نشر مؤتمتة وقابلة للتكرار |
| **البنية التحتية** | التوفير عبر النقرات | البنية التحتية ككود (Bicep) |
| **إدارة البيئات** | التركيز على بيئة واحدة | بيئات متعددة (تطوير/اختبار/إنتاج) |
| **تكامل CI/CD** | محدود | دعم أصلي لـ GitHub Actions |
| **إدارة التكاليف** | مراقبة أساسية | تحسين التكاليف حسب البيئة |

## المتطلبات الأساسية

- اشتراك Azure مع الأذونات المناسبة
- تثبيت Azure Developer CLI
- الوصول إلى خدمات Azure OpenAI
- معرفة أساسية بـ Microsoft Foundry

## أنماط التكامل الأساسية

### النمط 1: تكامل Azure OpenAI

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

### النمط 2: تكامل البحث بالذكاء الاصطناعي + RAG

**حالة الاستخدام**: نشر تطبيقات التوليد المعزز بالاسترجاع (RAG)

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

**حالة الاستخدام**: معالجة وتحليل المستندات

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

# تكوينات النموذج
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# إعدادات الأداء
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**تكوين التطوير:**
```bash
# إعدادات محسّنة التكلفة للتطوير
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

### النشر بأمر واحد

```bash
# قم بنشر كل شيء بأمر واحد
azd up

# أو قم بالنشر بشكل تدريجي
azd provision  # البنية التحتية فقط
azd deploy     # التطبيق فقط
```

### عمليات النشر حسب البيئة

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

## 🔐 أفضل ممارسات الأمان

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

### تكوين التوسيع التلقائي

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
# تحقق من استخدام الحصة الحالية
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
# تحقق من تعيينات الأدوار
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# تحقق من تكوين الهوية المُدارة
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# تحقق من الوصول إلى Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### المشكلة 3: مشكلات نشر النماذج

**الأعراض:**
- النماذج غير متوفرة في النشر
- فشل إصدارات معينة من النماذج

**الحلول:**
```bash
# قائمة النماذج المتاحة حسب المنطقة
az cognitiveservices model list --location eastus

# تحديث إصدار النموذج في قالب bicep
# التحقق من متطلبات سعة النموذج
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

### خط معالجة المستندات

**المستودع**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**الخدمات**: ذكاء المستندات + التخزين + الوظائف

**البدء السريع**:
```bash
azd init --template ai-document-processing
azd up
```

### دردشة مؤسسية مع RAG

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
3. **أضف المراقبة**: نفذ الرصد الشامل
4. **حسن التكاليف**: قم بضبط التكوينات حسب ميزانيتك
5. **أمن النشر الخاص بك**: نفذ أنماط الأمان المؤسسية
6. **التوسع للإنتاج**: أضف ميزات متعددة المناطق وعالية التوافر

## 🎯 تمارين عملية

### التمرين 1: نشر تطبيق دردشة Azure OpenAI (30 دقيقة)
**الهدف**: نشر واختبار تطبيق دردشة جاهز للإنتاج

```bash
# تهيئة القالب
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# ضبط متغيرات البيئة
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# نشر
azd up

# اختبار التطبيق
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# مراقبة عمليات الذكاء الاصطناعي
azd monitor

# تنظيف
azd down --force --purge
```

**معايير النجاح:**
- [ ] يكتمل النشر بدون أخطاء الحصة
- [ ] يمكن الوصول إلى واجهة الدردشة في المتصفح
- [ ] يمكن طرح الأسئلة والحصول على ردود مدعومة بالذكاء الاصطناعي
- [ ] تظهر بيانات التتبع في Application Insights
- [ ] تم تنظيف الموارد بنجاح

**التكلفة المقدرة**: 5-10 دولارات لمدة 30 دقيقة من الاختبار

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

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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

# النشر والتحقق
azd provision
azd show
```

**معايير النجاح:**
- [ ] تم نشر النماذج المتعددة بنجاح
- [ ] تم تطبيق إعدادات السعة المختلفة
- [ ] النماذج متاحة عبر API
- [ ] يمكن استدعاء كلا النموذجين من التطبيق

### التمرين 3: تنفيذ مراقبة التكاليف (20 دقيقة)
**الهدف**: إعداد تنبيهات الميزانية وتتبع التكاليف

```bash
# إضافة تنبيه الميزانية إلى Bicep
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
- [ ] تم إنشاء تنبيه الميزانية في Azure
- [ ] تم تكوين إشعارات البريد الإلكتروني
- [ ] يمكن عرض بيانات التكاليف في بوابة Azure
- [ ] تم تعيين حدود الميزانية بشكل مناسب

## 💡 الأسئلة الشائعة

<details>
<summary><strong>كيف يمكنني تقليل تكاليف Azure OpenAI أثناء التطوير؟</strong></summary>

1. **استخدام الطبقة المجانية**: تقدم Azure OpenAI 50,000 رمز/شهر مجانًا
2. **تقليل السعة**: قم بتعيين السعة إلى 10 TPM بدلاً من 30+ للتطوير
3. **استخدام azd down**: قم بإلغاء تخصيص الموارد عند عدم التطوير النشط
4. **تخزين الردود مؤقتًا**: نفذ Redis cache للاستعلامات المتكررة
5. **استخدام هندسة التعليمات**: قلل استخدام الرموز باستخدام تعليمات فعالة

```bash
# تكوين التطوير
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>ما الفرق بين Azure OpenAI و OpenAI API؟</strong></summary>

**Azure OpenAI**:
- أمان وامتثال مؤسسي
- تكامل الشبكة الخاصة
- ضمانات SLA
- مصادقة الهوية المُدارة
- حصص أعلى متاحة

**OpenAI API**:
- وصول أسرع إلى النماذج الجديدة
- إعداد أبسط
- حاجز دخول أقل
- الإنترنت العام فقط

لتطبيقات الإنتاج، **يوصى باستخدام Azure OpenAI**.
</details>

<details>
<summary><strong>كيف أتعامل مع أخطاء تجاوز حصة Azure OpenAI؟</strong></summary>

```bash
# تحقق من الحصة الحالية
az cognitiveservices usage list --location eastus2

# جرب منطقة مختلفة
azd env set AZURE_LOCATION westus2
azd up

# قلل السعة مؤقتًا
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# طلب زيادة الحصة
# انتقل إلى بوابة Azure > الحصص > طلب زيادة
```
</details>

<details>
<summary><strong>هل يمكنني استخدام بياناتي الخاصة مع Azure OpenAI؟</strong></summary>

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

راجع قالب [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>كيف يمكنني تأمين نقاط نهاية نماذج الذكاء الاصطناعي؟</strong></summary>

**أفضل الممارسات**:
1. استخدم الهوية المُدارة (بدون مفاتيح API)
2. قم بتمكين النقاط النهائية الخاصة
3. قم بتكوين مجموعات أمان الشبكة
4. نفذ تحديد المعدل
5. استخدم Azure Key Vault للأسرار

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

- **Microsoft Foundry Discord**: [قناة #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [المشكلات والمناقشات](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [التوثيق الرسمي](https://learn.microsoft.com/azure/ai-studio/)

---

**تنقل الفصول:**
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)
- **📖 الفصل الحالي**: الفصل 2 - التطوير القائم على الذكاء الاصطناعي
- **⬅️ الفصل السابق**: [الفصل 1: مشروعك الأول](../getting-started/first-project.md)
- **➡️ التالي**: [نشر نموذج الذكاء الاصطناعي](ai-model-deployment.md)
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../getting-started/configuration.md)

**تحتاج إلى مساعدة؟** انضم إلى مناقشات المجتمع أو افتح مشكلة في المستودع. مجتمع Azure AI + AZD هنا لمساعدتك على النجاح!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**إخلاء المسؤولية**:  
تم ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى لتحقيق الدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الموثوق. للحصول على معلومات حاسمة، يُوصى بالترجمة البشرية الاحترافية. نحن غير مسؤولين عن أي سوء فهم أو تفسيرات خاطئة تنشأ عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->