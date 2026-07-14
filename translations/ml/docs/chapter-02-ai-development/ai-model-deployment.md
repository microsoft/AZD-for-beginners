# Azure Developer CLI ഉപയോഗിച്ച് AI മോഡൽ വിന്യാസം

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 2 - AI-ഫസ്റ്റ് ഡെവലപ്പ്മെന്റ്
- **⬅️ മുമ്പിലുള്ളത്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

ഈ ഗൈഡ് AI മോഡലുകൾ വിന്യസിക്കുന്നതിന് AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ചുള്ള സമഗ്രമായ നിർദ്ദേശങ്ങൾ നൽകുന്നു, മോഡൽ തിരഞ്ഞെടുപ്പിൽ നിന്നും പ്രൊഡക്ഷൻ വിന്യാസ മാതൃകകളിലേക്കും ഒന്ന് എല്ലാവിധവും ഉൾക്കൊള്ളിക്കുന്നു.

> **തിരുത്തൽ കുറിപ്പ് (2026-07-13):** ഈ മാർഗ്ഗരേഖയിലെ AZD പ്രവൃത്തി പ്രവൃത്തി azd 1.27.1 പതിപ്പുമായി പരിശോധിച്ചു. മുൻകൂർ സേവനം വിന്യാസ സമയം വിട്ടുകൂടിയ AI വിന്യാസങ്ങൾക്ക് നിലവിലെ AZD റിലിസുകൾ `azd deploy --timeout <seconds>` പിന്തുണയ്ക്കുന്നു.

## ഉള്ളടക്ക പട്ടിക

- [മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം](#മോഡൽ-തിരഞ്ഞെടുപ്പ്-തന്ത്രം)
- [AI മോഡലുകളുടെ AZD കോൺഫിഗറേഷൻ](#ai-മോഡലുകൾക്കുള്ള-azd-കോൺഫിഗറേഷൻ)
- [വിന്യാസ മാതൃകകൾ](#വിന്യാസ-മാതൃകകൾ)
- [മോഡൽ മാനേജ്മെന്റ്](#മോഡൽ-മാനേജ്മെന്റ്)
- [പ്രൊഡക്ഷൻ പരിഗണനകൾ](#പ്രൊഡക്ഷൻ-പരിഗണനകൾ)
- [മോണിറ്ററിംഗ് ഒബ്സർവബിലിറ്റി](#മോണിറ്ററിംഗ്-ഒബ്സർവബിലിറ്റി)

## മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം

### Microsoft Foundry മോഡലുകൾ

നിങ്ങളുടെ ഉപയോഗ കേസിനുള്ള ശരിയായ മോഡൽ തിരഞ്ഞെടുക്കുക:

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

### മോഡൽ ശേഷി കാര്യം

| മോഡൽ തരം | ഉപയോഗം | ശുപാർശ ചെയ്ത ശേഷി | ചെലവ് പരിഗണനകൾ |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ചാറ്റ്, Q&A | 10-50 TPM | ബഹുഭൂരിപക്ഷ ജോലികൾക്കായി ചെലവ്-പ്രയോജനകരം |
| gpt-4.1 | സങ്കീർണ്ണമായ വിവേകം | 20-100 TPM | ഉയർന്ന ചെലവ്, പ്രീമിയം ഫീച്ചറുകൾക്കായി ഉപയോഗിക്കുക |
| text-embedding-3-large | തിരയൽ, RAG | 30-120 TPM | സെമാന്റിക് തിരയലിലേക്കും വീണ്ടെടുക്കലിലുമുള്ള ശക്തമായ ഡിഫോൾട്ട് തിരഞ്ഞെടുപ്പ് |
| Whisper | സ്പീച്ച്-ടു-ടെക്സ്റ് | 10-50 TPM | ഓഡിയോ പ്രോസസ്സിംഗ് ജോലികൾക്ക് |

## AI മോഡലുകൾക്കുള്ള AZD കോൺഫിഗറേഷൻ

### ബൈസപ് ടെംപ്ലേറ്റ് കോൺഫിഗറേഷൻ

ബൈസപ് ടെംപ്ലേറ്റുകൾ വഴി മോഡൽ വിന്യാസങ്ങൾ സൃഷ്ടിക്കുക:

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

### പരിസ്ഥിതി ഘടകങ്ങൾ

നിങ്ങളുടെ ആപ്ലിക്കേഷൻ പരിസ്ഥിതി കോൺഫിഗർ ചെയ്‌യുക:

```bash
# .env കോൺഫിഗറേഷൻ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## വിന്യാസ മാതൃകകൾ

### മാതൃക 1: ഒറ്റ പ്രദേശ വിന്യാസം

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

മികച്ചത്:
- ഡെവലപ്പ്മെന്റ്, ടെസ്റ്റിംഗ്
- ഒറ്റ മാർക്കറ്റ് ആപ്ലിക്കേഷനുകൾ
- ചെലവു കുറയ്ക്കൽ

### മാതൃക 2: ബഹു പ്രദേശ വിന്യാസം

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

മികച്ചത്:
- ഗ്ലോബൽ ആപ്ലിക്കേഷനുകൾ
- ഉയർന്ന ലഭ്യത ആവശ്യകതകൾ
- ലോഡ് വിതരണവും

### മാതൃക 3: ഹൈബ്രിഡ് വിന്യാസം

Microsoft Foundry മോഡലുകൾ മറ്റ് AI സേവനങ്ങളുമായി സംയോജിപ്പിക്കുക:

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

### പതിപ്പ് നിയന്ത്രണം

നിങ്ങളുടെ AZD കോൺഫിഗറേഷനിൽ മോഡൽ പതിപ്പുകൾ ട്രാക്കു ചെയ്യുക:

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

### മോഡൽ അപ്‌ഡേറ്റുകൾ

മോഡൽ അപ്‌ഡേറ്റുകൾക്കായി AZD ഹുക്കുകൾ ഉപയോഗിക്കുക:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# നിശ്ചിത സമയപരിധിയിൽ നിന്നും deployment കൂടുതൽ സമയം എടുക്കുകയാണെങ്കിൽ
azd deploy --timeout 1800
```

### A/B പരീക്ഷണം

നിരവധി മോഡൽ പതിപ്പുകൾ വിന്യസിക്കുക:

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

### ശേഷി പ്ലാനിംഗ്

ഉപയോഗ പാറ്റർമുകൾ അനുസരിച്ച് ആവശ്യമായ ശേഷി കണക്കുകൂട്ടുക:

```python
# ശേഷി കണക്കാക്കല്‍ ഉദാഹരണം
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

### ഓട്ടോ-സ്കെയ്ലിങ് കോൺഫിഗറേഷൻ

കണ്ടെയ്‌നർ ആപ്പുകൾക്കായുള്ള ഓട്ടോ-സ്കെയ്ലിങ് കോൺഫിഗർ ചെയ്യുക:

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

### ചെലവ് എത്രമാത്രം കുറയ്ക്കാം

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

## മോണിറ്ററിംഗ് ഒബ്സർവബിലിറ്റി

### ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ

AI ജോലികൾക്കും മോണിറ്ററിംഗിനും കോൺഫിഗർ ചെയ്യുക:

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

### കസ്റ്റം മെട്രിക്‌സ്

AI-സ്പെസിഫിക് മെട്രിക്‌സ് ട്രാക്കു ചെയ്യുക:

```python
# AI മോഡലുകൾക്കായുള്ള അനുകൂല ടേലിമെട്രി
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

### ആരോഗ്യ പരിശോധനകൾ

AI സേവനങ്ങളുടെ ആരോഗ്യ മോണിറ്ററിംഗ് നടപ്പിലാക്കുക:

```python
# ആരോഗ്യ പരിശോധന എൻഡ്പോയിന്റുകൾ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI ബന്ധം പരിശോധന ചെയ്യുക
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

## അടുത്ത ചുവടുകൾ

1. **സേവന സംയോജനം മാതൃകകൾക്കായി [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md) പരിശോധിക്കുക**
2. **ഹാൻഡ്‌സ്-ഓൺ അനുഭവത്തിനായി [AI Workshop Lab](ai-workshop-lab.md) പൂർത്തിയാക്കുക**
3. **എന്റര്‌പ്രൈസ് വിന്യാസത്തിനായി [Production AI Practices](production-ai-practices.md) നടപ്പിലാക്കുക**
4. **പൊതുവായ പ്രശ്നങ്ങൾക്ക് [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md) പരിശോധിക്കുക**

## സ്രോതസുകൾ

- [Microsoft Foundry മോഡലുകളുടെ ലഭ്യത](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps സ്കെയ്ലിംഗ്](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI മോഡൽ ചെലവ് കുറക്കൽ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 2 - AI-ഫസ്റ്റ് ഡെവലപ്പ്മെന്റ്
- **⬅️ മുമ്പിലുള്ളത്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->