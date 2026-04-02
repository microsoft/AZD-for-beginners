# Implementarea modelelor AI cu Azure Developer CLI

**Navigare capitol:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare axată pe AI
- **⬅️ Anterior**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Următor**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

Acest ghid oferă instrucțiuni cuprinzătoare pentru implementarea modelelor AI folosind șabloane AZD, acoperind totul, de la selecția modelului până la tiparele de implementare în producție.

> **Notă de validare (2026-03-25):** Fluxul de lucru AZD din acest ghid a fost verificat cu `azd` `1.23.12`. Pentru implementările AI care durează mai mult decât fereastra implicită de implementare a serviciului, versiunile curente AZD acceptă `azd deploy --timeout <seconds>`.

## Cuprins

- [Strategia de selecție a modelului](#strategia-de-selecție-a-modelului)
- [Configurarea AZD pentru modele AI](#configurarea-azd-pentru-modele-ai)
- [Tipare de implementare](#tipare-de-implementare)
- [Gestionarea modelelor](#gestionarea-modelelor)
- [Considerații pentru producție](#considerații-pentru-producție)
- [Monitorizare și observabilitate](#monitorizare-și-observabilitate)

## Strategia de selecție a modelului

### Modele Microsoft Foundry Modele

Alegeți modelul potrivit pentru cazul dvs. de utilizare:

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

### Planificarea capacității modelului

| Tip model | Caz de utilizare | Capacitate recomandată | Considerații privind costurile |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Întrebări și Răspunsuri | 10-50 TPM | Rentabil pentru majoritatea sarcinilor |
| gpt-4.1 | Raționament complex | 20-100 TPM | Cost mai mare, folosiți pentru funcționalități premium |
| text-embedding-3-large | Căutare, RAG | 30-120 TPM | Alegere implicită puternică pentru căutare semantică și recuperare |
| Whisper | Speech-to-text | 10-50 TPM | Sarcini de procesare audio |

## Configurarea AZD pentru modele AI

### Configurare șablon Bicep

Creați implementări de modele prin șabloane Bicep:

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

### Variabile de mediu

Configurați mediul aplicației:

```bash
# configurare .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Tipare de implementare

### Modelul 1: Implementare într-o singură regiune

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

Potrivit pentru:
- Dezvoltare și testare
- Aplicații pentru o singură piață
- Optimizare a costurilor

### Modelul 2: Implementare multi-regiune

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Potrivit pentru:
- Aplicații globale
- Cerințe de disponibilitate ridicată
- Distribuirea încărcării

### Modelul 3: Implementare hibridă

Combinați Modele Microsoft Foundry cu alte servicii AI:

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

## Gestionarea modelelor

### Controlul versiunilor

Urmăriți versiunile modelelor în configurația AZD:

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

### Actualizări ale modelului

Utilizați hook-urile AZD pentru actualizările modelelor:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Dacă implementarea durează mai mult decât timpul de expirare implicit
azd deploy --timeout 1800
```

### Testare A/B

Implementați mai multe versiuni ale modelului:

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

## Considerații pentru producție

### Planificarea capacității

Calculați capacitatea necesară pe baza tiparelor de utilizare:

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

### Configurare auto-scalare

Configurați auto-scalarea pentru Container Apps:

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

Implementați controale de cost:

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

### Integrare Application Insights

Configurați monitorizarea pentru sarcinile AI:

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

Urmăriți metrice specifice AI:

```python
# Telemetrie personalizată pentru modele de inteligență artificială
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

Implementați monitorizarea stării serviciilor AI:

```python
# Endpoint-uri pentru verificarea stării
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Testează conexiunea la OpenAI
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

## Pașii următori

1. **Revizuiți [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** pentru tipare de integrare a serviciilor
2. **Finalizați [AI Workshop Lab](ai-workshop-lab.md)** pentru experiență practică
3. **Implementați [Practici AI pentru producție](production-ai-practices.md)** pentru implementări enterprise
4. **Explorați [Ghidul de depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** pentru probleme comune

## Resurse

- [Disponibilitatea modelelor Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scalarea Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimizarea costurilor modelelor AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigare capitol:**
- **📚 Pagina cursului**: [AZD pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare axată pe AI
- **⬅️ Anterior**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Următor**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă o traducere profesională realizată de un traducător uman. Nu ne asumăm răspunderea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->