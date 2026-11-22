# 5. Personalizza un Modello

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Stabilire una linea di base

Usa il repository inizializzato [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) dai moduli precedenti. Registra la revisione del modello, la versione di AZD, l'ambiente selezionato, il deployment del modello e le domande di esempio funzionanti prima di modificare qualcosa.

L'esempio implementa un'applicazione di chat supportata da un agente. Non diventa **automaticamente** un sistema retail a due agenti solo impostando variabili d'ambiente o salvando file di istruzioni aggiuntivi. Agenti extra, gestori di strumenti, instradamento, autorizzazioni e accesso ai dati richiedono codice applicativo.

Esamina le istruzioni e gli strumenti dell'agente attualmente distribuito in Foundry. Testa una domanda fattuale, una domanda di recupero e una domanda a cui i dati di esempio non possono rispondere. Verifica le citazioni rispetto ai documenti di origine reali anziché presumere che una risposta fluente sia corretta.

## 5.2 Personalizza il recupero della conoscenza

Il modello supporta il recupero basato su file e l'integrazione opzionale con Azure AI Search. Segui la [guida attuale di AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) per l'indicizzazione e la configurazione degli strumenti.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Abilitare il servizio è solo una parte del recupero. Prima di caricare i tuoi dati:

1. Conferma di avere il permesso di utilizzare i documenti e rimuovi informazioni sensibili.
2. Seleziona un modello di embedding supportato nella tua regione e imposta la sua versione compatibile, tipo di deployment e dimensioni vettoriali.
3. Crea/popola l'indice utilizzando il processo documentato dell'esempio.
4. Configura lo strumento di recupero dell'agente per usare quell'indice.
5. Testa il recupero, le citazioni, l'autorizzazione e il comportamento quando non esistono documenti rilevanti.

Non passare da `text-embedding-3-small` a un modello di embedding diverso senza controllare le dimensioni e ricostruire/reindicizzare i vettori se necessario. Un nome come `retail-products` non è un catalogo implementato né una policy di controllo accesso.

## 5.3 Tracciamento e monitoraggio

Segui la [guida all'osservabilità dell'esempio](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Assicurati che la risorsa e la connessione di Application Insights richieste esistano già; se cambi impostazioni di infrastruttura, usa `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Invia una richiesta di test, quindi ispeziona i log applicativi del Container App e la vista di tracciamento dell'agente in Foundry. Controlla latenza, chiamate agli strumenti, errori e correlazione tra richiesta e tracciamento. Non presumere che la telemetria sia collegata solo perché il deployment è riuscito.

Lascia `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` disabilitato a meno che tu non abbia esplicitamente esaminato consenso, redazione, conservazione e controlli di accesso. I tracciamenti possono contenere argomenti sensibili degli strumenti o contenuti dei documenti anche quando i log applicativi ordinari sembrano innocui.

## 5.4 Valutazione dell'agente

Il punto d'ingresso per la valutazione dell'esempio è ora [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), non una directory `evals/`. Dalla radice dell'esempio, usa un ambiente Python che soddisfi i suoi requisiti documentati:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Prima di eseguire, completa i [prerequisiti di valutazione](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). I test caricano la configurazione dall'`.azure/<environment>/.env` selezionato; conferma che l'ambiente previsto sia selezionato. Gli input importanti includono:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando il formato richiesto dall'esempio attuale (la versione revisionata usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usato come deployment del modello giudice

Esamina i test per capire la scelta dell'evaluatore, le soglie, i ruoli richiesti e i costi del modello. Un'esecuzione completata non è automaticamente una soglia di qualità superata; ispeziona punteggi, casi falliti/con errori e i risultati collegati in Foundry.

### Estensione separata per valutazioni AZD

Il test Python sopra è un **flusso di lavoro specifico dell'esempio**. L'estensione opzionale `azure.ai.evaluations` è un flusso di lavoro diverso, con la propria configurazione `evals/azure.eval.yaml`. Si installa separatamente, non è inclusa nel bundle `microsoft.foundry` 1.0 generalmente disponibile:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Per una configurazione completa dell'estensione, consulta [flussi di lavoro di valutazione e migrazione](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Dalla beta.22 degli agenti, non usare i comandi rimossi `azd ai agent eval`. L'installazione dell'estensione valutazioni non converte i test Python dell'esempio né crea automaticamente una configurazione di valutazione.

Per un **esercizio separato di agenti ospitati GA**, usa una cartella vuota fuori dall'esempio di questo workshop e segui la [guida Foundry locale-al-cloud](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Usa AZD 1.37.0+, il bundle `microsoft.foundry`, Python 3.13+ e uv corrente. Ispezionerai `azure.yaml`, testerai localmente con Agent Inspector, distribuirai il codice sorgente per una build remota Foundry e genererai/revisionerai un dataset e una rubric prima di configurare `azd ai eval init --name quality`. Non sostituire i test di questo esempio né presumere che installare il bundle cambi il suo modello di hosting.

## 5.5 Red teaming AI e valutazione continua

L'esempio attuale offre [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Completa i prerequisiti e rivedi il target previsto e i costi prima di eseguire:

```bash
pytest tests/test_red_teaming.py -s
```

Usa un deployment di test autorizzato e dati sintetici. Esamina gli attacchi generati e i risultati; questa scansione non stabilisce che un'applicazione sia sicura o conforme.

La [guida all'osservabilità](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) descrive anche la valutazione continua configurata all'avvio del container. Valuta interazioni reali dell'utente, non traffico di test generato, e il supporto dell'evaluator varia per regione. Nessuna interazione significa nessuna voce di valutazione. Verifica la versione del campione installata e la configurazione dell'evaluator anziché presumere che ogni deployment abbia gli stessi predefiniti.

L'autenticazione è separata dalla valutazione. Segui la configurazione documentata identità/accesso dell'esempio. Non esiste un “fallback di autenticazione base” documentato su cui fare affidamento per proteggere un endpoint pubblico.

## 5.6 Esercizio di progettazione: personalizzazione retail

!!! warning "Esercizio di progettazione, non un deployment completato"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Scrivi un piano breve che affronti:

| Area | Decisioni e prove da raccogliere |
|------|----------------------------------|
| Responsabilità dell'agente | Inizia con un solo agente, oppure giustifica agenti separati Shopper e Loyalty e logica di instradamento |
| Dati | Definisci un catalogo/sistema premi sintetico e proprietà degli aggiornamenti |
| Strumenti | Implementa prima i gestori in sola lettura; specifica autorizzazione e validazione per eventuali scritture |
| Modelli | Scegli combinazioni modello/versione/SKU disponibili e verifica la quota; evita di fornire modelli inutilizzati |
| Recupero | Definisci indicizzazione, dimensioni embedding, citazioni e controlli di accesso a livello di documento |
| Valutazione | Aggiungi casi di risposta prevista, domanda non supportata, uso di strumenti e sicurezza con soglie esplicite |
| Operazioni | Definisci telemetria, budget di latenza/errori, limiti di costo e proprietà di pulizia |

Salvare `custom-agents/shopper-agent-instructions.md` non fa caricare il campione. Trova il codice applicativo che crea/aggiorna l'agente, collega lì le tue istruzioni revisionate e verifica la versione agente risultante prima di testare. Le istruzioni non possono concedere accesso a dati o strumenti che non hai implementato.

Applica una modifica alla volta, ridistribuisci i componenti interessati e riesegui le tue domande di base e valutazioni. Mantieni una revisione funzionante per confronto. Per ispirazione architetturale, vedi il [blueprint retail](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), che non è nemmeno un'applicazione retail completa.

!!! quote "AL TERMINE DI QUESTO LAB DOVRESTI AVER"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continua con [Smantellamento Infrastruttura](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->