# Nasadenie AI modelu pomocou Azure Developer CLI

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre Začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s prioritou AI
- **⬅️ Predchádzajúca**: [AI agenti](agents.md)
- **➡️ Ďalšia**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

Tento sprievodca poskytuje komplexné pokyny na nasadenie AI modelov pomocou šablón AZD, pokrývajúc všetko od výberu modelu po vzory nasadenia do produkcie.

> **Prehľad vydania (2026-11-04):** Súvisiace zmeny CLI boli overené voči `azd` `1.37.2`; dostupnosť modelu, verzie a kvóty zostávajú závislé na regióne a predplatnom. `azd deploy --timeout <seconds>` riadi časové okno nasadenia služby, nie záruku aktivácie agenta. Pozrite si [aktuálne poznámky k vydaniu a pokyny k migrácii AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Obsah

- [Stratégia výberu modelu](#model-selection-strategy)
- [Konfigurácia AZD pre AI modely](#azd-configuration-for-ai-models)
- [Vzorové nasadenia](#deployment-patterns)
- [Správa modelov](#model-management)
- [Úvahy o produkcii](#production-considerations)
- [Monitoring a sledovateľnosť](#monitoring-and-observability)

## Stratégia výberu modelu

### Azure OpenAI modely v Microsoft Foundry

Vyberte si správny model pre svoj prípad použitia:

Nasadenie modelov deklarujte v Bicep (nižšie), nie v ľubovoľných nastaveniach `services.*.config.AZURE_OPENAI_MODELS`. AZD neinterpretuje takéto nastavenie ako zoznam zdrojov modelov. Vlastnosť služby `project` ukazuje na zdroj aplikácie, nie na jej priečinok `infra/`.

Príklady používajú vydanú verziu `gpt-4.1-mini` **`2025-04-14`** a verziu embedingu **`1`**. Potvrďte, že verzia modelu a SKU nasadenia sú podporované vo vašom cieľovom regióne/účte pred provisioningom.

### Plánovanie kapacity modelu

| Typ modelu | Prípad použitia | Ilustratívna požiadavka na tokeny | Úvahy o nákladoch |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, otázky a odpovede | 10 000-50 000 TPM | Porovnajte náklady a kvalitu pre svoju pracovnú záťaž |
| gpt-4.1 | Zložité úlohy | 20 000-100 000 TPM | Vyhodnoťte zlepšenie kvality proti nákladom na tokeny |
| text-embedding-3-large | Vyhľadávanie, RAG | 30 000-120 000 TPM | Zohľadnite príjem aj dotazový traffic |
| Whisper | Prepis reči na text | Plánujte podľa trvania zvuku a limitov požiadaviek | Nepoužívajte vzorec kapacity TPM textového modelu |

TPM znamená tokeny za minútu. Pre tieto štandardné textové nasadenia ARM `sku.capacity` je v jednotkách **1 000 TPM**, nie jednotlivo (kapacita `10` znamená 10 000 TPM). Pomery RPM k TPM sa líšia podľa typu modelu/nasadenia; overte si obe limity v [dokumentácii ku kvótam](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Tieto rozsahy sú príklady, nie odporúčania pre veľkosť.

## Konfigurácia AZD pre AI modely

### Konfigurácia šablóny Bicep

Vytvorte nasadenia modelov cez šablóny Bicep:

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

Toto je príklad infraštruktúry **v rámci skupiny zdrojov na vývoj**, nie kompletná šablóna aplikácie AZD. Účet povoľuje prístup verejnej siete a vyžaduje autentifikáciu Entra ID/RBAC (`Cognitive Services OpenAI User` pre volajúcich). Produkcia potrebuje privátny endpoint, DNS a konektivitu aplikácie popísanú v kapitole 8. AZD tiež potrebuje hlavnú mapu parametrov/šablón a zdroje hostiteľa aplikácie; použite pracovný príklad pre úplné nasadenie.

### Premenné prostredia

Nakonfigurujte prostredie aplikácie:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Toto sú mená definované aplikáciou; pripojte ich do konfigurácie hostiteľa. Endpoint Azure OpenAI v1 použitý nižšie pre kontrolu zdravia nevyžaduje zastaralý parameter dotazu `api-version`; staršie klienty `AzureOpenAI` ho potrebujú, preto dodržiavajte generovanie API podľa vašej aplikácie.

## Vzory nasadenia

### Vzor 1: Nasadenie v jednom regióne

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

Najvhodnejšie pre:
- Vývoj a testovanie
- Jednopásmové aplikácie
- Optimalizáciu nákladov

### Vzor 2: Nasadenie vo viacerých regiónoch

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

Chýbajúce vlastnosti účtu/SKU musia byť dodané; táto časť nie je nasaditeľná ako je. Nasadzujte modely v každom účte a samostatne implementujte riadenie smerovania/prepnutia a reguláciu lokality dát.

Najvhodnejšie pre:
- Globálne aplikácie
- Požiadavky na vysokú dostupnosť
- Rozdelenie záťaže

### Vzor 3: Hybridné nasadenie

Kombinujte Microsoft Foundry modely s inými AI službami:

Nasledujúce fragmenty predpokladajú, že názvy a `location` sú dodané obsahujúcou šablónou.

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

## Správa modelov

### Kontrola verzií

Sledujte verzie modelov v konfigurácii aplikácie alebo IaC. Tento JSON je **príklad definovaný aplikáciou**, nie zabudovaná schéma modelu AZD; musí byť implementovaný a nasadený explicitne ako záloha:

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

### Aktualizácie modelu

Použite AZD hook na kontrolu dostupnosti v režime iba na čítanie, potom aktualizujte IaC a provisionujte ho:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Spustite `azd up` **mimo** hooku, aby ste aplikovali zmeny infraštruktúry modelu a nasadili kód. Nikdy nevolajte `azd deploy` z `predeploy` hooku: rekurzívne vyvolá ten istý hook. `azd deploy --timeout 1800` predlžuje časový limit nasadenia aplikácie; neaktualizuje Bicep zdroje.

### A/B testovanie

Nižšie uvedený ilustratívny zdroj vyberá názov nasadenia a kapacitu; vytvára **jedno** nasadenie, nie A/B test. Pre skutočný experiment zriaďte dva odlišné zdroje nasadenia, nasmerujte riadenú časť požiadaviek na každý a porovnajte kvalitu, latenciu a náklady. Predpokladá sa `openAi` z príkladu účtu:

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

## Úvahy o produkcii

### Plánovanie kapacity

Vypočítajte požadovanú kapacitu na základe vzorov používania:

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

Očakávaný výstup: `Required capacity: 9100 TPM`. Pri kapacitných jednotkách 1 000 TPM zaokrúhlite nahor na aspoň `10`, potom overte špecifický RPM modelu a odhad limitu služby (vrátane rozpočtu na požadovaný výstup). Tento odhad dopytu po tokenoch nezaručuje vyhnutie sa obmedzovaniu.

### Konfigurácia automatického škálovania

Nakonfigurujte automatické škálovanie pre Container Apps:

**Čiastkový zdroj:** zlúčte nastavenia `template.scale` do kompletného Container App so špecifikáciou lokality, spravovaným prostredím, kontajnerovým obrazom, zdrojmi a ingressom. Zvýšenie počtu replík nezvyšuje kvótu modelu.

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

### Optimalizácia nákladov

Implementujte kontrolu nákladov:

**Ilustratívny rozpočtový zdroj:** definujte `budgetStartDate` ako prvý deň aktuálneho mesiaca v UTC (napríklad `2026-11-01T00:00:00Z` pre túto recenziu) a nahraďte kontaktnú adresu. Štart musí vyhovovať aktuálnym dátovým obmedzeniam služby. Rozpočty upozorňujú na oneskorené fakturačné údaje; nezastavujú výdavky.

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

## Monitoring a sledovateľnosť

### Integrácia Application Insights

Nakonfigurujte monitoring pre AI pracovné záťaže:

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

Fragmnet zdroja predpokladá `applicationInsightsName`, `location` a existujúci `logAnalyticsWorkspace`. Zriaďuje monitoring, ale neinštrumentuje aplikáciu ani nevytvára vlastné metriky.

### Vlastné metriky

Sledujte metriky špecifické pre AI:

Použite podporovanú [distribúciu Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), nie zastaraný SDK pre Python `applicationinsights`. Nainštalujte `azure-monitor-opentelemetry`, nakonfigurujte `APPLICATIONINSIGHTS_CONNECTION_STRING` a inicializujte raz pri spustení:

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

Táto ukážka ilustruje vysielanie atribútov, nie skutočnú inštrumentáciu volania modelu. Zabaľte skutočný request do span, aby ste zmerali jeho trvanie; prezrite si `dependencies`/`traces` v Application Insights. Neodosielajte prompt, odpovede, kľúče ani surové chyby obsahujúce citlivé údaje.

### Kontroly stavu zdravia

Implementujte monitorovanie zdravia AI služby:

Nainštalujte `fastapi`, `uvicorn`, `httpx` a `azure-identity`. Nastavte premenné endpoint/nasadenie vyššie a povoľte volajúcemu `Cognitive Services OpenAI User`. Táto **kontrola pripravenosti** používa Azure OpenAI v1 dátovú rovinu s Entra ID; vykonáva fakturovateľné volanie modelu. Spustite s `uvicorn health:app` po uložení ako `health.py`. Použite samostatnú ľahkú kontrolu životaschopnosti, obmedzte/doručujte výsledky pripravenosti a nezverejňujte túto trasu verejne bez prístupovej kontroly.

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

Očakávané: `GET /health/ai-models` vráti `200 {"status":"healthy"}` keď je nakonfigurované chatové nasadenie použiteľné, alebo `503` bez prezradenia upstream detailov. Zoznam nasadení je operačná jednotka manažérskej roviny, nie platná kontrola zdravia dátovej roviny.

## Ďalšie kroky

1. **Prezrite si [Príručku integrácie Microsoft Foundry](microsoft-foundry-integration.md)** pre vzory integrácie služieb
2. **Dokončite [AI Workshop Lab](ai-workshop-lab.md)** pre praktické skúsenosti
3. **Implementujte [Produktionálne AI praktiky](../chapter-08-production/production-ai-practices.md)** pre podnikové nasadenia
4. **Preskúmajte [Príručku riešenia problémov AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** pre bežné problémy

## Zdroje

- [Dostupnosť modelov Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Škálovanie Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimalizácia nákladov na AI modely](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre Začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 2 - Vývoj s prioritou AI
- **⬅️ Predchádzajúca**: [AI agenti](agents.md)
- **➡️ Ďalšia**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Ďalšia kapitola**: [Kapitola 3: Konfigurácia](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->