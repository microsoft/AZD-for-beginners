# AI Model Deployment with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Agents](agents.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

This guide provides comprehensive instructions for deploying AI models using AZD templates, covering everything from model selection to production deployment patterns.

> **Release review (2026-11-04):** Related CLI changes were reviewed against `azd` `1.37.2`; model availability, versions, and quota remain region- and subscription-dependent. `azd deploy --timeout <seconds>` controls the service deployment window, not a guarantee of agent activation. See [current release notes and AI migration guidance](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Table of Contents

- [Model Selection Strategy](#model-selection-strategy)
- [AZD Configuration for AI Models](#azd-configuration-for-ai-models)
- [Deployment Patterns](#deployment-patterns)
- [Model Management](#model-management)
- [Production Considerations](#production-considerations)
- [Monitoring and Observability](#monitoring-and-observability)

## Model Selection Strategy

### Azure OpenAI Models in Microsoft Foundry

Choose the right model for your use case:

Declare model deployments in Bicep (below), not in arbitrary `services.*.config.AZURE_OPENAI_MODELS` settings. AZD does not interpret such a setting as a list of model resources. A service's `project` points to application source, not its `infra/` directory.

The examples use the published `gpt-4.1-mini` version **`2025-04-14`** and embedding version **`1`**. Confirm that the model version and deployment SKU are supported in your target region/account before provisioning.

### Model Capacity Planning

| Model Type | Use Case | Illustrative Token Demand | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10,000-50,000 TPM | Benchmark cost and quality for your workload |
| gpt-4.1 | Complex tasks | 20,000-100,000 TPM | Evaluate quality gains against token cost |
| text-embedding-3-large | Search, RAG | 30,000-120,000 TPM | Account for ingestion as well as query traffic |
| Whisper | Speech-to-text | Plan using audio duration and request limits | Do not apply a text-model TPM capacity formula |

TPM means tokens per minute. For these Standard text deployments, ARM `sku.capacity` is in **1,000-TPM units**, not individual TPM (capacity `10` means 10,000 TPM). RPM-to-TPM ratios vary by model/deployment type; verify both limits against the [quota documentation](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). These ranges are examples, not sizing recommendations.

## AZD Configuration for AI Models

### Bicep Template Configuration

Create model deployments through Bicep templates:

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

This is a resource-group-scoped **development infrastructure example**, not a complete AZD application template. The account permits public network access and requires Entra ID/RBAC authentication (`Cognitive Services OpenAI User` for callers). Production needs the private endpoint, DNS, and application connectivity described in Chapter 8. AZD also needs a main template/parameter mapping and application-host resources; use a working sample for a full deployment.

### Environment Variables

Configure your application environment:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

These are application-defined names; wire them into your host configuration. The Azure OpenAI v1 endpoint used by the health check below does not require the dated `api-version` query parameter; older `AzureOpenAI` clients do, so follow the API generation used by your application.

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

The omitted account properties/SKU must be supplied; this fragment is not deployable as written. Deploy models in each account and implement routing/failover and data-residency controls separately.

Best for:
- Global applications
- High availability requirements
- Load distribution

### Pattern 3: Hybrid Deployment

Combine Microsoft Foundry Models with other AI services:

The following fragments assume names and `location` are supplied by the containing template.

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

Track model versions in your application's configuration or IaC. This JSON is an **application-defined example**, not a built-in AZD model schema; a fallback must be implemented and deployed explicitly:

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

Use an AZD hook for a read-only availability check, then update IaC and provision it:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Run `azd up` **outside** the hook to apply changed model infrastructure and deploy code. Never call `azd deploy` from a `predeploy` hook: it recursively triggers the same hook. `azd deploy --timeout 1800` extends an application deployment timeout; it does not update Bicep resources.

### A/B Testing

The illustrative resource below selects a deployment name and capacity; it creates **one** deployment, not an A/B test. For a real experiment, provision two distinct deployment resources, route a controlled fraction of requests to each, and compare quality, latency, and cost. It assumes `openAi` from the account example:

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

Calculate required capacity based on usage patterns:

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

Expected output: `Required capacity: 9100 TPM`. With 1,000-TPM capacity units, round up to at least `10`, then verify model-specific RPM and service rate-limit estimation (including requested output budget). This token-demand estimate is not a guarantee against throttling.

### Auto-scaling Configuration

Configure auto-scaling for Container Apps:

**Partial resource:** merge the `template.scale` settings into a complete Container App with location, managed environment, container image, resources, and ingress. Scaling replicas does not increase model quota.

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

**Illustrative budget resource:** define `budgetStartDate` as the first day of the current month in UTC (for example `2026-11-01T00:00:00Z` for this review), and replace the contact address. The start must satisfy the service's current date constraints. Budgets alert on delayed billing data; they do not stop spending.

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

The resource fragment assumes `applicationInsightsName`, `location`, and an existing `logAnalyticsWorkspace`. It provisions monitoring, but does not instrument the app or create custom metrics.

### Custom Metrics

Track AI-specific metrics:

Use the supported [Azure Monitor OpenTelemetry distribution](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), not the legacy `applicationinsights` Python SDK. Install `azure-monitor-opentelemetry`, configure `APPLICATIONINSIGHTS_CONNECTION_STRING`, and initialize once at startup:

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

This illustrates attribute emission, not actual model-call instrumentation. Wrap the real request in a span to measure its duration; inspect `dependencies`/`traces` in Application Insights. Do not send prompts, responses, keys, or raw exception messages containing sensitive data.

### Health Checks

Implement AI service health monitoring:

Install `fastapi`, `uvicorn`, `httpx`, and `azure-identity`. Set the endpoint/deployment variables above and grant the caller `Cognitive Services OpenAI User`. This **readiness probe** uses the Azure OpenAI v1 data plane with Entra ID; it makes a billable model call. Run with `uvicorn health:app` after saving as `health.py`. Use a separate lightweight liveness check, rate-limit/cache readiness results, and do not expose this route publicly without access controls.

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

Expected: `GET /health/ai-models` returns `200 {"status":"healthy"}` when the configured chat deployment is usable, or `503` without disclosing upstream details. Listing deployments is a management-plane operation and is not a valid data-plane health probe.

## Next Steps

1. **Review the [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** for service integration patterns
2. **Complete the [AI Workshop Lab](ai-workshop-lab.md)** for hands-on experience
3. **Implement [Production AI Practices](../chapter-08-production/production-ai-practices.md)** for enterprise deployments
4. **Explore the [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** for common issues

## Resources

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Agents](agents.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->