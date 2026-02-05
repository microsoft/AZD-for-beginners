# AI-mallin käyttöönotto Azure Developer CLI:llä

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen**: [Microsoft Foundry -integraatio](microsoft-foundry-integration.md)
- **➡️ Seuraava**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

Tämä opas tarjoaa kattavat ohjeet AI-mallien käyttöönottoon AZD-mallipohjien avulla, kattaen kaiken mallin valinnasta tuotantokäyttöön liittyviin malleihin.

## Sisällysluettelo

- [Mallin valintastrategia](../../../../docs/ai-foundry)
- [AZD-konfigurointi AI-malleille](../../../../docs/ai-foundry)
- [Käyttöönoton mallit](../../../../docs/ai-foundry)
- [Mallien hallinta](../../../../docs/ai-foundry)
- [Tuotantoon liittyvät näkökohdat](../../../../docs/ai-foundry)
- [Seuranta ja näkyvyys](../../../../docs/ai-foundry)

## Mallin valintastrategia

### Azure OpenAI -mallit

Valitse oikea malli käyttötarkoitukseesi:

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

### Mallin kapasiteettisuunnittelu

| Mallityyppi | Käyttötarkoitus | Suositeltu kapasiteetti | Kustannusnäkökohdat |
|-------------|----------------|-------------------------|---------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Kustannustehokas useimmille työkuormille |
| GPT-4 | Monimutkainen päättely | 20-100 TPM | Korkeammat kustannukset, käytä premium-ominaisuuksiin |
| Text-embedding-ada-002 | Haku, RAG | 30-120 TPM | Välttämätön semanttiseen hakuun |
| Whisper | Puhe tekstiksi | 10-50 TPM | Äänidatan käsittelyyn |

## AZD-konfigurointi AI-malleille

### Bicep-mallipohjan konfigurointi

Luo mallien käyttöönotto Bicep-mallipohjien avulla:

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

### Ympäristömuuttujat

Määritä sovelluksesi ympäristö:

```bash
# .env-konfiguraatio
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Käyttöönoton mallit

### Malli 1: Yhden alueen käyttöönotto

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

Sopii parhaiten:
- Kehitykseen ja testaukseen
- Yhden markkina-alueen sovelluksiin
- Kustannusten optimointiin

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

Sopii parhaiten:
- Globaaleihin sovelluksiin
- Korkean käytettävyyden vaatimuksiin
- Kuormituksen jakamiseen

### Malli 3: Hybridikäyttöönotto

Yhdistä Azure OpenAI muihin AI-palveluihin:

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

## Mallien hallinta

### Versiohallinta

Seuraa malliversioita AZD-konfiguraatiossasi:

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

### Mallipäivitykset

Käytä AZD-koukkuja mallipäivityksiin:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B-testaus

Ota käyttöön useita malliversioita:

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

## Tuotantoon liittyvät näkökohdat

### Kapasiteettisuunnittelu

Laske tarvittava kapasiteetti käyttötapojen perusteella:

```python
# Kapasiteettilaskennan esimerkki
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

### Automaattinen skaalaus

Määritä automaattinen skaalaus Container Apps -sovelluksille:

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

### Kustannusten optimointi

Ota käyttöön kustannusten hallintatoimenpiteet:

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

## Seuranta ja näkyvyys

### Application Insights -integraatio

Määritä AI-työkuormien seuranta:

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

Seuraa AI-spesifisiä mittareita:

```python
# Mukautettu telemetria AI-malleille
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

### Terveystarkastukset

Ota käyttöön AI-palveluiden terveydentilan seuranta:

```python
# Terveystarkistuspisteet
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

1. **Tutustu [Microsoft Foundry -integraatio-oppaaseen](microsoft-foundry-integration.md)** palveluiden integrointimalleihin
2. **Suorita [AI Workshop Lab](ai-workshop-lab.md)** saadaksesi käytännön kokemusta
3. **Ota käyttöön [Tuotannon AI-käytännöt](production-ai-practices.md)** yrityskäyttöön
4. **Tutki [AI-vianmääritysopasta](../troubleshooting/ai-troubleshooting.md)** yleisten ongelmien ratkaisemiseksi

## Resurssit

- [Azure OpenAI -mallien saatavuus](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps -skaalaus](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI-mallien kustannusten optimointi](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen**: [Microsoft Foundry -integraatio](microsoft-foundry-integration.md)
- **➡️ Seuraava**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->