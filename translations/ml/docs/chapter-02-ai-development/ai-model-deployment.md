# എഐ മോഡൽ ഡിപ്പ്ലോയ്മെന്റ് ആസ്യൂർ ഡെവലപ്പർ CLI ഉപയോഗിച്ച്

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 2 - എഐ-ഫസ്റ്റ് ഡെവലപ്മെന്റ്
- **⬅️ കഴിഞ്ഞത്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

ഈ ഗൈഡ് AZD ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് എഐ മോഡലുകൾ ഡിപ്പ്ലോയ് ചെയ്യുന്നതിനുള്ള സമഗ്രമായ നിർദ്ദേശങ്ങൾ നൽകുന്നു, മോഡൽ തിരഞ്ഞെടുപ്പിൽ നിന്ന് ഉത്പാദന ഡിപ്പ്ലോയ്മെന്റ് പാറ്റേണുകൾ വരെ എല്ലാം ഉൾക്കൊള്ളുന്നു.

> **പൊരുത്തം സൂചന (2026-03-25):** ഈ ഗൈഡ്中的 AZD പ്രവൃത്തി പ്രക്രിയ `azd` `1.23.12` ന് എതിരെ പരിശോദിച്ചു. ഡീഫോൾട്ട് സർവീസ് ഡിപ്പ്ലോയ്മെന്റ് വിൻഡോകളിനെക്കാൾ കൂടുതൽ സമയം എടുക്കുന്ന എഐ ഡിപ്പ്ലോയ്മെന്റുകൾക്കായി, നിലവിലെ AZD റിലീസുകൾ `azd deploy --timeout <seconds>` പിന്തുണയ്ക്കുന്നു.

## ഉള്ളടക്കങ്ങളുടെ പട്ടിക

- [മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം](#മോഡൽ-തിരഞ്ഞെടുപ്പ്-തന്ത്രം)
- [എഐ മോഡലുകളുടെ AZD കോൺഫിഗറേഷൻ](#എഐ-മോഡലുകൾക്കുള്ള-azd-കോൺഫിഗറേഷൻ)
- [ഡിപ്പ്ലോയ്മെന്റ് പാറ്റേണുകൾ](#ഡിപ്പ്ലോയ്മെന്റ്-പാറ്റേണുകൾ)
- [മോഡൽ മാനേജ്മെന്റ്](#മോഡൽ-മാനേജ്മെന്റ്)
- [ഉത്പാദന പരിഗണനകൾ](#ഉത്പാദന-പരിഗണനകൾ)
- [മൊനിറ്ററിംഗ് ആൻഡ് ഒബ്സർവബിലിറ്റി](#മൊനിറ്ററിംഗ്-ആൻഡ്-ഒബ്സർവബിലിറ്റി)

## മോഡൽ തിരഞ്ഞെടുപ്പ് തന്ത്രം

### Microsoft Foundry മോഡലുകൾ

നിങ്ങളുടെ ഉപയോക്തൃ കേസിനായി ശരിയായ മോഡൽ തിരഞ്ഞെടുക്കുക:

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

### മോഡൽ ശേഷി പദ്ധതിയിടൽ

| മോഡൽ തരം | ഉപയോഗ കേസ് | ശുപാർശ ചെയ്ത ശേഷി | ചെലവ് പരിഗണനകൾ |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ചാറ്റ്, ചോദ്യം-ഉത്തരം | 10-50 TPM | ഭൂരിഭാഗം തന്ത്രങ്ങൾക്കുള്ള ചെലവ്-പ്രവർത്തകമാണ് |
| gpt-4.1 | സങ്കീർണം തർക്കം | 20-100 TPM | ഉയർന്ന ചെലവ്, പ്രീമിയം ഫീച്ചറുകൾക്കായി ഉപയോഗിക്കുക |
| text-embedding-3-large | തിരയൽ, RAG | 30-120 TPM | സെമാന്റിക് തിരയലിനും തിരിച്ചെടുക്കലിനും ശക്തമായ ഡീഫോൾട്ട് തിരഞ്ഞെടുപ്പ് |
| Whisper | വാക്കിൽ നിന്ന് ടെക്സ്റ്റ് | 10-50 TPM | ഓഡിയോ പ്രോസസ്സിംഗ് തന്ത്രങ്ങൾ |

## എഐ മോഡലുകൾക്കുള്ള AZD കോൺഫിഗറേഷൻ

### ബൈസിപ്പ് ടെംപ്ലേറ്റ് കോൺഫിഗറേഷൻ

ബൈസിപ്പ് ടെംപ്ലേറ്റുകൾ വഴി മോഡൽ ഡിപ്പ്ലോയ്മെന്റുകൾ സൃഷ്ടിക്കുക:

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

### പരിസ്ഥിതി ചവ്രങ്ങൾ

നിങ്ങളുടെ അപ്ലിക്കേഷന്റെ പരിസ്ഥിതി ക്രമീകരിക്കുക:

```bash
# .env കോൺഫിഗറേഷൻ
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## ഡിപ്പ്ലോയ്മെന്റ് പാറ്റേണുകൾ

### പാറ്റേൺ 1: ഏക-പ്രദേശ ഡിപ്പ്ലോയ്മെന്റ്

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

ശ്രേഷ്ഠം:
- വികസനവും പരിശോധനയും
- ഏക വിപണി അപ്ലിക്കേഷനുകൾ
- ചെലവ് മെച്ചപ്പെടുത്തൽ

### പാറ്റേൺ 2: ബഹു-പ്രദേശ ഡിപ്പ്ലോയ്മെന്റ്

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ശ്രേഷ്ഠം:
- ആഗോള അപ്ലിക്കേഷനുകൾ
- ഉയർന്ന ലഭ്യത ആവശ്യകതകൾ
- ലോഡ് വിതരണവും

### പാറ്റേൺ 3: ഹൈബ്രിഡ് ഡിപ്പ്ലോയ്മെന്റ്

Microsoft Foundry മോഡലുകൾ മറ്റ് എഐ സേവനങ്ങളുമായി സംയോജിപ്പിക്കുക:

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

നിങ്ങളുടെ AZD കോൺഫിഗറേഷനിൽ മോഡൽ പതിപ്പുകൾ ട്രാക്ക് ചെയ്യുക:

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

### മോഡൽ അപ്ഡേറ്റുകൾ

മോഡൽ അപ്ഡേറ്റുകൾക്കായി AZD ഹുക്കുകൾ ഉപയോഗിക്കുക:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ഡിപ്പ്ലോയ്മെന്റ് ഡിഫോൾട്ട് ടൈംഔട്ടിൽ നിന്ന് കൂടുതലായാൽ
azd deploy --timeout 1800
```

### എ/ബി ടെസ്റ്റിംഗ്

பல മോഡൽ പതിപ്പുകൾ ഡിപ്പ്ലോയ് ചെയ്യുക:

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

## ഉത്പാദന പരിഗണനകൾ

### ശേഷി പദ്ധതിയിടൽ

ഉപയോഗ പതിപ്പുകളുടെ അടിസ്ഥാനത്തിൽ ആവശ്യമായ ശേഷി കണക്കുകൂട്ടുക:

```python
# ശേഷിയുടയുള്ള കണക്കാക്കൽ ഉദാഹരണം
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

### ഓട്ടോ-സ്കെയ്ലിംഗ് കോൺഫിഗറേഷൻ

കണ്ടെയ്നർ ആപ്ലിക്കേഷനുകൾക്കായി ഓട്ടോ-സ്കെയ്ലിംഗ് ക്രമീകരിക്കുക:

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

### ചെലവ് മെച്ചപ്പെടുത്തൽ

ചിലവ് നിയന്ത്രണങ്ങൾ നടപ്പിലാക്കുക:

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

## മൊനിറ്ററിംഗ് ആൻഡ് ഒബ്സർവബിലിറ്റി

### അപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് ഇന്റഗ്രേഷൻ

എഐ തൊഴിലുകൾക്കുള്ള മോണിറ്ററിംഗ് ക്രമീകരിക്കുക:

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

### കസ്റ്റം മെട്രിക്ക്സ്

എഐ-സ്പെസിഫിക് മെട്രിക്കുകൾ ട്രാക്ക് ചെയ്യുക:

```python
# എ.ഐ. മാതൃകകൾക്കായുള്ള കസ്റ്റം ടെലിമെട്രി
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

### ഹെൽത്ത് ചെക്ക്‌സ്

എഐ സേവന ഹെൽത്ത് മോണിറ്ററിംഗ് നടപ്പിലാക്കുക:

```python
# ആരോഗ്യ പരിശോധന എൻഡ്‌പോയിന്റുകൾ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI കണക്ഷൻ പരീക്ഷിക്കുക
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

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** സേവന സംയോജനം പാറ്റേണുകൾ അവലോകനം ചെയ്യുക
2. **[AI Workshop Lab](ai-workshop-lab.md)** മുഖാവ് പ്രവൃത്തിക്കായി പൂർണ്ണമാക്കുക
3. **[Production AI Practices](production-ai-practices.md)** എന്റർപ്രൈസ് ഡിപ്പ്ലോയ്മെന്റുകൾക്കായി നടപ്പിലാക്കുക
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** സാധാരണ പ്രശ്നങ്ങൾക്കും പരിഹാരങ്ങൾക്കും അന്വേഷിക്കുക

## വിഭവങ്ങൾ

- [Microsoft Foundry Models Model ലഭ്യത](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [ആസ്യൂർ ഡെവലപ്പർ CLI ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [കണ്ടെയ്നർ ആപ്ലിക്കേഷനുകളുടെ സ്കെയ്ലിംഗ്](https://learn.microsoft.com/azure/container-apps/scale-app)
- [എഐ മോഡൽ ചെലവ് മെച്ചപ്പെടുത്തൽ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**അധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 2 - എഐ-ഫസ്റ്റ് ഡെവലപ്മെന്റ്
- **⬅️ കഴിഞ്ഞത്**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ അടുത്തത്**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 3: കോൺഫിഗറേഷൻ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**സമ്മതിമൊഴി**:  
ഈ രേഖ [Co-op Translator](https://github.com/Azure/co-op-translator) എന്ന AI ترجمة സേവനം ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി പരിശ്രമിച്ചിരുന്നെങ്കിലും, സ്വയംക뀄തമായ വിവർത്തനങ്ങളിൽ പിഴവുകളോ അക്രമങ്ങളോ ഉണ്ടാകാവുന്നുണ്ടെന്ന് ദയവായി ശ്രദ്ധിക്കുക. തന്റെ സ്വന്തം ഭാഷയിലുള്ള സാധാരണ രേഖ തന്നെ അധികാരപത്രമായി പരിഗണിക്കേണ്ടതാണ്. നിർണായക വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ വിവർത്തനം നിർദ്ദേശിക്കപ്പെടുന്നു. ഈ വിവർത്തനത്തിന്റെ ഉപയോഗത്തിൽനിന്നും ഏതു തെറ്റായ ധാരണകൾക്കും തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കും ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->