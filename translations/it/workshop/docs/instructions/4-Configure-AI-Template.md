# 4. Configura un Modello

!!! tip "AL TERMINE DI QUESTO MODULO SARAI CAPACE DI"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Inizia con il modello effettivo

Apri il [`azure.yaml` in Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) nel repository che hai inizializzato. Il modello upstream può cambiare indipendentemente da questo laboratorio. Il seguente **estratto** è stato verificato il 4 novembre 2026; non è un sostituto del file completo:

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` identifica il progetto AZD; `metadata.template` registra la versione del modello.
- `requiredVersions.azd` è il minimo del modello, non una raccomandazione di rimanere su una vecchia CLI. Usa una release AZD supportata e aggiornata.
- `services` definisce gli obiettivi di distribuzione dell’applicazione. Questo modello distribuisce la sua API Python e frontend come un unico servizio Container Apps.
- `project` è relativo a `azure.yaml`.
- `remoteBuild` richiede una build remota del container. La tua identità ha ancora bisogno dei permessi Azure necessari.

I file Bicep del modello sotto `infra/`, non solo la lista `services`, dichiarano risorse come Microsoft Foundry, distribuzioni di modelli, storage e ricerca AI opzionale.

## 2. Comprendere i hook del ciclo di vita

Ispeziona la sezione `hooks` e gli script referenziati prima di eseguire il modello. La versione esaminata contiene:

| Hook | Scopo | Comportamento importante |
|------|---------|--------------------|
| `preup` | Convalida gli input dell'ambiente del modello prima del workflow `up` | Gli script shell specifici per piattaforma possono fermare il workflow in caso di errore |
| `postdeploy` | Esegue setup specifici del modello dopo la distribuzione dell’applicazione | Controlla `continueOnError` e l’output dello script; una distribuzione riuscita non prova che tutte le attività di setup siano riuscite |

Questa versione **non** contiene il vecchio hook `postprovision` / `write_env` mostrato nel materiale del laboratorio precedente. Non copiare riferimenti a hook per script che non esistono più.

Le chiavi hook selezionano eventi del ciclo di vita; `posix` e `windows` selezionano implementazioni per piattaforma. `shell`, `run`, `interactive`, e `continueOnError` controllano l’esecuzione. Questi sono script eseguibili con i tuoi permessi, quindi esaminali come faresti con il codice applicativo.

Consulta la [documentazione AZD sui hook](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) per il ciclo di vita completo.

## 3. Traccia gli input dell’ambiente nell’infrastruttura

Esegui questi comandi dal repository di esempio inizializzato:

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Ispeziona `infra/main.parameters.json` per vedere quali variabili d’ambiente il modello effettivamente utilizza. Impostare un nome arbitrario con `azd env set` non cambia automaticamente una risorsa Azure.

Le impostazioni predefinite esaminate includono:

| Input | Default / scopo |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80`; le unità di quota dipendono dal modello e dal tipo di distribuzione |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false`; lascia disabilitato a meno che non sia stata esaminata la gestione dei dati |

Questi sono input specifici del campione, non impostazioni globali AZD. Controlla la [documentazione sul supporto di modelli e regioni](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) e le quote del tuo abbonamento prima di scegliere modello, SKU, capacità o regione. Non interpretare ogni unità di capacità come 1.000 token al minuto.

Per selezionare un modello di chat diverso, aggiorna **nome, versione, formato, SKU e capacità tutti insieme**, seguendo la [guida alla personalizzazione del campione](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Cambiare solo il nome può lasciare una versione o tipo di distribuzione incompatibile.

## 4. Laboratorio: abilita ricerca e tracciamento opzionali

!!! warning "Queste impostazioni possono aggiungere risorse a pagamento"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Le modifiche all’infrastruttura richiedono provisioning; solo `azd deploy` distribuisce servizi applicativi. Per indicizzazione della ricerca e opzioni di recupero supportate, segui la [guida AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Per il monitoraggio, segui la [guida sull’osservabilità](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

Non abilitare la cattura di prompt/risposta su dati reali di clienti senza il consenso richiesto, controlli di accesso, policy di conservazione e redazione.

## 5. Risorse esistenti e CI/CD

Per riutilizzare un progetto Foundry, segui le [istruzioni per risorse esistenti del campione](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources). Impostare `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` cambia il percorso di distribuzione; in quello scenario, il modello non crea Application Insights o AI Search per te. Verifica esplicitamente dipendenze, assegnazioni di ruolo e distribuzioni di modelli.

La sezione `pipeline.variables` controlla i valori passati a una pipeline generata; non è un archivio di segreti e non crea risorse Azure. Preferisci l’identità gestita nell’app e OIDC per CI/CD. I file ambiente AZD sono in testo normale e non dovrebbero essere committati.

AZD supporta l’importazione di un file dotenv affidabile preparato localmente:

```bash
azd env set --file .env
```

Esamina quel file prima di importarlo e non stampare file ambiente contenenti segreti in terminali condivisi o log CI.

## 6. Verifica la tua comprensione

- Quale servizio `azure.yaml` distribuisce l’applicazione?
- Quale parametro dell’infrastruttura consuma ogni valore che hai cambiato?
- Quali cambiamenti richiedono provisioning invece di solo distribuzione?
- La regione e l’abbonamento selezionati supportavano modello e quota?
- Tutti gli hook di setup sono riusciti e puoi verificarne il comportamento dell’applicazione distribuita?

Continua con [Personalizza un Modello](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->