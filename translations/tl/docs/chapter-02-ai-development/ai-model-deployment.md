# Pag-deploy ng AI Model gamit ang Azure Developer CLI

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [AI Agents](agents.md)
- **➡️ Susunod**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

Ang gabay na ito ay nagbibigay ng komprehensibong mga tagubilin para sa pag-deploy ng mga AI model gamit ang mga AZD template, kabilang ang lahat mula sa pagpili ng modelo hanggang sa mga pattern ng deployment sa produksyon.

> **Pagsusuri ng release (2026-11-04):** Ang mga kaugnay na pagbabago sa CLI ay na-review laban sa `azd` `1.37.2`; ang availability, mga bersyon, at quota ng modelo ay nananatiling nakadepende sa rehiyon at subscription. Ang `azd deploy --timeout <seconds>` ang kumokontrol sa window ng deployment ng serbisyo, hindi garantiya ng activation ng agent. Tingnan ang [kasalukuyang mga tala ng release at gabay sa migrasyon ng AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Talaan ng Nilalaman

- [Strategiya sa Pagpili ng Modelo](#model-selection-strategy)
- [Konfigurasyon ng AZD para sa mga AI Modelo](#azd-configuration-for-ai-models)
- [Mga Pattern ng Deployment](#deployment-patterns)
- [Pamamahala ng Modelo](#model-management)
- [Mga Pagsasaalang-alang sa Produksyon](#production-considerations)
- [Pagsubaybay at Observability](#monitoring-and-observability)

## Strategiya sa Pagpili ng Modelo

### Azure OpenAI Models sa Microsoft Foundry

Piliin ang tamang modelo para sa iyong gamit:

Ideklara ang mga deployment ng modelo sa Bicep (sa ibaba), hindi sa mga arbitraryo na `services.*.config.AZURE_OPENAI_MODELS` na setting. Hindi ini-interpret ng AZD ang ganoong setting bilang isang listahan ng mga resource ng modelo. Ang `project` ng isang serbisyo ay tumutukoy sa pinanggalingan ng aplikasyon, hindi sa `infra/` na direktoryo nito.

Ang mga halimbawa ay gumagamit ng inilathalang bersyon ng `gpt-4.1-mini` **`2025-04-14`** at bersyon ng embedding na **`1`**. Kumpirmahin na suportado ang bersyon ng modelo at deployment SKU sa iyong target na rehiyon/akawnt bago mag-provision.

### Pagpaplano ng Kapasidad ng Modelo

| Uri ng Modelo | Gamit | Halimbawa ng Demand ng Token | Mga Pagsasaalang-alang sa Gastos |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10,000-50,000 TPM | Benchmark ang gastos at kalidad para sa iyong trabaho |
| gpt-4.1 | Mga komplikadong gawain | 20,000-100,000 TPM | Suriin ang pagtaas sa kalidad laban sa gastos ng token |
| text-embedding-3-large | Paghahanap, RAG | 30,000-120,000 TPM | Isaalang-alang ang pag-ingest pati na rin ang trapiko ng query |
| Whisper | Speech-to-text | Magplano gamit ang tagal ng audio at mga limitasyon ng request | Huwag gamitin ang formula ng kapasidad na text-model TPM |

Ang TPM ay nangangahulugang tokens bawat minuto. Para sa mga Standard na text deployment na ito, ang ARM `sku.capacity` ay nasa **1,000-TPM na yunit**, hindi individual na TPM (ang kapasidad na `10` ay nangangahulugang 10,000 TPM). Ang mga ratio ng RPM-to-TPM ay nag-iiba depende sa uri ng modelo/deployment; tiyaking kung ano ang mga limitasyon ay tugma sa [dokyumentasyon ng quota](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Ang mga hanay na ito ay mga halimbawa, hindi rekomendasyon sa sukat.

## Konfigurasyon ng AZD para sa mga AI Modelo

### Konfigurasyon ng Template ng Bicep

Gumawa ng mga deployment ng modelo gamit ang mga Bicep template:

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

Ito ay isang halimbawa ng imprastruktura ng **development** na may saklaw sa resource group, hindi isang kompletong AZD application template. Pinapayagan ng akawnt ang public network access at nangangailangan ng Entra ID/RBAC authentication (`Cognitive Services OpenAI User` para sa mga tumatawag). Ang produksyon ay nangangailangan ng private endpoint, DNS, at connectivity ng aplikasyon na nakalarawan sa Kabanata 8. Kailangan din ng AZD ng pangunahing template/parameter mapping at mga resource ng application host; gumamit ng gumaganang halimbawa para sa kompletong deployment.

### Mga Variable ng Kapaligiran

I-configure ang kapaligiran ng iyong aplikasyon:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Ito ay mga pangalan na itinakda ng aplikasyon; ikonekta ang mga ito sa iyong host configuration. Ang Azure OpenAI v1 endpoint na ginamit sa health check sa ibaba ay hindi nangangailangan ng luma nang `api-version` na query parameter; ang mga mas lumang `AzureOpenAI` na client ay nangangailangan, kaya sundin ang API na ginagamit ng iyong aplikasyon.

## Mga Pattern ng Deployment

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

Pinakamainam para sa:
- Pag-develop at testing
- Mga aplikasyon na nakatuon sa isang merkado lamang
- Pag-optimize ng gastos

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

Kailangan punan ang mga hindi isinama na property ng akawnt/SKU; ang fragment na ito ay hindi maaaring i-deploy nang nakasulat. Mag-deploy ng mga modelo sa bawat akawnt at ipatupad nang hiwalay ang routing/failover at mga kontrol sa data residency.

Pinakamainam para sa:
- Mga global na aplikasyon
- Mataas na availability na mga pangangailangan
- Paghahati ng load

### Pattern 3: Hybrid Deployment

Pagsamahin ang mga Microsoft Foundry Models sa iba pang mga serbisyo ng AI:

Ipinapalagay ng mga sumusunod na fragment na ang mga pangalan at `location` ay ibinibigay ng naglalaman na template.

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

## Pamamahala ng Modelo

### Kontrol ng Bersyon

Subaybayan ang mga bersyon ng modelo sa konfigurasyon ng iyong aplikasyon o IaC. Ang JSON na ito ay isang halimbawa na **itinakda ng aplikasyon**, hindi isang built-in na schema ng modelo sa AZD; kailangang ipatupad at i-deploy nang malinaw ang isang fallback:

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

### Mga Update ng Modelo

Gumamit ng hook ng AZD para sa read-only na tseke ng availability, pagkatapos ay i-update ang IaC at i-provision ito:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Patakbuhin ang `azd up` **sa labas** ng hook para ilapat ang nabagong imprastruktura ng modelo at i-deploy ang code. Huwag kailanman tawagin ang `azd deploy` mula sa isang hook na `predeploy`: ito ay nagti-trigger nang paulit-ulit ng parehong hook. Pinalalawig ng `azd deploy --timeout 1800` ang timeout ng deployment ng aplikasyon; hindi nito ina-update ang mga Bicep resource.

### A/B Testing

Ang halimbawa ng resource sa ibaba ay pumipili ng pangalan ng deployment at kapasidad; lumilikha ito ng **isang** deployment lamang, hindi isang A/B test. Para sa totoong eksperimento, mag-provision ng dalawang magkakaibang resource ng deployment, i-route ang kinokontrol na bahagi ng mga request sa bawat isa, at ihambing ang kalidad, latency, at gastos. Ipinapalagay nito ang `openAi` mula sa halimbawa ng akawnt:

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

## Mga Pagsasaalang-alang sa Produksyon

### Pagpaplano ng Kapasidad

Kalkulahin ang kinakailangang kapasidad base sa pattern ng paggamit:

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

Inaasahang output: `Required capacity: 9100 TPM`. Sa 1,000-TPM na yunit ng kapasidad, i-round up sa hindi bababa sa `10`, pagkatapos ay tiyaking suriin ang mga espesipikong RPM ng modelo at tinantyang rate-limit ng serbisyo (kasama ang hinihiling na budget ng output). Ang pagtatantya ng demand ng token na ito ay hindi garantiya laban sa throttling.

### Konfigurasyon ng Auto-scaling

I-configure ang auto-scaling para sa Container Apps:

**Bahaging resource:** pagsamahin ang mga setting ng `template.scale` sa isang kompletong Container App na may lokasyon, managed environment, container image, resources, at ingress. Ang pag-scale ng replicas ay hindi nagpapataas ng quota ng modelo.

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

### Pag-optimize ng Gastos

Ipatupad ang mga kontrol sa gastos:

**Halimbawa ng budget resource:** tukuyin ang `budgetStartDate` bilang unang araw ng kasalukuyang buwan sa UTC (halimbawa `2026-11-01T00:00:00Z` para sa pagsusuring ito), at palitan ang contact address. Ang pagsisimula ay kailangang sumunod sa kasalukuyang mga limitasyon ng petsa ng serbisyo. Nagbibigay ng alerto ang mga budget sa naantala na data ng billing; hindi nito nililimitahan ang paggastos.

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

## Pagsubaybay at Observability

### Integrasyon ng Application Insights

I-configure ang pagsubaybay para sa mga AI workload:

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

Ipinapalagay ng fragment ng resource ang `applicationInsightsName`, `location`, at isang umiiral na `logAnalyticsWorkspace`. Nagpo-provision ito ng pagsubaybay, ngunit hindi nito sinasaniban ang app o lumilikha ng custom na metrics.

### Custom Metrics

Subaybayan ang mga espesipikong metric para sa AI:

Gamitin ang suportadong [distribusyon ng Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), hindi ang lumang SDK ng `applicationinsights` para sa Python. I-install ang `azure-monitor-opentelemetry`, i-configure ang `APPLICATIONINSIGHTS_CONNECTION_STRING`, at i-initialize isang beses lang sa pagsisimula:

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

Ipinapakita nito ang pagpapalabas ng attribute, hindi aktwal na instrumentation ng pagtawag sa modelo. Balutin ang totoong request sa isang span para sukatin ang tagal nito; suriin ang `dependencies`/`traces` sa Application Insights. Huwag magpadala ng mga prompt, sagot, susi, o hilaw na mensahe ng exception na naglalaman ng sensitibong data.

### Health Checks

Ipatupad ang pagsubaybay sa kalusugan ng AI service:

Mag-install ng `fastapi`, `uvicorn`, `httpx`, at `azure-identity`. Itakda ang mga variable ng endpoint/deployment sa itaas at bigyan ng pahintulot ang caller ng `Cognitive Services OpenAI User`. Ang **readiness probe** na ito ay gumagamit ng Azure OpenAI v1 data plane na may Entra ID; ito ay gumagawa ng billable na pagtawag sa modelo. Patakbuhin gamit ang `uvicorn health:app` matapos i-save bilang `health.py`. Gumamit ng hiwalay na magaang liveness check, limitahan/cach-in ang resulta ng readiness, at huwag hayagang ibahagi ang ruta na ito nang walang kontrol sa access.

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

Inaasahan: Nagbabalik ang `GET /health/ai-models` ng `200 {"status":"healthy"}` kapag ang nakatakdang chat deployment ay magagamit, o `503` nang hindi ibinubunyag ang mga detalye sa itaas. Ang pagpapakita ng mga deployment ay isang operasyon sa management plane at hindi valid na health probe sa data plane.

## Susunod na Mga Hakbang

1. **Suriin ang [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** para sa mga pattern ng integration ng serbisyo
2. **Tapusin ang [AI Workshop Lab](ai-workshop-lab.md)** para sa praktikal na karanasan
3. **Ipapatupad ang [Production AI Practices](../chapter-08-production/production-ai-practices.md)** para sa mga enterprise deployment
4. **Suriin ang [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** para sa mga karaniwang isyu

## Mga Sanggunian

- [Availability ng Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Pag-scale ng Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Pag-optimize ng Gastos ng AI Model](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Pag-navigate sa Kabanata:**
- **📚 Bahay ng Kurso**: [AZD For Beginners](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 2 - AI-First Development
- **⬅️ Nakaraan**: [AI Agents](agents.md)
- **➡️ Susunod**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Susunod na Kabanata**: [Kabanata 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->