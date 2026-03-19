# AI Modell Telepítése Azure Developer CLI-vel

**Fejezet Navigáció:**
- **📚 Kurzus Főoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-Először Fejlesztés
- **⬅️ Előző**: [Microsoft Foundry Integráció](microsoft-foundry-integration.md)
- **➡️ Következő**: [AI Műhely Labor](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

Ez az útmutató átfogó utasításokat nyújt AI modellek telepítéséhez az AZD sablonok segítségével, lefedve a modell kiválasztásától a gyártási telepítési mintákig mindent.

## Tartalomjegyzék

- [Modell Kiválasztási Stratégia](#modell-kiválasztási-stratégia)
- [AZD Konfiguráció AI Modellekhez](#azd-konfiguráció-ai-modellekhez)
- [Telepítési Minták](#telepítési-minták)
- [Modell Menedzsment](#modell-menedzsment)
- [Gyártási Szempontok](#gyártási-szempontok)
- [Figyelés és Megfigyelhetőség](#figyelés-és-megfigyelhetőség)

## Modell Kiválasztási Stratégia

### Microsoft Foundry Modellek

Válassza ki a megfelelő modellt az esete számára:

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
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Modell Kapacitás Tervezés

| Modell Típus | Használati Eset | Ajánlott Kapacitás | Költség Szempontok |
|--------------|-----------------|-------------------|--------------------|
| gpt-4.1-mini | Csevegés, Kérdés-Válasz | 10-50 TPM | Költséghatékony a legtöbb munkaterheléshez |
| gpt-4.1 | Komplex következtetés | 20-100 TPM | Magasabb költség, prémium funkciókhoz |
| Text-embedding-ada-002 | Keresés, RAG | 30-120 TPM | Szemantikus kereséshez elengedhetetlen |
| Whisper | Beszéd-szöveg | 10-50 TPM | Hangfeldolgozási munkaterhelésekhez |

## AZD Konfiguráció AI Modellekhez

### Bicep Sablon Konfiguráció

Hozzon létre modell telepítéseket Bicep sablonokon keresztül:

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

### Környezeti Változók

Állítsa be az alkalmazás környezetét:

```bash
# .env konfiguráció
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Telepítési Minták

### Minta 1: Egyrégiós Telepítés

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

Legjobb:
- Fejlesztés és tesztelés
- Egypiaci alkalmazások
- Költségoptimalizálás

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

Legjobb:
- Globális alkalmazások
- Magas rendelkezésre állás igénye
- Terheléselosztás

### Minta 3: Hibrid Telepítés

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

## Modell Menedzsment

### Verziókezelés

Kövesse a modellszámokat az AZD konfigurációban:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
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

### Modell Frissítések

Használja az AZD hook-okat a modell frissítésekhez:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B Tesztelés

Telepítsen több modell verziót:

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

## Gyártási Szempontok

### Kapacitás Tervezés

Számolja ki a szükséges kapacitást a használati minták alapján:

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

# Példa használatára
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-scaling Konfiguráció

Állítsa be az automatikus skálázást a Container Apps szolgáltatáshoz:

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

## Figyelés és Megfigyelhetőség

### Application Insights Integráció

Állítsa be a monitorozást az AI munkaterhelésekhez:

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

### Egyedi Mutatók

Kövesse az AI-specifikus mutatókat:

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

### Állapot Ellenőrzések

Valósítson meg AI szolgáltatás egészség-ellenőrzést:

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

## Következő Lépések

1. **Tekintse át a [Microsoft Foundry Integrációs Útmutatót](microsoft-foundry-integration.md)** a szolgáltatás integrációs mintákért
2. **Teljesítse a [AI Műhely Laboratóriumot](ai-workshop-lab.md)** gyakorlati tapasztalathoz
3. **Valósítsa meg a [Gyártási AI Gyakorlatokat](production-ai-practices.md)** vállalati telepítésekhez
4. **Fedezze fel a [AI Hibakeresési Útmutatót](../chapter-07-troubleshooting/ai-troubleshooting.md)** a gyakori problémákhoz

## Források

- [Microsoft Foundry Modellek elérhetősége](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps skálázása](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Modell Költségoptimalizálás](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Fejezet Navigáció:**
- **📚 Kurzus Főoldal**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet - AI-Először Fejlesztés
- **⬅️ Előző**: [Microsoft Foundry Integráció](microsoft-foundry-integration.md)
- **➡️ Következő**: [AI Műhely Labor](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kizáró nyilatkozat**:  
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár a pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatizált fordítások tartalmazhatnak hibákat vagy pontatlanságokat. Az eredeti dokumentum anyanyelvű változatát kell tekinteni a hiteles forrásnak. Kritikus információk esetén szakmai, emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy helytelen értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->