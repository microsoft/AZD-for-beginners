<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-23T17:00:18+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "ro"
}
-->
# Implementarea modelelor AI cu Azure Developer CLI

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Precedent**: [Integrarea Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Următor**: [Laborator Workshop AI](ai-workshop-lab.md)
- **🚀 Capitol Următor**: [Capitolul 3: Configurare](../getting-started/configuration.md)

Acest ghid oferă instrucțiuni detaliate pentru implementarea modelelor AI utilizând șabloane AZD, acoperind totul de la selecția modelului până la tiparele de implementare în producție.

## Cuprins

- [Strategia de selecție a modelului](../../../../docs/ai-foundry)
- [Configurarea AZD pentru modele AI](../../../../docs/ai-foundry)
- [Tipare de implementare](../../../../docs/ai-foundry)
- [Managementul modelelor](../../../../docs/ai-foundry)
- [Considerații pentru producție](../../../../docs/ai-foundry)
- [Monitorizare și observabilitate](../../../../docs/ai-foundry)

## Strategia de selecție a modelului

### Modele Azure OpenAI

Alege modelul potrivit pentru cazul tău de utilizare:

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

### Planificarea capacității modelului

| Tip Model | Caz de Utilizare | Capacitate Recomandată | Considerații de Cost |
|-----------|------------------|------------------------|-----------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Rentabil pentru majoritatea sarcinilor |
| GPT-4 | Raționament complex | 20-100 TPM | Cost mai ridicat, utilizare pentru funcții premium |
| Text-embedding-ada-002 | Căutare, RAG | 30-120 TPM | Esențial pentru căutare semantică |
| Whisper | Speech-to-text | 10-50 TPM | Sarcini de procesare audio |

## Configurarea AZD pentru modele AI

### Configurarea șablonului Bicep

Creează implementări de modele prin șabloane Bicep:

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

### Variabile de mediu

Configurează mediul aplicației tale:

```bash
# Configurarea .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Tipare de implementare

### Tipar 1: Implementare într-o singură regiune

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

Ideal pentru:
- Dezvoltare și testare
- Aplicații pentru o singură piață
- Optimizare costuri

### Tipar 2: Implementare multi-regiune

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Ideal pentru:
- Aplicații globale
- Cerințe de disponibilitate ridicată
- Distribuție a sarcinii

### Tipar 3: Implementare hibridă

Combină Azure OpenAI cu alte servicii AI:

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

## Managementul modelelor

### Controlul versiunilor

Urmărește versiunile modelelor în configurația AZD:

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

### Actualizări ale modelului

Utilizează hook-uri AZD pentru actualizări ale modelului:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### Testare A/B

Implementează mai multe versiuni ale modelului:

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

## Considerații pentru producție

### Planificarea capacității

Calculează capacitatea necesară pe baza tiparelor de utilizare:

```python
# Exemplu de calcul al capacității
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

# Exemplu de utilizare
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Configurarea auto-scalării

Configurează auto-scalarea pentru Container Apps:

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

### Optimizarea costurilor

Implementează controale de cost:

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

## Monitorizare și observabilitate

### Integrarea Application Insights

Configurează monitorizarea pentru sarcinile AI:

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

### Metrice personalizate

Urmărește metrici specifice AI:

```python
# Telemetrie personalizată pentru modele AI
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

### Verificări de sănătate

Implementează monitorizarea sănătății serviciilor AI:

```python
# Puncte de verificare a stării de sănătate
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Testează conexiunea OpenAI
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

## Pași următori

1. **Revizuiește [Ghidul de Integrare Microsoft Foundry](microsoft-foundry-integration.md)** pentru tipare de integrare a serviciilor
2. **Completează [Laboratorul Workshop AI](ai-workshop-lab.md)** pentru experiență practică
3. **Implementează [Practici AI pentru Producție](production-ai-practices.md)** pentru implementări la nivel de întreprindere
4. **Explorează [Ghidul de Depanare AI](../troubleshooting/ai-troubleshooting.md)** pentru probleme comune

## Resurse

- [Disponibilitatea modelelor Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scalarea Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimizarea costurilor modelelor AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Precedent**: [Integrarea Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Următor**: [Laborator Workshop AI](ai-workshop-lab.md)
- **🚀 Capitol Următor**: [Capitolul 3: Configurare](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->