# Uenezaji wa Mfano wa AI na Azure Developer CLI

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Iliyopita**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Ifuatayo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

Mwongozo huu unaelezea kwa kina maagizo ya kueneza mifano ya AI kwa kutumia violezo vya AZD, ukiwasha kila kitu kuanzia uteuzi wa mfano hadi mifumo ya ueneaji wa uzalishaji.

## Orodha ya Yaliyomo

- [Mkakati wa Uchaguzi wa Mfano](../../../../docs/chapter-02-ai-development)
- [Usanidi wa AZD kwa Mifano ya AI](../../../../docs/chapter-02-ai-development)
- [Mifumo ya Ueneaji](../../../../docs/chapter-02-ai-development)
- [Usimamizi wa Mfano](../../../../docs/chapter-02-ai-development)
- [Mambo ya Kuzingatia kwa Uzalishaji](../../../../docs/chapter-02-ai-development)
- [Ufuatiliaji na Uwezo wa Kuonekana](../../../../docs/chapter-02-ai-development)

## Mkakati wa Uchaguzi wa Mfano

### Mifano ya Azure OpenAI

Chagua mfano unaofaa kwa kesi yako ya matumizi:

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

### Upangaji wa Uwezo wa Mfano

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Cost-effective for most workloads |
| GPT-4 | Complex reasoning | 20-100 TPM | Higher cost, use for premium features |
| Text-embedding-ada-002 | Search, RAG | 30-120 TPM | Essential for semantic search |
| Whisper | Speech-to-text | 10-50 TPM | Audio processing workloads |

## Usanidi wa AZD kwa Mifano ya AI

### Usanidi wa Kiolezo cha Bicep

Tengeneza uenezaji wa mifano kupitia violezo vya Bicep:

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

### Vigezo vya Mazingira

Sanidi mazingira ya programu yako:

```bash
# usanidi wa .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Mifumo ya Ueneaji

### Mfumo 1: Ueneaji wa Mkoa Mmoja

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

Inafaa kwa:
- Maendeleo na upimaji
- Programu za soko moja
- Uboreshaji wa gharama

### Mfumo 2: Ueneaji wa Mikoa Mingi

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

### Mfumo 3: Ueneaji Mseto

Changanya Azure OpenAI na huduma nyingine za AI:

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

Fuata matoleo ya mifano katika usanidi wako wa AZD:

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

### Sasisho za Mfano

Tumia AZD hooks kwa sasisho za mifano:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### Upimaji A/B

Sambaza matoleo mengi ya mifano:

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

## Mambo ya Kuzingatia kwa Uzalishaji

### Upangaji wa Uwezo

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

# Mfano wa matumizi
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Usanidi wa Upanuaji Kiotomatiki

Sanidi upanuaji kiotomatiki kwa Container Apps:

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

### Uunganishaji wa Application Insights

Sanidi ufuatiliaji kwa mzigo wa kazi wa AI:

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

Fuata vipimo maalumu vya AI:

```python
# Telemetri iliyobinafsishwa kwa modeli za AI
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
# Vituo vya ukaguzi wa afya
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

1. **Pitia [Mwongozo wa Uunganishaji wa Microsoft Foundry](microsoft-foundry-integration.md)** kwa mifumo ya uunganishaji wa huduma
2. **Kamilisha [AI Workshop Lab](ai-workshop-lab.md)** kwa uzoefu wa vitendo
3. **Tekeleza [Mbinu za AI za Uzalishaji](production-ai-practices.md)** kwa ueneaji wa kampuni
4. **Chunguza [Mwongozo wa Utatuzi wa AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** kwa matatizo ya kawaida

## Rasilimali

- [Upatikanaji wa Mifano ya Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Upanuaji wa Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Uboreshaji wa Gharama za Mfano wa AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Uvinjari wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD For Beginners](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya Kwanza ya AI
- **⬅️ Iliyopita**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Ifuatayo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura 3: Usanidi](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Onyo:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator] (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nyaraka ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inashauriwa kutumia tafsiri ya kitaalamu iliyofanywa na mtaalamu wa binadamu. Hatuwajibiki kwa kutoelewana au tafsiri mbaya zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->