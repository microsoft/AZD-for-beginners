<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-21T00:34:28+00:00",
  "source_file": "docs/microsoft-foundry/ai-model-deployment.md",
  "language_code": "it"
}
-->
# Distribuzione di Modelli AI con Azure Developer CLI

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Integrazione con Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Successivo**: [Laboratorio Workshop AI](ai-workshop-lab.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

Questa guida fornisce istruzioni complete per distribuire modelli AI utilizzando i template AZD, coprendo tutto, dalla selezione del modello ai modelli di distribuzione in produzione.

## Indice

- [Strategia di Selezione del Modello](../../../../docs/microsoft-foundry)
- [Configurazione AZD per Modelli AI](../../../../docs/microsoft-foundry)
- [Modelli di Distribuzione](../../../../docs/microsoft-foundry)
- [Gestione dei Modelli](../../../../docs/microsoft-foundry)
- [Considerazioni per la Produzione](../../../../docs/microsoft-foundry)
- [Monitoraggio e Osservabilità](../../../../docs/microsoft-foundry)

## Strategia di Selezione del Modello

### Modelli Azure OpenAI

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

### Pianificazione della Capacità del Modello

| Tipo di Modello | Caso d'Uso | Capacità Raccomandata | Considerazioni sui Costi |
|------------------|------------|-----------------------|--------------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Conveniente per la maggior parte dei carichi di lavoro |
| GPT-4 | Ragionamento complesso | 20-100 TPM | Costo più elevato, da usare per funzionalità premium |
| Text-embedding-ada-002 | Ricerca, RAG | 30-120 TPM | Essenziale per la ricerca semantica |
| Whisper | Da voce a testo | 10-50 TPM | Carichi di lavoro di elaborazione audio |

## Configurazione AZD per Modelli AI

### Configurazione del Template Bicep

Crea distribuzioni di modelli tramite template Bicep:

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

### Variabili d'Ambiente

Configura l'ambiente della tua applicazione:

```bash
# Configurazione .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Modelli di Distribuzione

### Modello 1: Distribuzione in una Singola Regione

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

Ideale per:
- Sviluppo e test
- Applicazioni per un singolo mercato
- Ottimizzazione dei costi

### Modello 2: Distribuzione Multi-Regione

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

### Modello 3: Distribuzione Ibrida

Combina Azure OpenAI con altri servizi AI:

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

## Gestione dei Modelli

### Controllo delle Versioni

Tieni traccia delle versioni dei modelli nella configurazione AZD:

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

### Aggiornamenti dei Modelli

Usa gli hook AZD per aggiornare i modelli:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### Test A/B

Distribuisci più versioni di modelli:

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

## Considerazioni per la Produzione

### Pianificazione della Capacità

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

### Configurazione Auto-scaling

Configura l'auto-scaling per le Container Apps:

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

### Ottimizzazione dei Costi

Implementa controlli sui costi:

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

## Monitoraggio e Osservabilità

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

### Metriche Personalizzate

Tieni traccia di metriche specifiche per l'AI:

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

### Controlli di Salute

Implementa il monitoraggio dello stato dei servizi AI:

```python
# Endpoint di controllo della salute
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test connessione OpenAI
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

## Prossimi Passi

1. **Consulta la [Guida all'Integrazione con Microsoft Foundry](microsoft-foundry-integration.md)** per i modelli di integrazione dei servizi
2. **Completa il [Laboratorio Workshop AI](ai-workshop-lab.md)** per un'esperienza pratica
3. **Implementa le [Pratiche AI per la Produzione](production-ai-practices.md)** per distribuzioni aziendali
4. **Esplora la [Guida alla Risoluzione dei Problemi AI](../troubleshooting/ai-troubleshooting.md)** per problemi comuni

## Risorse

- [Disponibilità dei Modelli Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scalabilità delle Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Ottimizzazione dei Costi dei Modelli AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigazione Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [Integrazione con Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Successivo**: [Laboratorio Workshop AI](ai-workshop-lab.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->