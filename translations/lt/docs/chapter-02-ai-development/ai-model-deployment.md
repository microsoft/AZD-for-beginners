# AI Modelio diegimas naudojant Azure Developer CLI

**Skyrelio navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmas vystymas
- **⬅️ Ankstesnis**: [Microsoft Foundry integracija](microsoft-foundry-integration.md)
- **➡️ Kitas**: [AI dirbtuvės](ai-workshop-lab.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

Šiame vadove pateikiamos išsamios instrukcijos, kaip diegti AI modelius naudojant AZD šablonus, aprėpiant viską nuo modelio pasirinkimo iki gamybos diegimo modelių.

> **Patvirtinimo pastaba (2026-07-13):** Šio vadovo AZD darbo eiga buvo patikrinta naudojant `azd` `1.27.1`. AI diegimams, kurie trunka ilgiau nei numatytasis paslaugos diegimo langas, dabartinės AZD versijos palaiko komandą `azd deploy --timeout <seconds>`.

## Turinys

- [Modelio pasirinkimo strategija](#modelio-pasirinkimo-strategija)
- [AZD konfigūracija AI modeliams](#azd-konfigūracija-ai-modeliams)
- [Diegimo modeliai](#diegimo-modeliai)
- [Modelio valdymas](#modelio-valdymas)
- [Gamybos svarstymai](#gamybos-svarstymai)
- [Stebėsena ir matomumas](#stebėsena-ir-matomumas)

## Modelio pasirinkimo strategija

### Microsoft Foundry modeliai

Pasirinkite tinkamą modelį savo naudojimo atvejui:

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

### Modelio talpos planavimas

| Modelio tipas | Naudojimo atvejis | Rekomenduojama talpa | Kainos aspektai |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Pokalbiai, klausimai ir atsakymai | 10-50 TPM | Ekonomiškas daugumai krūvių |
| gpt-4.1 | Kompleksinis samprotavimas | 20-100 TPM | Aukštesnės kainos, naudoti aukščiausios klasės funkcijoms |
| text-embedding-3-large | Paieška, RAG | 30-120 TPM | Stiprus numatytasis pasirinkimas semantinei paieškai ir gavimui |
| Whisper | Kalbos į tekstą | 10-50 TPM | Garso apdorojimo krūviai |

## AZD konfigūracija AI modeliams

### Bicep šablono konfigūracija

Kurkite modelio diegimus per Bicep šablonus:

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

### Aplinkos kintamieji

Konfigūruokite savo programos aplinką:

```bash
# .env konfigūracija
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Diegimo modeliai

### Modelis 1: Vienos regiono diegimas

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

Geriausia:
- Kūrimo ir testavimo aplinkoms
- Programėlėms vienai rinkai
- Sąnaudų optimizavimui

### Modelis 2: Daugybinio regiono diegimas

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Geriausia:
- Globalioms programėlėms
- Didelio prieinamumo reikalavimams
- Apkrovos paskirstymui

### Modelis 3: Hibridinis diegimas

Derinkite Microsoft Foundry modelius su kitomis AI paslaugomis:

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

## Modelio valdymas

### Versijų valdymas

Sekite modelio versijas savo AZD konfigūracijoje:

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

### Modelio atnaujinimai

Naudokite AZD kablius modelio atnaujinimams:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Jei diegimas užtrunka ilgiau nei numatytasis laiko limitas
azd deploy --timeout 1800
```

### A/B testingas

Diegkite kelias modelio versijas:

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

## Gamybos svarstymai

### Talpos planavimas

Apskaičiuokite reikiamą talpą pagal naudojimo modelius:

```python
# Talpos skaičiavimo pavyzdys
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

# Panaudojimo pavyzdys
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Automatinio mastelio keitimo konfigūracija

Konfigūruokite automatinį mastelio keitimą Container Apps:

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

### Sąnaudų optimizavimas

Įgyvendinkite sąnaudų kontrolę:

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

## Stebėsena ir matomumas

### Application Insights integracija

Konfigūruokite AI krūvių stebėjimą:

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

### Pasirinktinių rodiklių sekimas

Sekite AI specifinius rodiklius:

```python
# Tinkinta telemetrija dirbtinio intelekto modeliams
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

### Sveikatos patikrinimai

Įgyvendinkite AI paslaugų sveikatos stebėjimą:

```python
# Sveikatos patikros galiniai taškai
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Patikrinti OpenAI ryšį
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

## Kiti veiksmai

1. **Peržiūrėkite [Microsoft Foundry integracijos vadovą](microsoft-foundry-integration.md)** dėl paslaugų integracijos modelių
2. **Užbaikite [AI dirbtuvių laboratoriją](ai-workshop-lab.md)** praktinei patirčiai
3. **Įgyvendinkite [gamybos AI praktiką](production-ai-practices.md)** verslui skirtam diegimui
4. **Išnagrinėkite [AI trikčių šalinimo vadovą](../chapter-07-troubleshooting/ai-troubleshooting.md)** dėl dažnų problemų

## Ištekliai

- [Microsoft Foundry modelių prieinamumas](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps mastelio keitimas](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI modelio sąnaudų optimizavimas](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Skyrelio navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmas vystymas
- **⬅️ Ankstesnis**: [Microsoft Foundry integracija](microsoft-foundry-integration.md)
- **➡️ Kitas**: [AI dirbtuvės](ai-workshop-lab.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->