# AI Model Deployment with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Current Chapter**: Bölüm 2 - Yapay Zeka Öncelikli Geliştirme
- **⬅️ Previous**: [Microsoft Foundry Entegrasyonu](microsoft-foundry-integration.md)
- **➡️ Next**: [Yapay Zeka Atölyesi](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

Bu kılavuz, model seçiminden üretim dağıtım desenlerine kadar AZD şablonlarını kullanarak AI modellerini dağıtmak için kapsamlı talimatlar sağlar.

> **Doğrulama notu (2026-03-25):** Bu kılavuzdaki AZD iş akışı `azd` `1.23.12` ile kontrol edilmiştir. Varsayılan hizmet dağıtım penceresinden daha uzun süren AI dağıtımları için, mevcut AZD sürümleri `azd deploy --timeout <seconds>` komutunu destekler.

## Table of Contents

- [Model Selection Strategy](#model-selection-strategy)
- [AZD Configuration for AI Models](#azd-configuration-for-ai-models)
- [Deployment Patterns](#deployment-patterns)
- [Model Management](#model-management)
- [Production Considerations](#production-considerations)
- [Monitoring and Observability](#monitoring-and-observability)

## Model Selection Strategy

### Microsoft Foundry Modelleri

Kullanım durumunuza uygun modeli seçin:

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

### Model Kapasite Planlaması

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Sohbet, Soru-Cevap | 10-50 TPM | Çoğu iş yükü için maliyet-etkin |
| gpt-4.1 | Karmaşık muhakeme | 20-100 TPM | Daha yüksek maliyet, premium özellikler için kullanın |
| text-embedding-3-large | Arama, RAG | 30-120 TPM | Semantik arama ve retrieval için güçlü varsayılan seçim |
| Whisper | Konuşma metne çeviri | 10-50 TPM | Ses işleme iş yükleri |

## AZD Configuration for AI Models

### Bicep Şablonu Yapılandırması

Bicep şablonları aracılığıyla model dağıtımları oluşturun:

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

### Ortam Değişkenleri

Uygulama ortamınızı yapılandırın:

```bash
# .env yapılandırması
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Deployment Patterns

### Desen 1: Tek Bölge Dağıtımı

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

En uygun:
- Geliştirme ve test
- Tek pazara yönelik uygulamalar
- Maliyet optimizasyonu

### Desen 2: Çok Bölgeli Dağıtım

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

En uygun:
- Küresel uygulamalar
- Yüksek erişilebilirlik gereksinimleri
- Yük dağılımı

### Desen 3: Hibrit Dağıtım

Microsoft Foundry Modellerini diğer AI hizmetleriyle birleştirin:

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

## Model Management

### Versiyon Kontrolü

AZD yapılandırmanızda model sürümlerini izleyin:

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

### Model Güncellemeleri

Model güncellemeleri için AZD kancalarını kullanın:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Dağıtım varsayılan zaman aşımından daha uzun sürerse
azd deploy --timeout 1800
```

### A/B Testi

Birden fazla model sürümünü dağıtın:

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

## Production Considerations

### Kapasite Planlaması

Kullanım desenlerine göre gereken kapasiteyi hesaplayın:

```python
# Kapasite hesaplama örneği
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

# Kullanım örneği
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Otomatik Ölçeklendirme Yapılandırması

Container Apps için otomatik ölçeklendirmeyi yapılandırın:

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

### Maliyet Optimizasyonu

Maliyet kontrollerini uygulayın:

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

## Monitoring and Observability

### Application Insights Entegrasyonu

AI iş yükleri için izlemeyi yapılandırın:

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

### Özel Metrikler

AI'ya özgü metrikleri izleyin:

```python
# Yapay zeka modelleri için özel telemetri
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

### Sağlık Kontrolleri

AI hizmeti sağlık izlemesini uygulayın:

```python
# Sağlık kontrolü uç noktaları
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI bağlantısını test et
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

## Bir Sonraki Adımlar

1. **Hizmet entegrasyon desenleri için [Microsoft Foundry Entegrasyon Kılavuzunu](microsoft-foundry-integration.md) inceleyin**
2. **Pratik deneyim için [Yapay Zeka Atölyesini](ai-workshop-lab.md) tamamlayın**
3. **Kurumsal dağıtımlar için [Üretim AI Uygulamalarını](production-ai-practices.md) uygulayın**
4. **Yaygın sorunlar için [AI Sorun Giderme Kılavuzunu](../chapter-07-troubleshooting/ai-troubleshooting.md) inceleyin**

## Kaynaklar

- [Microsoft Foundry Modelleri Kullanılabilirliği](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokümantasyonu](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Ölçeklendirme](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Modeli Maliyet Optimizasyonu](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD Yeni Başlayanlar İçin](../../README.md)
- **📖 Current Chapter**: Bölüm 2 - Yapay Zeka Öncelikli Geliştirme
- **⬅️ Previous**: [Microsoft Foundry Entegrasyonu](microsoft-foundry-integration.md)
- **➡️ Next**: [Yapay Zeka Atölyesi](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Bölüm 3: Yapılandırma](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba göstersek de, otomatik çevirilerin hatalar veya yanlışlıklar içerebileceğini lütfen unutmayın. Orijinal belge, kendi dilindeki sürümü yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanılması nedeniyle ortaya çıkan herhangi bir yanlış anlama veya yanlış yorumdan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->