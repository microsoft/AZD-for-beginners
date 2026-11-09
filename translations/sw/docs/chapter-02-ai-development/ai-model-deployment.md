# Utekelezaji wa Mfano wa AI kwa kutumia Azure Developer CLI

**Uelekezaji wa Sura:**
- **📚 Kwanza ya Kozi**: [AZD Kwa Anwani](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Iliyopita**: [Maajenti wa AI](agents.md)
- **➡️ Ifuatayo**: [Soma Warsha ya AI](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura ya 3: Usanidi](../chapter-03-configuration/configuration.md)

Mwongozo huu unatoa maelekezo kamili ya kutekeleza mifano ya AI kwa kutumia templeti za AZD, ukifunika kila kitu kutoka kwenye uchaguzi wa mfano hadi mifumo ya utekelezaji wa uzalishaji.

> **Mapitio ya toleo (2026-11-04):** Mabadiliko yanayohusiana ya CLI yalipitiwa dhidi ya `azd` `1.37.2`; upatikaji wa mfano, matoleo, na kanda bado hutegemea mkoa na akaunti ya usajili. `azd deploy --timeout <seconds>` inadhibiti dirisha la utekelezaji wa huduma, si dhamana ya kuwashwa kwa maajenti. Angalia [maelezo ya sasa ya toleo na mwongozo wa uhamisho wa AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Jedwali la Yaliyomo

- [Mkakati wa Uchaguzi wa Mfano](#model-selection-strategy)
- [Usanidi wa AZD kwa Mifano ya AI](#azd-configuration-for-ai-models)
- [Mifumo ya Utekelezaji](#deployment-patterns)
- [Usimamizi wa Mfano](#model-management)
- [Mazingira ya Uzalishaji](#production-considerations)
- [Ufuatiliaji na Uonekano](#monitoring-and-observability)

## Mkakati wa Uchaguzi wa Mfano

### Mifano ya Azure OpenAI katika Microsoft Foundry

Chagua mfano sahihi kwa matumizi yako:

Taja utekelezaji wa mifano katika Bicep (chini), sio katika mipangilio isiyo rasmi ya `services.*.config.AZURE_OPENAI_MODELS`. AZD haisemi mipangilio hiyo kama orodha ya rasilimali za mfano. `project` ya huduma inaelekeza kwenye chanzo cha programu, sio saraka ya `infra/`.

Mifano hutumia toleo lililotangazwa la `gpt-4.1-mini` **`2025-04-14`** na toleo la embedding **`1`**. Thibitisha kuwa toleo la mfano na SKU ya utekelezaji vinaungwa mkono katika mkoa/akaunti yako lengwa kabla ya kuanzisha.

### Mipango ya Uwezo wa Mfano

| Aina ya Mfano | Matumizi | Mahitaji ya Tokeni kwa Mfano | Madhumuni ya Gharama |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Mazungumzo, Maswali na Majibu | 10,000-50,000 TPM | Pima gharama na ubora kwa kazi yako |
| gpt-4.1 | Kazi ngumu | 20,000-100,000 TPM | Tathmini faida za ubora dhidi ya gharama ya tokeni |
| text-embedding-3-large | Utafutaji, RAG | 30,000-120,000 TPM | Fikiria kuhusu ulaji pamoja na trafiki ya maswali |
| Whisper | Hotuba-kuandikwa | Panga kwa kutumia muda wa sauti na mipaka ya maombi | Usitumie formula ya uwezo wa TPM wa mfano wa maandishi |

TPM ina maana tokeni kwa dakika. Kwa utekelezaji huu wa maandishi wa Standard, ARM `sku.capacity` iko katika **vifaa vya 1,000-TPM**, si TPM moja moja (uwezo wa `10` una maana 10,000 TPM). Uwiano wa RPM hadi TPM hubadilika kulingana na aina ya mfano/utekelezaji; hakikisha mipaka yote ikilinganishwa na [nyaraka za quota](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Mipaka hii ni mifano, si mapendekezo ya ukubwa.

## Usanidi wa AZD kwa Mifano ya AI

### Usanidi wa Templeti ya Bicep

Unda utekelezaji wa mfano kupitia templeti za Bicep:

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

Hii ni mfano wa **miundombinu ya maendeleo iliyoko ndani ya kundi la rasilimali**, si templeti kamili ya programu ya AZD. Akaunti inaruhusu upatikanaji wa mtandao wa umma na inahitaji uthibitishaji wa Entra ID/RBAC (`Cognitive Services OpenAI User` kwa wito). Uzalishaji unahitaji sehemu ya binafsi, DNS, na muunganisho wa programu ulioelezewa katika Sura ya 8. AZD pia inahitaji templeti kuu/mwandiko wa vigezo na rasilimali za mwenyeji wa programu; tumia mfano unaofanya kazi kwa utekelezaji kamili.

### Mabadiliko ya Mazingira

Sanidi mazingira ya programu yako:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Haya ni majina yaliyotengwa na programu; yaunganishe katika usanidi wa mwenyeji wako. Sehemu ya Azure OpenAI v1 inayotumika kwa ukaguzi wa afya hapa chini haina hitaji la vigezo vya uchunguzi vya zamani vya `api-version`; wateja wa zamani `AzureOpenAI` wanahitaji, hivyo fuata kizazi cha API kinachotumika na programu yako.

## Mifumo ya Utekelezaji

### Mfano 1: Utekelezaji wa Mkoa Mmoja

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

Bora kwa:
- Maendeleo na majaribio
- Programu za soko moja
- Uboreshaji wa gharama

### Mfano 2: Utekelezaji wa Mikoa Mingi

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

Mali zilizokosewa za akaunti/SKU lazima ziwasilishwe; kipande hiki hakiwezi kutekelezwa kama kilivyoandikwa. Tekeleza mifano katika kila akaunti na tekeleza usambazaji/uhamisho wa mtiririko na udhibiti wa makazi ya data kando.

Bora kwa:
- Programu za kimataifa
- Mahitaji ya upatikanaji mkubwa
- Ugawaji mzigo

### Mfano 3: Utekelezaji Mchanganyiko

Changanya Mifano ya Microsoft Foundry na huduma zingine za AI:

Vipande vifuatavyo vinadhani majina na `location` vinatolewa na templeti yenyewe.

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

## Usimamizi wa Mfano

### Udhibiti wa Matoleo

Fuata matoleo ya mfano katika usanidi wa programu yako au IaC. JSON hii ni **mfano ulioainishwa na programu**, si dumbe la mfano lililojengwa la AZD; suluhisho la dharura lazima litekelezwe na kutekelezwa wazi:

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

### Mabadiliko ya Mfano

Tumia hook ya AZD kwa ukaguzi wa upatikanaji wa kusoma tu, kisha sasisha IaC na uitenge:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Endesha `azd up` **nje** ya hook ili kutekeleza mabadiliko ya miundombinu ya mfano na kusambaza msimbo. Usitoe wito `azd deploy` kutoka hook ya `predeploy`: inalazimisha tena hook hiyo hiyo. `azd deploy --timeout 1800` hupanua muda wa utekelezaji wa programu; haibadili rasilimali za Bicep.

### Mtihani wa A/B

Rasilimali ya mfano hapa chini huchagua jina la utekelezaji na uwezo; hutengeneza utekelezaji **mmoja**, si mtihani wa A/B. Kwa jaribio halisi, toa rasilimali mbili tofauti za utekelezaji, pelekesha sehemu inayodhibitiwa ya maombi kwa kila moja, na linganisha ubora, ucheleweshaji, na gharama. Inahesabu `openAi` kutoka kwenye mfano wa akaunti:

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

## Mazingira ya Uzalishaji

### Mipango ya Uwezo

Hesabu uwezo unaohitajika kulingana na mifumo ya matumizi:

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

Matokeo yanayotarajiwa: `Required capacity: 9100 TPM`. Kwa vipimo vya uwezo vya 1,000-TPM, zungusha hadi angalau `10`, kisha thibitisha makadirio ya RPM na kiwango cha huduma cha mfano (pamoja na bajeti ya maombi ya matokeo). Makadirio haya ya mahitaji ya tokeni si dhamana dhidi ya kupunguzwa kasi.

### Usanidi wa Ujipachiko wa Kihuo

Sanidi ujipachiko wa kioto kwa Container Apps:

**Rasilimali ya sehemu:** ungana mipangilio ya `template.scale` ndani ya Container App kamili yenye eneo, mazingira yaliyosimamiwa, picha ya kontena, rasilimali, na kuingilia. Kuongeza nakala hakuongezi quota ya mfano.

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

### Uboreshaji wa Gharama

Tekeleza udhibiti wa gharama:

**Rasilimali ya bajeti ya mfano:** fafanua `budgetStartDate` kama siku ya kwanza ya mwezi huu kwa UTC (kwa mfano `2026-11-01T00:00:00Z` kwa mapitio haya), na badilisha anwani ya mawasiliano. Mwanzo lazima uzingatie vikwazo vya tarehe za sasa za huduma. Bajeti huvutia tahadhari kwa takwimu zinazo chelewa za bili; hazizuizi matumizi.

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

## Ufuatiliaji na Uonekano

### Muungano wa Application Insights

Sanidi ufuatiliaji kwa mizigo ya AI:

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

Kipande cha rasilimali kinadhani `applicationInsightsName`, `location`, na `logAnalyticsWorkspace` iliyopo. Hutoa ufuatiliaji, lakini haisimami programu wala haitengenezi vipimo maalum.

### Vipimo Maalum

Fuata vipimo maalum vya AI:

Tumia [mgawanyo wa Azure Monitor OpenTelemetry unaoungwa mkono](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), si SDK ya Python ya zamani ya `applicationinsights`. Sakinisha `azure-monitor-opentelemetry`, sanidi `APPLICATIONINSIGHTS_CONNECTION_STRING`, na anzisha mara moja wakati wa kuanzishwa:

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

Hii inaonyesha utoaji wa sifa, si uendeshaji halisi wa wito wa mfano. Funga ombi halisi katika kipengele cha span kupima muda wake; angalia `dependencies`/`traces` katika Application Insights. Usitume vidokezo, majibu, funguo, au ujumbe wa makosa ghafi zenye data nyeti.

### Ukaguzi wa Afya

Tekeleza ufuatiliaji wa afya ya huduma za AI:

Sakinisha `fastapi`, `uvicorn`, `httpx`, na `azure-identity`. Weka vigezo vya endpoint/utekelezaji hapo juu na mruhusu mwito `Cognitive Services OpenAI User`. Hii **kaguzi la tayari** hutumia Azure OpenAI v1 data plane na Entra ID; hufanya wito wa mfano unao biliwa. Endesha kwa `uvicorn health:app` baada ya kuhifadhi kama `health.py`. Tumia ukaguzi wa uzito tofauti, tumia viwango ya kupunguza/kumbukumbu za matokeo ya tayari, na usione njia hii kwa umma bila udhibiti wa upatikanaji.

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

Inatarajiwa: `GET /health/ai-models` hurudisha `200 {"status":"healthy"}` wakati utekelezaji wa gumzo ulio sanidiwa unafaa, au `503` bila kufichua maelezo ya hodi za juu. Kuweka orodha za utekelezaji ni operesheni ya usimamizi wa ndege na sio ukaguzi halali wa afya za ndege za data.

## Hatua Zinazofuata

1. **Pitia [Mwongozo wa Muungano wa Microsoft Foundry](microsoft-foundry-integration.md)** kwa mifumo ya muungano wa huduma
2. **Kamilisha [Soma Warsha ya AI](ai-workshop-lab.md)** kwa uzoefu wa vitendo
3. **Tekeleza [Mazingira ya AI ya Uzalishaji](../chapter-08-production/production-ai-practices.md)** kwa utekelezaji wa biashara
4. **Gundua [Mwongozo wa Utatuzi wa AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** kwa matatizo ya kawaida

## Rasilimali

- [Upatikanaji wa Mifano ya Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Nyaraka za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Upanuzi wa Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Uboreshaji wa Gharama za Mfano wa AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Uelekezaji wa Sura:**
- **📚 Kwanza ya Kozi**: [AZD Kwa Anwani](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 2 - Maendeleo ya AI-Kwanza
- **⬅️ Iliyopita**: [Maajenti wa AI](agents.md)
- **➡️ Ifuatayo**: [Soma Warsha ya AI](ai-workshop-lab.md)
- **🚀 Sura Ifuatayo**: [Sura ya 3: Usanidi](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->