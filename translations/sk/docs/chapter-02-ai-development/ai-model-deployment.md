# Nasadenie AI modelu pomocou Azure Developer CLI

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-prvé vývoj
- **⬅️ Predchádzajúca**: [Integrácia Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Ďalšia**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

Tento návod poskytuje komplexné pokyny na nasadenie AI modelov pomocou šablón AZD, pokrývajúc všetko od výberu modelu po vzory nasadenia do produkcie.

> **Poznámka o validácii (2026-07-13):** Pracovný postup AZD v tomto návode bol overený s `azd` `1.27.1`. Pre AI nasadenia, ktoré trvajú dlhšie než predvolené okno nasadenia služby, sú súčasné verzie AZD podporujú `azd deploy --timeout <seconds>`.

## Obsah

- [Stratégia výberu modelu](#stratégia-výberu-modelu)
- [Konfigurácia AZD pre AI modely](#konfigurácia-azd-pre-ai-modely)
- [Vzory nasadenia](#vzory-nasadenia)
- [Správa modelov](#správa-modelov)
- [Úvahy o produkcii](#úvahy-o-produkcii)
- [Monitorovanie a pozorovateľnosť](#monitorovanie-a-pozorovateľnosť)

## Stratégia výberu modelu

### Modely Microsoft Foundry

Vyberte správny model pre váš prípad použitia:

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

### Plánovanie kapacity modelu

| Typ modelu | Prípad použitia | Odporúčaná kapacita | Nákladové úvahy |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Otázky a odpovede | 10-50 TPM | Nákladovo efektívne pre väčšinu záťaží |
| gpt-4.1 | Komplexné uvažovanie | 20-100 TPM | Vyššie náklady, použite pre prémiové funkcie |
| text-embedding-3-large | Vyhľadávanie, RAG | 30-120 TPM | Silná predvolená voľba pre sémantické vyhľadávanie a získavanie |
| Whisper | Prevod reči na text | 10-50 TPM | Zaťaženia spracovania zvuku |

## Konfigurácia AZD pre AI modely

### Konfigurácia Bicep šablóny

Vytvorte nasadenia modelov pomocou Bicep šablón:

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

### Premenné prostredia

Nakonfigurujte prostredie vašej aplikácie:

```bash
# konfigurácia .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Vzory nasadenia

### Vzor 1: Nasadenie v jednom regióne

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

Najvhodnejšie pre:
- Vývoj a testovanie
- Aplikácie pre jeden trh
- Optimalizácia nákladov

### Vzor 2: Nasadenie vo viacerých regiónoch

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Najvhodnejšie pre:
- Globálne aplikácie
- Požiadavky na vysokú dostupnosť
- Distribúciu záťaže

### Vzor 3: Hybridné nasadenie

Kombinujte modely Microsoft Foundry s inými AI službami:

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

## Správa modelov

### Verzionovanie

Sledujte verzie modelov vo vašej AZD konfigurácii:

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

### Aktualizácie modelov

Použite AZD háky pre aktualizácie modelov:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Ak nasadenie trvá dlhšie ako predvolený časový limit
azd deploy --timeout 1800
```

### A/B testovanie

Nasadzujte viacero verzií modelov:

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

## Úvahy o produkcii

### Plánovanie kapacity

Vypočítajte požadovanú kapacitu na základe vzorov používania:

```python
# Príklad výpočtu kapacity
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

# Príklad použitia
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Konfigurácia automatického škálovania

Nakonfigurujte automatické škálovanie pre Container Apps:

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

### Optimalizácia nákladov

Zavádzajte riadenie nákladov:

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

## Monitorovanie a pozorovateľnosť

### Integrácia Application Insights

Nakonfigurujte monitorovanie AI záťaží:

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

### Vlastné metriky

Sledujte špecifické AI metriky:

```python
# Vlastná telemetria pre AI modely
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

### Kontroly stavu

Zavádzajte monitorovanie stavu AI služieb:

```python
# Koncové body pre kontrolu zdravia
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Otestovať pripojenie k OpenAI
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

## Ďalšie kroky

1. **Preštudujte si [Príručku integrácie Microsoft Foundry](microsoft-foundry-integration.md)** pre vzory integrácie služieb
2. **Dokončite [AI Workshop Lab](ai-workshop-lab.md)** pre praktické skúsenosti
3. **Implementujte [Produkčné AI praktiky](production-ai-practices.md)** pre podnikové nasadenia
4. **Preskúmajte [Návod na riešenie problémov s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** pre bežné problémy

## Zdroje

- [Dostupnosť modelov Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Škálovanie Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimalizácia nákladov AI modelov](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - AI-prvé vývoj
- **⬅️ Predchádzajúca**: [Integrácia Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Ďalšia**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->