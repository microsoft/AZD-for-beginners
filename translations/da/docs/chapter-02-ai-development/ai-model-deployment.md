# AI Model Deployment med Azure Developer CLI

**Kapitelnavigation:**
- **📚 Kursusstart**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-Første Udvikling
- **⬅️ Forrige**: [AI Agents](agents.md)
- **➡️ Næste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

Denne vejledning giver omfattende instruktioner til implementering af AI-modeller ved hjælp af AZD-skabeloner, der dækker alt fra modelvalg til produktionsimplementeringsmønstre.

> **Udgivelsesanmeldelse (2026-11-04):** Relaterede CLI-ændringer blev gennemgået i forhold til `azd` `1.37.2`; modeltilgængelighed, versioner og kvoter forbliver regions- og abonnementafhængige. `azd deploy --timeout <seconds>` styrer tjenestens implementeringsvindue, ikke en garanti for agentaktivering. Se [nuværende udgivelsesnoter og AI-migreringsvejledning](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Indholdsfortegnelse

- [Strategi for modelvalg](#model-selection-strategy)
- [AZD-konfiguration for AI-modeller](#azd-configuration-for-ai-models)
- [Implementeringsmønstre](#deployment-patterns)
- [Modeladministration](#model-management)
- [Produktionshensyn](#production-considerations)
- [Overvågning og observabilitet](#monitoring-and-observability)

## Strategi for modelvalg

### Azure OpenAI-modeller i Microsoft Foundry

Vælg det rette model til dit anvendelsestilfælde:

Angiv modelimplementeringer i Bicep (nedenfor), ikke i vilkårlige `services.*.config.AZURE_OPENAI_MODELS`-indstillinger. AZD fortolker ikke en sådan indstilling som en liste over modelleressourcer. En tjenestes `project` peger på applikationskilde, ikke til dens `infra/`-mappe.

Eksemplerne bruger den offentliggjorte `gpt-4.1-mini`-version **`2025-04-14`** og embedding-version **`1`**. Bekræft, at modelversion og implementerings-SKU understøttes i din målregion/konto, før du opretter ressourcen.

### Modelkapacitetsplanlægning

| Modeltype | Anvendelsestilfælde | Illustrativ tokenefterspørgsel | Omkostningshensyn |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Q&A | 10.000-50.000 TPM | Benchmark omkostninger og kvalitet for din arbejdsbyrde |
| gpt-4.1 | Komplekse opgaver | 20.000-100.000 TPM | Evaluer kvalitetsforbedringer mod tokenomkostninger |
| text-embedding-3-large | Søgning, RAG | 30.000-120.000 TPM | Tag højde for både indtagelse og forespørgselstrafik |
| Whisper | Tale-til-tekst | Planlæg ud fra lydvarighed og anmodningsbegrænsninger | Anvend ikke TPM-kapacitetsformel fra tekstmodel |

TPM betyder tokens per minut. For disse Standard tekstimplementeringer er ARM `sku.capacity` i **1.000-TPM enheder**, ikke individuelle TPM (kapacitet `10` betyder 10.000 TPM). RPM-til-TPM forhold varierer efter model-/implementeringstype; verificer begge grænser mod [kvotedokumentation](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Disse intervaller er eksempler, ikke størrelsesanbefalinger.

## AZD-konfiguration for AI-modeller

### Bicep-skabelonkonfiguration

Opret modelimplementeringer via Bicep-skabeloner:

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

Dette er et ressourcegruppe-afgrænset **udviklingsinfrastruktureksempel**, ikke en komplet AZD-applikationsskabelon. Kontoen tillader offentlig netværksadgang og kræver Entra ID/RBAC-godkendelse (`Cognitive Services OpenAI User` for kaldere). Produktion kræver privat endepunkt, DNS og applikationsforbindelse som beskrevet i Kapitel 8. AZD har også brug for en hovedskabelon/parametermapping og applikationshost-ressourcer; brug et fungerende eksempel til fuld implementering.

### Miljøvariabler

Konfigurer dit applikationsmiljø:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Dette er applikationsdefinerede navne; integrer dem i din hostkonfiguration. Azure OpenAI v1 endpointet, der bruges af sundhedstjekket nedenfor, kræver ikke den daterede `api-version` forespørgselsparameter; ældre `AzureOpenAI` klienter gør, så følg den API-generation, din applikation bruger.

## Implementeringsmønstre

### Mønster 1: Enkel-region-implementering

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

Bedst til:
- Udvikling og test
- Enkeltmarked-applikationer
- Omkostningsoptimering

### Mønster 2: Multi-region-implementering

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

De udeladte kontoejendomme/SKU skal leveres; denne fragment kan ikke implementeres som skrevet. Implementer modeller i hver konto og implementer routing/failover og dataplacering separat.

Bedst til:
- Globale applikationer
- Krav om høj tilgængelighed
- Belastningsfordeling

### Mønster 3: Hybrid implementering

Kombiner Microsoft Foundry-modeller med andre AI-tjenester:

Følgende fragmenter antager, at navne og `location` leveres af den indeholdende skabelon.

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

## Modeladministration

### Versionsstyring

Spor modelversioner i din applikations konfiguration eller IaC. Denne JSON er et **applikationsdefineret eksempel**, ikke et indbygget AZD-modelskema; en fallback skal implementeres og deployeres eksplicit:

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

### Modelopdateringer

Brug et AZD-hook til en skrivebeskyttet tilgængelighedskontrol, opdater derefter IaC og udrul det:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Kør `azd up` **udenfor** hooken for at anvende ændret modelinfrastruktur og udrulningskode. Kald aldrig `azd deploy` fra et `predeploy` hook: det udløser rekursivt det samme hook. `azd deploy --timeout 1800` udvider en applikationsudrulnings timeout; det opdaterer ikke Bicep-ressourcer.

### A/B-test

Det illustrative resource nedenfor vælger et implementeringsnavn og kapacitet; det opretter **én** implementering, ikke en A/B-test. For et ægte eksperiment, opret to separate implementeringsressourcer, led en kontrolleret andel af forespørgsler til hver og sammenlign kvalitet, latenstid og omkostning. Det antager `openAi` fra kontoeksemplet:

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

## Produktionshensyn

### Kapacitetsplanlægning

Beregn nødvendig kapacitet baseret på brugsmønstre:

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

Forventet output: `Required capacity: 9100 TPM`. Med 1.000-TPM kapacitetenheder, rund op til mindst `10`, og verificer derefter model-specifik RPM og tjenestes grænseværdiberegning (inklusive anmodet outputbudget). Dette token-efterspørgselsestimat er ikke en garanti mod throttling.

### Auto-skalering konfiguration

Konfigurer auto-skalering for Container Apps:

**Delvis ressource:** flet `template.scale` indstillingerne ind i en komplet Container App med placering, styret miljø, containerbillede, ressourcer og adgang. Skalering af replikaer øger ikke modelkvote.

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

### Omkostningsoptimering

Implementer omkostningskontroller:

**Illustrativt budgetresource:** definer `budgetStartDate` som den første dag i indeværende måned i UTC (for eksempel `2026-11-01T00:00:00Z` for denne gennemgang), og erstat kontaktadressen. Starten skal opfylde tjenestens aktuelle datobegrænsninger. Budgetter alarmerer om forsinkede faktureringsdata; de stopper ikke forbrug.

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

## Overvågning og observabilitet

### Integration med Application Insights

Konfigurer overvågning af AI-arbejdsbyrder:

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

Ressourcefragmentet antager `applicationInsightsName`, `location` og en eksisterende `logAnalyticsWorkspace`. Det opretter overvågning, men instrumenterer ikke appen eller opretter brugerdefinerede metrics.

### Brugerdefinerede metrics

Spor AI-specifikke målinger:

Brug den understøttede [Azure Monitor OpenTelemetry-distribution](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), ikke den ældre `applicationinsights` Python SDK. Installer `azure-monitor-opentelemetry`, konfigurer `APPLICATIONINSIGHTS_CONNECTION_STRING`, og initialiser én gang ved opstart:

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

Dette illustrerer attributudsendelse, ikke reel instrumentering af modelkald. Pak den rigtige anmodning ind i en span for at måle varigheden; inspekter `dependencies`/`traces` i Application Insights. Send ikke prompts, svar, nøgler eller rå undtagelsesmeddelelser, der indeholder følsomme data.

### Sundhedstjek

Implementer sundhedsovervågning af AI-tjenesten:

Installer `fastapi`, `uvicorn`, `httpx` og `azure-identity`. Indstil endpoint-/implementeringsvariablerne ovenfor og giv kaldende `Cognitive Services OpenAI User` adgang. Denne **readiness probe** bruger Azure OpenAI v1 dataplane med Entra ID; den laver et fakturerbart modelkald. Kør med `uvicorn health:app` efter lagring som `health.py`. Brug et separat let liveness-tjek, begræns/cache readiness-resultater og eksponer ikke denne rute offentligt uden adgangskontrol.

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

Forventet: `GET /health/ai-models` returnerer `200 {"status":"healthy"}`, når den konfigurerede chatimplementering er brugbar, eller `503` uden at afsløre interne detaljer. Oplistning af implementeringer er en administrationsplaneoperation og er ikke gyldigt sundhedsprobe for dataplane.

## Næste skridt

1. **Gennemgå [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** for tjenesteintegrationsmønstre
2. **Fuldfør [AI Workshop Lab](ai-workshop-lab.md)** for praktisk erfaring
3. **Implementer [Produktions AI-praksis](../chapter-08-production/production-ai-practices.md)** for enterprise-implementeringer
4. **Udforsk [AI-fejlfinding Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** for almindelige problemer

## Ressourcer

- [Microsoft Foundry Models Modelltilgængelighed](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Skalering](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Omkostningsoptimering](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapitelnavigation:**
- **📚 Kursusstart**: [AZD For Beginners](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 2 - AI-Første Udvikling
- **⬅️ Forrige**: [AI Agents](agents.md)
- **➡️ Næste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Næste kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->