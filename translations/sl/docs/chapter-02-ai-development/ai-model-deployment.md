# Uporaba AI modelov z Azure Developer CLI

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z AI v ospredju
- **⬅️ Prejšnje**: [AI agenti](agents.md)
- **➡️ Naslednje**: [Delavnica AI laboratorij](ai-workshop-lab.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

Ta vodič nudi celovita navodila za uporabo AI modelov z uporabo AZD predlog, pri čemer zajema vse od izbire modela do vzorcev uporabe v produkciji.

> **Pregled izdaje (2026-11-04):** Pri povezani spremembi CLI smo preverili `azd` `1.37.2`; razpoložljivost modelov, različice in kvote so še vedno odvisne od regije in naročnine. `azd deploy --timeout <seconds>` nadzira časovni okvir uvedbe storitve, ne zagotavlja aktivacije agenta. Oglejte si [trenutne opombe k izdaji in smernice za migracijo AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Kazalo

- [Strategija izbire modela](#model-selection-strategy)
- [Konfiguracija AZD za AI modele](#azd-configuration-for-ai-models)
- [Vzorec uvedbe](#deployment-patterns)
- [Upravljanje modelov](#model-management)
- [Premisleki za produkcijo](#production-considerations)
- [Nadzor in opazovanje](#monitoring-and-observability)

## Strategija izbire modela

### Azure OpenAI modeli v Microsoft Foundry

Izberite pravilen model za vašo uporabo:

Izpostavite uvedbe modelov v Bicep (spodaj), ne v poljubnih `services.*.config.AZURE_OPENAI_MODELS` nastavitvah. AZD ne interpretira takšne nastavitve kot seznam virov modelov. `project` storitve kaže na izvor aplikacije, ne na njen `infra/` imenik.

Primeri uporabljajo objavljeno različico `gpt-4.1-mini` **`2025-04-14`** in verzijo vdelave **`1`**. Pred zagonom preverite, da sta različica modela in SKU uvedbe podprta v vaši ciljni regiji/naročnini.

### Načrtovanje zmogljivosti modela

| Vrsta modela | Uporaba | Približna potreba po tokenih | Stroškovni premisleki |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Klepet, vprašanja in odgovori | 10.000-50.000 TPM | Preizkus stroškov in kakovosti za vaše delo |
| gpt-4.1 | Kompleksne naloge | 20.000-100.000 TPM | Ocenite izboljšave kakovosti glede na stroške tokenov |
| text-embedding-3-large | Iskanje, RAG | 30.000-120.000 TPM | Upoštevajte tudi prenos podatkov in promet poizvedb |
| Whisper | Govor v besedilo | Načrtujte glede na trajanje avdio posnetka in omejitve zahtev | Ne uporabljajte formule zmogljivosti TPM za tekstovne modele |

TPM pomeni število tokenov na minuto. Za te standardne tekstovne uvedbe je ARM `sku.capacity` v enotah **1000 TPM**, ne posameznih TPM (kapaciteta `10` pomeni 10.000 TPM). Razmerja med RPM in TPM se razlikujejo glede na model/vrsto uvedbe; preverite oba limita glede na [dokumentacijo za kvote](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Ti primeri so ilustrativni, ne priporočila za velikost.

## Konfiguracija AZD za AI modele

### Konfiguracija predloge Bicep

Ustvarite uvedbe modelov prek predlog Bicep:

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

To je primer **razvojne infrastrukture**, omejene na skupino virov, ne popolna predloga aplikacije AZD. Naročnina dovoljuje javni dostop do omrežja in zahteva Overjanje Entra ID/RBAC (za klice uporabite `Cognitive Services OpenAI User`). Za produkcijo potrebujete zasebni končni točki, DNS in povezljivost aplikacije, opisano v poglavju 8. AZD potrebuje tudi glavno predlogo/mapiranje parametrov in vire gostitelja aplikacije; uporabite delujoč primer za popolno uvedbo.

### Spremenljivke okolja

Konfigurirajte okolje vaše aplikacije:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

To so imena, določena v aplikaciji; povežite jih v konfiguracijo gostitelja. Azure OpenAI v1 končna točka, uporabljena za spodnji zdravstveni pregled, ne zahteva zastarelega parametra poizvedbe `api-version`; starejši odjemalci `AzureOpenAI` pa, zato sledite API specifikaciji, ki jo uporablja vaša aplikacija.

## Vzorec uvedbe

### Vzorec 1: Uvedba v eni regiji

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

Najbolj primerno za:
- Razvoj in testiranje
- Aplikacije na enem trgu
- Optimizacija stroškov

### Vzorec 2: Uvedba v več regijah

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

Izpuščene lastnosti naročnine/SKU morate dodati; ta fragment ni uporaben kot je. Uvedite modele v vsaki naročnini in izvedite usmerjanje/preklop ter kontrole naselitve podatkov ločeno.

Najbolj primerno za:
- Globalne aplikacije
- Zahteve po visoki razpoložljivosti
- Razpršitev obremenitve

### Vzorec 3: Hibridna uvedba

Združite Microsoft Foundry modele z drugimi AI storitvami:

Naslednji fragmenti predpostavljajo, da imena in `location` določi vsebovana predloga.

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

## Upravljanje modelov

### Nadzor različic

Spremljajte različice modelov v konfiguraciji vaše aplikacije ali infrastrukturi kot kodi. Ta JSON je **primer, določen z aplikacijo**, ne vgrajena AZD shema modela; treba je uvesti rezervno možnost in jo izrecno uvesti:

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

### Posodobitve modela

Uporabite AZD hook za preverjanje razpoložljivosti samo za branje, nato posodobite infrastrukturo kot kodo in jo uvedite:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Zaženite `azd up` **izven** hooka za uporabo spremenjene infrastrukture modela in uvedbo kode. Nikoli ne kličite `azd deploy` iz hooka `predeploy`: sproži isto hook rekurzivno. `azd deploy --timeout 1800` podaljša časovno omejitev uvedbe aplikacije; ne posodablja virov Bicepa.

### A/B testiranje

Spodnji primer vira izbere ime uvedbe in kapaciteto; ustvari **eno** uvedbo, ne A/B testa. Za pravi eksperiment uvedite dva ločena vira uvedbe, usmerjajte nadzorovan delež zahtev vsaki in primerjajte kakovost, zakasnitev in stroške. Predpostavlja `openAi` iz primera naročnine:

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

## Premisleki za produkcijo

### Načrtovanje zmogljivosti

Izračunajte potrebno zmogljivost glede na vzorce uporabe:

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

Pričakovan izhod: `Required capacity: 9100 TPM`. Z enotami zmogljivosti 1000 TPM zaokrožite na vsaj `10`, nato preverite ocene RPM in omejitve hitrosti storitve specifične za model (vključno z zahtevanim proračunom izpisa). Ta ocena potrebe po tokenih ni zagotovilo proti dušenju.

### Konfiguracija samodejnega skaliranja

Konfigurirajte samodejno skaliranje za Container Apps:

**Delni vir:** združite nastavitve `template.scale` v celovit Container App z lokacijo, upravljanim okoljem, slikami kontejnerjev, viri in vhodom. Povečanje števila replik ne poveča kvote modela.

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

### Optimizacija stroškov

Uvedite kontrole stroškov:

**Primer vira proračuna:** določite `budgetStartDate` kot prvi dan tekočega meseca v UTC (na primer `2026-11-01T00:00:00Z` za ta pregled) in zamenjajte kontaktni naslov. Začetek mora ustrezati trenutnim omejitvam datuma storitve. Proračuni opozarjajo o zamujenih podatkih o obračunu; ne ustavijo porabe.

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

## Nadzor in opazovanje

### Integracija Application Insights

Konfigurirajte nadzor za AI obremenitve:

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

Ta fragment virov predpostavlja `applicationInsightsName`, `location` in obstoječi `logAnalyticsWorkspace`. Uvedbo nadzora opravi, vendar ne instrumentira aplikacije ali ustvari lastnih metrik.

### Lastne metrike

Spremljajte metrike, specifične za AI:

Uporabljajte podprto [Azure Monitor OpenTelemetry distribucijo](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), ne zastarelega `applicationinsights` Python SDK. Namestite `azure-monitor-opentelemetry`, konfigurirajte `APPLICATIONINSIGHTS_CONNECTION_STRING` in inicializirajte enkrat ob zagonu:

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

To prikazuje oddajo atributov, ne dejansko instrumentacijo klica modela. Ovoj pravi zahtevek v span za merjenje trajanja; preglejte `dependencies`/`traces` v Application Insights. Ne pošiljajte pozivov, odgovorov, ključev ali surovih sporočil napak, ki vsebujejo občutljive podatke.

### Preverjanje zdravja

Uvedite nadzor zdravja AI storitve:

Namestite `fastapi`, `uvicorn`, `httpx` in `azure-identity`. Nastavite zgornje spremenljivke za končno točko/uvedbo in dodelite kličevalcu `Cognitive Services OpenAI User`. Ta **preverjanje pripravljenosti** uporablja Azure OpenAI v1 podatkovno plast z Entra ID; gre za zaračunljiv klic modela. Zaženite z `uvicorn health:app` po shranjevanju kot `health.py`. Uporabite ločeno lahkotno preverjanje delovanja, omejite hitrost/shranjujte rezultate pripravljenosti in ne izpostavite te poti javno brez kontrol dostopa.

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

Pričakovano: `GET /health/ai-models` vrne `200 {"status":"healthy"}`, ko je nameščena uvedba klepetalnega modela uporabna, ali `503` brez razkrivanja podrobnosti flere. Seznam uvedb je upravljavska operacija in ni veljavni zdravstveni pregled podatkovne plasti.

## Naslednji koraki

1. **Preglejte [Microsoft Foundry Integracijski vodič](microsoft-foundry-integration.md)** za vzorce integracije storitev
2. **Dokončajte [Delavnico AI laboratorij](ai-workshop-lab.md)** za praktične izkušnje
3. **Izvedite [Prakse AI za produkcijo](../chapter-08-production/production-ai-practices.md)** za uvedbe v podjetjih
4. **Raziščite [Vodič za odpravljanje težav z AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** za pogoste težave

## Viri

- [Razpoložljivost modelov Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Razširjanje Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimizacija stroškov AI modelov](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 2 - Razvoj z AI v ospredju
- **⬅️ Prejšnje**: [AI agenti](agents.md)
- **➡️ Naslednje**: [Delavnica AI laboratorij](ai-workshop-lab.md)
- **🚀 Naslednje poglavje**: [Poglavje 3: Konfiguracija](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->