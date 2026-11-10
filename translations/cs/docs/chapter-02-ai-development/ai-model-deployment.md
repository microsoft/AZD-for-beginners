# Nasazení modelu AI pomocí Azure Developer CLI

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - Vývoj orientovaný na AI
- **⬅️ Předchozí**: [AI Agenti](agents.md)
- **➡️ Další**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

Tento průvodce poskytuje komplexní instrukce pro nasazení AI modelů pomocí AZD šablon, pokrývající vše od výběru modelu po vzory nasazení do produkce.

> **Recenze vydání (2026-11-04):** Související změny CLI byly přezkoumány s `azd` `1.37.2`; dostupnost modelů, verze a kvóty zůstávají závislé na regionu a předplatném. `azd deploy --timeout <seconds>` řídí okno nasazení služby, nikoli záruku aktivace agenta. Viz [aktuální poznámky k vydání a pokyny pro migraci AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Obsah

- [Strategie výběru modelu](#model-selection-strategy)
- [Konfigurace AZD pro AI modely](#azd-configuration-for-ai-models)
- [Vzorová nasazení](#deployment-patterns)
- [Správa modelů](#model-management)
- [Aspekty produkce](#production-considerations)
- [Monitoring a pozorovatelnost](#monitoring-and-observability)

## Strategie výběru modelu

### Azure OpenAI modely v Microsoft Foundry

Vyberte správný model pro váš případ použití:

Nasazení modelů deklarujte v Bicep (níže), ne v libovolných nastaveních `services.*.config.AZURE_OPENAI_MODELS`. AZD takové nastavení neinterpretuje jako seznam modelových zdrojů. `project` služby odkazuje na zdroj aplikace, ne na její `infra/` adresář.

Příklady používají publikovanou verzi `gpt-4.1-mini` **`2025-04-14`** a verzi embeddingu **`1`**. Před nasazením si ověřte, že verze modelu a SKU nasazení jsou podporovány ve vaší cílové oblasti/účtu.

### Plánování kapacity modelu

| Typ modelu | Případ použití | Ilustrační poptávka tokenů | Nákladové úvahy |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Otázky a odpovědi | 10 000–50 000 TPM | Benchmark nákladů a kvality pro vaši zátěž |
| gpt-4.1 | Složité úkoly | 20 000–100 000 TPM | Vyhodnoťte zlepšení kvality vůči nákladům na tokeny |
| text-embedding-3-large | Vyhledávání, RAG | 30 000–120 000 TPM | Zohledněte příjem dat i dotazovací provoz |
| Whisper | Přepis řeči na text | Plánujte podle délky audia a limitů požadavků | Nepoužívejte kapacitní vzorec TPM pro textové modely |

TPM znamená tokeny za minutu. Pro tato standardní textová nasazení je ARM `sku.capacity` v jednotkách **1 000 TPM**, ne jednotlivých TPM (kapacita `10` znamená 10 000 TPM). Poměry RPM k TPM se liší podle typu modelu/nasazení; ověřte oba limity dle [dokumentace kvót](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Tyto rozsahy jsou příklady, nikoliv doporučení velikosti.

## Konfigurace AZD pro AI modely

### Konfigurace šablony Bicep

Vytvořte nasazení modelů pomocí Bicep šablon:

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

Toto je příklad **vývojové infrastruktury** omezený na skupinu prostředků, nikoli kompletní šablona aplikace AZD. Účet umožňuje přístup z veřejné sítě a vyžaduje autentizaci Entra ID/RBAC (`Cognitive Services OpenAI User` pro volající). Pro produkci je potřeba privátní konektivita, DNS a připojení aplikace popsané v Kapitole 8. AZD také potřebuje hlavní šablonu/mapování parametrů a prostředky hostitele aplikace; pro úplné nasazení použijte funkční ukázku.

### Proměnné prostředí

Nakonfigurujte prostředí vaší aplikace:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Toto jsou názvy definované aplikací; propojte je s konfigurací hostitele. Azure OpenAI v1 koncový bod používaný níže pro kontrolu stavu nevyžaduje zastaralý dotazovací parametr `api-version`; starší klienti `AzureOpenAI` ano, proto postupujte podle generování API používaného vaší aplikací.

## Vzory nasazení

### Vzor 1: Nasazení v jednom regionu

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

Nejvhodnější pro:
- Vývoj a testování
- Aplikace pro jedno tržní prostředí
- Optimalizaci nákladů

### Vzor 2: Nasazení v několika regionech

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

Vynechané vlastnosti účtu/SKU musí být doplněny; tento úsek nelze nasadit v původní podobě. Nasazujte modely v každém účtu a implementujte směrování/přepínání a řízení držby dat samostatně.

Nejvhodnější pro:
- Globální aplikace
- Požadavky na vysokou dostupnost
- Distribuci zátěže

### Vzor 3: Hybridní nasazení

Kombinujte Microsoft Foundry Models s dalšími AI službami:

Následující úseky předpokládají, že názvy a `location` jsou dodány obsaženou šablonou.

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

## Správa modelu

### Správa verzí

Sledujte verze modelů v konfiguraci vaší aplikace nebo IaC. Tento JSON je **příklad definovaný aplikací**, nikoli vestavěné schéma modelu AZD; musí být implementován a nasazen záložní mechanismus explicitně:

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

### Aktualizace modelu

Použijte háček AZD pro kontrolu dostupnosti pouze pro čtení, poté aktualizujte IaC a proveďte provisioning:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Spusťte `azd up` **mimo** háček pro aplikaci změněné infrastruktury modelu a nasazení kódu. Nikdy nevolejte `azd deploy` z háčku `predeploy`: rekurzivně spouští ten samý háček. `azd deploy --timeout 1800` prodlužuje časový limit nasazení aplikace; neaktualizuje prostředky Bicep.

### A/B testování

Ilustrační prostředek níže vybírá název nasazení a kapacitu; vytvoří **jedno** nasazení, nikoli A/B test. Pro skutečný experiment nasaďte dvě odlišné nasazovací prostředky, směrujte řízenou část požadavků na každý a porovnejte kvalitu, latenci a náklady. Předpokládá `openAi` z příkladu účtu:

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

## Produkční aspekty

### Plánování kapacity

Vypočítejte požadovanou kapacitu na základě vzorů využití:

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

Očekávaný výstup: `Required capacity: 9100 TPM`. Při kapacitě 1 000 TPM zaokrouhlete nahoru alespoň na `10`, poté ověřte odhad RPM specifický pro model a limit služby (včetně požadovaného rozpočtu na výstup). Tento odhad tokenové poptávky nezaručuje ochranu proti omezování.

### Konfigurace autoškálování

Nakonfigurujte autoškálování pro Container Apps:

**Částečný prostředek:** spojte nastavení `template.scale` do kompletního Container App s umístěním, spravovaným prostředím, kontejnerovým obrazem, prostředky a ingress. Zvýšení počtu replik nezvyšuje kvótu modelu.

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

### Optimalizace nákladů

Implementujte kontrolu nákladů:

**Ilustrační rozpočtový prostředek:** definujte `budgetStartDate` jako první den aktuálního měsíce v UTC (například `2026-11-01T00:00:00Z` pro tuto kontrolu) a nahraďte kontaktní adresu. Začátek musí vyhovovat aktuálním časovým omezením služby. Rozpočty upozorňují na opožděná fakturační data; nezastavují utrácení.

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

## Sledování a pozorovatelnost

### Integrace s Application Insights

Nakonfigurujte sledování AI zátěží:

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

Tento prostředek předpokládá `applicationInsightsName`, `location` a existující `logAnalyticsWorkspace`. Provisions monitorování, ale neinstruuje aplikaci ani nevytváří vlastní metriky.

### Vlastní metriky

Sledujte metriky specifické pro AI:

Použijte podporovanou [Azure Monitor OpenTelemetry distribuci](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), nikoli zastaralé SDK `applicationinsights` pro Python. Nainstalujte `azure-monitor-opentelemetry`, nakonfigurujte `APPLICATIONINSIGHTS_CONNECTION_STRING` a inicializujte jednou při startu:

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

Toto ilustruje emisí atributů, nikoli skutečné instrumentace volání modelu. Zabalte skutečný požadavek do rozsahu pro měření jeho trvání; inspectujte `dependencies`/`traces` v Application Insights. Neposílejte výzvy, odpovědi, klíče ani surové zprávy o výjimkách obsahující citlivá data.

### Kontroly stavu

Implementujte sledování stavu AI služeb:

Nainstalujte `fastapi`, `uvicorn`, `httpx` a `azure-identity`. Nastavte výše uvedené proměnné endpointu/nasazení a povolte volajícímu `Cognitive Services OpenAI User`. Tento **readiness probe** používá Azure OpenAI v1 datovou rovinu s Entra ID; provádí zpoplatněné volání modelu. Spusťte s `uvicorn health:app` po uložení jako `health.py`. Použijte samostatnou lehkou kontrolu životaschopnosti, omezujte rychlost/kachlování výsledků readiness a nezveřejňujte tuto cestu veřejně bez řízení přístupu.

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

Očekávané: `GET /health/ai-models` vrací `200 {"status":"healthy"}`, když je nakonfigurované chat nasazení použitelné, nebo `503` bez zveřejnění podrobností upstream. Výpis nasazení je operace managementové roviny a není validní health probe datové roviny.

## Další kroky

1. **Projděte [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** pro vzory integrace služeb
2. **Dokončete [AI Workshop Lab](ai-workshop-lab.md)** pro praktické zkušenosti
3. **Implementujte [Production AI Practices](../chapter-08-production/production-ai-practices.md)** pro podnikovou produkci
4. **Prozkoumejte [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** pro běžné problémy

## Zdroje

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigace kapitol:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 2 - AI-first vývoj
- **⬅️ Předchozí**: [AI Agents](agents.md)
- **➡️ Další**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Další kapitola**: [Kapitola 3: Konfigurace](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->