<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-20T00:33:36+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "pl"
}
-->
# Wdrażanie modeli AI z Azure Developer CLI

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój zorientowany na AI
- **⬅️ Poprzedni**: [Integracja z Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Następny**: [Warsztaty AI](ai-workshop-lab.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

Ten przewodnik zawiera szczegółowe instrukcje dotyczące wdrażania modeli AI za pomocą szablonów AZD, obejmując wszystko od wyboru modelu po wzorce wdrażania w środowisku produkcyjnym.

## Spis treści

- [Strategia wyboru modelu](../../../../docs/ai-foundry)
- [Konfiguracja AZD dla modeli AI](../../../../docs/ai-foundry)
- [Wzorce wdrażania](../../../../docs/ai-foundry)
- [Zarządzanie modelami](../../../../docs/ai-foundry)
- [Rozważania produkcyjne](../../../../docs/ai-foundry)
- [Monitorowanie i obserwowalność](../../../../docs/ai-foundry)

## Strategia wyboru modelu

### Modele Azure OpenAI

Wybierz odpowiedni model do swojego przypadku użycia:

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

### Planowanie pojemności modelu

| Typ modelu | Przypadek użycia | Zalecana pojemność | Koszty |
|------------|------------------|--------------------|--------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Kosztowo efektywny dla większości obciążeń |
| GPT-4 | Złożone rozumowanie | 20-100 TPM | Wyższe koszty, używany do funkcji premium |
| Text-embedding-ada-002 | Wyszukiwanie, RAG | 30-120 TPM | Kluczowy dla wyszukiwania semantycznego |
| Whisper | Mowa na tekst | 10-50 TPM | Obciążenia związane z przetwarzaniem audio |

## Konfiguracja AZD dla modeli AI

### Konfiguracja szablonu Bicep

Twórz wdrożenia modeli za pomocą szablonów Bicep:

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

### Zmienne środowiskowe

Skonfiguruj środowisko swojej aplikacji:

```bash
# Konfiguracja .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Wzorce wdrażania

### Wzorzec 1: Wdrożenie w jednym regionie

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

Najlepsze dla:
- Rozwoju i testowania
- Aplikacji na jeden rynek
- Optymalizacji kosztów

### Wzorzec 2: Wdrożenie w wielu regionach

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Najlepsze dla:
- Aplikacji globalnych
- Wymagań wysokiej dostępności
- Rozkładu obciążenia

### Wzorzec 3: Wdrożenie hybrydowe

Połącz Azure OpenAI z innymi usługami AI:

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

## Zarządzanie modelami

### Kontrola wersji

Śledź wersje modeli w swojej konfiguracji AZD:

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

### Aktualizacje modeli

Używaj hooków AZD do aktualizacji modeli:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### Testy A/B

Wdrażaj wiele wersji modeli:

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

## Rozważania produkcyjne

### Planowanie pojemności

Oblicz wymaganą pojemność na podstawie wzorców użycia:

```python
# Przykład obliczania pojemności
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

# Przykład użycia
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Konfiguracja automatycznego skalowania

Skonfiguruj automatyczne skalowanie dla aplikacji kontenerowych:

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

### Optymalizacja kosztów

Wprowadź mechanizmy kontroli kosztów:

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

## Monitorowanie i obserwowalność

### Integracja z Application Insights

Skonfiguruj monitorowanie obciążeń AI:

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

### Niestandardowe metryki

Śledź metryki specyficzne dla AI:

```python
# Niestandardowa telemetria dla modeli AI
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

### Kontrole zdrowia

Wprowadź monitorowanie kondycji usług AI:

```python
# Punkty końcowe sprawdzania stanu zdrowia
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Przetestuj połączenie z OpenAI
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

## Kolejne kroki

1. **Przejrzyj [Przewodnik integracji z Microsoft Foundry](microsoft-foundry-integration.md)**, aby poznać wzorce integracji usług
2. **Ukończ [Warsztaty AI](ai-workshop-lab.md)**, aby zdobyć praktyczne doświadczenie
3. **Wdroż [Praktyki AI w środowisku produkcyjnym](production-ai-practices.md)** dla wdrożeń korporacyjnych
4. **Zapoznaj się z [Przewodnikiem rozwiązywania problemów z AI](../troubleshooting/ai-troubleshooting.md)**, aby poznać typowe problemy

## Zasoby

- [Dostępność modeli Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentacja Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Skalowanie aplikacji kontenerowych](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optymalizacja kosztów modeli AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Nawigacja po rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 2 - Rozwój zorientowany na AI
- **⬅️ Poprzedni**: [Integracja z Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Następny**: [Warsztaty AI](ai-workshop-lab.md)
- **🚀 Następny rozdział**: [Rozdział 3: Konfiguracja](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->