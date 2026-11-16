# AI Model Deployment wit Azure Developer CLI

**Chapta Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapta**: Chapta 2 - AI-First Development
- **⬅️ Previous**: [AI Agents](agents.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapta**: [Chapta 3: Configuration](../chapter-03-configuration/configuration.md)

Dis guide dey provide full instructions for deploying AI models by using AZD templates, e cover everything from model choice reach production deployment patterns.

> **Release review (2026-11-04):** Dem review related CLI changes for `azd` `1.37.2`; model availability, versions, and quota still dey depend on region and subscription. `azd deploy --timeout <seconds>` control the service deployment window, no be guarantee say agent go activate. See [current release notes and AI migration guidance](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Table of Contents

- [Model Selection Strategy](#model-selection-strategy)
- [AZD Configuration for AI Models](#azd-configuration-for-ai-models)
- [Deployment Patterns](#deployment-patterns)
- [Model Management](#model-management)
- [Production Considerations](#production-considerations)
- [Monitoring and Observability](#monitoring-and-observability)

## Model Selection Strategy

### Azure OpenAI Models for Microsoft Foundry

Make sure say you pick correct model for your use case:

Talk model deployments for Bicep (wey dey below), no for just any `services.*.config.AZURE_OPENAI_MODELS` settings. AZD no go treat this kind setting as list of model resources. Service `project` dey point application source, no be the `infra/` directory.

The examples dem use the published `gpt-4.1-mini` version **`2025-04-14`** and embedding version **`1`**. Make sure say the model version and deployment SKU dey your target region/account before you provision am.

### Model Capacity Planning

| Model Type | Use Case | Illustrative Token Demand | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10,000-50,000 TPM | Check cost and quality for your work |
| gpt-4.1 | Complex tasks | 20,000-100,000 TPM | Weigh quality gains against token cost |
| text-embedding-3-large | Search, RAG | 30,000-120,000 TPM | Consider ingestion plus query traffic |
| Whisper | Speech-to-text | Plan with audio duration and request limits | No use text-model TPM capacity formula |

TPM mean tokens per minute. For these Standard text deployments, ARM `sku.capacity` dey in **1,000-TPM units**, no be individual TPM (capacity `10` mean 10,000 TPM). RPM-to-TPM ratios fit change by model/deployment type; confirm both limits wit the [quota documentation](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). These na examples, no be sizing advice.

## AZD Configuration for AI Models

### Bicep Template Configuration

Arrange model deployments wit Bicep templates:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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
    disableLocalAuth: true
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

This one na resource-group-scoped **development infrastructure example**, no be complete AZD app template. The account allow public network access and need Entra ID/RBAC authentication (`Cognitive Services OpenAI User` for callers). Production need private endpoint, DNS, and application connectivity wey dey inside Chapta 8. AZD also need main template/parameter mapping and application-host resources; use working sample for full deployment.

### Environment Variables

Configure your application environment:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

These na application-defined names; connect dem to your host configuration. The Azure OpenAI v1 endpoint used by the health check below no need the dated `api-version` query parameter; older `AzureOpenAI` clients need am, so follow API generation wey your app dey use.

## Deployment Patterns

### Pattern 1: Single-Region Deployment

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Best for:
- Development and testing
- Single-market applications
- Cost optimization

### Pattern 2: Multi-Region Deployment

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

The omitted account properties/SKU must e put; dis fragment no fit deploy as e be. Deploy models for each account and put routing/failover and data-residency controls separately.

Best for:
- Global applications
- High availability requirements
- Load distribution

### Pattern 3: Hybrid Deployment

Combine Microsoft Foundry Models wit other AI services:

The following fragments assume names and `location` dey inside the containing template.

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

Track model versions for your application's configuration or IaC. This JSON na **application-defined example**, no be built-in AZD model schema; fallback must dey and e must deploy clearly:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Model Updates

Use AZD hook for read-only availability check, then update IaC and provision am:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Run `azd up` **outside** the hook to apply changed model infrastructure and deploy code. No ever call `azd deploy` from `predeploy` hook: e go trigger the same hook recursively. `azd deploy --timeout 1800` extend application deployment timeout; e no dey update Bicep resources.

### A/B Testing

The example resource below choose deployment name and capacity; e go create **one** deployment, no be A/B test. For real experiment, provide two different deployment resources, send small portion of requests to each, then compare quality, latency, and cost. E assume `openAi` from account example:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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

Calculate capacity needed based on usage:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Expected output: `Required capacity: 9100 TPM`. Wit 1,000-TPM capacity units, round up to at least `10`, then confirm model-specific RPM and service rate-limit estimate (including output budget). This token-demand estimate no be guarantee say e no go fit get throttled.

### Auto-scaling Configuration

Configure auto-scaling for Container Apps:

**Partial resource:** merge `template.scale` settings into complete Container App with location, managed environment, container image, resources, and ingress. Scaling replicas no dey increase model quota.

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

Implement cost controls:

**Illustrative budget resource:** set `budgetStartDate` as first day of current month in UTC (for example `2026-11-01T00:00:00Z` for this review), and change contact address. The start must satisfy service current date rules. Budgets alert on delayed billing data; dem no dey stop spending.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Configure monitoring for AI workloads:

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

```

The resource fragment assume `applicationInsightsName`, `location`, and existing `logAnalyticsWorkspace`. E dey set monitoring, but e no instrument the app or create custom metrics.

### Custom Metrics

Track AI-specific metrics:

Use the supported [Azure Monitor OpenTelemetry distribution](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), no the old `applicationinsights` Python SDK. Install `azure-monitor-opentelemetry`, configure `APPLICATIONINSIGHTS_CONNECTION_STRING`, and initialize one time at startup:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

This one show how to emit attribute, no be real model-call instrumentation. Wrap real request inside span to measure how long e take; check `dependencies`/`traces` in Application Insights. No send prompts, responses, keys, or raw error messages wey get sensitive data.

### Health Checks

Set up AI service health monitoring:

Install `fastapi`, `uvicorn`, `httpx`, and `azure-identity`. Set endpoint/deployment variables above and give caller `Cognitive Services OpenAI User`. Dis **readiness probe** use Azure OpenAI v1 data plane wit Entra ID; e make billable model call. Run wit `uvicorn health:app` afta you save am as `health.py`. Use separate small liveness check, rate-limit/cache readiness results, and no expose this route public without access control.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Expected: `GET /health/ai-models` go return `200 {"status":"healthy"}` when the chat deployment configured dey usable, or `503` without reveal upstream details. Listing deployments na management-plane operation and no be valid data-plane health probe.

## Next Steps

1. **Look the [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** for service integration patterns
2. **Finish the [AI Workshop Lab](ai-workshop-lab.md)** for hands-on experience
3. **Use the [Production AI Practices](../chapter-08-production/production-ai-practices.md)** for enterprise deployments
4. **Explore the [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** for common wahala

## Resources

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Chapta Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapta**: Chapta 2 - AI-First Development
- **⬅️ Previous**: [AI Agents](agents.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapta**: [Chapta 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->