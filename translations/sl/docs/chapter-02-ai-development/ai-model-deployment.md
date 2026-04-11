# Nameščanje AI modelov z Azure Developer CLI

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen v AI
- **⬅️ Prejšnje**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Naslednje**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

Ta vodič vsebuje celovita navodila za nameščanje AI modelov z uporabo AZD predlog, od izbire modela do vzorcev nameščanja v produkciji.

> **Validacijska opomba (2026-03-25):** Delovni tok AZD v tem vodiču je bil preverjen proti `azd` `1.23.12`. Za AI nameščanja, ki zasedejo več časa kot privzeto okno nameščanja storitve, trenutne izdaje AZD podpirajo `azd deploy --timeout <seconds>`.

## Kazalo

- [Strategija izbire modela](#strategija-izbire-modela)
- [AZD konfiguracija za AI modele](#azd-konfiguracija-za-ai-modele)
- [Vzorcei nameščanja](#vzorcei-nameščanja)
- [Upravljanje modelov](#upravljanje-modelov)
- [Premisleki za produkcijsko okolje](#premisleki-za-produkcijsko-okolje)
- [Nadzor in opazljivost](#nadzor-in-opazljivost)

## Strategija izbire modela

### Microsoft Foundry Models Models

Izberite pravi model za vaš primer uporabe:

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

### Načrtovanje zmogljivosti modela

| Tip modela | Primer uporabe | Priporočena zmogljivost | Premisleki o stroških |
|------------|----------------|------------------------|----------------------|
| gpt-4.1-mini | Pogovor, Vprašanja in odgovori | 10-50 TPM | Stroškovno učinkovit za večino nalog |
| gpt-4.1 | Kompleksno razmišljanje | 20-100 TPM | Višji stroški, uporaba za premium funkcionalnosti |
| text-embedding-3-large | Iskanje, RAG | 30-120 TPM | Močna privzeta izbira za semantično iskanje in pridobivanje |
| Whisper | Govor v besedilo | 10-50 TPM | Delovne obremenitve za obdelavo zvoka |

## AZD konfiguracija za AI modele

### Bicep Template Configuration

Ustvarite nameščanja modelov z Bicep predlogami:

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

### Spremenljivke okolja

Konfigurirajte okolje aplikacije:

```bash
# Konfiguracija .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Vzorcei nameščanja

### Vzorec 1: Namestitev v eni regiji

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

Najbolj primerno za:
- Razvoj in testiranje
- Aplikacije za en sam trg
- Optimizacija stroškov

### Vzorec 2: Namestitev v več regijah

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Najbolj primerno za:
- Globalne aplikacije
- Zahteve po visoki razpoložljivosti
- Porazdelitev obremenitve

### Vzorec 3: Hibridna namestitev

Združite Microsoft Foundry modele z drugimi AI storitvami:

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

## Upravljanje modelov

### Nadzor različic

Spremljajte različice modelov v vaši AZD konfiguraciji:

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

### Posodobitve modelov

Uporabite AZD hooks za posodobitve modelov:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Če razmestitev traja dlje kot privzeta časovna omejitev
azd deploy --timeout 1800
```

### A/B testiranje

Nameščajte več različic modelov:

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

## Premisleki za produkcijsko okolje

### Načrtovanje zmogljivosti

Izračunajte potrebne zmogljivosti glede na vzorce uporabe:

```python
# Primer izračuna zmogljivosti
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

# Primer uporabe
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Konfiguracija samodejnega skaliranja

Konfigurirajte samodejno skaliranje za Container Apps:

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

### Optimizacija stroškov

Uvedite kontrole stroškov:

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

## Nadzor in opazljivost

### Integracija z Application Insights

Konfigurirajte nadzor za AI delovne obremenitve:

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

### Prilagojene metrike

Spremljajte AI-specifične metrike:

```python
# Prilagojena telemetrija za AI modele
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

### Preverjanje zdravja

Vpeljite nadzor zdravja AI storitev:

```python
# Končne točke za preverjanje stanja
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Preizkus povezave z OpenAI
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

## Naslednji koraki

1. **Preglejte [Vodnik za integracijo Microsoft Foundry](microsoft-foundry-integration.md)** za vzorce integracije storitev
2. **Dokončajte [AI Workshop Lab](ai-workshop-lab.md)** za praktične izkušnje
3. **Uvedite [Prakse AI v produkciji](production-ai-practices.md)** za podjetniške namestitve
4. **Raziščite [Vodnik za odpravljanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** za pogoste težave

## Viri

- [Razpoložljivost modelov Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Prilagajanje skaliranja Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimizacija stroškov AI modelov](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj, usmerjen v AI
- **⬅️ Prejšnje**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Naslednje**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokoven človeški prevod. Ne odgovarjamo za kakršne koli nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->