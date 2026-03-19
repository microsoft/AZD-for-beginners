# Utekelezaji wa Modeli za AI kwa Azure Developer CLI

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Mwanzo](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo Yanayompa Kipaumbele AI
- **⬅️ Iliyotangulia**: [Muunganisho wa Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Ifuatayo**: [Maabara ya Warsha ya AI](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

Mwongozo huu unatoa maelekezo kamili kwa ajili ya kuweka modeli za AI kwa kutumia violezo vya AZD, ukifunika kila kitu kutoka kwa uchaguzi wa modeli hadi mifumo ya uenezaji kwa uzalishaji.

## Jedwali la Yaliyomo

- [Mkakati wa Uchaguzi wa Modeli](#mkakati-wa-uchaguzi-wa-modeli)
- [Usanidi wa AZD kwa Modeli za AI](#usanidi-wa-azd-kwa-modeli-za-ai)
- [Mifumo ya Utekelezaji](#mifumo-ya-utekelezaji)
- [Usimamizi wa Modeli](#usimamizi-wa-modeli)
- [Mambo ya Kuzingatia kwa Uzalishaji](#mambo-ya-kuzingatia-kwa-uzalishaji)
- [Ufuatiliaji na Uwezo wa Kuonekana](#ufuatiliaji-na-uwezo-wa-kuonekana)

## Mkakati wa Uchaguzi wa Modeli

### Modeli za Microsoft Foundry

Chagua modeli sahihi kwa matumizi yako:

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

### Mipango ya Uwezo wa Modeli

| Aina ya Modeli | Matumizi | Uwezo Unaopendekezwa | Mambo ya Gharama |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Mazungumzo, Maswali na Majibu | 10-50 TPM | Inayoweza kuendeshwa kwa gharama kwa kazi nyingi |
| gpt-4.1 | Ufikiri mgumu | 20-100 TPM | Gharama juu, tumia kwa vipengele vya kiwango cha juu |
| Text-embedding-ada-002 | Utafutaji, RAG | 30-120 TPM | Muhimu kwa utafutaji wa maana (semantic) |
| Whisper | Hotuba hadi maandishi | 10-50 TPM | Mizigo ya kazi ya usindikaji wa sauti |

## Usanidi wa AZD kwa Modeli za AI

### Usanidi wa Violezo vya Bicep

Tengeneza utoaji wa modeli kupitia violezo vya Bicep:

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

### Vigezo vya Mazingira

Sanidi mazingira ya programu yako:

```bash
# Usanidi wa .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Mifumo ya Utekelezaji

### Mfano 1: Utekelezaji wa Mkoa Mmoja

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

Inafaa kwa:
- Maendeleo na upimaji
- Programu za soko moja
- Uboreshaji wa gharama

### Mfano 2: Utekelezaji wa Mikoa Nyingi

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Inafaa kwa:
- Programu za kimataifa
- Mahitaji ya upatikanaji wa juu
- Ugawaji wa mzigo

### Mfano 3: Utekelezaji Mchanganyiko

Changanya Modeli za Microsoft Foundry na huduma zingine za AI:

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

## Usimamizi wa Modeli

### Udhibiti wa Toleo

Fuatilia toleo za modeli katika usanidi wako wa AZD:

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

### Sasisho za Modeli

Tumia hooks za AZD kwa sasisho za modeli:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### Upimaji wa A/B

Weka toleo mbalimbali za modeli:

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

## Mambo ya Kuzingatia kwa Uzalishaji

### Upangaji wa Uwezo

Hesabu uwezo unaohitajika kulingana na mifumo ya matumizi:

```python
# Mfano wa kuhesabu uwezo
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

# Mfano wa matumizi
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Usanidi wa Ukuaji wa Kiotomatiki

Sanidi ukuaji wa kiotomatiki kwa Container Apps:

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

### Uboreshaji wa Gharama

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

## Ufuatiliaji na Uwezo wa Kuonekana

### Muunganisho wa Application Insights

Sanidi ufuatiliaji kwa mizigo ya kazi za AI:

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

Fuatilia vipimo maalum vya AI:

```python
# Telemetri maalum kwa mifano ya AI
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

Tekeleza ufuatiliaji wa afya ya huduma za AI:

```python
# Miisho ya ukaguzi wa afya
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

1. **Pitia [Mwongozo wa Muunganisho wa Microsoft Foundry](microsoft-foundry-integration.md)** kwa mifumo ya muunganisho wa huduma
2. **Kamilisha [Maabara ya Warsha ya AI](ai-workshop-lab.md)** kwa uzoefu wa vitendo
3. **Tekeleza [Mazoea ya AI kwa Uzalishaji](production-ai-practices.md)** kwa uenezaji wa shirika
4. **Chunguza [Mwongozo wa Utatuzi wa Matatizo ya AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** kwa matatizo ya kawaida

## Rasilimali

- [Upatikanaji wa Modeli za Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Ukuaji wa Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Uboreshaji wa Gharama za Modeli za AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Chapter Navigation:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Mwanzo](../../README.md)
- **📖 Sura ya Sasa**: Sura 2 - Maendeleo Yanayompa Kipaumbele AI
- **⬅️ Iliyotangulia**: [Muunganisho wa Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Ifuatayo**: [Maabara ya Warsha ya AI](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kukanusha**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri zilizofanywa kiotomatiki zinaweza kuwa na makosa au kutokukamilika. Nyaraka ya awali katika lugha yake ya asili inapaswa kuzingatiwa kama chanzo cha kuaminika. Kwa taarifa muhimu, tafsiri ya kitaalamu iliyofanywa na mtafsiri wa kibinadamu inashauriwa. Sisi hatuwajibiki kwa uelewa mbaya au tafsiri potofu yoyote zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->