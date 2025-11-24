<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-24T13:08:53+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "et"
}
-->
# AI-mudeli juurutamine Azure Developer CLI abil

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine**: [Microsoft Foundry integreerimine](microsoft-foundry-integration.md)
- **➡️ Järgmine**: [AI töötoa labor](ai-workshop-lab.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

See juhend pakub põhjalikke juhiseid AI-mudelite juurutamiseks AZD mallide abil, hõlmates kõike alates mudeli valikust kuni tootmises kasutatavate juurutusmustriteni.

## Sisukord

- [Mudeli valimise strateegia](../../../../docs/ai-foundry)
- [AZD konfiguratsioon AI-mudelite jaoks](../../../../docs/ai-foundry)
- [Juurutusmustrid](../../../../docs/ai-foundry)
- [Mudelite haldamine](../../../../docs/ai-foundry)
- [Tootmisküsimused](../../../../docs/ai-foundry)
- [Jälgimine ja nähtavus](../../../../docs/ai-foundry)

## Mudeli valimise strateegia

### Azure OpenAI mudelid

Valige oma kasutusjuhtumi jaoks sobiv mudel:

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

### Mudeli võimekuse planeerimine

| Mudelitüüp | Kasutusjuhtum | Soovitatav võimekus | Kulude kaalutlused |
|------------|--------------|---------------------|--------------------|
| GPT-4o-mini | Vestlus, KKK | 10-50 TPM | Kulutõhus enamiku töökoormuste jaoks |
| GPT-4 | Keeruline arutlus | 20-100 TPM | Kõrgemad kulud, kasutage premium-funktsioonide jaoks |
| Text-embedding-ada-002 | Otsing, RAG | 30-120 TPM | Oluline semantilise otsingu jaoks |
| Whisper | Kõne tekstiks | 10-50 TPM | Helitöötluse töökoormused |

## AZD konfiguratsioon AI-mudelite jaoks

### Bicep-malli konfiguratsioon

Looge mudelite juurutused Bicep-mallide abil:

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

### Keskkonnamuutujad

Konfigureerige oma rakenduse keskkond:

```bash
# .env konfiguratsioon
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Juurutusmustrid

### Muster 1: Ühe piirkonna juurutus

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

Sobib:
- Arenduseks ja testimiseks
- Ühe turu rakendustele
- Kulude optimeerimiseks

### Muster 2: Mitme piirkonna juurutus

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Sobib:
- Globaalsed rakendused
- Kõrge kättesaadavuse nõuded
- Koormuse jaotamine

### Muster 3: Hübriidne juurutus

Kombineerige Azure OpenAI teiste AI-teenustega:

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

Jälgige mudelite versioone oma AZD konfiguratsioonis:

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

### Mudelite uuendused

Kasutage AZD hooke mudelite uuendamiseks:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B testimine

Juurutage mitu mudeliversiooni:

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

## Tootmisküsimused

### Võimekuse planeerimine

Arvutage vajalik võimekus kasutusmustrite põhjal:

```python
# Mahutavuse arvutamise näide
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

### Automaatse skaleerimise konfiguratsioon

Konfigureerige automaatne skaleerimine Container Apps jaoks:

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

### Kulude optimeerimine

Rakendage kulude kontrolli:

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

## Jälgimine ja nähtavus

### Application Insights integratsioon

Konfigureerige jälgimine AI-töökoormuste jaoks:

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

Jälgige AI-spetsiifilisi mõõdikuid:

```python
# Kohandatud telemeetria AI mudelite jaoks
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

Rakendage AI-teenuste tervise jälgimine:

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

1. **Vaadake üle [Microsoft Foundry integreerimise juhend](microsoft-foundry-integration.md)** teenuste integreerimise mustrite jaoks
2. **Lõpetage [AI töötoa labor](ai-workshop-lab.md)** praktilise kogemuse saamiseks
3. **Rakendage [Tootmise AI praktikad](production-ai-practices.md)** ettevõtte juurutuste jaoks
4. **Uurige [AI tõrkeotsingu juhendit](../troubleshooting/ai-troubleshooting.md)** levinud probleemide jaoks

## Ressursid

- [Azure OpenAI mudelite saadavus](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps skaleerimine](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI mudelite kulude optimeerimine](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine**: [Microsoft Foundry integreerimine](microsoft-foundry-integration.md)
- **➡️ Järgmine**: [AI töötoa labor](ai-workshop-lab.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->