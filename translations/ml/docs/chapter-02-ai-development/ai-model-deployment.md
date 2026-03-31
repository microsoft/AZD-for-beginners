# AI മോഡൽ ഡിപ്പ്ലോയ്മെന്റ് with Azure Developer CLI

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അധ്യായം**: അധ്യായം 2 - AI-ഫസ്റ്റ് ഡെവലപ്പ്‌മെന്റ്
- **⬅️ മുമ്പ്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് AI മോഡലുകൾ ഡിപ്പ്ലോയ്മെന്റ് ചെയ്യുന്നതിനുള്ള സമഗ്ര മാർഗ്ഗനിർദ്ദേശങ്ങൾ നൽകിയതാണ് ഈ ഗൈഡ്, മോഡൽ തിരഞ്ഞെടുപ്പ് മുതൽ പ്രൊഡക്ഷൻ ഡിപ്പ്ലോയ്മെന്റ് പാറ്റേണുകൾ വരെ എല്ലാം ഉൾപ്പെട്ടതാണ്.

## ഉള്ളടക്കങ്ങൾ

- [മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം](#മോഡൽ-തിരഞ്ഞെടുപ്പ്-തന്ത്രം)
- [AI മോഡലുകൾക്ക് AZD കോൺഫിഗറേഷൻ](#ai-മോഡലുകൾക്കുള്ള-azd-കോൺഫിഗറേഷൻ)
- [ഡിപ്പ്ലോയ്മെന്റ് പാറ്റേണുകൾ](#ഡിപ്പ്ലോയ്മെന്റ്-പാറ്റേണുകൾ)
- [മോഡൽ മാനേജ്മെന്റ്](#മോഡൽ-മാനേജ്മെന്റ്)
- [പ്രൊഡക്ഷൻ പരിഗണനകൾ](#പ്രൊഡക്ഷൻ-പരിഗണനകൾ)
- [മോണിറ്ററിംഗ് & അവബോധം](#മോണിറ്ററിംഗ്-അവബോധം)

## മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം

### Microsoft Foundry മോഡലുകൾ

നിങ്ങളുടെ ഉപയോഗത്തിനായി ശരിയായ മോഡൽ തിരഞ്ഞെടുക്കുക:

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

### മോഡൽ ശേഷി പദ്ധതി

| മോഡൽ തരം | ഉപയോഗ കേസ് | ശിപാർശ ചെയ്ത ശേഷി | ചെലവ് പരിഗണനകൾ |
|------------|------------|---------------------|-------------------|
| gpt-4.1-mini | ചാറ്റ്, Q&A | 10-50 TPM | ഭൂരിഭാഗം വർക്ക്‌ലോഡുകൾക്ക് ചെലവ് കാര്യക്ഷമം |
| gpt-4.1 | സങ്കീർണ്ണമായ നിലവിളി | 20-100 TPM | ഉയർന്ന ചെലവ്, പ്രിമിയം ഫീച്ചറുകൾക്ക് ഉപയോഗിക്കുക |
| Text-embedding-ada-002 | സെർച്ച്, RAG | 30-120 TPM | സെമാന്റിക് സെർച്ചിന് ആവശ്യമാണ് |
| Whisper | സ്പീച്ച്-ടു-ടെക്സ്റ്റ് | 10-50 TPM | ഓഡിയോ പ്രോസസ്സിംഗ് വർക്ക്ലോഡുകൾ |

## AI മോഡലുകൾക്കുള്ള AZD കോൺഫിഗറേഷൻ

### Bicep ടെംപ്ലേറ്റ് കോൺഫിഗറേഷൻ

Bicep ടെംപ്ലേറ്റുകൾ മുഖേന മോഡൽ ഡിപ്പ്ലോയ്മെന്റുകൾ സൃഷ്ടിക്കുക:

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

### എന്റർവയോൺമെന്റ് വേരിയബിളുകൾ

നിങ്ങളുടെ ആപ്പ്ലിക്കേഷൻ പരിസ്ഥിതി കോൺഫിഗർ ചെയ്യുക:

```bash
# .env കോൺഫിഗറേഷൻ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ഡിപ്പ്ലോയ്മെന്റ് പാറ്റേണുകൾ

### പാറ്റേൺ 1: സിങ്കിൾ-റിയോണൽ ഡിപ്പ്ലോയ്മെന്റ്

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

ഉത്തമം:
- ഡെവലപ്പ്‌മെന്റ് & ടെസ്റ്റിംഗ്
- സിങ്കിൾ-മാർക്കറ്റ് ആപ്പ്ലിക്കേഷനുകൾ
- ചെലവ് അനുകൂലീകരണം

### പാറ്റേൺ 2: മൾട്ടി-റിയോണൽ ഡിപ്പ്ലോയ്മെന്റ്

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ഉത്തമം:
- ഗ്ലോബൽ ആപ്പ്ലിക്കേഷനുകൾ
- ഉയർന്ന ലഭ്യത ആവശ്യങ്ങൾ
- ലോഡ് വിതരണ നിയന്ത്രണം

### പാറ്റേൺ 3: ഹൈബ്രിഡ് ഡിപ്പ്ലോയ്മെന്റ്

Microsoft Foundry മോഡലുകളും മറ്റ് AI സേവനങ്ങളും സംയോജിപ്പിക്കുക:

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

## മോഡൽ മാനേജ്മെന്റ്

### വേർഷൻ കൺട്രോൾ

നിങ്ങളുടെ AZD കോൺഫിഗറന്സിൽ മോഡൽ വേർഷനുകൾ നിരീക്ഷിക്കുക:

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

### മോഡൽ അപ്ഡേറ്റുകൾ

AZD ഹുക്കുകൾ മോഡൽ അപ്ഡേറ്റുകൾക്കായി ഉപയോഗിക്കുക:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B ടെസ്റ്റിംഗ്

പല മോഡൽ വേർഷനുകളും ഡിപ്പ്ലോയ് ചെയ്യുക:

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

## പ്രൊഡക്ഷൻ പരിഗണനകൾ

### ശേഷി പദ്ധതി

ഉപയോഗ പാറ്റേണുകൾ അടിസ്ഥാനമാക്കി ആവശ്യമായ ശേഷിയൊരുക്കുക:

```python
# ശേഷി കണക്കാക്കൽ ഉദാഹരണം
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

# ഉദാഹരണ ഉപയോഗം
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ഓട്ടോ-സ്കെയിലിങ് കോൺഫിഗറേഷൻ

കണ്ടെയ്‌നർ ആപ്പുകൾക്കായി ഓട്ടോ-സ്കെയിലിങ് ക്രമീകരിക്കുക:

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

### ചെലവ് അനുകൂലീകരണം

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

## മോണിറ്ററിംഗ് & അവബോധം

### ആപ്പ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ

AI വർക്ക്ലോഡുകൾക്കുള്ള നിരീക്ഷണം ക്രമീകരിക്കുക:

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

### കസ്റ്റം മെട്രിക്സ്

AI പ്രത്യേക മെട്രിക്‌സുകൾ നിരീക്ഷിക്കുക:

```python
# എഐ മോഡലുകൾക്കായുള്ള കസ്റ്റം ടെലിമെട്രി
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

### ഹെൽത്ത് ചെക്കുകൾ

AI സേവനങ്ങളുടെ ഹെൽത്ത് മോണിറ്ററിംഗ് നടപ്പിലാക്കുക:

```python
# ആരോഗ്യം പരിശോധിക്കുന്ന എൻഡ്‌പോയിന്റുകൾ
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

## അടുത്ത ഘട്ടങ്ങൾ

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** സേവന ഇന്റഗ്രേഷൻ പാറ്റേണുകൾ അവലോകനം ചെയ്യുക
2. **[AI Workshop Lab](ai-workshop-lab.md)** ഹാൻഡ്സ്-ഓൺ അനുഭവത്തിനായി പൂര്‍ത്തിയാക്കുക
3. **[Production AI Practices](production-ai-practices.md)** എന്റർപ്രൈസ് ഡിപ്പ്ലോയ്മെന്റുകൾക്കായി നടപ്പിലാക്കുക
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** സാധാരണ പ്രശ്നങ്ങൾക്കായി പഠനം നടത്തുക

## റിസോഴ്സുകൾ

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 ഇപ്പോഴത്തെ അധ്യായം**: അധ്യായം 2 - AI-ഫസ്റ്റ് ഡെവലപ്പ്‌മെന്റ്
- **⬅️ മുമ്പ്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ഡി‌സ്‌ക്ലെയിമർ**:  
ഈ ഡോക്യുമെന്റ് AI വിവർത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതക്ക് ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയം പ്രവർത്തിക്കുന്ന വിവർത്തനങ്ങളിൽ പിശകുകൾ അല്ലെങ്കിൽ തെറ്റുകൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ടെന്ന് ദയവായി ശ്രദ്ധിക്കുക. മാതൃഭാഷയിലുള്ള ഒറിജിനൽ ഡോക്യുമെന്റാണ് പ്രാമാണികമായ സ്രോതസ്സ് ആയി കണക്കാക്കേണ്ടത്. നിർണ്ണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മാനുഷിക വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ചതിലൂടെയുണ്ടാകുന്ന വെറും തെറ്റായ മനസിലാക്കലുകൾക്കോ തെറ്റായി വ്യാഖ്യാനിക്കലുകൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->