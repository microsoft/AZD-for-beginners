# Distribusjon av AI-modell med Azure Developer CLI

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige**: [AI-agenter](agents.md)
- **➡️ Neste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

Denne veiledningen gir omfattende instruksjoner for distribusjon av AI-modeller ved bruk av AZD-maler, og dekker alt fra modellvalg til produksjonsdistribusjonsmønstre.

> **Utgivelsesanmeldelse (2026-11-04):** Relaterte CLI-endringer ble gjennomgått mot `azd` `1.37.2`; modelltilgjengelighet, versjoner og kvoter avhenger fortsatt av region og abonnement. `azd deploy --timeout <seconds>` kontrollerer tjenestens distribusjonsvindu, ikke en garanti for agentaktivering. Se [gjeldende utgivelsesnotater og AI-migreringsveiledning](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Innholdsfortegnelse

- [Modellvalgsstrategi](#model-selection-strategy)
- [AZD-konfigurasjon for AI-modeller](#azd-configuration-for-ai-models)
- [Distribusjonsmønstre](#deployment-patterns)
- [Modelladministrasjon](#model-management)
- [Produksjonsbetraktninger](#production-considerations)
- [Overvåking og observabilitet](#monitoring-and-observability)

## Modellvalgsstrategi

### Azure OpenAI-modeller i Microsoft Foundry

Velg riktig modell for ditt brukstilfelle:

Definer modellutplasseringer i Bicep (nedenfor), ikke i vilkårlige `services.*.config.AZURE_OPENAI_MODELS`-innstillinger. AZD tolker ikke en slik innstilling som en liste over modellressurser. En tjenestes `project` peker til applikasjonskilde, ikke til dens `infra/`-katalog.

Eksemplene bruker den publiserte `gpt-4.1-mini`-versjonen **`2025-04-14`** og embedding-versjon **`1`**. Bekreft at modellversjonen og distribusjonsskuen støttes i din målregion/konto før provisjonering.

### Modellkapasitetsplanlegging

| Modelltype | Brukstilfelle | Illustrerende token-behov | Kostnadshensyn |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, spørsmål og svar | 10 000-50 000 TPM | Benchmark kostnad og kvalitet for din arbeidsbelastning |
| gpt-4.1 | Komplekse oppgaver | 20 000-100 000 TPM | Vurder kvalitetsforbedringer mot tokenkostnad |
| text-embedding-3-large | Søk, RAG | 30 000-120 000 TPM | Ta høyde for inntasting samt spørringstrafikk |
| Whisper | Tale-til-tekst | Planlegg med utgangspunkt i lydvarighet og forespørselsgrenser | Ikke bruk en TPM-kapasitetsformel for tekstmodell |

TPM betyr tokens per minutt. For disse Standard tekstdistribusjonene er ARM `sku.capacity` i **1 000-TPM enheter**, ikke enkelt-TPM (kapasitet `10` betyr 10 000 TPM). RPM-til-TPM-forhold varierer med modell/distribusjonstype; verifiser begge grenser mot [kvotedokumentasjonen](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Disse områdene er eksempler, ikke anbefalinger for dimensjonering.

## AZD-konfigurasjon for AI-modeller

### Bicep-mal-konfigurasjon

Opprett modellutplasseringer gjennom Bicep-maler:

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

Dette er et ressursgruppe-avgrenset **utviklingsinfrastruktur-eksempel**, ikke en fullstendig AZD-applikasjonsmal. Kontoen tillater offentlig nettverkstilgang og krever Entra ID/RBAC-autentisering (`Cognitive Services OpenAI User` for anroper). Produksjon krever det private endepunktet, DNS og applikasjonstilkobling beskrevet i kapittel 8. AZD trenger også en hovedmal/parameterkartlegging og applikasjonsvert-ressurser; bruk et fungerende eksempel for full distribusjon.

### Miljøvariabler

Konfigurer ditt applikasjonsmiljø:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Dette er applikasjonsdefinerte navn; koble dem til vertskonfigurasjonen din. Azure OpenAI v1-endepunktet brukt av helsesjekken nedenfor krever ikke den utdaterte `api-version`-spørringsparameteren; eldre `AzureOpenAI`-klienter gjør det, så følg API-genereringen som brukes av din applikasjon.

## Distribusjonsmønstre

### Mønster 1: Enkel-region distribusjon

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

Best egnet for:
- Utvikling og testing
- Enkel-markedsapplikasjoner
- Kostnadsoptimalisering

### Mønster 2: Multi-region distribusjon

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

De utelatte kontoeiendommene/SKU må oppgis; denne fragmenten kan ikke distribueres som skrevet. Distribuer modeller i hver konto og implementer ruting/feilover og datalokalitetskontroller separat.

Best egnet for:
- Globale applikasjoner
- Krav til høy tilgjengelighet
- Lastdistribusjon

### Mønster 3: Hybrid distribusjon

Kombiner Microsoft Foundry-modeller med andre AI-tjenester:

Følgende fragmenter antar at navn og `location` leveres av den omgivende malen.

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

## Modelladministrasjon

### Versjonskontroll

Spor modellversjoner i applikasjonens konfigurasjon eller IaC. Denne JSON er et **applikasjonsdefinert eksempel**, ikke et innebygd AZD-modellskjema; en reserveplan må implementeres og distribueres eksplisitt:

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

### Modelloppdateringer

Bruk en AZD-hook for en skrivebeskyttet tilgjengelighetssjekk, og oppdater deretter IaC og provisjoner den:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Kjør `azd up` **utenfor** hooken for å anvende endret modellinfrastruktur og distribuere kode. Ring aldri `azd deploy` fra en `predeploy`-hook: det utløser rekursivt samme hook. `azd deploy --timeout 1800` forlenger en applikasjonsdistribusjonstimeout; det oppdaterer ikke Bicep-ressurser.

### A/B-testing

Den illustrerende ressursen nedenfor velger et distribusjonsnavn og kapasitet; den oppretter **en** distribusjon, ikke en A/B-test. For et ekte eksperiment, provisjoner to separate distribusjonsressurser, ruter en kontrollert andel av forespørsler til hver, og sammenlign kvalitet, ventetid og kostnad. Det forutsetter `openAi` fra kontoeeksemplet:

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

## Produksjonsbetraktninger

### Kapasitetsplanlegging

Beregn nødvendig kapasitet basert på bruks- og mønsteranalyser:

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

Forventet utdata: `Required capacity: 9100 TPM`. Med 1 000-TPM kapasitetenheter, rund opp til minst `10`, og verifiser så modellspesifikke RPM og tjenestebegrensningsestimeringer (inkludert foreslått resultatbudsjett). Dette estimatet for token-behov er ingen garanti mot struping.

### Autoskalering-konfigurasjon

Konfigurer autoskalering for Container Apps:

**Delvis ressurs:** slå sammen `template.scale`-innstillingene i en komplett Container App med lokasjon, administrert miljø, containerbilde, ressurser og inngang. Skalering av replikaer øker ikke modellkvoten.

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

### Kostnadsoptimalisering

Implementer kostnadskontroller:

**Illustrerende budsjettressurs:** definer `budgetStartDate` som den første dagen i inneværende måned i UTC (for eksempel `2026-11-01T00:00:00Z` for denne gjennomgangen), og erstatt kontaktadressen. Starttidspunktet må tilfredsstille tjenestens gjeldende datobegrensninger. Budsjett varsler om forsinkede faktureringsdata; den stopper ikke utgifter.

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

## Overvåking og observabilitet

### Application Insights-integrasjon

Konfigurer overvåking for AI-arbeidsbelastninger:

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

Ressursfragmentet forutsetter `applicationInsightsName`, `location`, og en eksisterende `logAnalyticsWorkspace`. Det provisjonerer overvåking, men instrumenterer ikke appen eller lager egendefinerte målinger.

### Egne målinger

Spor AI-spesifikke målinger:

Bruk den støttede [Azure Monitor OpenTelemetry-distribusjonen](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), ikke den gamle `applicationinsights` Python SDK. Installer `azure-monitor-opentelemetry`, konfigurer `APPLICATIONINSIGHTS_CONNECTION_STRING`, og initialiser én gang ved oppstart:

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

Dette illustrerer utslipp av attributter, ikke faktisk modell-forespørselsinstrumentering. Pakk den virkelige forespørselen inn i et span for å måle varigheten; undersøk `dependencies`/`traces` i Application Insights. Ikke send prompts, svar, nøkler eller rå unntaksmeldinger som inneholder sensitiv informasjon.

### Helsekontroller

Implementer helseovervåking for AI-tjenester:

Installer `fastapi`, `uvicorn`, `httpx`, og `azure-identity`. Sett endepunkt-/distribusjonsvariablene ovenfor og gi anroper `Cognitive Services OpenAI User`. Denne **readiness-proben** bruker Azure OpenAI v1 dataflyt med Entra ID; den foretar et fakturerbart modellkall. Kjør med `uvicorn health:app` etter lagring som `health.py`. Bruk en separat lettvekts liveness-sjekk, rate-limit/cach readiness-resultater, og eksponer ikke denne ruten offentlig uten tilgangskontroller.

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

Forventet: `GET /health/ai-models` returnerer `200 {"status":"healthy"}` når den konfigurerte chat-distribusjonen er brukbar, eller `503` uten å avsløre oppstrømsdetaljer. Å liste opp distribusjoner er en management-plane-operasjon og er ikke en gyldig data-plane helseprøve.

## Neste steg

1. **Gå gjennom [Microsoft Foundry Integrasjonsveiledning](microsoft-foundry-integration.md)** for tjenesteintegrasjonsmønstre
2. **Fullfør [AI Workshop Lab](ai-workshop-lab.md)** for praktisk erfaring
3. **Implementer [Produksjons-AI-praksis](../chapter-08-production/production-ai-practices.md)** for bedriftsdistribusjoner
4. **Utforsk [AI Feilsøkingsveiledning](../chapter-07-troubleshooting/ai-troubleshooting.md)** for vanlige problemer

## Ressurser

- [Microsoft Foundry Models Modelltilgjengelighet](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Skalering](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Modell Kostnadsoptimalisering](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapittelnavigasjon:**
- **📚 Kursstart**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 2 - AI-først utvikling
- **⬅️ Forrige**: [AI-agenter](agents.md)
- **➡️ Neste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Neste kapittel**: [Kapittel 3: Konfigurasjon](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->