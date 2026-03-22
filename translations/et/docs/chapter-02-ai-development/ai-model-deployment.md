# Tehisintellekti mudeli juurutamine Azure Developer CLI-ga

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Hetke peatükk**: Peatükk 2 - AI-esimene arendus
- **⬅️ Eelmine**: [Microsoft Foundry integratsioon](microsoft-foundry-integration.md)
- **➡️ Järgmine**: [AI töötuba](ai-workshop-lab.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfigureerimine](../chapter-03-configuration/configuration.md)

See juhend annab põhjalikud juhised AI mudelite juurutamiseks, kasutades AZD malle, hõlmates kõike mudeli valikust kuni tootmises juurutamise mustriteni.

## Sisukord

- [Mudeli valiku strateegia](../../../../docs/chapter-02-ai-development)
- [AZD konfiguratsioon AI mudelitele](../../../../docs/chapter-02-ai-development)
- [Juurutamise mustrid](../../../../docs/chapter-02-ai-development)
- [Mudelite haldamine](../../../../docs/chapter-02-ai-development)
- [Tootmise kaalutlused](../../../../docs/chapter-02-ai-development)
- [Jälgimine ja jälgitavus](../../../../docs/chapter-02-ai-development)

## Mudeli valiku strateegia

### Microsoft Foundry mudelid

Valige oma kasutusjuhtumile sobiv mudel:

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

### Mudeli mahtude planeerimine

| Mudeli tüüp | Kasutusjuhtum | Soovitatud maht | Kulude kaalutlused |
|------------|--------------|----------------|-------------------|
| gpt-4.1-mini | Vestlus, K&A | 10-50 TPM | Kuluefektiivne enamikele töökoormustele |
| gpt-4.1 | Kompleksne järeldus | 20-100 TPM | Kõrgem hind, kasutamiseks premium-funktsioonidel |
| Text-embedding-ada-002 | Otsing, RAG | 30-120 TPM | Oluline semantilises otsingus |
| Whisper | Kõnest tekstiks | 10-50 TPM | Helitöötluse töökoormused |

## AZD konfiguratsioon AI mudelite jaoks

### Bicep malli konfiguratsioon

Loo mudeli juurutused läbi Bicep mallide:

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

### Keskkonnamuutujad

Seadista oma rakenduse keskkond:

```bash
# .env konfiguratsioon
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Juurutamise mustrid

### Muster 1: Ühe regiooniga juurutamine

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

Parim kasutamiseks:
- Arendus ja testimine
- Ühe turu rakendused
- Kulude optimeerimine

### Muster 2: Mitme regiooniga juurutamine

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Parim kasutamiseks:
- Globaalsetele rakendustele
- Kõrge töökindluse nõudmistega
- Koormuse jaotamiseks

### Muster 3: Hübriidjuurutamine

Kombineeri Microsoft Foundry mudelid teiste AI teenustega:

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

## Mudelite haldamine

### Versioonihaldus

Jälgi mudeli versioone oma AZD konfiguratsioonis:

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

### Mudeli uuendused

Kasuta AZD konksusid mudeli uuendusteks:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B testimine

Juuruta mitu mudeliversiooni:

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

## Tootmise kaalutlused

### Mahu planeerimine

Arvuta vajalik maht kasutusmustrite alusel:

```python
# Näide võimsuse arvutamisest
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

# Näidis kasutus
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Automaatse skaaleerimise konfiguratsioon

Seadista konteinerirakenduste automaatne skaleerimine:

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

### Kulu optimeerimine

Rakenda kulukontroll:

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

## Jälgimine ja jälgitavus

### Application Insights integratsioon

Seadista AI töökoormuste jälgimine:

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

### Kohandatud mõõdikud

Jälgi AI-spetsiifilisi mõõdikuid:

```python
# Kohandatud telemeetria tehisintellekti mudelite jaoks
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

### Tervisekontrollid

Rakenda AI teenuste tervisekontroll:

```python
# Tervisekontrolli lõpp-punktid
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Testi OpenAI ühendust
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

## Järgmised sammud

1. **Vaata üle [Microsoft Foundry integreerimise juhend](microsoft-foundry-integration.md)** teenuse integreerimise mustrite jaoks
2. **Läbi [AI töötuba](ai-workshop-lab.md)** praktilise kogemuse saamiseks
3. **Rakenda [Tootmise AI praktikaid](production-ai-practices.md)** ettevõtte juurutusteks
4. **Uuri [AI tõrkeotsingu juhendit](../chapter-07-troubleshooting/ai-troubleshooting.md)** levinud probleemide lahendamiseks

## Ressursid

- [Microsoft Foundry mudelite mudelite saadavus](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Konteinerirakenduste skaleerimine](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI mudelite kulude optimeerimine](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Hetke peatükk**: Peatükk 2 - AI-esimene arendus
- **⬅️ Eelmine**: [Microsoft Foundry integratsioon](microsoft-foundry-integration.md)
- **➡️ Järgmine**: [AI töötuba](ai-workshop-lab.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfigureerimine](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüame täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud arusaamatuste ega väärinterpretatsioonide eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->