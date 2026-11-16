# Distribuzione di Modelli AI con Azure Developer CLI

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [AI Agents](agents.md)
- **➡️ Successivo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

Questa guida fornisce istruzioni complete per il deployment di modelli AI utilizzando i template AZD, coprendo tutto dalla selezione del modello ai modelli di distribuzione in produzione.

> **Revisione della release (2026-11-04):** Le modifiche correlate alla CLI sono state revisionate rispetto a `azd` `1.37.2`; la disponibilità dei modelli, le versioni e le quote rimangono dipendenti dalla regione e dall'abbonamento. `azd deploy --timeout <seconds>` controlla la finestra di distribuzione del servizio, non è una garanzia di attivazione dell'agente. Consulta le [note di rilascio attuali e la guida alla migrazione AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Sommario

- [Strategia di Selezione del Modello](#model-selection-strategy)
- [Configurazione AZD per Modelli AI](#azd-configuration-for-ai-models)
- [Modelli di Distribuzione](#deployment-patterns)
- [Gestione dei Modelli](#model-management)
- [Considerazioni per la Produzione](#production-considerations)
- [Monitoraggio e Osservabilità](#monitoring-and-observability)

## Strategia di Selezione del Modello

### Modelli Azure OpenAI in Microsoft Foundry

Scegli il modello giusto per il tuo caso d'uso:

Dichiarare i deployment del modello in Bicep (qui sotto), non in impostazioni arbitrarie `services.*.config.AZURE_OPENAI_MODELS`. AZD non interpreta tale impostazione come una lista di risorse modello. `project` di un servizio punta alla sorgente dell'applicazione, non alla sua directory `infra/`.

Gli esempi utilizzano la versione pubblicata `gpt-4.1-mini` **`2025-04-14`** e la versione embedding **`1`**. Conferma che la versione del modello e la SKU di distribuzione siano supportate nella tua regione/account di destinazione prima di effettuare il provisioning.

### Pianificazione della Capacità del Modello

| Tipo di Modello | Caso d'Uso | Domanda Illustrativa di Token | Considerazioni di Costo |
|----------------|-----------|----------------------------|------------------------|
| gpt-4.1-mini | Chat, Domande & Risposte | 10.000-50.000 TPM | Benchmark di costo e qualità per il tuo carico di lavoro |
| gpt-4.1 | Compiti complessi | 20.000-100.000 TPM | Valuta i miglioramenti di qualità rispetto al costo dei token |
| text-embedding-3-large | Ricerca, RAG | 30.000-120.000 TPM | Considera l'ingestione oltre al traffico di query |
| Whisper | Da parlato a testo | Pianifica usando la durata audio e limiti di richiesta | Non applicare una formula di capacità TPM per modelli di testo |

TPM significa token per minuto. Per queste distribuzioni Standard di testo, ARM `sku.capacity` è in unità di **1.000 TPM**, non TPM individuali (capacità `10` significa 10.000 TPM). I rapporti RPM-TPM variano a seconda del tipo di modello/distribuzione; verifica entrambi i limiti con la [documentazione sulle quote](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Queste sono gamme illustrative, non raccomandazioni di dimensionamento.

## Configurazione AZD per Modelli AI

### Configurazione del Template Bicep

Crea deployment di modelli tramite template Bicep:

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

Questo è un **esempio di infrastruttura di sviluppo** scoped a un resource group, non un template AZD completo per applicazioni. L'account consente l'accesso alla rete pubblica e richiede autenticazione Entra ID/RBAC (`Cognitive Services OpenAI User` per chiamanti). In produzione serve il private endpoint, DNS e connettività applicativa descritti nel Capitolo 8. AZD necessita inoltre di un template principale/mapping dei parametri e risorse host dell'app; usa un esempio funzionante per una distribuzione completa.

### Variabili d'Ambiente

Configura l’ambiente della tua applicazione:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Questi sono nomi definiti dall’applicazione; collegali alla configurazione dell’host. L’endpoint Azure OpenAI v1 usato dal controllo di salute qui sotto non richiede il parametro query `api-version` obsoleto; i client `AzureOpenAI` più vecchi sì, quindi segui la generazione API usata dalla tua applicazione.

## Modelli di Distribuzione

### Modello 1: Distribuzione in Singola Regione

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

Migliore per:
- Sviluppo e testing
- Applicazioni per singolo mercato
- Ottimizzazione dei costi

### Modello 2: Distribuzione Multi-Regione

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

Le proprietà SKU/account omesse devono essere fornite; questo frammento così com’è non è distribuibile. Distribuisci i modelli in ogni account e implementa separatamente il routing/failover e il controllo della residenza dei dati.

Migliore per:
- Applicazioni globali
- Requisiti di alta disponibilità
- Distribuzione del carico

### Modello 3: Distribuzione Ibrida

Combina modelli Microsoft Foundry con altri servizi AI:

I frammenti seguenti assumono nomi e `location` forniti dal template contenitore.

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

## Gestione dei Modelli

### Controllo delle Versioni

Traccia le versioni del modello nella configurazione dell’app o nell’IaC. Questo JSON è un **esempio definito dall’applicazione**, non uno schema modello AZD integrato; un fallback deve essere implementato e distribuito esplicitamente:

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

### Aggiornamenti del Modello

Usa un hook AZD per un check di disponibilità in sola lettura, poi aggiorna l’IaC e prosegui con il provisioning:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Esegui `azd up` **al di fuori** dell'hook per applicare le modifiche all’infrastruttura modello e distribuire il codice. Mai chiamare `azd deploy` da un hook `predeploy`: ciò causerebbe trigger ricorsivi dello stesso hook. `azd deploy --timeout 1800` estende il timeout del deployment dell’applicazione; non aggiorna risorse Bicep.

### A/B Testing

La risorsa illustrativa sotto seleziona un nome e capacità di deployment; crea **un solo** deployment, non un test A/B. Per un esperimento reale, crea due risorse di deployment distinte, instrada una frazione controllata di richieste a ciascuna e confronta qualità, latenza e costi. Assume `openAi` dall’esempio account:

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

## Considerazioni per la Produzione

### Pianificazione della Capacità

Calcola la capacità richiesta basandoti sui pattern di utilizzo:

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

Output previsto: `Required capacity: 9100 TPM`. Con unità di capacità da 1.000 TPM, arrotonda verso l’alto almeno a `10`, poi verifica stime RPM specifiche del modello e limiti di servizio (incluso budget di output richiesto). Questa stima della domanda di token non garantisce l'assenza di throttling.

### Configurazione Auto-scalamento

Configura l’auto-scalamento per Container Apps:

**Risorsa parziale:** integra le impostazioni `template.scale` in un Container App completo con location, ambiente gestito, immagine container, risorse e ingressi. Scalare repliche non aumenta la quota modello.

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

### Ottimizzazione dei Costi

Implementa controlli di costo:

**Risorsa budget illustrativa:** definisci `budgetStartDate` come il primo giorno del mese corrente in UTC (ad esempio `2026-11-01T00:00:00Z` per questa revisione), e sostituisci l’indirizzo di contatto. L’inizio deve soddisfare i vincoli temporali correnti del servizio. I budget avvertono per dati di fatturazione ritardati; non bloccano la spesa.

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

## Monitoraggio e Osservabilità

### Integrazione con Application Insights

Configura il monitoraggio per carichi AI:

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

Il frammento risorse assume `applicationInsightsName`, `location` e un `logAnalyticsWorkspace` esistente. Provisiona il monitoraggio, ma non strumenta l’app né crea metriche personalizzate.

### Metriche Personalizzate

Traccia metriche specifiche per AI:

Usa la [distribuzione Azure Monitor OpenTelemetry supportata](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), non il legacy SDK Python `applicationinsights`. Installa `azure-monitor-opentelemetry`, configura `APPLICATIONINSIGHTS_CONNECTION_STRING` e inizializza una volta all’avvio:

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

Questo illustra l’emissione di attributi, non la strumentazione reale della chiamata modello. Incapsula la richiesta reale in uno span per misurarne la durata; ispeziona `dependencies`/`traces` in Application Insights. Non inviare prompt, risposte, chiavi o messaggi di eccezione grezzi contenenti dati sensibili.

### Controlli di Salute

Implementa il monitoraggio dello stato di salute del servizio AI:

Installa `fastapi`, `uvicorn`, `httpx` e `azure-identity`. Imposta le variabili endpoint/deployment sopra e concedi a chi chiama `Cognitive Services OpenAI User`. Questa **readiness probe** usa il data plane Azure OpenAI v1 con Entra ID; effettua una chiamata modello fatturabile. Esegui con `uvicorn health:app` dopo averlo salvato come `health.py`. Usa un controllo di liveness leggero separato, limita/tieni in cache i risultati readiness, e non esporre questa route pubblicamente senza controlli di accesso.

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

Previsto: `GET /health/ai-models` restituisce `200 {"status":"healthy"}` quando il deployment chat configurato è utilizzabile, o `503` senza rivelare dettagli a monte. Elencare i deployment è un’operazione del management plane e non una valid health probe del data plane.

## Prossimi Passi

1. **Rivedi la [Guida all’Integrazione Microsoft Foundry](microsoft-foundry-integration.md)** per pattern di integrazione del servizio
2. **Completa il [Laboratorio AI Workshop](ai-workshop-lab.md)** per esperienza pratica
3. **Implementa le [Best Practice AI in Produzione](../chapter-08-production/production-ai-practices.md)** per distribuzioni enterprise
4. **Esplora la [Guida alla Risoluzione Problemi AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** per problemi comuni

## Risorse

- [Disponibilità Modelli Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Scaling Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Ottimizzazione Costi Modelli AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD For Beginners](../../README.md)
- **📖 Capitolo Attuale**: Capitolo 2 - Sviluppo AI-First
- **⬅️ Precedente**: [AI Agents](agents.md)
- **➡️ Successivo**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Capitolo Successivo**: [Capitolo 3: Configurazione](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->