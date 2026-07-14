# Azure Developer CLI ile Yapay Zeka Modeli Dağıtımı

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfası**: [Başlangıç için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - Yapay Zeka Öncelikli Geliştirme
- **⬅️ Önceki**: [Microsoft Foundry Entegrasyonu](microsoft-foundry-integration.md)
- **➡️ Sonraki**: [Yapay Zeka Çalıştayı Laboratuvarı](ai-workshop-lab.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../chapter-03-configuration/configuration.md)

Bu rehber, AI modellerinin dağıtımı için AZD şablonlarını kullanarak, model seçiminden üretim dağıtım kalıplarına kadar kapsamlı talimatlar sağlar.

> **Doğrulama notu (2026-07-13):** Bu rehberdeki AZD iş akışı `azd` `1.27.1` sürümü ile test edilmiştir. Varsayılan hizmet dağıtım süresinden daha uzun süren AI dağıtımları için, mevcut AZD sürümleri `azd deploy --timeout <saniye>` komutunu desteklemektedir.

## İçindekiler

- [Model Seçim Stratejisi](#model-seçim-stratejisi)
- [AI Modelleri için AZD Konfigürasyonu](#ai-modelleri-için-azd-konfigürasyonu)
- [Dağıtım Kalıpları](#dağıtım-kalıpları)
- [Model Yönetimi](#model-yönetimi)
- [Üretim Dikkat Edilmesi Gerekenler](#üretim-dikkat-edilmesi-gerekenler)
- [İzleme ve Gözlemlenebilirlik](#i̇zleme-ve-gözlemlenebilirlik)

## Model Seçim Stratejisi

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

| Model Türü | Kullanım Durumu | Önerilen Kapasite | Maliyet Dikkatleri |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Sohbet, Soru-Cevap | 10-50 TPM | Çoğu iş yükü için maliyet etkin |
| gpt-4.1 | Karmaşık akıl yürütme | 20-100 TPM | Daha yüksek maliyet, premium özellikler için kullanın |
| text-embedding-3-large | Arama, RAG | 30-120 TPM | Anlamsal arama ve erişim için güçlü varsayılan seçim |
| Whisper | Konuşmadan metne | 10-50 TPM | Ses işleme iş yükleri için |

## AI Modelleri için AZD Konfigürasyonu

### Bicep Şablon Konfigürasyonu

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

## Dağıtım Kalıpları

### Kalıp 1: Tek Bölge Dağıtımı

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

En iyi:
- Geliştirme ve test için
- Tek pazar uygulamaları için
- Maliyet optimizasyonu için

### Kalıp 2: Çok Bölge Dağıtımı

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

En iyi:
- Küresel uygulamalar için
- Yüksek kullanılabilirlik gereksinimleri için
- Yük dağıtımı için

### Kalıp 3: Hibrit Dağıtım

Microsoft Foundry Modellerini diğer AI servisleriyle birleştirin:

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

## Model Yönetimi

### Sürüm Kontrolü

AZD konfigürasyonunuzda model sürümlerini takip edin:

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

Birden fazla model sürümü dağıtın:

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

## Üretim Dikkat Edilmesi Gerekenler

### Kapasite Planlaması

Kullanım kalıplarına göre gerekli kapasiteyi hesaplayın:

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

# Örnek kullanım
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Otomatik Ölçeklendirme Konfigürasyonu

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

Maliyet kontrolü uygulayın:

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

## İzleme ve Gözlemlenebilirlik

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

AI’ye özel metrikleri takip edin:

```python
# AI modelleri için özel telemetri
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

AI hizmeti sağlık izlemeyi uygulayın:

```python
# Sağlık kontrolu uç noktaları
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

## Sonraki Adımlar

1. **Servis entegrasyon kalıpları için [Microsoft Foundry Entegrasyon Rehberi](microsoft-foundry-integration.md)** inceleyin
2. **Pratik deneyim için [Yapay Zeka Çalıştayı Laboratuvarı](ai-workshop-lab.md)** tamamlayın
3. **Kurumsal dağıtımlar için [Üretim AI Uygulamaları](production-ai-practices.md)** uygulayın
4. **Yaygın sorunlar için [AI Sorun Giderme Rehberi](../chapter-07-troubleshooting/ai-troubleshooting.md)** keşfedin

## Kaynaklar

- [Microsoft Foundry Modelleri Model Mevcudiyeti](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Belgeleri](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Ölçeklendirme](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Modeli Maliyet Optimizasyonu](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Bölüm Navigasyonu:**
- **📚 Kurs Anasayfası**: [Başlangıç için AZD](../../README.md)
- **📖 Mevcut Bölüm**: Bölüm 2 - Yapay Zeka Öncelikli Geliştirme
- **⬅️ Önceki**: [Microsoft Foundry Entegrasyonu](microsoft-foundry-integration.md)
- **➡️ Sonraki**: [Yapay Zeka Çalıştayı Laboratuvarı](ai-workshop-lab.md)
- **🚀 Sonraki Bölüm**: [Bölüm 3: Konfigürasyon](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Feragatname**:
Bu belge, AI çeviri hizmeti [Co-op Translator](https://github.com/Azure/co-op-translator) kullanılarak çevrilmiştir. Doğruluk için çaba sarf etsek de, otomatik çevirilerin hata veya yanlışlık içerebileceğini lütfen unutmayınız. Orijinal belge, kendi dilinde yetkili kaynak olarak kabul edilmelidir. Kritik bilgiler için profesyonel insan çevirisi önerilir. Bu çevirinin kullanımı sonucu ortaya çıkabilecek yanlış anlamalardan veya yanlış yorumlamalardan sorumlu değiliz.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->