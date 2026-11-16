# AI-mallin käyttöönotto Azure Developer CLI:llä

**Luku Navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensimmäinen Kehitys
- **⬅️ Edellinen**: [AI-agentit](agents.md)
- **➡️ Seuraava**: [AI-työpajan laboratorio](ai-workshop-lab.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

Tämä opas tarjoaa kattavat ohjeet AI-mallien käyttöönottoon käyttämällä AZD-malleja, kattaen kaiken mallin valinnasta tuotantoon käyttöönoton malleihin.

> **Julkaisun tarkistus (2026-11-04):** Liittyviä CLI-muutoksia on tarkasteltu `azd` `1.37.2` suhteessa; mallien saatavuus, versiot ja määrärahat ovat alue- ja tilauskohtaisia. `azd deploy --timeout <seconds>` hallitsee palvelun käyttöönottoikkunaa, ei ole takuu agentin aktivoinnista. Katso [nykyiset julkaisumuistiinpanot ja AI-siirtymäohjeet](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Sisällysluettelo

- [Mallin valintastrategia](#model-selection-strategy)
- [AZD-konfigurointi AI-malleille](#azd-configuration-for-ai-models)
- [Käyttöönoton mallit](#deployment-patterns)
- [Mallien hallinta](#model-management)
- [Tuotannon näkökohdat](#production-considerations)
- [Valvonta ja havainnointi](#monitoring-and-observability)

## Mallin valintastrategia

### Azure OpenAI -mallit Microsoft Foundryssa

Valitse oikea malli käyttötarkoitukseesi:

Määritä mallien käyttöönotot Bicepissä (alla), älä satunnaisissa `services.*.config.AZURE_OPENAI_MODELS`-asetuksissa. AZD ei tulkitse tällaista asetusta malliresurssien listaksi. Palvelun `project` viittaa sovelluksen lähteeseen, ei sen `infra/`-hakemistoon.

Esimerkeissä käytetään julkaistua `gpt-4.1-mini` versiota **`2025-04-14`** ja upotuksen versiota **`1`**. Varmista, että malliversio ja käyttöönoton SKU ovat tuettuja kohdealueellasi/tililläsi ennen käyttöönottoa.

### Mallikapasiteetin suunnittelu

| Mallin tyyppi | Käyttötapaus | Havainnollistava token-vaatimus | Kustannusnäkökohdat |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Keskustelu, Kysymykset ja vastaukset | 10 000-50 000 TPM | Testaa kustannus ja laatu työkuormallesi |
| gpt-4.1 | Monimutkaiset tehtävät | 20 000-100 000 TPM | Arvioi laadun parannukset token-kustannuksiin nähden |
| text-embedding-3-large | Haku, RAG | 30 000-120 000 TPM | Huomioi sisäänsyöttö sekä kyselyliikenne |
| Whisper | Puhe tekstiksi | Suunnittele äänitallenteen keston ja pyyntilukujen mukaan | Älä käytä tekstimallin TPM-kapasiteetin kaavaa |

TPM tarkoittaa tokeneita minuutissa. Näissä Standard-tekstikäyttöönotossa ARM `sku.capacity` on **1 000 TPM -yksiköissä**, ei yksittäisissä TPM-yksiköissä (kapasiteetti `10` tarkoittaa 10 000 TPM). RPM-TPM-suhteet vaihtelevat mallin/käyttöönoton mukaan; tarkista molemmat rajat [määrärahadokumentaatiosta](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Nämä vaihteluvälit ovat esimerkkejä, eivät kokoa suosituksia.

## AZD-konfigurointi AI-malleille

### Bicep-mallipohjan konfigurointi

Luo mallien käyttöönotot Bicep-mallipohjien avulla:

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

Tämä on resurssiryhmän laajuinen **kehitysinfrastruktuurin esimerkki**, ei täydellinen AZD-sovelluksen malli. Tili sallii julkisen verkon pääsyn ja edellyttää Entra ID / RBAC -todennusta (`Cognitive Services OpenAI User` kutsujille). Tuotannossa tarvitaan yksityinen päätepiste, DNS ja sovellusyhteydet, jotka on kuvattu luvussa 8. AZD tarvitsee myös päämallipohjan/parametrien kartoituksen ja sovelluksen isäntäresurssit; käytä toimivaa esimerkkiä täyteen käyttöönottoon.

### Ympäristömuuttujat

Konfiguroi sovellusympäristösi:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Nämä ovat sovelluksen määrittelemiä nimiä; liitä ne isäntäkoneen kokoonpanoon. Azure OpenAI v1 -päätepistettä, jota käytetään alla olevassa terveyden tarkistuksessa, ei tarvitse vanhentunutta `api-version` kyselyparametriä; vanhemmat `AzureOpenAI`-asiakkaat tarvitsevat, joten noudata sovelluksesi käyttämää API-generointia.

## Käyttöönoton mallit

### Malli 1: Yhden alueen käyttöönotto

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

Paras:
- Kehitykseen ja testaukseen
- Yhden markkinan sovelluksiin
- Kustannusten optimointiin

### Malli 2: Monialueen käyttöönotto

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

Poistetut tilin ominaisuudet/SKU:t on toimitettava; tämä katkelma ei ole suoraan käytettävissä. Ota mallit käyttöön jokaisessa tilissä ja toteuta reititys/vikavalvonta sekä datan sijainnin hallinta erikseen.

Paras:
- Globaaleihin sovelluksiin
- Korkean käytettävyyden vaatimuksiin
- Kuorman jakeluun

### Malli 3: Hybridikäyttöönotto

Yhdistä Microsoft Foundry -mallit muihin AI-palveluihin:

Seuraavat katkelmat olettavat, että nimet ja `location` ovat mallipohjan määrittelemiä.

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

### Versionhallinta

Seuraa malliversioita sovelluksen konfiguraatiossa tai IaC:ssä. Tämä JSON on **sovelluksen määrittelemä esimerkki**, ei sisäänrakennettu AZD-mallikaava; takaporras on toteutettava ja otettava käyttöön erikseen:

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

### Mallipäivitykset

Käytä AZD-hookia vain-lukuiseen saatavuustarkistukseen ja päivitä sitten IaC ja ota käyttöön:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Suorita `azd up` **hookin ulkopuolella** soveltaaksesi muutettuja mallin infrastruktuureja ja käyttöönotto-koodia. Älä koskaan kutsu `azd deploy`:a `predeploy`-hookista: se laukaisee rekursiivisesti saman hookin. `azd deploy --timeout 1800` jatkaa sovelluksen käyttöönoton aikakatkaisua; se ei päivitä Bicep-resursseja.

### A/B-testaus

Alla oleva kuvaava resurssi valitsee käyttöönoton nimen ja kapasiteetin; se luo **yhden** käyttöönoton, ei A/B-testiä. Todellista koetta varten varaa kaksi erillistä käyttöönottoresurssia, ohjaa hallittu osuus pyynnöistä kumpaankin ja vertaa laatua, viivettä ja kustannuksia. Se olettaa `openAi` tiliesimerkistä:

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

## Tuotantoon liittyvät näkökohdat

### Kapasiteetin suunnittelu

Laske tarvittava kapasiteetti käyttömalleihin perustuen:

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

Odotettu tulos: `Required capacity: 9100 TPM`. 1000 TPM -kapasiteettiyksiköllä pyöristä ylöspäin vähintään `10`:een, ja tarkista sitten mallikohtainen RPM- ja palvelun nopeusrajoitusarvio (sisältäen pyydetyn tulosbudjetin). Tämä tokenien kysynnän arvio ei takaa rajoittamisen puuttumista.

### Automaattisen skaalaamisen asetukset

Määritä automaattinen skaalaus Container Apps -sovelluksille:

**Osittainen resurssi:** yhdistä `template.scale` asetukset täydelliseen Container Appiin, jossa on sijainti, hallittu ympäristö, konttikuvake, resurssit ja sisääntulo. Kopioiden skaalaus ei lisää mallin kiintiötä.

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

Toteuta kustannusten valvonta:

**Kuvaava budjettivaraus:** määritä `budgetStartDate` nykykuukauden ensimmäiseksi päiväksi UTC-ajassa (esimerkiksi `2026-11-01T00:00:00Z` tätä tarkastelua varten), ja vaihda yhteystiedot. Alkamispäivän on täytettävä palvelun nykyiset päivämäärärajoitukset. Budjetit hälyttävät viivästyneestä laskutusaineistosta; ne eivät pysäytä kulutusta.

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

## Seuranta ja havainnointi

### Application Insights -integraatio

Määritä seuranta AI-kuormille:

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

Resurssifragmentti olettaa `applicationInsightsName`, `location`, ja olemassa olevan `logAnalyticsWorkspace`. Se ottaa käyttöön seurannan, mutta ei instrumentoi sovellusta tai luo mukautettuja mittareita.

### Mukautetut mittarit

Seuraa AI-spesifisiä mittareita:

Käytä tuettua [Azure Monitor OpenTelemetry -jakelua](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), ei legacy `applicationinsights` Python SDK:ta. Asenna `azure-monitor-opentelemetry`, määritä `APPLICATIONINSIGHTS_CONNECTION_STRING`, ja alusta kerran käynnistyksessä:

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

Tämä havainnollistaa attribuuttien lähettämistä, ei varsinaista mallikutsun instrumentointia. Kiedo varsinainen pyyntö spanin sisään mitataksesi keston; tarkasta `dependencies`/`traces` Application Insightsissa. Älä lähetä kehoteviestejä, vastauksia, avaimia tai raakoja poikkeusviestejä, jotka sisältävät arkaluontoisia tietoja.

### Terveystarkastukset

Toteuta AI-palvelun terveysvalvonta:

Asenna `fastapi`, `uvicorn`, `httpx` ja `azure-identity`. Aseta yllä olevan palvelupisteen/käyttöönoton muuttujat ja myönnä kutsujalle `Cognitive Services OpenAI User`. Tämä **valmiusprofiili** käyttää Azure OpenAI:n v1 data planea Entra ID:llä; se tekee laskutettavan mallikutsun. Suorita `uvicorn health:app`:lla tallennuksen jälkeen `health.py`. Käytä erillistä kevyttä elinkelpoisuustarkistusta, rajoita/nojaa valmiustuloksiin välimuistia, äläkä paljasta tätä reittiä julkisesti ilman pääsynvalvontaa.

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

Odotettu: `GET /health/ai-models` palauttaa `200 {"status":"healthy"}`, kun määritetty chat-käyttöönotto on käytettävissä, tai `503` ilman yläpuolisten yksityiskohtien paljastamista. Käyttöönottolistaus on hallintaplaneerausoperaatio eikä ole kelvollinen data-plane-terveystarkastus.

## Seuraavat askeleet

1. **Tutustu [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** palvelun integrointimalleihin
2. **Suorita [AI Workshop Lab](ai-workshop-lab.md)** käytännön kokemusta varten
3. **Ota käyttöön [Production AI Practices](../chapter-08-production/production-ai-practices.md)** yrityskäyttöön
4. **Tutki [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** yleisten ongelmien varalta

## Resurssit

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensimmäinen kehitys
- **⬅️ Edellinen**: [AI Agents](agents.md)
- **➡️ Seuraava**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->