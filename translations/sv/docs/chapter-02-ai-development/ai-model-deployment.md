# Driftsättning av AI-modeller med Azure Developer CLI

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-först-utveckling
- **⬅️ Föregående**: [AI-agenter](agents.md)
- **➡️ Nästa**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

Denna guide ger omfattande instruktioner för driftsättning av AI-modeller med AZD-mallar, och täcker allt från modellval till produktionsdriftsättningsmönster.

> **Versionsgranskning (2026-11-04):** Relaterade ändringar i CLI granskades mot `azd` `1.37.2`; tillgång till modeller, versioner och kvoter är fortfarande regions- och abonnemangsberoende. `azd deploy --timeout <seconds>` styr service-driftsättningsfönstret, inte en garanti för agentaktivering. Se [aktuella versionsanteckningar och AI-migreringsvägledning](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Innehållsförteckning

- [Strategi för modellval](#model-selection-strategy)
- [AZD-konfiguration för AI-modeller](#azd-configuration-for-ai-models)
- [Driftsättningsmönster](#deployment-patterns)
- [Modellhantering](#model-management)
- [Produktionsöverväganden](#production-considerations)
- [Övervakning och observerbarhet](#monitoring-and-observability)

## Strategi för modellval

### Azure OpenAI-modeller i Microsoft Foundry

Välj rätt modell för ditt användningsfall:

Deklarera modell-driftsättningar i Bicep (nedan), inte i godtyckliga `services.*.config.AZURE_OPENAI_MODELS`-inställningar. AZD tolkar inte en sådan inställning som en lista över modellresurser. En tjänsts `project` pekar på applikationskällan, inte dess `infra/`-katalog.

Exemplen använder den publicerade `gpt-4.1-mini`-versionen **`2025-04-14`** och inbäddningsversionen **`1`**. Bekräfta att modellversion och driftsättnings-SKU stöds i din målnregion/konto innan provisionering.

### Planering av modellkapacitet

| Modelltyp | Användningsfall | Illustrativ tokenefterfrågan | Kostnadsöverväganden |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chatt, Frågor & Svar | 10 000-50 000 TPM | Jämför kostnad och kvalitet för din arbetsbelastning |
| gpt-4.1 | Komplexa uppgifter | 20 000-100 000 TPM | Utvärdera kvalitetsvinster mot tokenkostnad |
| text-embedding-3-large | Sök, RAG | 30 000-120 000 TPM | Ta hänsyn till både inmatning och förfrågnings trafik |
| Whisper | Tal-till-text | Planera med ljudduration och förfrågningsgränser | Använd inte text-modell TPM kapacitetsformel |

TPM betyder tokens per minut. För dessa Standard textdriftsättningar är ARM `sku.capacity` i **1 000-TPM-enheter**, inte individuella TPM (kapacitet `10` betyder 10 000 TPM). RPM-till-TPM förhållanden varierar med modell/driftsättningstyp; verifiera båda gränserna mot [kvotdokumentationen](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Dessa intervall är exempel, inte dimensioneringsrekommendationer.

## AZD-konfiguration för AI-modeller

### Bicep-mallkonfiguration

Skapa modell-driftsättningar via Bicep-mallar:

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

Detta är ett resursgruppsbegränsat **exempel på utvecklingsinfrastruktur**, inte en fullständig AZD applikationsmall. Kontot tillåter offentlig nätverksåtkomst och kräver Entra ID/RBAC-autentisering (`Cognitive Services OpenAI User` för anropare). Produktion kräver den privata slutpunkten, DNS och applikationsuppkoppling som beskrivs i Kapitel 8. AZD behöver även en huvudmall/parametermappning och applikationsvärdsresurser; använd ett fungerande exempel för fullständig driftsättning.

### Miljövariabler

Konfigurera din applikationsmiljö:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Dessa är applikationsdefinierade namn; koppla ihop dem med din värdkonfiguration. Azure OpenAI v1-endpoint som används av hälsokontrollen nedan kräver inte den föråldrade `api-version`-sökparameter; äldre `AzureOpenAI`-klienter gör det, så följ API-genereringen som din applikation använder.

## Driftsättningsmönster

### Mönster 1: Driftsättning i en region

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

Bäst för:
- Utveckling och testning
- Applikationer för en marknad
- Kostnadsoptimering

### Mönster 2: Driftsättning i flera regioner

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

De utelämnade kontoegenskaperna/SKU måste anges; denna fragment är inte driftsättningsbar som skriven. Driftsätt modeller i varje konto och implementera routning/failover och datalokaliseringskontroller separat.

Bäst för:
- Globala applikationer
- Krav på hög tillgänglighet
- Lastfördelning

### Mönster 3: Hybriddriftsättning

Kombinera Microsoft Foundry-modeller med andra AI-tjänster:

Följande fragment antar att namn och `location` tillhandahålls av den omslutande mallen.

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

## Modellhantering

### Versionshantering

Spåra modellversioner i din applikations konfiguration eller IaC. Denna JSON är ett **applikationsdefinierat exempel**, inte ett inbyggt AZD-modellschema; en reservplan måste implementeras och driftsättas explicit:

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

### Modelluppdateringar

Använd en AZD-hook för en read-only tillgänglighetskontroll, uppdatera sedan IaC och provisionera den:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Kör `azd up` **utanför** hooken för att tillämpa ändrad modellinfrastruktur och driftsätta kod. Anropa aldrig `azd deploy` från en `predeploy`-hook: det triggar rekursivt samma hook. `azd deploy --timeout 1800` förlänger en applikationsdriftsättningstid utan att uppdatera Bicep-resurser.

### A/B-testning

Den illustrativa resursen nedan väljer ett driftsättningsnamn och kapacitet; den skapar **en** driftsättning, inte ett A/B-test. För ett verkligt experiment, provisionera två distinkta driftsättningsresurser, rutt en kontrollerad andel av förfrågningar till varje, och jämför kvalitet, latens och kostnad. Den antar `openAi` från kontoexemplet:

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

## Produktionsöverväganden

### Kapacitetsplanering

Beräkna nödvändig kapacitet baserat på användningsmönster:

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

Förväntad output: `Required capacity: 9100 TPM`. Med 1 000-TPM kapacitetenheter, avrunda upp till minst `10`, verifiera sedan modell-specifika RPM- och servicerate-limit uppskattningar (inklusive efterfrågad outputbudget). Denna tokenefterfrågeuppskattning är inte en garanti mot begränsning.

### Automatisk skalningskonfiguration

Konfigurera autoskalning för Container Apps:

**Delresurs:** slå ihop `template.scale`-inställningarna till en komplett Container App med plats, hanterad miljö, containerbild, resurser och ingress. Att skala repliker ökar inte modellkvoten.

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

### Kostnadsoptimering

Implementera kostnadskontroller:

**Illustrativ budgetresurs:** definiera `budgetStartDate` som den första dagen i aktuella månaden i UTC (t.ex. `2026-11-01T00:00:00Z` för denna granskning), och ersätt kontaktadressen. Starten måste uppfylla tjänstens aktuella datumkrav. Budgetar varnar vid fördröjd faktureringsdata; de stoppar inte utgifter.

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

## Övervakning och observerbarhet

### Integration med Application Insights

Konfigurera övervakning för AI-arbetsbelastningar:

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

Resursfragmentet antar `applicationInsightsName`, `location` och en befintlig `logAnalyticsWorkspace`. Det provisionerar övervakning men instrumenterar inte appen eller skapar anpassade mätvärden.

### Anpassade mätvärden

Spåra AI-specifika mätvärden:

Använd den stödda [Azure Monitor OpenTelemetry-distributionen](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), inte den äldre `applicationinsights` Python SDK. Installera `azure-monitor-opentelemetry`, konfigurera `APPLICATIONINSIGHTS_CONNECTION_STRING`, och initiera en gång vid start:

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

Detta illustrerar attribututsläpp, inte faktisk instrumentering av modellanrop. Omslut den verkliga förfrågan i ett span för att mäta dess varaktighet; inspektera `dependencies`/`traces` i Application Insights. Skicka inte prompts, svar, nycklar eller råa undantagsmeddelanden som innehåller känslig data.

### Hälsokontroller

Implementera hälsomonitorering för AI-tjänster:

Installera `fastapi`, `uvicorn`, `httpx` och `azure-identity`. Sätt endpoint-/driftsättningsvariabler ovan och ge anroparen `Cognitive Services OpenAI User`. Denna **readiness probe** använder Azure OpenAI v1 dataservice med Entra ID; den gör ett debiterbart modellanrop. Kör med `uvicorn health:app` efter att ha sparat som `health.py`. Använd en separat lättviktig liveness check, begränsa cachade readiness-resultat, och exponera inte denna rutt offentligt utan åtkomstkontroller.

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

Förväntat: `GET /health/ai-models` returnerar `200 {"status":"healthy"}` när den konfigurerade chattdriftsättningen är användbar, eller `503` utan att avslöja detaljer från upstream. Listning av driftsättningar är en hanteringsplanoperation och inte en giltig hälsoprob för dataplan.

## Nästa steg

1. **Granska [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** för tjänsteintegrationsmönster
2. **Slutför [AI Workshop Lab](ai-workshop-lab.md)** för praktisk erfarenhet
3. **Implementera [Produktionspraxis för AI](../chapter-08-production/production-ai-practices.md)** för företagsdriftsättningar
4. **Utforska [AI felsökningsguide](../chapter-07-troubleshooting/ai-troubleshooting.md)** för vanliga problem

## Resurser

- [Tillgänglighet för Microsoft Foundry-modeller](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentation för Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scaling för Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Kostnadsoptimering av AI-modeller](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapitelnavigering:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 2 - AI-först-utveckling
- **⬅️ Föregående**: [AI-agenter](agents.md)
- **➡️ Nästa**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->