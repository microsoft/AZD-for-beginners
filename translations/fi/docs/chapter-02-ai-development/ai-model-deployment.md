# AI-mallien käyttöönotto Azure Developer CLI:llä

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-First Development
- **⬅️ Edellinen**: [Microsoft Foundry -integraatio](microsoft-foundry-integration.md)
- **➡️ Seuraava**: [AI-työpaja](ai-workshop-lab.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

Tässä oppaassa on kattavat ohjeet AI-mallien käyttöönottoon AZD-malleilla, kattaen kaiken mallin valinnasta tuotantoon vietäviin käyttöönottoihin.

> **Varmistusmerkintä (2026-03-25):** Tässä oppaassa oleva AZD-työnkulku tarkistettiin versiota `azd` `1.23.12` vastaan. AI-käyttöönottoihin, jotka kestävät pidempään kuin oletusarvoinen palvelun käyttöönottoaika, nykyiset AZD-versiot tukevat `azd deploy --timeout <seconds>`.

## Sisällysluettelo

- [Mallin valintastrategia](#mallin-valintastrategia)
- [AZD-määritykset AI-malleille](#azd-määritykset-ai-malleille)
- [Käyttöönotto-mallit](#käyttöönotto-mallit)
- [Mallinhallinta](#mallinhallinta)
- [Tuotantoon liittyvät näkökohdat](#tuotantoon-liittyvät-näkökohdat)
- [Valvonta ja havaittavuus](#valvonta-ja-havaittavuus)

## Mallin valintastrategia

### Microsoft Foundry -mallit

Valitse oikea malli käyttötapaukseesi:

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

### Mallin kapasiteettisuunnittelu

| Mallityyppi | Käyttötapaus | Suositeltu kapasiteetti | Kustannusnäkökohdat |
|------------|--------------|------------------------|---------------------|
| gpt-4.1-mini | Chat, kysymykset ja vastaukset | 10-50 TPM | Kustannustehokas useimmille työmäärille |
| gpt-4.1 | Monimutkainen päättely | 20-100 TPM | Korkeammat kustannukset, käytä premium-ominaisuuksiin |
| text-embedding-3-large | Haku, RAG | 30-120 TPM | Vahva oletusvalinta semanttiseen hakuun ja noutoon |
| Whisper | Puheesta tekstiin | 10-50 TPM | Äänen käsittelyyn liittyvät työkuormat |

## AZD-määritykset AI-malleille

### Bicep-mallin määritys

Luo mallien käyttöönotot Bicep-malleilla:

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

### Ympäristömuuttujat

Määritä sovelluksesi ympäristö:

```bash
# .env-konfiguraatio
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Käyttöönotto-mallit

### Malli 1: Yhden alueen käyttöönotto

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

Parhaiten sopii:
- Kehitys ja testaus
- Yhden markkinan sovellukset
- Kustannusoptimointi

### Malli 2: Monialueinen käyttöönotto

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Parhaiten sopii:
- Maailmanlaajuiset sovellukset
- Korkean käytettävyyden vaatimukset
- Kuormituksen jakaminen

### Malli 3: Hybridikäyttöönotto

Yhdistä Microsoft Foundry -mallit muihin AI-palveluihin:

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

## Mallinhallinta

### Versiohallinta

Seuraa malliversioita AZD-määrityksessäsi:

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

### Mallipäivitykset

Käytä AZD-koukkuja mallipäivityksiin:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Jos käyttöönotto kestää pidempään kuin oletusaikakatkaisu
azd deploy --timeout 1800
```

### A/B-testaus

Ota käyttöön useita malliversioita:

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

## Tuotantoon liittyvät näkökohdat

### Kapasiteettisuunnittelu

Laske tarvittava kapasiteetti käyttötapojen perusteella:

```python
# Esimerkki kapasiteetin laskemisesta
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

# Käyttöesimerkki
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Automaattisen skaalaamisen määritys

Määritä automaattinen skaalaus Container Appsille:

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

### Kustannusoptimointi

Ota käyttöön kustannusvalvonta:

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

## Valvonta ja havaittavuus

### Application Insights -integraatio

Määritä valvonta AI-työkuormille:

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

### Mukautetut mittarit

Seuraa AI-kohtaisia mittareita:

```python
# Mukautettu telemetria tekoälymalleille
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

### Terveystarkistukset

Ota käyttöön AI-palveluiden kunnon valvonta:

```python
# Terveystarkastus-päätepisteet
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Testaa OpenAI-yhteyttä
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

## Seuraavat askeleet

1. **Tutustu [Microsoft Foundry -integraatio-oppaaseen](microsoft-foundry-integration.md)** palvelujen integraatiomalleihin
2. **Suorita [AI-työpaja](ai-workshop-lab.md)** saadaksesi käytännön kokemusta
3. **Ota käyttöön [Tuotannon AI-käytännöt](production-ai-practices.md)** yritystason käyttöönottoja varten
4. **Tutustu [AI-vianetsintäoppaaseen](../chapter-07-troubleshooting/ai-troubleshooting.md)** yleisten ongelmien varalta

## Resurssit

- [Microsoft Foundry -mallien saatavuus](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps -skaalaus](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI-mallien kustannusoptimointi](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-First Development
- **⬅️ Edellinen**: [Microsoft Foundry -integraatio](microsoft-foundry-integration.md)
- **➡️ Seuraava**: [AI-työpaja](ai-workshop-lab.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tämä asiakirja on käännetty tekoälykäännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää määräysvaltana. Tärkeän tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkinnasta.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->