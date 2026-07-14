# نشر نماذج الذكاء الاصطناعي باستخدام Azure Developer CLI  

**تنقل الفصل:**  
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)  
- **📖 الفصل الحالي**: الفصل 2 - تطوير يركز على الذكاء الاصطناعي  
- **⬅️ السابق**: [تكامل Microsoft Foundry](microsoft-foundry-integration.md)  
- **➡️ التالي**: [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md)  
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)  

يقدم هذا الدليل تعليمات شاملة لنشر نماذج الذكاء الاصطناعي باستخدام قوالب AZD، يغطي كل شيء من اختيار النموذج إلى أنماط النشر في الإنتاج.  

> **ملاحظة التحقق (2026-07-13):** تم التحقق من سير عمل AZD في هذا الدليل باستخدام `azd` `1.27.1`. لنشرات الذكاء الاصطناعي التي تستغرق وقتًا أطول من نافذة نشر الخدمة الافتراضية، تدعم إصدارات AZD الحالية الأمر `azd deploy --timeout <seconds>`.  

## جدول المحتويات  

- [استراتيجية اختيار النموذج](#استراتيجية-اختيار-النموذج)  
- [تكوين AZD لنماذج الذكاء الاصطناعي](#تكوين-azd-لنماذج-الذكاء-الاصطناعي)  
- [أنماط النشر](#أنماط-النشر)  
- [إدارة النموذج](#إدارة-النموذج)  
- [الاعتبارات المتعلقة بالإنتاج](#اعتبارات-الإنتاج)  
- [المراقبة والملاحظة](#المراقبة-والرصد)  

## استراتيجية اختيار النموذج  

### نماذج Microsoft Foundry  

اختر النموذج المناسب لحالتك الاستخدامية:  

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```
  
### تخطيط سعة النموذج  

| نوع النموذج | حالة الاستخدام | السعة الموصى بها | اعتبارات التكلفة |  
|------------|----------|---------------------|-------------------|  
| gpt-4.1-mini | دردشة، أسئلة وأجوبة | 10-50 TPM | فعالة من حيث التكلفة لمعظم الأحمال |  
| gpt-4.1 | استدلال معقد | 20-100 TPM | تكلفة أعلى، استخدم للميزات المتميزة |  
| text-embedding-3-large | البحث، RAG | 30-120 TPM | خيار قوي افتراضي للبحث الدلالي والاسترجاع |  
| Whisper | تحويل الكلام إلى نص | 10-50 TPM | أحمال معالجة الصوت |  

## تكوين AZD لنماذج الذكاء الاصطناعي  

### تكوين قالب Bicep  

أنشئ توزيعات النموذج عبر قوالب Bicep:  

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```
  
### متغيرات البيئة  

قم بتكوين بيئة تطبيقك:  

```bash
# تكوين .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```
  
## أنماط النشر  

### النمط 1: النشر في منطقة واحدة  

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```
  
الأفضل لـ:  
- التطوير والاختبار  
- التطبيقات ذات السوق الواحدة  
- تحسين التكلفة  

### النمط 2: النشر متعدد المناطق  

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```
  
الأفضل لـ:  
- التطبيقات العالمية  
- متطلبات توفر عالي  
- توزيع الحمل  

### النمط 3: النشر الهجين  

دمج نماذج Microsoft Foundry مع خدمات الذكاء الاصطناعي الأخرى:  

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```
  
## إدارة النموذج  

### التحكم في الإصدار  

تتبع إصدارات النموذج في تكوين AZD الخاص بك:  

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```
  
### تحديثات النموذج  

استخدم روابط AZD لتحديثات النموذج:  

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# إذا استغرق النشر وقتًا أطول من المهلة الافتراضية
azd deploy --timeout 1800
```
  
### اختبار A/B  

انشر نسخاً متعددة من النموذج:  

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```
  
## اعتبارات الإنتاج  

### تخطيط السعة  

احسب السعة المطلوبة بناءً على أنماط الاستخدام:  

```python
# مثال على حساب السعة
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# مثال على الاستخدام
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```
  
### تكوين التحجيم التلقائي  

قم بتكوين التحجيم التلقائي لتطبيقات الحاويات:  

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```
  
### تحسين التكلفة  

نفذ ضوابط التكلفة:  

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```
  
## المراقبة والرصد  

### تكامل Application Insights  

قم بتكوين المراقبة لأحمال عمل الذكاء الاصطناعي:  

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```
  
### مقاييس مخصصة  

تتبع مقاييس خاصة بالذكاء الاصطناعي:  

```python
# قياسات مخصصة لنماذج الذكاء الاصطناعي
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```
  
### فحوصات الصحة  

نفذ مراقبة صحة خدمة الذكاء الاصطناعي:  

```python
# نقاط نهاية فحص الصحة
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # اختبار اتصال OpenAI
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```
  
## الخطوات التالية  

1. **راجع [دليل تكامل Microsoft Foundry](microsoft-foundry-integration.md)** لأنماط تكامل الخدمة  
2. **أكمل [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md)** للحصول على تجربة عملية  
3. **نفذ [ممارسات الذكاء الاصطناعي في الإنتاج](production-ai-practices.md)** للنشرات المؤسسية  
4. **استكشف [دليل استكشاف مشكلات الذكاء الاصطناعي](../chapter-07-troubleshooting/ai-troubleshooting.md)** للمشاكل الشائعة  

## الموارد  

- [توفر نماذج Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)  
- [توثيق Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [تحجيم تطبيقات الحاويات](https://learn.microsoft.com/azure/container-apps/scale-app)  
- [تحسين تكلفة نماذج الذكاء الاصطناعي](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)  

---  

**تنقل الفصل:**  
- **📚 الصفحة الرئيسية للدورة**: [AZD للمبتدئين](../../README.md)  
- **📖 الفصل الحالي**: الفصل 2 - تطوير يركز على الذكاء الاصطناعي  
- **⬅️ السابق**: [تكامل Microsoft Foundry](microsoft-foundry-integration.md)  
- **➡️ التالي**: [مختبر ورشة عمل الذكاء الاصطناعي](ai-workshop-lab.md)  
- **🚀 الفصل التالي**: [الفصل 3: التكوين](../chapter-03-configuration/configuration.md)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**تنويه**:
تمت ترجمة هذا المستند باستخدام خدمة الترجمة بالذكاء الاصطناعي [Co-op Translator](https://github.com/Azure/co-op-translator). بينما نسعى للدقة، يرجى العلم أن الترجمات الآلية قد تحتوي على أخطاء أو عدم دقة. يجب اعتبار المستند الأصلي بلغته الأصلية المصدر الرسمي والمعتمد. للمعلومات الهامة، يُنصح بالاستعانة بترجمة بشرية محترفة. نحن غير مسؤولين عن أي سوء فهم أو تفسير ناتج عن استخدام هذه الترجمة.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->