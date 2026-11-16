# 5. Personalizzare un Modello

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stabilire una linea di base

Usa il repository inizializzato [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) dai moduli precedenti. Registra la revisione del modello, la versione AZD, l'ambiente selezionato, il deployment del modello e le domande di esempio funzionanti prima di apportare modifiche.

Il campione implementa un'applicazione chat supportata da un agente. Non diventa **automaticamente** un sistema retail a due agenti semplicemente impostando variabili d'ambiente o salvando file di istruzioni aggiuntive. Agenti extra, gestori di strumenti, instradamento, autorizzazione e accesso ai dati richiedono codice applicativo.

Ispeziona le istruzioni e gli strumenti dell'agente attualmente distribuito in Foundry. Testa una domanda fattuale, una domanda di recupero e una domanda a cui i dati di esempio non possono rispondere. Verifica le citazioni confrontandole con i documenti originali, invece di assumere che una risposta fluente sia corretta.

## 5.2 Personalizzare il recupero della conoscenza

Il modello supporta il recupero basato su file e l'integrazione opzionale con Azure AI Search. Segui la [guida attuale di AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) per l'indicizzazione e la configurazione degli strumenti.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Abilitare il servizio è solo una parte del recupero. Prima di caricare i tuoi dati:

1. Conferma di avere il permesso di usare i documenti e rimuovi informazioni sensibili.
2. Seleziona un modello di embedding supportato nella tua regione e imposta la versione, il tipo di deployment e le dimensioni vettoriali compatibili.
3. Crea/popola l'indice utilizzando il processo documentato nel campione.
4. Configura lo strumento di recupero dell'agente per usare quell'indice.
5. Testa il recupero, le citazioni, l'autorizzazione e il comportamento quando non esiste alcun documento rilevante.

Non passare da `text-embedding-3-small` a un modello di embedding diverso senza verificare le dimensioni e ricostruire/rindicizzare i vettori se necessario. Un nome come `retail-products` non è un catalogo implementato né una policy di controllo accessi.

## 5.3 Tracciamento e monitoraggio

Segui la [guida sulla osservabilità del campione](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Assicurati che la risorsa Application Insights richiesta e la connessione esistano già; se modifichi le impostazioni infrastrutturali, usa `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Invia una richiesta di test, quindi ispeziona i log applicativi del Container App e la vista di tracciamento dell'agente in Foundry. Controlla latenza, chiamate agli strumenti, errori e correlazione tra richiesta e traccia. Non presumere che la telemetria sia connessa solo perché il deployment è riuscito.

Lascia disabilitato `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` a meno che tu non abbia esplicitamente esaminato consenso, redazione, conservazione e controlli di accesso. Le tracce possono contenere argomenti sensibili degli strumenti o contenuti di documenti anche quando i normali log applicativi sembrano innocui.

## 5.4 Valutazione dell'agente

Il punto di ingresso per la valutazione del campione ora è [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), non una directory `evals/`. Dalla radice del campione, usa un ambiente Python che soddisfi i suoi requisiti documentati:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Prima di eseguire, completa i [prerequisiti per la valutazione](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). I test caricano la configurazione dal `.azure/<environment>/.env` selezionato; conferma che è selezionato l'ambiente previsto. Input importanti includono:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando il formato richiesto dall'attuale campione (la versione revisionata usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usato come deployment modello giudice

Ispeziona i test per capire la scelta del valutatore, le soglie, i ruoli richiesti e i costi del modello. Un run completato non è automaticamente un gate di qualità superato; controlla i punteggi, i casi falliti/errore e i risultati collegati in Foundry.

### Estensione valutazioni separate AZD

Il test Python sopra è un **workflow specifico per il campione**. L'estensione opzionale `azure.ai.evaluations` è un workflow diverso, con la propria configurazione `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Per una configurazione completa dell'estensione, vedi [workflow di valutazione e migrazione](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Dalla beta.22 dell'estensione agents, non usare i comandi `azd ai agent eval` rimossi. Installare l'estensione valutazioni non converte i test Python del campione né crea automaticamente una configurazione di valutazione.

## 5.5 Red teaming AI e valutazione continua

Il campione attuale fornisce [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Completa i prerequisiti e rivedi l'obiettivo previsto e i costi prima di eseguire:

```bash
pytest tests/test_red_teaming.py -s
```

Usa un deployment di test autorizzato e dati sintetici. Rivedi gli attacchi generati e i risultati; questa scansione non stabilisce che un'applicazione sia sicura o conforme.

La [guida all'osservabilità](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) descrive anche la valutazione continua configurata all'avvio del container. Valuta interazioni reali degli utenti, non il traffico di test generato, e il supporto per il valutatore varia per regione. Nessuna interazione significa nessuna voce di valutazione. Verifica la versione del campione installata e la configurazione del valutatore invece di presumere che ogni deployment abbia le stesse impostazioni predefinite.

L'autenticazione è separata dalla valutazione. Segui la configurazione di identità/accesso documentata nel campione. Non esiste un “fallback di autenticazione base” documentato su cui fare affidamento per proteggere un endpoint pubblico.

## 5.6 Esercizio di progettazione: personalizzazione retail

!!! warning "Esercizio di progettazione, non un deployment completo"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Scrivi un piano breve che affronti:

| Area | Decisione e evidenze da raccogliere |
|------|----------------------------------|
| Responsabilità degli agenti | Inizia con un agente, o giustifica agenti separati Shopper e Loyalty e la logica di instradamento |
| Dati | Definisci un catalogo/dataset premi sintetico e la proprietà degli aggiornamenti |
| Strumenti | Implementa innanzitutto gestori in sola lettura; specifica autorizzazione e validazione per eventuali scritture |
| Modelli | Scegli combinazioni modello/versione/SKU disponibili e verifica la quota; evita di provvedere modelli non usati |
| Recupero | Definisci indicizzazione, dimensioni embedding, citazioni e controlli di accesso a livello di documento |
| Valutazione | Aggiungi casi di risposta prevista, domanda non supportata, uso strumenti e sicurezza con soglie esplicite |
| Operazioni | Definisci telemetria, budget di latenza/errori, limiti di costo e proprietà di pulizia |

Salvare `custom-agents/shopper-agent-instructions.md` non fa caricare il campione. Trova il codice applicativo che crea/aggiorna l'agente, collega lì le tue istruzioni revisionate e verifica la versione risultante dell'agente prima di testare. Le istruzioni non possono concedere accesso a dati o strumenti che non hai implementato.

Applica una modifica alla volta, ridistribuisci i componenti interessati e riesegui le domande baseline e le valutazioni. Tieni una revisione funzionante per confronto. Per ispirazione architetturale, vedi il [modello retail](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), che però non è neanche un'applicazione retail completa.

!!! quote "AL TERMINE DI QUESTO LAB DOVRESTI AVERE"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continua con [Smantella l'infrastruttura](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->