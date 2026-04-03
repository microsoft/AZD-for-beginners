# AI Modell Telepítése Azure Developer CLI-vel

**Fejezet navigáció:**
- **📚 Kurzus főoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [Microsoft Foundry Integráció](microsoft-foundry-integration.md)
- **➡️ Következő**: [AI Műhely Labor](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

Ez az útmutató átfogó utasításokat nyújt AI modellek telepítéséhez az AZD sablonok használatával, a modell kiválasztásától a gyártási telepítési mintákig.

> **Érvényességi megjegyzés (2026-03-25):** Az ebben az útmutatóban található AZD munkafolyamatot a `azd` `1.23.12` verzióval tesztelték. Azokban az AI telepítésekben, amelyek hosszabb ideig tartanak, mint az alapértelmezett szolgáltatás telepítési ablak, a jelenlegi AZD kiadások támogatják az `azd deploy --timeout <másodperc>` használatát.

## Tartalomjegyzék

- [Modell kiválasztási stratégia](#modell-kiválasztási-stratégia)
- [AZD konfiguráció AI modellekhez](#azd-konfiguráció-ai-modellekhez)
- [Telepítési minták](#telepítési-minták)
- [Modell menedzsment](#modell-menedzsment)
- [Gyártási megfontolások](#gyártási-megfontolások)
- [Megfigyelés és megfigyelhetőség](#megfigyelés-és-megfigyelhetőség)

## Modell kiválasztási stratégia

### Microsoft Foundry Modellek

Válassza ki az adott feladathoz legmegfelelőbb modellt:

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

### Modell kapacitás tervezés

| Modell típus | Használati eset | Ajánlott kapacitás | Költség megfontolások |
|--------------|-----------------|-------------------|-----------------------|
| gpt-4.1-mini | Chat, Kérdések és válaszok | 10-50 TPM | Költséghatékony a legtöbb munkaterheléshez |
| gpt-4.1 | Összetett érvelés | 20-100 TPM | Magasabb költség, prémium funkciókhoz |
| text-embedding-3-large | Keresés, RAG | 30-120 TPM | Erős alapválasztás szemantikus kereséshez és visszakereséshez |
| Whisper | Beszéd-szöveg konverzió | 10-50 TPM | Hangfeldolgozási munkaterhelésekhez |

## AZD konfiguráció AI modellekhez

### Bicep sablon konfiguráció

Modellek telepítésének létrehozása Bicep sablonok segítségével:

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

### Környezeti változók

Állítsa be az alkalmazás környezetét:

```bash
# .env konfiguráció
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
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
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Legalkalmasabb:
- Fejlesztéshez és teszteléshez
- Egypiacos alkalmazásokhoz
- Költség optimalizáláshoz

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

Legalkalmasabb:
- Globális alkalmazásokhoz
- Magas rendelkezésre állási követelményekhez
- Terheléselosztáshoz

### Minta 3: Hibrid telepítés

Kombinálja a Microsoft Foundry Modelleket más AI szolgáltatásokkal:

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

## Modell menedzsment

### Verzió kezelés

Kövesse a modell verziókat az AZD konfigurációban:

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

### Modell frissítések

Használja az AZD hookokat a modell frissítésekhez:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Ha a telepítés tovább tart az alapértelmezett időkorlátnál
azd deploy --timeout 1800
```

### A/B tesztelés

Több modell verzió telepítése:

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

## Gyártási megfontolások

### Kapacitás tervezés

Számítsa ki a szükséges kapacitást a használati minták alapján:

```python
# Kapacitás számítási példa
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

# Használati példa
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-scaling konfiguráció

Állítsa be az automatikus méretezést a Container Apps számára:

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

## Megfigyelés és megfigyelhetőség

### Application Insights integráció

Állítsa be a megfigyelést AI munkaterhelésekhez:

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

Kövesse az AI-specifikus metrikákat:

```python
# Egyedi telemetria MI modellekhez
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

Valósítson meg AI szolgáltatás egészségügyi megfigyelést:

```python
# Egészségügyi ellenőrző végpontok
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI kapcsolat tesztelése
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

1. **Nézze át a [Microsoft Foundry Integrációs Útmutatót](microsoft-foundry-integration.md)** a szolgáltatás integrációs mintákért
2. **Teljesítse az [AI Műhely Labort](ai-workshop-lab.md)** a gyakorlati tapasztalatért
3. **Valósítsa meg a [Gyártási AI gyakorlatokat](production-ai-practices.md)** vállalati telepítésekhez
4. **Ismerje meg az [AI Hibakeresési Útmutatót](../chapter-07-troubleshooting/ai-troubleshooting.md)** a gyakori problémákhoz

## Források

- [Microsoft Foundry Modellek elérhetősége](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps méretezés](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Modell költségoptimalizálás](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Fejezet navigáció:**
- **📚 Kurzus főoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 2. fejezet - AI-első fejlesztés
- **⬅️ Előző**: [Microsoft Foundry Integráció](microsoft-foundry-integration.md)
- **➡️ Következő**: [AI Műhely Labor](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvén tekintendő a hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítás ajánlott. Nem vállalunk felelősséget az ebből eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->