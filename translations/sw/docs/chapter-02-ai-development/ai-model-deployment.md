# Uwekaji wa Mfano wa AI kwa kutumia Azure Developer CLI

**Utsafirishaji wa Sura:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura Ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Iliyo kabla**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Ifuatayo**: [Semina ya AI](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Mipangilio](../chapter-03-configuration/configuration.md)

Mwongozo huu unatoa maelekezo kamili ya kuweka mifano ya AI kwa kutumia templeti za AZD, ukijumuisha kila kitu kuanzia uchaguzi wa mfano hadi mifumo ya uwekaji wa uzalishaji.

> **Kumbuka ya Uthibitisho (2026-07-13):** Mtiririko wa kazi wa AZD katika mwongozo huu ulipimwa dhidi ya `azd` `1.27.1`. Kwa uwekaji wa AI unaochukua muda zaidi kuliko dirisha la kawaida la huduma, toleo la sasa la AZD linaunga mkono `azd deploy --timeout <seconds>`.

## Jedwali la Yaliyomo

- [Mikakati ya Uchaguzi wa Mfano](#mikakati-ya-uchaguzi-wa-mfano)
- [Mipangilio ya AZD kwa Mifano ya AI](#mipangilio-ya-azd-kwa-mifano-ya-ai)
- [Mifumo ya Uwekaji](#mifumo-ya-uwekaji)
- [Usimamizi wa Mfano](#usimamizi-wa-mfano)
- [Mazingira ya Uzalishaji](#mazingira-ya-uzalishaji)
- [Ufuatiliaji na Uzingatia](#ufuatiliaji-na-uzingatia)

## Mikakati ya Uchaguzi wa Mfano

### Mifano ya Microsoft Foundry

Chagua mfano sahihi kwa matumizi yako:

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

### Mipango ya Uwezo wa Mfano

| Aina ya Mfano | Matumizi | Uwezo Unaopendekezwa | Mambo ya Gharama |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Mazungumzo, Maswali & Majibu | TPM 10-50 | Gharama nafuu kwa kazi nyingi |
| gpt-4.1 | Ufafanuzi mgumu | TPM 20-100 | Gharama kubwa, tumia kwa vipengele vya premium |
| text-embedding-3-large | Utafutaji, RAG | TPM 30-120 | Chaguo thabiti kwa utaftaji wa maana na urejeshaji |
| Whisper | Hotuba-kwenye-maandishi | TPM 10-50 | Kazi za usindikaji wa sauti |

## Mipangilio ya AZD kwa Mifano ya AI

### Mipangilio ya Templeti ya Bicep

Tengeneza uwekaji wa mifano kupitia templeti za Bicep:

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

### Mabadiliko ya Mazingira

Sanidi mazingira ya matumizi yako:

```bash
# usanidi wa .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Mifumo ya Uwekaji

### Mfumo 1: Uwekaji Kanda Moja

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

Bora kwa:
- Maendeleo na majaribio
- Programu za soko moja
- Kuboresha gharama

### Mfumo 2: Uwekaji Kanda Nyingi

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Bora kwa:
- Programu za kimataifa
- Mahitaji ya upatikanaji mkubwa
- Usambazaji wa mzigo

### Mfumo 3: Uwekaji Mchanganyiko

Changanya Mifano ya Microsoft Foundry na huduma zingine za AI:

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

## Usimamizi wa Mfano

### Udhibiti wa Matoleo

Fuata matoleo ya mfano katika mipangilio yako ya AZD:

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

### Mabadiliko ya Mfano

Tumia hooks za AZD kwa mabadiliko ya mfano:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Ikiwa usambazaji unachukua muda mrefu kuliko muda wa kawaida wa kusubiri
azd deploy --timeout 1800
```

### Upimaji wa A/B

Weka matoleo mengi ya mfano:

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

## Mazingira ya Uzalishaji

### Mipango ya Uwezo

Hesabu uwezo unaohitajika kulingana na mifumo ya matumizi:

```python
# Mfano wa hesabu ya uwezo
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

# Matumizi ya mfano
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Mipangilio ya Ukuzaji wa Kiotomatiki

Sanidi ukuzaji wa kiotomatiki kwa Container Apps:

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

### Kuboresha Gharama

Tekeleza udhibiti wa gharama:

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

## Ufuatiliaji na Uzingatia

### Muunganisho wa Application Insights

Sanidi ufuatiliaji kwa kazi za AI:

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

### Vipimo Maalum

Fuata vipimo maalum vya AI:

```python
# Telemetri maalum kwa modeli za AI
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

### Ukaguzi wa Afya

Tekeleza ufuatiliaji wa afya ya huduma ya AI:

```python
# Vikundi vya ukaguzi wa afya
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Jaribu muunganisho wa OpenAI
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

## Hatua Zifuatazo

1. **Kagua [Mwongozo wa Microsoft Foundry Integration](microsoft-foundry-integration.md)** kwa mifumo ya muunganisho wa huduma
2. **Kamilisha [Semina ya AI](ai-workshop-lab.md)** kwa uzoefu wa vitendo
3. **Tekeleza [Mazoezi ya AI ya Uzalishaji](production-ai-practices.md)** kwa uwekaji wa viwanda
4. **Chunguza [Mwongozo wa Kusuluhisha AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** kwa matatizo ya kawaida

## Rasilimali

- [Upatikanaji wa Mfano wa Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Ukuzaji wa Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Kuboresha Gharama za Mfano wa AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Utsafirishaji wa Sura:**
- **📚 Mwanzo wa Kozi**: [AZD Kwa Waanzilishi](../../README.md)
- **📖 Sura Ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Iliyo kabla**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Ifuatayo**: [Semina ya AI](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Mipangilio](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->