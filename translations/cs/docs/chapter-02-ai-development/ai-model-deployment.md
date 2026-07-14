# Nasazení AI modelu s Azure Developer CLI

**Navigace kapitolou:**
- **📚 Domů ke kurzu**: [AZD Pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Integrace Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Další**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

Tento průvodce poskytuje komplexní instrukce pro nasazení AI modelů pomocí šablon AZD, pokrývající vše od výběru modelu až po produkční vzory nasazení.

> **Poznámka k ověření (2026-07-13):** Workflow AZD v tomto průvodci bylo ověřeno s `azd` verzí `1.27.1`. Pro AI nasazení, která trvají déle než výchozí časové okno nasazení služby, aktuální verze AZD podporují příkaz `azd deploy --timeout <sekundy>`.

## Obsah

- [Strategie výběru modelu](#strategie-výběru-modelu)
- [Konfigurace AZD pro AI modely](#konfigurace-azd-pro-ai-modely)
- [Vzorová nasazení](#vzorová-nasazení)
- [Správa modelu](#správa-modelu)
- [Provozní úvahy](#provozní-úvahy)
- [Monitorování a pozorovatelnost](#monitorování-a-pozorovatelnost)

## Strategie výběru modelu

### Modely Microsoft Foundry

Vyberte správný model pro svůj případ použití:

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

### Plánování kapacity modelu

| Typ modelu | Případ použití | Doporučená kapacita | Cenová hlediska |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10-50 TPM | Nákladově efektivní pro většinu pracovních zatížení |
| gpt-4.1 | Komplexní uvažování | 20-100 TPM | Vyšší náklady, použijte pro prémiové funkce |
| text-embedding-3-large | Vyhledávání, RAG | 30-120 TPM | Silná výchozí volba pro sémantické vyhledávání a získávání |
| Whisper | Přepis řeči na text | 10-50 TPM | Pracovní zatížení zpracování audia |

## Konfigurace AZD pro AI modely

### Konfigurace šablony Bicep

Vytvořte nasazení modelu pomocí šablon Bicep:

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

### Proměnné prostředí

Nakonfigurujte prostředí své aplikace:

```bash
# konfigurace .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Vzorová nasazení

### Vzor 1: Nasazení v jedné oblasti

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

Nejvhodnější pro:
- Vývoj a testování
- Aplikace pro jedno tržní prostředí
- Optimalizaci nákladů

### Vzor 2: Nasazení ve více oblastech

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Nejvhodnější pro:
- Globální aplikace
- Požadavky na vysokou dostupnost
- Rozložení zátěže

### Vzor 3: Hybridní nasazení

Kombinujte Microsoft Foundry Modely s dalšími AI službami:

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

## Správa modelu

### Kontrola verzí

Sledujte verze modelů ve své konfiguraci AZD:

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

### Aktualizace modelu

Používejte AZD háčky pro aktualizace modelů:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Pokud nasazení trvá déle než výchozí časový limit
azd deploy --timeout 1800
```

### A/B testování

Nasazujte více verzí modelu:

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

## Provozní úvahy

### Plánování kapacity

Vypočítejte požadovanou kapacitu na základě vzorů používání:

```python
# Příklad výpočtu kapacity
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

# Příklad použití
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Konfigurace automatického škálování

Nakonfigurujte automatické škálování pro Container Apps:

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

### Optimalizace nákladů

Implementujte kontroly nákladů:

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

## Monitorování a pozorovatelnost

### Integrace Application Insights

Nakonfigurujte monitorování pro AI pracovní zatížení:

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

### Vlastní metriky

Sledujte metriky specifické pro AI:

```python
# Vlastní telemetrie pro AI modely
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

Implementujte monitorování stavu AI služeb:

```python
# Koncové body kontroly zdraví
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Testovat připojení OpenAI
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

## Další kroky

1. **Prostudujte [Průvodce integrací Microsoft Foundry](microsoft-foundry-integration.md)** pro vzory integrace služeb
2. **Dokončete [AI Workshop Lab](ai-workshop-lab.md)** pro praktické zkušenosti
3. **Implementujte [Produkční AI praktiky](production-ai-practices.md)** pro nasazení ve firmách
4. **Prozkoumejte [Průvodce řešením problémů AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** pro běžné problémy

## Zdroje

- [Dostupnost modelů Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Škálování Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimalizace nákladů AI modelů](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigace kapitolou:**
- **📚 Domů ke kurzu**: [AZD Pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj zaměřený na AI
- **⬅️ Předchozí**: [Integrace Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Další**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->