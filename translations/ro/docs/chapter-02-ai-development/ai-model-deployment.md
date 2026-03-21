# Implementarea Modelului AI cu Azure Developer CLI

**Navigarea capitolului:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Anterior**: [Integrare Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Următor**: [Laborator AI Workshop](ai-workshop-lab.md)
- **🚀 Capitol Următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

Acest ghid oferă instrucțiuni complete pentru implementarea modelelor AI folosind șabloane AZD, acoperind totul de la selecția modelului până la tiparele de implementare în producție.

## Cuprins

- [Strategia de Selecție a Modelului](#strategia-de-selecție-a-modelului)
- [Configurarea AZD pentru Modelele AI](#configurarea-azd-pentru-modelele-ai)
- [Tipare de Implementare](#tipare-de-implementare)
- [Managementul Modelului](#managementul-modelului)
- [Considerații pentru Producție](#considerații-pentru-producție)
- [Monitorizare și Observabilitate](#monitorizare-și-observabilitate)

## Strategia de Selecție a Modelului

### Modele Microsoft Foundry

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

### Planificarea Capacității Modelului

| Tip Model | Caz de Utilizare | Capacitate Recomandată | Considerații de Cost |
|-----------|------------------|-----------------------|---------------------|
| gpt-4.1-mini | Chat, Întrebări & Răspunsuri | 10-50 TPM | Rentabil pentru majoritatea sarcinilor |
| gpt-4.1 | Raționament complex | 20-100 TPM | Cost mai mare, folosit pentru funcții premium |
| Text-embedding-ada-002 | Căutare, RAG | 30-120 TPM | Esențial pentru căutare semantică |
| Whisper | Transcriere vorbire | 10-50 TPM | Sarcini de procesare audio |

## Configurarea AZD pentru Modelele AI

### Configurarea Șablonului Bicep

Creează implementări ale modelului prin șabloane Bicep:

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

### Variabile de Mediu

Configurează mediul aplicației tale:

```bash
# configurație .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Tipare de Implementare

### Tiparul 1: Implementare într-o singură regiune

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

Cel mai potrivit pentru:
- Dezvoltare și testare
- Aplicații pentru o singură piață
- Optimizare a costurilor

### Tiparul 2: Implementare multi-regiune

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Cel mai potrivit pentru:
- Aplicații globale
- Cerințe ridicate de disponibilitate
- Distribuția încărcării

### Tiparul 3: Implementare Hibridă

Combină modelele Microsoft Foundry cu alte servicii AI:

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

## Managementul Modelului

### Controlul Versiunilor

Urmărește versiunile modelului în configurația AZD:

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

### Actualizări ale Modelului

Folosește hook-uri AZD pentru actualizările modelului:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### Testare A/B

Implementarea mai multor versiuni ale modelului:

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

## Considerații pentru Producție

### Planificarea Capacității

Calculează capacitatea necesară în funcție de modelele de utilizare:

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

### Configurarea Auto-scalării

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

### Optimizarea Costurilor

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

## Monitorizare și Observabilitate

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

### Metrice Personalizate

Urmărește metrice specifice AI:

```python
# Telemetrie personalizată pentru modelele AI
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

### Verificări de Sănătate

Implementează monitorizarea stării serviciilor AI:

```python
# Puncte finale pentru verificarea sănătății
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

## Pașii Următori

1. **Revizuiește [Ghidul de Integrare Microsoft Foundry](microsoft-foundry-integration.md)** pentru tipare de integrare a serviciilor
2. **Finalizează [Laboratorul AI Workshop](ai-workshop-lab.md)** pentru experiență practică
3. **Implementează [Practici AI pentru Producție](production-ai-practices.md)** pentru implementări enterprise
4. **Explorează [Ghidul AI de Remediere a Problemelor](../chapter-07-troubleshooting/ai-troubleshooting.md)** pentru probleme comune

## Resurse

- [Disponibilitatea Modelului Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scalarea Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimizarea Costurilor Model AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigarea capitolului:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Anterior**: [Integrare Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Următor**: [Laborator AI Workshop](ai-workshop-lab.md)
- **🚀 Capitol Următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite ce pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->