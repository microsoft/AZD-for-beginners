# AI-mudelite juurutamine Azure Developer CLI abil

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esmane arendus
- **⬅️ Eelmine**: [AI agendid](agents.md)
- **➡️ Järgmine**: [AI töötuba](ai-workshop-lab.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

See juhend annab põhjalikud juhised AI mudelite juurutamiseks AZD mallidega, hõlmates kõike mudeli valikust kuni tootmisse juurutamise mustriteni.

> **Väljalaske ülevaade (2026-11-04):** Seotud CLI muudatused vaadati üle `azd` `1.37.2` vastu; mudelite kättesaadavus, versioonid ja kvotaadid on piirkonniti ja tellimuse põhised. `azd deploy --timeout <seconds>` reguleerib teenuse juurutamise akent, mitte agendi aktiveerimise garantiid. Vaata [praeguseid väljalaseteateid ja AI migratsiooni juhiseid](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Sisukord

- [Mudeli valiku strateegia](#model-selection-strategy)
- [AZD konfiguratsioon AI mudelite jaoks](#azd-configuration-for-ai-models)
- [Juurutamise mustrid](#deployment-patterns)
- [Mudelite haldamine](#model-management)
- [Tootmise kaalutlused](#production-considerations)
- [Jälgimine ja nähtavus](#monitoring-and-observability)

## Mudeli valiku strateegia

### Azure OpenAI mudelid Microsoft Foundrys

Vali oma kasutusjuhtumi jaoks sobiv mudel:

Deklareeri mudelide juurutamised Biceps (allpool), mitte suvalistes `services.*.config.AZURE_OPENAI_MODELS` seadetes. AZD ei tõlgenda sellist seadistust kui mudeliressursside listi. Teenuse `project` viitab rakenduse lähtekoodile, mitte selle `infra/` kataloogile.

Näited kasutavad avaldatud `gpt-4.1-mini` versiooni **`2025-04-14`** ja embedimise versiooni **`1`**. Kinnita, et mudeli versioon ja juurutamise SKU on sinu sihtpiirkonnas/tellimusel toetatud, enne kui juurutad.

### Mudeli mahtude planeerimine

| Mudeli tüüp | Kasutusjuhtum | Illustratiivne tokeni nõudlus | Kulu kaalutlused |
|------------|-------------|--------------------------|-------------------|
| gpt-4.1-mini | Vestlus, K&V | 10 000–50 000 TPM | Võrdle kulu ja kvaliteeti töökoormuse jaoks |
| gpt-4.1 | Keerukad ülesanded | 20 000–100 000 TPM | Hinda kvaliteedi kasvu tokeni kulu vastu |
| text-embedding-3-large | Otsing, RAG | 30 000–120 000 TPM | Arvesta nii andmete ingesteerimist kui ka päringuliiklust |
| Whisper | Kõne tekstiks | Plaani heli kestuse ja päringu piirangute järgi | Ära kasuta tekstimudeli TPM valemit |

TPM tähendab tokenit minutis. Neis Standard tekstipõhistes juurutustes on ARM `sku.capacity` mõõtühikutes **1000 TPM ühikutes**, mitte üksikutes TPM-des (maht `10` tähendab 10 000 TPM). RPM-i ja TPM-i suhe varieerub mudeli ja juurutamise tüübi järgi; kontrolli mõlemad piirid [kvotaadi dokumentatsioonist](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Need näited on illustratiivsed, mitte suuruse soovitused.

## AZD konfiguratsioon AI mudelite jaoks

### Biceps mallikonfiguratsioon

Loo mudeli juurutamised Biceps mallide kaudu:

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

See on ressursside gruppi ulatuv **arenduse infrastruktuuri näide**, mitte täielik AZD rakenduse mall. Kontol on lubatud avalik võrgule juurdepääs ja nõutav on Entra ID/RBAC autentimine (`Cognitive Services OpenAI User` kutsujatele). Tootmises on vajalikud privaatsed lõpp-punktid, DNS ja rakenduse ühenduvus, millest on juttu peatükis 8. AZD vajab ka põhimalle ja parameetrite kaardistust ning rakenduse hosti ressursse; täisjuurutuse jaoks kasuta töökorras näidet.

### Keskkonna muutujad

Konfigureeri oma rakenduse keskkond:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Need on rakenduse määratud nimed; ühenda need oma hosti konfiguratsiooniga. Azure OpenAI v1 lõpp-punkt, mida allpool tervisekontrollis kasutatakse, ei vaja aegunud `api-version` päringut; vanemad `AzureOpenAI` kliendid seda vajavad, nii et järgi oma rakenduse API genereerimist.

## Juurutamise mustrid

### Muster 1: Ühe piirkonna juurutamine

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

Sobib kõige paremini:
- Arenduseks ja testimiseks
- Ühe turu rakendustele
- Kulu optimeerimiseks

### Muster 2: Mitme piirkonna juurutamine

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

Puuduvad konto omadused/SKU tuleb lisada; see fragment ei ole sellisena juurutatav. Juuruta mudelid iga konto alla ja rakenda marsruutimine/käivituskate ning andmete paiknemise kontrollid eraldi.

Sobib kõige paremini:
- Globaalsetele rakendustele
- Kõrge kättesaadavuse nõudmistega
- Koormuse jaotuseks

### Muster 3: Hübriidjuurutamine

Kombineeri Microsoft Foundry mudelid teiste AI teenustega:

Järgnevad fragmendid eeldavad, et nimed ja `location` on sisalduvates mallides määratletud.

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

## Mudelite haldamine

### Versioonihaldus

Jälgi mudeliversioone oma rakenduse konfiguratsioonis või IaC-s. See JSON on **rakenduse määratud näide**, mitte sisseehitatud AZD mudeli skeem; tagavaralahendus tuleb eraldi rakendada ja juurutada:

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

### Mudeli uuendused

Kasuta AZD hooki ainult loetavuskontrolliks, siis uuenda IaC ja juuruta see:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Käivita `azd up` **välja** hookist, et rakendada muudetud mudeli infrastruktuuri ja juurutada koodi. Ära kunagi kutsu `azd deploy` `predeploy` hookist: see käivitab samasuguse hooki rekursiivselt. `azd deploy --timeout 1800` pikendab rakenduse juurutamise ajalimiiti; see ei uuenda Biceps ressursse.

### A/B testimine

Allolev näide valib juurutamise nime ja mahtu; see loob **ühe** juurutuse, mitte A/B testi. Tõelise eksperimendi jaoks juuruta kaks erinevat juurutamise ressurssi, suuna kontrollitud osa päringuid kummaski ja võrdle kvaliteeti, latentsust ja kulusid. Eeldab `openAi` kontonäidist:

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

## Tootmise kaalutlused

### Mahtude planeerimine

Arvuta nõutav maht olenevalt kasutusmustritest:

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

Oodatav väljund: `Required capacity: 9100 TPM`. 1000 TPM ühiku korral ümarda vähemalt `10` peale ning kontrolli mudelipõhist RPM- ja teenuse kiiruse piirangut (sh taotletud väljund eelarvega). See tokeni nõudluse hinnang ei taga, et ei esineks piiranguid.

### Automaatne skaleerimine konfiguratsioon

Konfigureeri automaatne skaleerimine konteinerirakenduste jaoks:

**Osaline ressurss:** ühenda `template.scale` seaded täieliku konteinerirakendusega koos asukoha, hallatava keskkonna, konteineripildi, ressursside ja sissetulekuga. Koopiate hulk ei suurenda mudeli kvota.

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

### Kulu optimeerimine

Rakenda kulukontrollid:

**Illustreeriv eelarve ressurss:** defineeri `budgetStartDate` kujul selle kuu esimene päev UTC ajal (nt `2026-11-01T00:00:00Z` selle ülevaate jaoks) ja asenda kontaktiaadress. Alguskuupäev peab vastama teenuse päevapiirangutele. Eelarved annavad hoiatuse viivituse korral arveldusandmetes; need ei piira kulutusi.

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

## Jälgimine ja nähtavus

### Application Insights integreerimine

Konfigureeri jälgimine AI töökoormuste jaoks:

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

Ressursi fragment eeldab `applicationInsightsName`, `location` ja olemasolevat `logAnalyticsWorkspace`. See juurutab jälgimise, kuid ei instrumendi ega loo kohandatud mõõdikuid.

### Kohandatud mõõdikud

Jälgi AI-spetsiifilisi mõõdikuid:

Kasuta toetatud [Azure Monitor OpenTelemetry jaotust](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), mitte vananenud `applicationinsights` Python SDK-d. Paigalda `azure-monitor-opentelemetry`, sea `APPLICATIONINSIGHTS_CONNECTION_STRING` ja initsialiseeri kord käivitamisel:

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

See näitab atribuudi edastamist, mitte tegelikku mudeli kutsumise instrumendi. Mässi päring span-i sisse, et mõõta selle kestust; vaata `dependencies`/`traces` Application Insightsis. Ära saada viipeid, vastuseid, võtmeid ega tundlikke andmeid sisaldavaid erandite sõnumeid.

### Tervisekontrollid

Rakenda AI teenuse tervise jälgimine:

Paigalda `fastapi`, `uvicorn`, `httpx` ja `azure-identity`. Sea eelnevalt lõpp-punkt/juurutamise muutujad ja anna kutsujale `Cognitive Services OpenAI User`. See **valmiduse proov** kasutab Azure OpenAI v1 andmelauda koos Entra ID-ga; see teeb arveldatava mudelikutse. Käivita `uvicorn health:app` pärast salvestamist failina `health.py`. Kasuta eraldi kerget elujõulisuse kontrolli, kasuta valmisoleku tulemuste kiiruse/piirangu vahemällu salvestust ja ära avalikult avalda ligipääsu seadistuseta seda marsruuti.

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

Oodatud: `GET /health/ai-models` tagastab `200 {"status":"healthy"}`, kui konfigureeritud vestlusjuurutus on kasutatav, või `503`, ilma ülesvoo üksikasju avaldamata. Juurutuste loendamine on haldusoperatsioon ega sobi andmepõhiseks tervise prooviks.

## Järgmised sammud

1. **Vaata üle [Microsoft Foundry integratsiooni juhend](microsoft-foundry-integration.md)** teenuste integratsiooni mustrite jaoks
2. **Lõpeta [AI töötuba](ai-workshop-lab.md)** praktilise kogemuse saamiseks
3. **Rakenda [Tootmise AI tavad](../chapter-08-production/production-ai-practices.md)** ettevõtte juurutuste jaoks
4. **Uuri [AI tõrkeotsingu juhendit](../chapter-07-troubleshooting/ai-troubleshooting.md)** levinud probleemide lahendamiseks

## Ressursid

- [Microsoft Foundry mudelite kättesaadavus](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Konteinerirakenduste skaleerimine](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI mudeli kulu optimeerimine](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esmane arendus
- **⬅️ Eelmine**: [AI agendid](agents.md)
- **➡️ Järgmine**: [AI töötuba](ai-workshop-lab.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->