# Azure Developer CLI ഉപയോഗിച്ച് AI മോഡൽ വിന്യസനം

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 Course Home**: [AZD ആരംഭക്കാർക്ക്](../../README.md)
- **📖 Current Chapter**: അധ്യായം 2 - AI-പ്രഥമ വികസനം
- **⬅️ Previous**: [Microsoft Foundry ഇന്റഗ്രേഷൻ](microsoft-foundry-integration.md)
- **➡️ Next**: [AI വർക്ക്‌ഷോപ്പ് ലാബ്](ai-workshop-lab.md)
- **🚀 Next Chapter**: [അധ്യായം 3: ക്രമീകരണം](../chapter-03-configuration/configuration.md)

ഈ ഗൈഡ് AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് AI മോഡലുകൾ വിന്യസിക്കുന്നതിന് സംബന്ധിച്ച സമഗ്ര നിർദ്ദേശങ്ങൾ നൽകുന്നു, മോഡൽ തിരഞ്ഞെടുപ്പു മുതൽ പ്രോഡക്ഷൻ വിന്യാസ മാതൃകകളിലേക്ക് എല്ലാം ഉൾക്കൊള്ളുന്നു.

## Table of Contents

- [മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം](../../../../docs/chapter-02-ai-development)
- [AI മോഡലുകൾക്കുള്ള AZD ക്രമീകരണം](../../../../docs/chapter-02-ai-development)
- [വിന്യാസ മാതൃകകൾ](../../../../docs/chapter-02-ai-development)
- [മോഡൽ മാനേജ്‌മെന്റ്](../../../../docs/chapter-02-ai-development)
- [ഉൽപ്പാദനം സംബന്ധിച്ച പരിഗണനകൾ](../../../../docs/chapter-02-ai-development)
- [നിരീക്ഷണവും ദൃശ്യക്ഷമതയും](../../../../docs/chapter-02-ai-development)

## Model Selection Strategy

### Azure OpenAI Models

ഉപയോഗ കേസിനുങ്ങുത്തമാണമായ മോഡൽ തിരഞ്ഞെടുക്കുക:

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

### Model Capacity Planning

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | ചാറ്റ്, Q&A | 10-50 TPM | കൂടുതലായ പ്രയോഗങ്ങൾക്ക് ചെലവ്-ഫലപ്രദം |
| GPT-4 | സങ്കീർണ ആലോചന | 20-100 TPM | ഉയർന്ന ചെലവ്, പ്രീമിയം സവിശേഷതകൾക്കായി ഉപയോഗിക്കുക |
| Text-embedding-ada-002 | തിരയൽ, RAG | 30-120 TPM | സെമാന്റിക് തിരയലിന് അനിവാര്യമാണ് |
| Whisper | ശബ്ദം-ടെക്സ്റ്റ് | 10-50 TPM | ഓഡിയോ പ്രോസസ്സിംഗ് ജോലികൾക്ക് അനുയോജ്യം |

## AZD Configuration for AI Models

### Bicep Template Configuration

Bicep ടെംപ്ലേറ്റുകൾ വഴി മോഡൽ വിന്യാസങ്ങൾ സൃഷ്ടിക്കുക:

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

### Environment Variables

നിങ്ങളുടെ ആപ്ലിക്കേഷൻ പരിസ്ഥിതിയെ കോൺഫിഗർ ചെയ്യുക:

```bash
# .env ക്രമീകരണം
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Deployment Patterns

### Pattern 1: Single-Region Deployment

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

ഉത്തമമാണ്:
- വികസനവും ടെസ്റ്റിംഗും
- ഒരു മാര്‍ക്കറ്റിനുള്ള അപ്ലിക്കേഷനുകൾ
- ചെലവ് ഓപ്ടിമൈസേഷൻ

### Pattern 2: Multi-Region Deployment

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ഉത്തമമാണ്:
- ഗ്ലോബൽ അപ്ലിക്കേഷനുകൾ
- ഉയർന്ന ലഭ്യത ആവശ്യകതകൾ
- ഭാരം വിതരണം

### Pattern 3: Hybrid Deployment

Azure OpenAI മറ്റ് AI സേവനങ്ങളുമായി സംയോജിപ്പിക്കുക:

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

### Version Control

AZD കോൺഫിഗറേഷനിൽ മോഡൽ വേർഷനുകൾ ട്രാക്ക് ചെയ്യുക:

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

### Model Updates

മോഡൽ അപ്ഡേറ്റുകൾക്കായി AZD ഹുക്കുകൾ ഉപയോഗിക്കുക:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B Testing

பல മോഡൽ വേർഷനുകൾ വിന്യസിക്കുക:

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

## Production Considerations

### Capacity Planning

ഉപയോഗ നെയ്റ്റേണുകൾ അടിസ്ഥാനമാക്കി ആവശ്യമായ ശേഷി കണക്കാക്കുക:

```python
# ക്ഷമത കണക്കാക്കലിന്റെ ഉദാഹരണം
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

# ഉപയോഗത്തിന്റെ ഉദാഹരണം
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-scaling Configuration

Container Apps-നായി ഓട്ടോ-സ്കെയ്ലിംഗ് കോൺഫിഗർ ചെയ്യുക:

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

### Cost Optimization

ചെലവ് നിയന്ത്രണങ്ങൾ നടപ്പിലാക്കുക:

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

### Application Insights Integration

AI ജോലികളിലെ നിരീക്ഷണത്തിനായി കോൺഫിഗർ ചെയ്യുക:

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

### Custom Metrics

AI-സ്പെസിഫിക് മെട്രിക്‌സുകൾ ട്രാക്ക് ചെയ്യുക:

```python
# എഐ മോഡലുകൾക്കുള്ള ഇഷ്‌ടാനുസൃത ടെലിമെട്രി
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

### Health Checks

AI സേവനങ്ങളുടെ ആരോഗ്യ നിരീക്ഷണം നടപ്പിലാക്കുക:

```python
# ആരോഗ്യ പരിശോധന എൻഡ്‌പോയിന്റുകൾ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ബന്ധം പരീക്ഷിക്കുക
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

## Next Steps

1. **അവലോകനം ചെയ്യുക [Microsoft Foundry ഇന്റഗ്രേഷൻ ഗൈഡ്](microsoft-foundry-integration.md)** സേവന സംയോജന മാതൃകകൾക്കായി
2. **പൂർത്തിയാക്കുക [AI വർക്ക്‌ഷോപ്പ് ലാബ്](ai-workshop-lab.md)** പ്രായോഗിക അനുഭവത്തിനായി
3. **നടപ്പിലാക്കുക [ഉൽപ്പാദന AI പ്രാക്ടീസുകൾ](production-ai-practices.md)** എന്റർപ്രൈസ് വിന്യാസങ്ങൾക്കായി
4. **പരിശോധിക്കുക [AI പ്രശ്നപരിഹാര ഗൈഡ്](../chapter-07-troubleshooting/ai-troubleshooting.md)** സാധാരണ പ്രശ്നങ്ങൾക്ക്

## Resources

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 Course Home**: [AZD ആരംഭക്കാർക്ക്](../../README.md)
- **📖 Current Chapter**: അധ്യായം 2 - AI-പ്രഥമ വികസനം
- **⬅️ Previous**: [Microsoft Foundry ഇന്റഗ്രേഷൻ](microsoft-foundry-integration.md)
- **➡️ Next**: [AI വർക്ക്‌ഷോപ്പ് ലാബ്](ai-workshop-lab.md)
- **🚀 Next Chapter**: [അധ്യായം 3: ക്രമീകരണം](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ഡിസ്ക്ലെയിമർ:

ഈ രേഖ AI വിവർത്തന സേവനമായ Co-op Translator (https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. നാം കൃത്യതയ്ക്കായി ശ്രമിച്ചെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിശകുകൾ അല്ലെങ്കിൽ അക്കുറത്വങ്ങൾ ഉണ്ടാകാവുന്നതാണ് എന്ന点 ദയവായി ശ്രദ്ധിക്കുക. മാതൃഭാഷയിലെ മൂലരേഖയെ അധികാരപരമായ സ്രോതസ്സായി കരുതണം. നിർണായകമായ വിവരങ്ങൾക്കായി പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യപ്പെടുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കുമേൽ ഞങ്ങൾ ഉത്തരവാദികളാകില്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->