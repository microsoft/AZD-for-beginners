# AI Modell Telepítése Azure Developer CLI-vel

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 2. Fejezet - AI-Előfejlesztés
- **⬅️ Előző**: [Microsoft Foundry Integráció](microsoft-foundry-integration.md)
- **➡️ Következő**: [AI Műhely Labor](ai-workshop-lab.md)
- **🚀 Következő Fejezet**: [3. Fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

Ez az útmutató átfogó utasításokat nyújt AI modellek telepítéséhez az AZD sablonok használatával, a modell kiválasztásától a gyártási telepítési mintákig mindent lefedve.

> **Érvényességi megjegyzés (2026-07-13):** Az ebben az útmutatóban szereplő AZD munkafolyamatot a `azd` `1.27.1` verzióval ellenőrizték. Az AI telepítések esetén, amelyek hosszabb ideig tartanak, mint az alapértelmezett szolgáltatás telepítési időablaka, a jelenlegi AZD kiadások támogatják az `azd deploy --timeout <másodperc>` parancsot.

## Tartalomjegyzék

- [Modell Kiválasztási Stratégia](#modell-kiválasztási-stratégia)
- [AZD Konfiguráció AI Modellekhez](#azd-konfiguráció-ai-modellekhez)
- [Telepítési Minták](#telepítési-minták)
- [Modell Kezelés](#modell-kezelés)
- [Gyártási Megfontolások](#gyártási-megfontolások)
- [Monitorozás és Megfigyelhetőség](#monitorozás-és-megfigyelhetőség)

## Modell Kiválasztási Stratégia

### Microsoft Foundry Modellek

Válaszd ki a megfelelőt az esetedhez:

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

### Modell Kapacitásterv

| Modell Típus | Használati Eset | Javasolt Kapacitás | Költség Megfontolások |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Kérdések és Válaszok | 10-50 TPM | Költséghatékony a legtöbb munkaterheléshez |
| gpt-4.1 | Összetett érvelés | 20-100 TPM | Magasabb költség, prémium funkciókhoz |
| text-embedding-3-large | Keresés, RAG | 30-120 TPM | Erős alapértelmezett választás szemantikus kereséshez és visszakereséshez |
| Whisper | Beszéd szöveggé alakítása | 10-50 TPM | Audio feldolgozó munkaterhelésekhez |

## AZD Konfiguráció AI Modellekhez

### Bicep Sablon Konfiguráció

Hozz létre modell telepítéseket Bicep sablonokkal:

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

### Környezeti Változók

Állítsd be az alkalmazás környezetét:

```bash
# .env konfiguráció
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Telepítési Minták

### Minta 1: Egyszeri Régió Telepítés

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

Legjobb választás:
- Fejlesztés és tesztelés
- Egypiacos alkalmazások
- Költséghatékonyság

### Minta 2: Többrégiós Telepítés

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
- Magas rendelkezésre állás követelmények
- Terheléselosztás

### Minta 3: Hibrid Telepítés

Kombináld a Microsoft Foundry Modelleket más AI szolgáltatásokkal:

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

## Modell Kezelés

### Verziókezelés

Kövesd a modell verziókat az AZD konfigurációdban:

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

### Modell Frissítések

Használj AZD hookokat modellfrissítésekhez:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Ha a telepítés tovább tart az alapértelmezett időkorlátónál
azd deploy --timeout 1800
```

### A/B Tesztelés

Telepíts több modell verziót:

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

## Gyártási Megfontolások

### Kapacitás Tervezés

Számold ki a szükséges kapacitást a használati minták alapján:

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

# Példa használat
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Automatikus Méretezés Konfiguráció

Állíts be automatikus méretezést a Container Apps számára:

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

### Költségoptimalizáció

Vezess be költségkontrollokat:

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

## Monitorozás és Megfigyelhetőség

### Application Insights Integráció

Állítsd be a monitorozást AI munkaterhelésekhez:

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

### Egyedi Mérőszámok

Kövesd az AI-specifikus mérőszámokat:

```python
# Egyedi telemetria AI modellekhez
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

### Egészségügyi Ellenőrzések

Valósíts meg egészségügyi monitorozást az AI szolgáltatáshoz:

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

## További Lépések

1. **Tekintsd át a [Microsoft Foundry Integrációs Útmutatót](microsoft-foundry-integration.md)** a szolgáltatás integrációs mintákért
2. **Teljesítsd az [AI Műhely Labort](ai-workshop-lab.md)** a gyakorlati tapasztalatért
3. **Valósítsd meg a [Gyártási AI Gyakorlatokat](production-ai-practices.md)** vállalati telepítésekhez
4. **Fedezd fel az [AI Hibakeresési Útmutatót](../chapter-07-troubleshooting/ai-troubleshooting.md)** a gyakori problémákhoz

## Források

- [Microsoft Foundry Modellek Elérhetősége](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Méretezés](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Modell Költségoptimalizáció](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Fejezet Navigáció:**
- **📚 Tanfolyam Kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális Fejezet**: 2. Fejezet - AI-Előfejlesztés
- **⬅️ Előző**: [Microsoft Foundry Integráció](microsoft-foundry-integration.md)
- **➡️ Következő**: [AI Műhely Labor](ai-workshop-lab.md)
- **🚀 Következő Fejezet**: [3. Fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->