# Implementacija AI modela pomoću Azure Developer CLI

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-First Development
- **⬅️ Prethodno**: [AI agenti](agents.md)
- **➡️ Sljedeće**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

Ovaj vodič pruža sveobuhvatne upute za implementaciju AI modela koristeći AZD predloške, pokrivajući sve od odabira modela do obrazaca implementacije u produkciji.

> **Pregled izdanja (2026-11-04):** Povezane promjene CLI su pregledane u odnosu na `azd` `1.37.2`; dostupnost modela, verzije i kvote i dalje ovise o regiji i pretplati. `azd deploy --timeout <seconds>` kontrolira vremenski okvir implementacije usluge, ne jamči aktivaciju agenta. Pogledajte [trenutne napomene o izdanju i smjernice za migraciju AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Sadržaj

- [Strategija odabira modela](#model-selection-strategy)
- [AZD konfiguracija za AI modele](#azd-configuration-for-ai-models)
- [Obrasci implementacije](#deployment-patterns)
- [Upravljanje modelima](#model-management)
- [Razmatranja za produkciju](#production-considerations)
- [Nadzor i opažanje](#monitoring-and-observability)

## Strategija odabira modela

### Azure OpenAI modeli u Microsoft Foundry

Odaberite pravi model za vašu upotrebu:

Izjavite implementacije modela u Bicep-u (dolje), ne u proizvoljnim `services.*.config.AZURE_OPENAI_MODELS` postavkama. AZD ne tumači takvu postavku kao popis resursa modela. `project` usluge ukazuje na izvor aplikacije, a ne na njen `infra/` direktorij.

Primjeri koriste objavljenu verziju `gpt-4.1-mini` **`2025-04-14`** i verziju za ugradnju **`1`**. Potvrdite da su verzija modela i SKU implementacije podržani u vašoj ciljnoj regiji/računu prije provisioniranja.

### Planiranje kapaciteta modela

| Tip modela | Slučaj upotrebe | Ilustrativna potražnja za tokenima | Troškovi |
|------------|-----------------|------------------------------|------------|
| gpt-4.1-mini | Razgovor, Q&A | 10,000-50,000 TPM | Mjerite trošak i kvalitetu za vaše opterećenje |
| gpt-4.1 | Složeni zadaci | 20,000-100,000 TPM | Procijenite poboljšanja kvalitete u odnosu na trošak tokena |
| text-embedding-3-large | Pretraživanje, RAG | 30,000-120,000 TPM | Uzmite u obzir unos kao i promet upita |
| Whisper | Govor u tekst | Planirajte koristeći trajanje zvuka i ograničenja zahtjeva | Nemojte primjenjivati formulu kapaciteta TPM za tekstualne modele |

TPM znači tokeni po minuti. Za ove Standard tekstualne implementacije, ARM `sku.capacity` je u **jedinicama od 1.000 TPM**, a ne pojedinačni TPM (kapacitet `10` znači 10.000 TPM). Odnosi RPM prema TPM variraju ovisno o tipu modela/implementacije; provjerite oba ograničenja u odnosu na [dokumentaciju o kvotama](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Ovi rasponi su primjeri, a ne preporuke za dimenzioniranje.

## AZD konfiguracija za AI modele

### Konfiguracija Bicep predloška

Kreirajte implementacije modela kroz Bicep predloške:

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

Ovo je primjer **razvojne infrastrukture** ograničene na skup resursa, a ne potpuni AZD predložak aplikacije. Račun dopušta javni pristup mreži i zahtijeva Entra ID/RBAC autentifikaciju (`Cognitive Services OpenAI User` za pozivatelje). Produkcija zahtijeva privatnu krajnju točku, DNS i povezanost aplikacije opisanu u Poglavlju 8. AZD također treba glavni predložak/mapiranje parametara i resurse domaćina aplikacije; koristite radni uzorak za potpunu implementaciju.

### Varijable okruženja

Konfigurirajte svoje aplikacijsko okruženje:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Ovo su imena definirana aplikacijom; povežite ih sa svojom konfiguracijom domaćina. Azure OpenAI v1 krajnja točka korištena u donjem zdravstvenom pregledu ne zahtijeva zastarjeli `api-version` upitni parametar; stariji `AzureOpenAI` klijenti ga koriste, stoga slijedite generiranje API-ja koje koristi vaša aplikacija.

## Obrasci implementacije

### Obrazac 1: Implementacija u jednoj regiji

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

Najbolje za:
- Razvoj i testiranje
- Aplikacije za jedno tržište
- Optimizaciju troškova

### Obrazac 2: Implementacija u više regija

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

Izostavljene značajke računa/SKU moraju se osigurati; ovaj odlomak nije moguće implementirati u ovom obliku. Implementirajte modele u svakom računu te zasebno provedite rješavanje ruta/preusmjeravanja i kontrole rezidencije podataka.

Najbolje za:
- Globalne aplikacije
- Zahtjeve za visoku dostupnost
- Raspodjelu opterećenja

### Obrazac 3: Hibridna implementacija

Kombinirajte Microsoft Foundry modele s drugim AI servisima:

Sljedeći odlomci pretpostavljaju da su imena i `location` osigurani od strane uključenog predloška.

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

## Upravljanje modelima

### Kontrola verzija

Pratite verzije modela u konfiguraciji svoje aplikacije ili IaC. Ovaj JSON je **primjer definiran od aplikacije**, a ne ugrađeni AZD modelni shema; rezervna opcija mora se implementirati i izričito postaviti:

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

### Ažuriranja modela

Koristite AZD hook za provjeru dostupnosti samo za čitanje, zatim ažurirajte IaC i postavite ga:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Pokrenite `azd up` **izvan** hook-a da biste primijenili promijeljenu infrastrukturu modela i implementirali kod. Nikad ne pozivate `azd deploy` iz `predeploy` hook-a: to rekurzivno aktivira isti hook. `azd deploy --timeout 1800` produžuje timeout implementacije aplikacije; ne ažurira Bicep resurse.

### A/B testiranje

Slijedeći ilustrativni resurs bira ime implementacije i kapacitet; stvara **jednu** implementaciju, a ne A/B test. Za pravi eksperiment postavite dva različita resursna implementacije, usmjerite kontrolirani dio zahtjeva na svaku i usporedite kvalitetu, latenciju i troškove. Pretpostavlja `openAi` iz primjera računa:

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

## Razmatranja za produkciju

### Planiranje kapaciteta

Izračunajte potrebni kapacitet na temelju obrazaca korištenja:

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

Očekivani izlaz: `Required capacity: 9100 TPM`. Sa 1.000-TPM kapacitetnih jedinica, zaokružite na najmanje `10`, potom provjerite procjenu RPM-a specifičnu za model i ograničenja stope usluge (uključujući zatraženi budžet za izlaz). Ova procjena potražnje tokena nije jamstvo protiv usporavanja.

### Konfiguracija automatskog skaliranja

Konfigurirajte automatsko skaliranje za Container Apps:

**Djelomični resurs:** spojite konfiguracije `template.scale` u cjelovitu Container App s lokacijom, upravljanim okruženjem, slikom spremnika, resursima i ulazom. Skaliranje replika ne povećava kvotu modela.

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

### Optimizacija troškova

Provedite kontrole troškova:

**Ilustrativni resurs budžeta:** definirajte `budgetStartDate` kao prvi dan trenutnog mjeseca u UTC (npr. `2026-11-01T00:00:00Z` za ovu reviziju), i zamijenite kontakt adresu. Početak mora zadovoljavati trenutne zahtjeve servisa za datum. Budžeti upozoravaju na zakašnjele podatke o naplati; ne zaustavljaju trošenje.

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

## Praćenje i preglednost

### Integracija sa Application Insights

Konfigurirajte nadzor za AI radna opterećenja:

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

Ovaj odlomak pretpostavlja `applicationInsightsName`, `location` i postojeći `logAnalyticsWorkspace`. Osigurava praćenje, ali ne instrumentira aplikaciju niti ne stvara prilagođene metrike.

### Prilagođene metrike

Pratite AI-specifične metrike:

Koristite podržani [Azure Monitor OpenTelemetry distribution](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), a ne zastarjeli `applicationinsights` Python SDK. Instalirajte `azure-monitor-opentelemetry`, konfigurirajte `APPLICATIONINSIGHTS_CONNECTION_STRING` i inicijalizirajte jednom prilikom pokretanja:

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

Ovo ilustrira emitiranje atributa, a ne stvarnu instrumentaciju poziva modela. Omotajte stvarni zahtjev u span da biste izmjerili trajanje; pregledajte `dependencies`/`traces` u Application Insights. Nemojte slati promptove, odgovore, ključeve ili poruke o iznimkama koje sadrže osjetljive podatke.

### Zdravstvene provjere

Provedite praćenje zdravlja AI usluga:

Instalirajte `fastapi`, `uvicorn`, `httpx` i `azure-identity`. Postavite gore navedene varijable krajnje točke/implementacije i dodijelite pozivatelju `Cognitive Services OpenAI User`. Ova **probe spremnosti** koristi Azure OpenAI v1 data plane s Entra ID; čini naplatni poziv modelu. Pokrenite s `uvicorn health:app` nakon spremanja kao `health.py`. Koristite zasebnu laganu provjeru 'životnosti', ograničite stopu/i keširajte rezultate spremnosti, i nemojte javno izlagati ovu rutu bez kontrola pristupa.

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

Očekivano: `GET /health/ai-models` vraća `200 {"status":"healthy"}` kada je konfigurirana implementacija chat-a dostupna, ili `503` bez otkrivanja sadržaja iznad razine. Popis implementacija je upravljačka operacija i nije valjana zdravstvena provjera na razini podataka.

## Sljedeći koraci

1. **Pregledajte [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** za obrasce integracije servisa
2. **Završite [AI Workshop Lab](ai-workshop-lab.md)** za praktično iskustvo
3. **Provedite [Production AI Practices](../chapter-08-production/production-ai-practices.md)** za korporativne implementacije
4. **Istražite [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** za uobičajene probleme

## Resursi

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigacija poglavljem:**
- **📚 Početak tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 2 - AI-First razvoj
- **⬅️ Prethodno**: [AI Agents](agents.md)
- **➡️ Sljedeće**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->