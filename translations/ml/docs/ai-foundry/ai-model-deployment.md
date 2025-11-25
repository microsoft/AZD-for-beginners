<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-25T00:05:58+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "ml"
}
-->
# AZD ഉപയോഗിച്ച് AI മോഡൽ ഡിപ്ലോയ്മെന്റ്

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 2 - AI-First Development
- **⬅️ മുൻപ്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 3: Configuration](../getting-started/configuration.md)

AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് AI മോഡലുകൾ ഡിപ്ലോയ് ചെയ്യുന്നതിനുള്ള സമഗ്രമായ മാർഗ്ഗനിർദ്ദേശങ്ങൾ, മോഡൽ തിരഞ്ഞെടുപ്പിൽ നിന്ന് പ്രൊഡക്ഷൻ ഡിപ്ലോയ്മെന്റ് പാറ്റേണുകൾ വരെ ഉൾക്കൊള്ളുന്നു.

## ഉള്ളടക്ക പട്ടിക

- [മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം](../../../../docs/ai-foundry)
- [AI മോഡലുകൾക്കായുള്ള AZD കോൺഫിഗറേഷൻ](../../../../docs/ai-foundry)
- [ഡിപ്ലോയ്മെന്റ് പാറ്റേണുകൾ](../../../../docs/ai-foundry)
- [മോഡൽ മാനേജ്മെന്റ്](../../../../docs/ai-foundry)
- [പ്രൊഡക്ഷൻ പരിഗണനകൾ](../../../../docs/ai-foundry)
- [മോണിറ്ററിംഗ് & ഓബ്സർവബിലിറ്റി](../../../../docs/ai-foundry)

## മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം

### Azure OpenAI മോഡലുകൾ

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

### മോഡൽ ശേഷി പ്ലാനിംഗ്

| മോഡൽ തരം | ഉപയോഗം | ശുപാർശ ചെയ്യുന്ന ശേഷി | ചെലവു പരിഗണനകൾ |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | ചാറ്റ്, Q&A | 10-50 TPM | മിക്ക ജോലികൾക്കും ചെലവുകുറഞ്ഞത് |
| GPT-4 | സങ്കീർണ്ണമായ തർക്കങ്ങൾ | 20-100 TPM | ഉയർന്ന ചെലവ്, പ്രീമിയം ഫീച്ചറുകൾക്കായി ഉപയോഗിക്കുക |
| Text-embedding-ada-002 | തിരയൽ, RAG | 30-120 TPM | സെമാന്റിക് തിരയലിനായി അനിവാര്യമാണ് |
| Whisper | സ്പീച്ച്-ടു-ടെക്സ്റ്റ് | 10-50 TPM | ഓഡിയോ പ്രോസസ്സിംഗ് ജോലികൾക്കായി |

## AI മോഡലുകൾക്കായുള്ള AZD കോൺഫിഗറേഷൻ

### Bicep ടെംപ്ലേറ്റ് കോൺഫിഗറേഷൻ

Bicep ടെംപ്ലേറ്റുകൾ വഴി മോഡൽ ഡിപ്ലോയ്മെന്റുകൾ സൃഷ്ടിക്കുക:

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

### പരിസ്ഥിതി വേരിയബിളുകൾ

നിങ്ങളുടെ ആപ്ലിക്കേഷൻ പരിസ്ഥിതി കോൺഫിഗർ ചെയ്യുക:

```bash
# .env കോൺഫിഗറേഷൻ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ഡിപ്ലോയ്മെന്റ് പാറ്റേണുകൾ

### പാറ്റേൺ 1: സിംഗിൾ-റീജിയൻ ഡിപ്ലോയ്മെന്റ്

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

ഉത്തമം:
- ഡെവലപ്മെന്റ് & ടെസ്റ്റിംഗ്
- സിംഗിൾ-മാർക്കറ്റ് ആപ്ലിക്കേഷനുകൾ
- ചെലവു ഓപ്റ്റിമൈസേഷൻ

### പാറ്റേൺ 2: മൾട്ടി-റീജിയൻ ഡിപ്ലോയ്മെന്റ്

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
- ഗ്ലോബൽ ആപ്ലിക്കേഷനുകൾ
- ഉയർന്ന ലഭ്യത ആവശ്യങ്ങൾ
- ലോഡ് ഡിസ്‌ട്രിബ്യൂഷൻ

### പാറ്റേൺ 3: ഹൈബ്രിഡ് ഡിപ്ലോയ്മെന്റ്

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

## മോഡൽ മാനേജ്മെന്റ്

### വേർഷൻ കൺട്രോൾ

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

### മോഡൽ അപ്ഡേറ്റുകൾ

AZD ഹുക്കുകൾ ഉപയോഗിച്ച് മോഡൽ അപ്ഡേറ്റുകൾ നടത്തുക:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B ടെസ്റ്റിംഗ്

വിവിധ മോഡൽ വേർഷനുകൾ ഡിപ്ലോയ് ചെയ്യുക:

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

## പ്രൊഡക്ഷൻ പരിഗണനകൾ

### ശേഷി പ്ലാനിംഗ്

ഉപയോഗ പാറ്റേണുകൾ അടിസ്ഥാനമാക്കി ആവശ്യമായ ശേഷി കണക്കാക്കുക:

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

# ഉപയോഗത്തിന്റെ ഉദാഹരണം
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗറേഷൻ

Container Apps-നായി ഓട്ടോ-സ്കെയിലിംഗ് കോൺഫിഗർ ചെയ്യുക:

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

### ചെലവു ഓപ്റ്റിമൈസേഷൻ

ചെലവു നിയന്ത്രണങ്ങൾ നടപ്പിലാക്കുക:

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

## മോണിറ്ററിംഗ് & ഓബ്സർവബിലിറ്റി

### ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ

AI ജോലികൾക്കായി മോണിറ്ററിംഗ് കോൺഫിഗർ ചെയ്യുക:

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

AI-സ്പെസിഫിക് മെട്രിക്‌സ് ട്രാക്ക് ചെയ്യുക:

```python
# AI മോഡലുകൾക്കുള്ള കസ്റ്റം ടെലിമെട്രി
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

AI സേവനങ്ങളുടെ ആരോഗ്യ നിരീക്ഷണം നടപ്പിലാക്കുക:

```python
# ആരോഗ്യ പരിശോധന എൻഡ്പോയിന്റുകൾ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # ഓപ്പൺഎഐ കണക്ഷൻ പരിശോധിക്കുക
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

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** റിവ്യൂ ചെയ്യുക സേവന സംയോജന പാറ്റേണുകൾക്കായി
2. **[AI Workshop Lab](ai-workshop-lab.md)** പൂർത്തിയാക്കുക പ്രായോഗിക പരിചയത്തിനായി
3. **[Production AI Practices](production-ai-practices.md)** നടപ്പിലാക്കുക എന്റർപ്രൈസ് ഡിപ്ലോയ്മെന്റുകൾക്കായി
4. **[AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)** എളുപ്പത്തിൽ പരിഹരിക്കാവുന്ന പ്രശ്നങ്ങൾക്കായി പരിശോധിക്കുക

## റിസോഴ്സുകൾ

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: Chapter 2 - AI-First Development
- **⬅️ മുൻപ്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 3: Configuration](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ പ്രമാണം AI വിവർത്തന സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. പ്രമാണത്തിന്റെ മാതൃഭാഷയിലുള്ള യഥാർത്ഥ പതിപ്പ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം ശുപാർശ ചെയ്യുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കോ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കോ ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->