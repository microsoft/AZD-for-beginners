# Distribuzione di modelli AI con Azure Developer CLI

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo incentrato sull'AI
- **⬅️ Precedente**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Successivo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Capitolo successivo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

Questa guida fornisce istruzioni complete per distribuire modelli AI usando i template AZD, coprendo tutto, dalla selezione del modello ai pattern di distribuzione in produzione.

> **Nota di validazione (2026-03-25):** Il flusso di lavoro AZD in questa guida è stato verificato con `azd` `1.23.12`. Per le distribuzioni AI che richiedono più tempo rispetto alla finestra di distribuzione predefinita del servizio, le release AZD correnti supportano `azd deploy --timeout <seconds>`.

## Indice

- [Strategia di selezione del modello](#model-selection-strategy)
- [Configurazione AZD per modelli AI](#azd-configuration-for-ai-models)
- [Modelli di distribuzione](#deployment-patterns)
- [Gestione dei modelli](#model-management)
- [Considerazioni per la produzione](#production-considerations)
- [Monitoraggio e osservabilità](#monitoring-and-observability)

## Model Selection Strategy

### Microsoft Foundry Models Models

Scegli il modello giusto per il tuo caso d'uso:

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

### Pianificazione della capacità del modello

| Model Type | Caso d'uso | Capacità consigliata | Considerazioni sui costi |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10-50 TPM | Costo-efficace per la maggior parte dei carichi di lavoro |
| gpt-4.1 | Ragionamento complesso | 20-100 TPM | Costo maggiore, da utilizzare per funzionalità premium |
| text-embedding-3-large | Ricerca, RAG | 30-120 TPM | Scelta predefinita solida per la ricerca semantica e il recupero |
| Whisper | Speech-to-text | 10-50 TPM | Carichi di lavoro di elaborazione audio |

## AZD Configuration for AI Models

### Bicep Template Configuration

Crea distribuzioni di modelli tramite i template Bicep:

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

### Variabili d'ambiente

Configura l'ambiente della tua applicazione:

```bash
# Configurazione del file .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Deployment Patterns

### Pattern 1: Distribuzione in singola regione

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

Ideale per:
- Sviluppo e test
- Applicazioni per un unico mercato
- Ottimizzazione dei costi

### Pattern 2: Distribuzione multi-regione

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Ideale per:
- Applicazioni globali
- Requisiti di alta disponibilità
- Distribuzione del carico

### Pattern 3: Distribuzione ibrida

Combina i modelli Microsoft Foundry con altri servizi AI:

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

## Model Management

### Controllo delle versioni

Tieni traccia delle versioni dei modelli nella tua configurazione AZD:

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

### Aggiornamenti del modello

Usa gli hook AZD per gli aggiornamenti dei modelli:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Se il deployment impiega più tempo del timeout predefinito
azd deploy --timeout 1800
```

### Testing A/B

Distribuisci più versioni del modello:

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

## Production Considerations

### Pianificazione della capacità

Calcola la capacità necessaria in base ai modelli di utilizzo:

```python
# Esempio di calcolo della capacità
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

# Esempio di utilizzo
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Configurazione dell'auto-scaling

Configura l'auto-scaling per Container Apps:

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

### Ottimizzazione dei costi

Implementa controlli dei costi:

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

## Monitoring and Observability

### Integrazione con Application Insights

Configura il monitoraggio per i carichi di lavoro AI:

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

### Metriche personalizzate

Monitora metriche specifiche per l'AI:

```python
# Telemetria personalizzata per modelli di intelligenza artificiale
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

### Controlli di integrità

Implementa il monitoraggio dello stato dei servizi AI:

```python
# Endpoint per il controllo dello stato
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Verifica della connessione a OpenAI
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

## Prossimi passi

1. **Esamina la [Guida all'integrazione Microsoft Foundry](microsoft-foundry-integration.md)** per i pattern di integrazione dei servizi
2. **Completa il [AI Workshop Lab](ai-workshop-lab.md)** per esperienza pratica
3. **Implementa le [Pratiche AI per la produzione](production-ai-practices.md)** per distribuzioni enterprise
4. **Esplora la [Guida alla risoluzione dei problemi AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** per problemi comuni

## Risorse

- [Disponibilità dei modelli Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scalabilità di Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Ottimizzazione dei costi dei modelli AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigazione del capitolo:**
- **📚 Home del corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo corrente**: Capitolo 2 - Sviluppo incentrato sull'AI
- **⬅️ Precedente**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Successivo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Capitolo successivo**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatizzate possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->