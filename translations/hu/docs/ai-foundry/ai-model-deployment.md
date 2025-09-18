<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6af361e2339c27aa56a9196e11b32cb7",
  "translation_date": "2025-09-18T09:17:34+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "hu"
}
-->
# AI modellek telepítése az Azure Developer CLI segítségével

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [Azure AI Foundry integráció](azure-ai-foundry-integration.md)
- **➡️ Következő**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)

Ez az útmutató átfogó instrukciókat nyújt az AI modellek telepítéséhez AZD sablonok segítségével, a modell kiválasztásától kezdve egészen a termelési telepítési mintákig.

## Tartalomjegyzék

- [Modellválasztási stratégia](../../../../docs/ai-foundry)
- [AZD konfiguráció AI modellekhez](../../../../docs/ai-foundry)
- [Telepítési minták](../../../../docs/ai-foundry)
- [Modellkezelés](../../../../docs/ai-foundry)
- [Termelési szempontok](../../../../docs/ai-foundry)
- [Monitoring és megfigyelhetőség](../../../../docs/ai-foundry)

## Modellválasztási stratégia

### Azure OpenAI modellek

Válassza ki a megfelelő modellt az adott felhasználási esethez:

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
            "name": "gpt-4o-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4o-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Modell kapacitástervezés

| Modell típusa | Felhasználási eset | Ajánlott kapacitás | Költségszempontok |
|---------------|--------------------|--------------------|-------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Költséghatékony a legtöbb munkaterheléshez |
| GPT-4 | Komplex érvelés | 20-100 TPM | Magasabb költség, prémium funkciókhoz ajánlott |
| Text-embedding-ada-002 | Keresés, RAG | 30-120 TPM | Elengedhetetlen a szemantikus kereséshez |
| Whisper | Beszéd szöveggé alakítása | 10-50 TPM | Hangfeldolgozási munkaterhelésekhez |

## AZD konfiguráció AI modellekhez

### Bicep sablon konfiguráció

Hozzon létre modelltelepítéseket Bicep sablonok segítségével:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4o-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-ada-002'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
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

### Környezeti változók

Konfigurálja az alkalmazás környezetét:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Telepítési minták

### Minta 1: Egy régiós telepítés

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

Legjobb választás:
- Fejlesztés és tesztelés
- Egyetlen piacra szánt alkalmazások
- Költségoptimalizálás

### Minta 2: Több régiós telepítés

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Legjobb választás:
- Globális alkalmazások
- Magas rendelkezésre állási követelmények
- Terheléselosztás

### Minta 3: Hibrid telepítés

Kombinálja az Azure OpenAI-t más AI szolgáltatásokkal:

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

## Modellkezelés

### Verziókövetés

Kövesse nyomon a modellverziókat az AZD konfigurációban:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4o-mini",
      "version": "2024-07-18",
      "fallback": "gpt-35-turbo"
    },
    "embedding": {
      "name": "text-embedding-ada-002",
      "version": "2"
    }
  }
}
```

### Modellfrissítések

Használjon AZD horgokat a modellfrissítésekhez:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B tesztelés

Telepítsen több modellverziót:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Termelési szempontok

### Kapacitástervezés

Számítsa ki a szükséges kapacitást a használati minták alapján:

```python
# Capacity calculation example
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

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Automatikus skálázás konfigurációja

Konfigurálja az automatikus skálázást a Container Apps számára:

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

### Költségoptimalizálás

Valósítson meg költségkontrollokat:

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

## Monitoring és megfigyelhetőség

### Application Insights integráció

Konfigurálja az AI munkaterhelések monitorozását:

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

### Egyedi metrikák

Kövesse nyomon az AI-specifikus metrikákat:

```python
# Custom telemetry for AI models
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

### Egészségügyi ellenőrzések

Valósítson meg AI szolgáltatás egészségügyi monitorozást:

```python
# Health check endpoints
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test OpenAI connection
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

## Következő lépések

1. **Tekintse át az [Azure AI Foundry integrációs útmutatót](azure-ai-foundry-integration.md)** a szolgáltatási integrációs mintákért
2. **Teljesítse az [AI Workshop Lab](ai-workshop-lab.md)** gyakorlati tapasztalatokért
3. **Valósítsa meg a [Termelési AI gyakorlatokat](production-ai-practices.md)** vállalati telepítésekhez
4. **Fedezze fel az [AI hibakeresési útmutatót](../troubleshooting/ai-troubleshooting.md)** a gyakori problémákhoz

## Források

- [Azure OpenAI modellek elérhetősége](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps skálázás](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI modell költségoptimalizálás](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Fejezet navigáció:**
- **📚 Kurzus kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [Azure AI Foundry integráció](azure-ai-foundry-integration.md)
- **➡️ Következő**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../getting-started/configuration.md)

---

**Felelősség kizárása**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Fontos információk esetén javasolt professzionális emberi fordítást igénybe venni. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely a fordítás használatából eredhet.