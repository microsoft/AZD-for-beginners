# AI modell telepítése Azure Developer CLI-vel

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet – AI-első fejlesztés
- **⬅️ Előző**: [AI ügynökök](agents.md)
- **➡️ Következő**: [AI Workshop Labor](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

Ez az útmutató átfogó utasításokat nyújt AI modellek telepítéséhez AZD sablonok használatával, a modell kiválasztásától a termelői telepítési mintákig.

> **Kiadás áttekintés (2026-11-04):** A kapcsolódó CLI változásokat átnézték `azd` `1.37.2` ellen; a modell elérhetősége, verziói és kvóta régió- és előfizetésfüggő marad. `azd deploy --timeout <seconds>` a szolgáltatás telepítési ablakát szabályozza, nem garantálja az ügynök aktiválását. Lásd a [jelenlegi kiadási megjegyzéseket és AI migrációs útmutatót](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Tartalomjegyzék

- [Modell kiválasztási stratégia](#model-selection-strategy)
- [AZD konfiguráció AI modellekhez](#azd-configuration-for-ai-models)
- [Telepítési minták](#deployment-patterns)
- [Modell menedzsment](#model-management)
- [Termelői megfontolások](#production-considerations)
- [Megfigyelés és észlelhetőség](#monitoring-and-observability)

## Modell kiválasztási stratégia

### Azure OpenAI modellek a Microsoft Foundry-ban

Válassza ki a megfelelő modellt az esete számára:

Modell telepítéseket a Bicep-ben deklaráljon (lent), ne tetszőleges `services.*.config.AZURE_OPENAI_MODELS` beállításban. AZD nem értelmezi ezt a beállítást modell erőforrások listájaként. Egy szolgáltatás `project`je az alkalmazás forrására mutat, nem pedig a `infra/` könyvtárára.

A példák a kiadott `gpt-4.1-mini` verziót használják, a **`2025-04-14`** verziót és az embed verziót **`1`**. Győződjön meg arról, hogy a modell verzió és a telepítési SKU támogatott a cél régióban/fiókban, mielőtt előkészíti.

### Modell kapacitás tervezés

| Modell típus | Használati eset | Illusztratív token igény | Költség megfontolások |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Csevegés, Kérdés-válasz | 10,000-50,000 TPM | Munkaterhelésének költség és minőség benchmarkja |
| gpt-4.1 | Komplex feladatok | 20,000-100,000 TPM | Értékelje a minőségjavulást a token költséggel szemben |
| text-embedding-3-large | Keresés, RAG | 30,000-120,000 TPM | Számoljon az adatbevitel és lekérdezési forgalommal is |
| Whisper | Beszéd szöveggé alakítás | Tervezze meg hanghossz alapján és kérés korlát szerint | Ne alkalmazzon szöveg-modell TPM kapacitás képletet |

A TPM tokenek percenkénti száma. Ezekhez az Standard szöveg telepítésekhez, az ARM `sku.capacity` egységek **1,000-TPM egységek**, nem egyéni TPM (kapacitás `10` jelentése 10,000 TPM). Az RPM-TPM arányok modell- és telepítés-típus szerint változnak; ellenőrizze mindkét korlátot a [kvóta dokumentációban](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Ezek a tartományok példák, nem méretezési ajánlások.

## AZD konfiguráció AI modellekhez

### Bicep sablon konfiguráció

Modell telepítéseket készítsen Bicep sablonokon keresztül:

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

Ez egy erőforráscsoport szintű **fejlesztési infrastruktúra példa**, nem egy teljes AZD alkalmazás sablon. A fiók engedélyezi a nyilvános hálózati elérést és Entra ID/RBAC hitelesítést követel meg (a hívók számára `Cognitive Services OpenAI User`). Termelői környezethez a 8. fejezetben leírt privát végpont, DNS és alkalmazás kapcsolat szükséges. AZD-nek fő sablon/paraméter leképezésre és alkalmazás-host erőforrásokra is szüksége van; teljes telepítéshez használjon működő mintát.

### Környezeti változók

Konfigurálja az alkalmazás környezetét:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Ezek alkalmazás által definiált nevek; kösse be őket a host konfigurációba. Az alábbi egészség-ellenőrzéshez használt Azure OpenAI v1 végpont nem igényli a régi `api-version` lekérdezési paramétert; az régi `AzureOpenAI` ügyfelek azt igen, ezért kövesse az alkalmazás által generált API-t.

## Telepítési minták

### Minta 1: Egy régiós telepítés

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

Legalkalmasabb:
- Fejlesztés és tesztelés
- Egypiacos alkalmazások
- Költségoptimalizálás

### Minta 2: Több régiós telepítés

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

Az elhagyott fiók tulajdonságokat/SKU-kat meg kell adni; ez a töredék írás szerint nem telepíthető. Modelljeit minden egyes fiókban telepítse, és a routing/átkapcsolás, valamint adat-tartózkodási szabályokat külön kezelje.

Legalkalmasabb:
- Globális alkalmazások
- Magas rendelkezésre állás igénylése
- Terheléselosztás

### Minta 3: Hibrid telepítés

Kombinálja a Microsoft Foundry modelleket más AI szolgáltatásokkal:

A következő töredékek feltételezik, hogy a neveket és a `location` a tartalmazó sablon szolgáltatja.

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

## Modell menedzsment

### Verziókövetés

Kövesse nyomon a modell verziókat az alkalmazás konfigurációjában vagy IaC-ben. Ez a JSON egy **alkalmazás által definiált példa**, nem beépített AZD modell séma; egy tartalék megoldást be kell vezetni és explicit telepíteni:

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

### Modell frissítések

Használjon AZD hook-ot csak olvasható elérhetőségi ellenőrzésre, majd frissítse az IaC-t és telepítse azt:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Futtassa `azd up` **a hook kívül** a módosított modell infrastruktúra alkalmazásához és kód telepítéséhez. Soha ne hívja a `azd deploy`-t egy `predeploy` hook-ból: az rekurzívan ugyanazt a hook-ot indítja el. `azd deploy --timeout 1800` meghosszabbítja az alkalmazás telepítési időkorlátját; nem frissíti a Bicep erőforrásokat.

### A/B tesztelés

Az alábbi illusztratív erőforrás kiválaszt egy telepítési nevet és kapacitást; **egy** telepítést hoz létre, nem A/B tesztet. Valódi kísérlethez készítsen két külön telepítési erőforrást, irányítson kontrollált arányban kéréseket mindkettőhöz, és hasonlítsa össze minőséget, késleltetést és költséget. Feltételezi a `openAi`-t a fiók példából:

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

## Termelői megfontolások

### Kapacitás tervezés

Számítsa ki a szükséges kapacitást a használati minták alapján:

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

Várt kimenet: `Required capacity: 9100 TPM`. 1,000-TPM kapacitási egységgel kerekítsen fel legalább `10` értékre, majd ellenőrizze a modell specifikus RPM és szolgáltatás sebességkorlát becslést (beleértve a kért kimeneti költségkeretet). Ez a token kereslet becslés nem garancia a korlátozás ellen.

### Automatikus skálázás konfiguráció

Konfigurálja az automatikus skálázást Container App-ekhez:

**Részleges erőforrás:** Olvassza össze a `template.scale` beállításokat egy teljes Container App-el lokációval, kezelt környezettel, konténer képpel, erőforrásokkal és bejövő forgalommal. A replikák skálázása nem növeli a modell kvótát.

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

### Költségoptimalizálás

Valósítson meg költségkontrollokat:

**Illusztratív költségvetés erőforrás:** Állítsa be a `budgetStartDate` értéket az aktuális hónap első napjára UTC-ban (például `2026-11-01T00:00:00Z` ezen áttekintéshez) és cserélje ki a kapcsolattartó címet. A kezdési időnek meg kell felelnie a szolgáltatás jelenlegi dátum korlátainak. A költségvetések értesítenek a késleltetett számlázási adatokról, de nem állítják meg a kiadásokat.

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

## Megfigyelés és észlelhetőség

### Application Insights integráció

Konfigurálja az AI munkaterhelések megfigyelését:

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

Az erőforrás töredék feltételezi a `applicationInsightsName`, `location` és egy létező `logAnalyticsWorkspace` használatát. Létrehozza a megfigyelést, de nem szereli fel az alkalmazást vagy hoz létre egyedi mérőszámokat.

### Egyedi mérőszámok

Kövesse az AI-specifikus mérőszámokat:

Használja a támogatott [Azure Monitor OpenTelemetry disztribúciót](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), ne a régi `applicationinsights` Python SDK-t. Telepítse `azure-monitor-opentelemetry`, konfigurálja `APPLICATIONINSIGHTS_CONNECTION_STRING`, és inicializálja egyszer az indításkor:

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

Ez az attribútum kibocsátást mutatja be, nem a tényleges modell-hívás szerelést. Csomagolja a valós kérelmet egy span-be, hogy mérje a futási időt; vizsgálja meg `dependencies`/`traces` Application Insights-ban. Ne küldjön promptokat, választ, kulcsokat vagy nyers kivétel üzeneteket érzékeny adatokkal.

### Egészség-ellenőrzések

Valósítson meg AI szolgáltatás egészség-ellenőrzést:

Telepítse `fastapi`, `uvicorn`, `httpx` és `azure-identity`. Állítsa be a fenti végpont/telepítés változókat és adjon hívói jogosultságot `Cognitive Services OpenAI User`. Ez az **állapotellenőrző próba** az Azure OpenAI v1 adatvezérlőt használja Entra ID-vel; ekkor modellhívás történik, ami számlázandó. Futtassa `uvicorn health:app` futtatva, `health.py` mentése után. Használjon külön könnyű életjelet, korlátozza/cserélje a készenléti eredményeket, és ne tegye közzé ezt az útvonalat nyilvánosan jogosultságkezelés nélkül.

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

Várható: `GET /health/ai-models` `200 {"status":"healthy"}`-t ad vissza, ha a konfigurált csevegő telepítés használható, vagy `503`-t anélkül, hogy az upstream részleteket felfedné. A telepítések listázása menedzsment sík művelet, nem érvényes adat sík egészség próba.

## Következő lépések

1. **Nézze át a [Microsoft Foundry Integrációs Útmutatót](microsoft-foundry-integration.md)** szolgáltatás integrációs mintákért
2. **Teljesítse a [AI Workshop Lab](ai-workshop-lab.md)** gyakorlatot a gyakorlati tapasztalatért
3. **Valósítsa meg a [Termelői AI Gyakorlatokat](../chapter-08-production/production-ai-practices.md)** vállalati telepítésekhez
4. **Fedezze fel az [AI Hibaelhárítási Útmutatót](../chapter-07-troubleshooting/ai-troubleshooting.md)** gyakori problémákhoz

## Források

- [Microsoft Foundry modellek elérhetősége](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI dokumentáció](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps skálázás](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI modell költség optimalizálás](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 2. fejezet – AI-első fejlesztés
- **⬅️ Előző**: [AI ügynökök](agents.md)
- **➡️ Következő**: [AI Workshop Labor](ai-workshop-lab.md)
- **🚀 Következő fejezet**: [3. fejezet: Konfiguráció](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->