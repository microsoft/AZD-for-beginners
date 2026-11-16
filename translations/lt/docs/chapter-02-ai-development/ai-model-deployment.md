# DI Modelių diegimas naudojant Azure Developer CLI

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius – DI pirma vystymas
- **⬅️ Ankstesnis**: [DI Agentai](agents.md)
- **➡️ Kitas**: [DI dirbtuvės laboratorija](ai-workshop-lab.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

Šiame vadove pateikiamos išsamios instrukcijos, kaip diegti DI modelius naudojant AZD šablonus – pradedant nuo modelio pasirinkimo ir baigiant gamybinio diegimo šablonais.

> **Leidimo apžvalga (2026-11-04):** Susiję CLI pakeitimai buvo peržiūrėti su `azd` `1.37.2`; modelių prieinamumas, versijos ir kvotos priklauso nuo regiono ir prenumeratos. `azd deploy --timeout <seconds>` kontroliuoja paslaugos diegimo langą, ne garantiją agentui aktyvuotis. Žr. [dabartines išleidimo pastabas ir DI migracijos rekomendacijas](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Turinys

- [Modelių pasirinkimo strategija](#model-selection-strategy)
- [AZD konfigūracija DI modeliams](#azd-configuration-for-ai-models)
- [Diegimo šablonai](#deployment-patterns)
- [Modelių valdymas](#model-management)
- [Gamybiniai svarstymai](#production-considerations)
- [Stebėsena ir stebimumas](#monitoring-and-observability)

## Modelių pasirinkimo strategija

### Azure OpenAI modeliai Microsoft Foundry aplinkoje

Pasirinkite tinkamą modelį pagal savo naudojimo atvejį:

Modelių diegimus deklaruokite Bicep šablonuose (žemiau), o ne laisvuose `services.*.config.AZURE_OPENAI_MODELS` nustatymuose. AZD tokio nustatymo neinterpretina kaip modelių išteklių sąrašo. Paslaugos `project` nurodo programos šaltinį, o ne jos `infra/` katalogą.

Pavyzdžiuose naudojama paskelbta `gpt-4.1-mini` versija **`2025-04-14`** ir embedding versija **`1`**. Patikrinkite, ar modelio versija ir diegimo SKU palaikomi jūsų tikslinei regiono/paskyros vietai prieš diegiant.

### Modelio talpos planavimas

| Modelio tipas | Naudojimo atvejis | Iliustracinis požymių poreikis | Sąnaudų svarstymai |
|--------------|------------------|----------------------------|-------------------|
| gpt-4.1-mini  | Pokalbiai, klausimai-atsakymai | 10,000-50,000 TPM | Įvertinkite darbo krūvio sąnaudų ir kokybės santykį |
| gpt-4.1       | Sudėtingos užduotys | 20,000-100,000 TPM | Įvertinkite kokybės augimą lyginant su požymių sąnaudomis |
| text-embedding-3-large | Paieška, RAG | 30,000-120,000 TPM | Įvertinkite tiek įvedimo, tiek užklausų srautą |
| Whisper      | Kalbos į tekstą | Planuokite pagal garso trukmę ir užklausų limitus | Nenaudokite TPM talpos formulės tekstiniams modeliams |

TPM reiškia požymių per minutę. Šiems Standartiniams tekstiniams diegimams ARM `sku.capacity` yra **1,000-TPM vienetais**, ne pavieniais TPM (pavyzdžiui, talpa `10` reiškia 10,000 TPM). RPM ir TPM santykiai skiriasi priklausomai nuo modelio/diegimo tipo; patikrinkite abu limitus pagal [kvotų dokumentaciją](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Šie intervalai yra pavyzdžiai, ne dydžio rekomendacijos.

## AZD konfigūracija DI modeliams

### Bicep šablono konfigūracija

Kurkite modelių diegimus per Bicep šablonus:

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

Tai yra išteklių grupės ribų **vystymo infrastruktūros pavyzdys**, ne pilnas AZD programos šablonas. Paskyroje leidžiamas viešasis tinklo prieigos būdas ir reikalaujama Entra ID/RBAC autentifikacija (`Cognitive Services OpenAI User` kvietėjams). Gamyboje reikalingas privatus taškas, DNS ir aprašytas programos ryšys 8 skyriuje. AZD taip pat reikalauja pagrindinio šablono/parametrų žemėlapio ir programos šeimininko išteklių; pilnam diegimui naudokite veikiančius pavyzdžius.

### Aplinkos kintamieji

Konfigūruokite savo programos aplinką:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Tai su programa susieti pavadinimai; susiekite juos su savo šeimininko konfigūracija. Apačioje naudojamas Azure OpenAI v1 galinis taškas sveikatos patikrinimui nereikalauja senosios `api-version` užklausos parametro; senesni `AzureOpenAI` klientai jo reikalauja, tad vadovaukitės API generavimo būdu pagal savo programą.

## Diegimo šablonai

### Šablonas 1: Vieno regiono diegimas

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

Geriausiai tinka:
- Vystymui ir testavimui
- Vienos rinkos programoms
- Sąnaudų optimizavimui

### Šablonas 2: Daugregionis diegimas

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

Praleistos paskyros savybės/SKU turi būti nurodytos; šis fragmentas nepasiekiamas tiesiogiai. Diegkite modelius kiekvienoje paskyroje ir atskirai įgyvendinkite maršrutizavimą/atsarginį perkėlimą bei duomenų lokalizacijos kontrolę.

Geriausiai tinka:
- Pasaulinėms programoms
- Aukštą pasiekiamumo lygį reikalaujantiems sprendimams
- Apkrovos paskirstymui

### Šablonas 3: Hibridinis diegimas

Kombinuokite Microsoft Foundry modelius su kitomis DI paslaugomis:

Toliau pateikti fragmentai numato, kad pavadinimai ir `location` yra pateikti didesnio šablono.

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

## Modelių valdymas

### Versijų valdymas

Sekite modelių versijas savo programos konfigūracijoje arba infrastruktūroje kaip kodas. Šis JSON yra **su programa susieta pavyzdinė struktūra**, ne įmontuota AZD modelio schema; turi būti sukurta rezervinė sistema ir aiškiai išdiegta:

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

### Modelių atnaujinimai

Naudokite AZD kablį skaitymui skirtam prieinamumo patikrinimui, tada atnaujinkite infrastruktūrą kaip kodą ir įdiekite:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Vykdykite `azd up` **už** kablio ribų, kad pritaikytumėte pakeitimus modelio infrastruktūroje ir įdiegtumėte kodą. Niekada nekvieskite `azd deploy` iš `predeploy` kablio: tai rekursyviai suaktyvins tą patį kablį. `azd deploy --timeout 1800` pratęsia programos diegimo laiko limitą; jis neatnaujina Bicep išteklių.

### A/B testavimas

Toliau pateiktas išteklius pasirenka diegimo pavadinimą ir talpą; jis sukuria **vieną** diegimą, ne A/B testą. Tikram eksperimentui sukurkite dvi atskiras diegimo karteles, nukreipkite kontroliuojamą užklausų dalį kiekvienai ir palyginkite kokybę, delsą bei sąnaudas. Jis remiasi `openAi` iš paskyros pavyzdžio:

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

## Gamybiniai svarstymai

### Talpos planavimas

Apskaičiuokite reikiamą talpą pagal naudojimo modelius:

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

Tikėtina išvestis: `Required capacity: 9100 TPM`. Turint 1,000-TPM talpos vienetus, apvalinkite į viršų bent iki `10`, po to patikrinkite modelio specifinius RPM ir paslaugų ribojimo skaičiavimus (įskaitant prašomą išvesties biudžetą). Šis požymių paklausos vertinimas nėra garantija prieš ribojimą.

### Automatinio skalavimo konfigūravimas

Konfigūruokite automatinį skalavimą Container Apps:

**Dalinis išteklius:** sujunkite `template.scale` nustatymus su pilnu Container App, apimančiu vietą, valdomą aplinką, konteinerio atvaizdą, išteklius ir įėjimą. Kartų skaičiaus didinimas nepadidina modelio kvotos.

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

### Sąnaudų optimizavimas

Įgyvendinkite sąnaudų kontrolę:

**Iliustracinis biudžeto išteklius:** apibrėžkite `budgetStartDate` kaip einamojo mėnesio pirmą dieną UTC laiku (pvz., `2026-11-01T00:00:00Z` šiai apžvalgai), ir pakeiskite kontaktinį adresą. Pradžia turi atitikti dabartinius paslaugos datos reikalavimus. Biudžetai signalizuoja apie atidėtas sąskaitų duomenų vėlavimus; jie nesustabdo išlaidų.

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

## Stebėsena ir stebimumas

### Application Insights integracija

Konfigūruokite DI darbo krūvio stebėjimą:

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

Išteklių fragmentas numato `applicationInsightsName`, `location` ir esamą `logAnalyticsWorkspace`. Jis įdiegtas stebėsenai, bet neprogramuoja programos ar sukuria pasirinktinius metrikas.

### Pasirinktinės metrikos

Sekite DI specifines metrikas:

Naudokite palaikomą [Azure Monitor OpenTelemetry distribuciją](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), ne senąjį `applicationinsights` Python SDK. Įdiekite `azure-monitor-opentelemetry`, sukonfigūruokite `APPLICATIONINSIGHTS_CONNECTION_STRING` ir inicializuokite vieną kartą paleidime:

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

Tai iliustruoja atributų perdavimą, ne realią modelio kvietimų instrumentaciją. Apvyniokite tikrą užklausą laike, kad pamatuotumėte trukmę; patikrinkite `dependencies`/`traces` Application Insights. Nesiųskite raginimų, atsakymų, raktų ar žalių išimčių pranešimų su jautriais duomenimis.

### Sveikatos patikros

Įgyvendinkite DI paslaugų sveikatos stebėseną:

Įdiekite `fastapi`, `uvicorn`, `httpx` ir `azure-identity`. Nustatykite aukščiau galinio taško/diegimo kintamuosius ir suteikite kvietėjui `Cognitive Services OpenAI User` teises. Ši **parengties patikra** naudoja Azure OpenAI v1 duomenų sritį su Entra ID; ji sukuria apmokestinamą modelio kvietimą. Vykdykite su `uvicorn health:app` įrašę kaip `health.py`. Naudokite atskirą lengvą gyvybingumo patikrą, ribokite spartą/saugokite parengties rezultatus ir neviešinkite šio maršruto be prieigos kontrolės.

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

Tikėtina: `GET /health/ai-models` grąžina `200 {"status":"healthy"}`, kai sukonfigūruotas pokalbių diegimas yra naudojamas, arba `503` neatskleisdamas vidinių detalių. Diegimų sąrašas yra valdymo srities operacija ir nėra tinkama duomenų srities sveikatos patikra.

## Tolimesni žingsniai

1. **Peržiūrėkite [Microsoft Foundry integracijos vadovą](microsoft-foundry-integration.md)** paslaugų integracijos šablonams
2. **Baikite [DI dirbtuvių laboratoriją](ai-workshop-lab.md)** praktinei patirčiai
3. **Įgyvendinkite [gamybinius DI sprendimus](../chapter-08-production/production-ai-practices.md)** įmonių diegimams
4. **Tyrinėkite [DI trikčių šalinimo vadovą](../chapter-07-troubleshooting/ai-troubleshooting.md)** dažnoms problemoms

## Ištekliai

- [Microsoft Foundry modelių prieinamumas](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps skalavimas](https://learn.microsoft.com/azure/container-apps/scale-app)
- [DI modelių sąnaudų optimizavimas](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius – DI pirma vystymas
- **⬅️ Ankstesnis**: [DI Agentai](agents.md)
- **➡️ Kitas**: [DI dirbtuvės laboratorija](ai-workshop-lab.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->