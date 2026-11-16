# Implementarea modelelor AI cu Azure Developer CLI

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Anterior**: [Agenți AI](agents.md)
- **➡️ Următor**: [Laborator AI Workshop](ai-workshop-lab.md)
- **🚀 Capitolul următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

Acest ghid oferă instrucțiuni complete pentru implementarea modelelor AI folosind șabloanele AZD, acoperind totul de la selectarea modelului până la tiparele de implementare în producție.

> **Revizuire lansare (2026-11-04):** Modificările CLI aferente au fost revizuite față de `azd` `1.37.2`; disponibilitatea modelului, versiunile și cota sunt în continuare dependente de regiune și abonament. `azd deploy --timeout <seconds>` controlează fereastra de implementare a serviciului, nu este o garanție a activării agentului. Consultați [notele de lansare actuale și ghidul de migrare AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Cuprins

- [Strategia de selecție a modelului](#model-selection-strategy)
- [Configurarea AZD pentru modele AI](#azd-configuration-for-ai-models)
- [Tipare de implementare](#deployment-patterns)
- [Managementul modelului](#model-management)
- [Considerații pentru producție](#production-considerations)
- [Monitorizare și observabilitate](#monitoring-and-observability)

## Strategia de selecție a modelului

### Modele Azure OpenAI în Microsoft Foundry

Alege modelul potrivit pentru cazul tău de utilizare:

Declară implementările modelelor în Bicep (mai jos), nu în setări arbitrare `services.*.config.AZURE_OPENAI_MODELS`. AZD nu interpretează astfel de setări ca o listă de resurse model. Un `project` al unui serviciu indică sursa aplicației, nu directorul sau `infra/`.

Exemplele utilizează versiunea publicată `gpt-4.1-mini` **`2025-04-14`** și versiunea embedding **`1`**. Confirmă că versiunea modelului și SKU-ul de implementare sunt acceptate în regiunea/contul tău țintă înainte de aprovizionare.

### Planificarea capacității modelului

| Tip model | Caz de utilizare | Cerere ilustrativă de tokeni | Considerații de cost |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Întrebări & Răspunsuri | 10,000-50,000 TPM | Marchează costul și calitatea pentru sarcina ta |
| gpt-4.1 | Sarcini complexe | 20,000-100,000 TPM | Evaluează câștigurile de calitate față de costul tokenilor |
| text-embedding-3-large | Căutare, RAG | 30,000-120,000 TPM | Ia în calcul atât ingestia cât și traficul de interogări |
| Whisper | Transcriere audio-text | Planifică folosind durata audio și limitele de cereri | Nu aplica o formulă TPM pentru modelele text |

TPM înseamnă tokeni pe minut. Pentru aceste implementări Standard de text, ARM `sku.capacity` este în unități de **1,000-TPM**, nu TPM individuali (capacitatea `10` înseamnă 10,000 TPM). Raporturile RPM-la-TPM variază în funcție de model/tip implementare; verifică ambele limite contra [documentației de cotă](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Aceste intervale sunt exemple, nu recomandări de dimensiune.

## Configurarea AZD pentru modele AI

### Configurarea șabloanelor Bicep

Creează implementări de modele prin șabloane Bicep:

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

Acesta este un exemplu de **infrastructură de dezvoltare** pe grup de resurse, nu un șablon complet de aplicație AZD. Contul permite accesul la rețeaua publică și necesită autentificare Entra ID/RBAC (`Cognitive Services OpenAI User` pentru solicitanti). Producția necesită punctul final privat, DNS și conectivitatea aplicației descrise în Capitolul 8. AZD necesită, de asemenea, un șablon principal/hartă de parametri și resurse de găzduire a aplicației; folosește un exemplu funcțional pentru o implementare completă.

### Variabile de mediu

Configurează mediul aplicației tale:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Acestea sunt nume definite de aplicație; integrează-le în configurarea gazdei tale. Endpoint-ul Azure OpenAI v1 folosit mai jos pentru verificarea stării nu necesită parametrul de interogare `api-version` depășit; clienții mai vechi `AzureOpenAI` îl cer, deci urmează generarea API folosită de aplicația ta.

## Tipare de implementare

### Tipar 1: Implementare într-o singură regiune

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

Ideal pentru:
- Dezvoltare și testare
- Aplicații pentru o singură piață
- Optimizare costuri

### Tipar 2: Implementare multi-regiune

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

Proprietățile contului/SKU omise trebuie furnizate; acest fragment nu este implementabil așa cum este scris. Implementează modelele în fiecare cont și implementează rutare, failover și controale de rezidență a datelor separat.

Ideal pentru:
- Aplicații globale
- Cerințe de disponibilitate ridicată
- Distribuție a încărcăturii

### Tipar 3: Implementare hibridă

Combină modelele Microsoft Foundry cu alte servicii AI:

Următoarele fragmente presupun că numele și `location` sunt furnizate de șablonul conținător.

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

## Managementul modelului

### Controlul versiunilor

Urmărește versiunile modelului în configurația aplicației sau IaC. Acest JSON este un **exemplu definit de aplicație**, nu un schema model încorporată AZD; trebuie implementat și implementat un fallback explicit:

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

### Actualizări ale modelului

Folosește un hook AZD pentru o verificare read-only a disponibilității, apoi actualizează IaC și aprovizionarea:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Rulează `azd up` **în afara** hook-ului pentru a aplica infrastructura modificată a modelului și codul de implementare. Niciodată să nu apelezi `azd deploy` dintr-un hook `predeploy`: declanșează recursiv același hook. `azd deploy --timeout 1800` extinde timeout-ul implementării aplicației; nu actualizează resursele Bicep.

### Testare A/B

Resursa ilustrativă de mai jos selectează un nume de implementare și capacitate; creează **o singură** implementare, nu un test A/B. Pentru un experiment real, aprovizionează două resurse distincte de implementare, direcționează o fracțiune controlată a cererilor către fiecare și compară calitatea, latența și costul. Presupune `openAi` din exemplul contului:

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

## Considerații pentru producție

### Planificarea capacității

Calculează capacitatea necesară pe baza modelelor de utilizare:

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

Ieșire așteptată: `Required capacity: 9100 TPM`. Cu unități de capacitate 1,000-TPM, rotunjește în sus la cel puțin `10`, apoi verifică estimările specifice RPM și limitele de rată a serviciului (inclusiv bugetul de ieșire solicitat). Această estimare a cererii de tokeni NU garantează evitarea throttling-ului.

### Configurarea auto-scalării

Configurează auto-scalarea pentru Container Apps:

**Resursă parțială:** combină setările `template.scale` într-o Container App completă cu locație, mediu gestionat, imagine container, resurse și ingress. Scalarea replicilor NU mărește cota modelului.

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

### Optimizarea costurilor

Implementează controale de cost:

**Resursă ilustrativă de buget:** definește `budgetStartDate` ca prima zi a lunii curente în UTC (de exemplu `2026-11-01T00:00:00Z` pentru această revizuire) și înlocuiește adresa de contact. Începutul trebuie să respecte constrângerile curente de dată ale serviciului. Bugetele alertează asupra întârzierii datelor de facturare; nu opresc cheltuielile.

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

## Monitorizare și observabilitate

### Integrarea Application Insights

Configurează monitorizarea pentru sarcinile AI:

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

Fragmentul de resursa presupune `applicationInsightsName`, `location` și un `logAnalyticsWorkspace` existent. Se provisionează monitorizarea, dar nu se instrumentează aplicația sau nu se creează metrici personalizate.

### Metrici personalizate

Monitorizează metrici specifice AI:

Folosește distribuția suportată [Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), nu SDK-ul Python `applicationinsights` vechi. Instalează `azure-monitor-opentelemetry`, configurează `APPLICATIONINSIGHTS_CONNECTION_STRING` și inițializează o dată la pornire:

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

Aceasta ilustrează emiterea atributelor, nu instrumentarea efectivă a apelului modelului. Încapsulează cererea reală într-un span pentru a măsura durata; inspectează `dependencies`/`traces` în Application Insights. Nu trimite prompturi, răspunsuri, chei sau mesaje de excepție brute cu date sensibile.

### Verificări de sănătate

Implementează monitorizarea sănătății serviciului AI:

Instalați `fastapi`, `uvicorn`, `httpx` și `azure-identity`. Configurați variabilele endpoint/deployment de mai sus și acordați apelantului `Cognitive Services OpenAI User`. Această **sondă de pregătire** folosește planul de date Azure OpenAI v1 cu Entra ID; face un apel la model care se taxează. Rulați cu `uvicorn health:app` după salvarea ca `health.py`. Utilizați o verificare separată ușoară de liveness, limitați rata/cache rezultatelor de pregătire și nu expuneți această rută public fără controale de acces.

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

Așteptat: `GET /health/ai-models` returnează `200 {"status":"healthy"}` când deploymentul chat configurat este utilizabil, sau `503` fără a dezvălui detalii upstream. Listarea deploymenturilor este o operațiune de management-plane și nu este o sondă validă de sănătate data-plane.

## Pași Următori

1. **Consultați [Ghidul de integrare Microsoft Foundry](microsoft-foundry-integration.md)** pentru tipare de integrare a serviciilor
2. **Finalizați [Laboratorul AI Workshop](ai-workshop-lab.md)** pentru experiență practică
3. **Implementați [Practici AI pentru Producție](../chapter-08-production/production-ai-practices.md)** pentru deploymenturi enterprise
4. **Explorați [Ghidul de depanare AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** pentru probleme comune

## Resurse

- [Disponibilitatea Modelului Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scalarea Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimizarea Costurilor Modelului AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigarea Capitolului:**
- **📚 Acasă Curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul Curent**: Capitolul 2 - Dezvoltare AI-First
- **⬅️ Anterior**: [Agenti AI](agents.md)
- **➡️ Următor**: [Laborator AI Workshop](ai-workshop-lab.md)
- **🚀 Capitolul Următor**: [Capitolul 3: Configurare](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->