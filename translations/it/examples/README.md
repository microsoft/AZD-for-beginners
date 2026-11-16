# Esempi — Sorgente in inglese e campioni Azure

Questi sono esempi di apprendimento, non applicazioni certificate per la produzione. Leggi i
prerequisiti, le limitazioni, i costi e le istruzioni per la pulizia di ogni esempio prima
di eseguire i comandi. La disponibilità e le quote di Azure devono essere verificate nella tua sottoscrizione.

- [Home del corso](../README.md)
- [Installazione](../docs/chapter-01-foundation/installation.md)
- [Risoluzione problemi](../docs/chapter-07-troubleshooting/common-issues.md)

## Cosa esiste effettivamente localmente

Ci sono **quattro esempi di applicazioni** e **uno scheletro di infrastruttura**:

| Esempio | Implementazione locale | Focus di apprendimento | Livello |
|---|---|---|---|
| [Simple Flask API](../../../examples/container-app/simple-flask-api) | API Flask CRUD, Dockerfile, Bicep, `azure.yaml` | Distribuzione container, probe, log | Principiante |
| [Microservizi a due servizi](../../../examples/container-app/microservices) | Gateway Node.js e servizio prodotto Python read-only, Dockerfile, Bicep, `azure.yaml` | Comunicazione HTTPS interna, scalabilità indipendente | Intermedio |
| [App database](../../../examples/database-app) | API di lettura Flask, Azure SQL, App Service, Bicep, `azure.yaml` | Connettività SQL, inizializzazione, log | Intermedio |
| [Chat Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python locale, Azure OpenAI e Key Vault Bicep, solo infrastruttura `azure.yaml` | Provisioning modello, cronologia chat, stima token | Intermedio |
| [Infrastruttura retail](../../../examples/retail-multiagent-arm-template) | Template ARM, parametri, script Bash di deployment; **solo container hello-world** | Infrastruttura per una futura applicazione multi-agente | Avanzato |

Lo [scenario retail](retail-scenario.md) è un **progetto architetturale**, non un’
implementazione multi-agente completa. Non sono inclusi codice agente retail, frontend chat,
API router, pipeline dati di ricerca, CLI di valutazione, failover automatico o
hardening per la produzione. Questi devono essere progettati, costruiti e testati separatamente.

La [panoramica microservizi](microservices/README.md) punta all'esempio eseguibile
a due servizi; non è un’altra directory di deployment.

## Percorso di apprendimento consigliato

1. Distribuire l’API Flask e verificare `/health` e le operazioni CRUD.
2. Distribuire l'app database e verificare i suoi cinque prodotti preinseriti.
3. Distribuire l’esempio a due servizi e verificare le richieste gateway-prodotto.
4. Provisionare le risorse chat ed eseguire la CLI interattiva **localmente**.
5. Studiare il progetto retail dopo aver completato gli esempi funzionanti.

Dedica circa 30–60 minuti per ciascun esempio di applicazione includendo prerequisiti e
verifica. L’implementazione retail è un progetto di sviluppo separato, non un
workshop di 30 minuti. La lettura della sua architettura richiede circa 2–3 ore; l’implementazione
e la prontezza per la produzione possono richiedere molto più tempo rispetto alle illustrative
80–120 ore di sviluppo nel guida.

## Avvio rapido

Dalla root del repository, per il primo esempio container:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Atteso: HTTP 200 e JSON contenente `"status": "healthy"`.
È necessario che Docker sia in esecuzione per la build locale del container.

Per la chat, segui il [README chat](azure-openai-chat/README.md): usa
`azd provision`, carica la chiave API da Key Vault nella shell corrente, installa
`src/requirements.txt`, ed esegui `python src/chat.py`. Non esiste un servizio chat ospitato.

Per il commercio al dettaglio, usa la [guida ARM](retail-multiagent-arm-template/README.md).
Non ha `azure.yaml` ed **non** è distribuito o rimosso tramite `azd up`/`azd down`.

## Costi e limitazioni

- Tutte le distribuzioni creano risorse Azure fatturabili. Lo scale-to-zero si applica solo al
  calcolo delle app; non elimina i costi per registro, database, archiviazione, ricerca o log.
- I prezzi esatti dipendono da regione, valuta, traffico, modello/SKU e conservazione.
  Usa il [calcolatore prezzi di Azure](https://azure.microsoft.com/pricing/calculator/)
  prima della distribuzione e configura un budget in Azure Cost Management.
- I dati CRUD di Flask sono in memoria, limitati a un solo worker e al massimo una replica di default.
  Scompaiono al riavvio o allo scale-to-zero. Non si tratta di archiviazione durevole.
- Il microservizio prodotto espone solo endpoint GET. Non sono inclusi servizio ordini, servizio utenti,
  database, Service Bus, implementazioni in C# o Go.
- Le risorse Application Insights non strumentano automaticamente ogni applicazione.
  Consulta ogni esempio per la telemetria effettivamente emessa.
- Gli esempi non implementano l’autenticazione dell’applicazione. Aggiungi identità, autorizzazione,
  archiviazione persistente, controlli di rete, test e procedure operative prima della produzione.

## Esempi Azure esterni — clona separatamente

Questi link sono riferimenti a repository separati, **non esempi locali**.
I loro manutentori gestiscono istruzioni di setup, implementazioni, dipendenze e costi.

| Esempio | Focus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Applicazione Node.js con database |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# e Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend statico con funzioni C# e SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Applicazione serverless Python |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend store containerizzato |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | Applicazione chat AI |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Applicazione agenti |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG con ricerca e citazioni |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Esempio AI conversazionale |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microservizi Java |

Scopri altri progetti nella [galleria template AZD](https://azure.github.io/awesome-azd/).
Non dare per scontato che un progetto esterno supporti `azd` senza controllare il README attuale.

## Struttura del repository

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Non esiste un `configurations/`, `scripts/` condiviso o una directory test promessa da
questo indice. I file effettivi e le idee opzionali di estensione sono individuati in ogni guida.

## Pulizia

Per i quattro esempi AZD, esegui questo **dalla directory dell’esempio selezionato**:

```bash
azd down
```

Controlla il prompt di cancellazione. Per il commercio al dettaglio, elimina solo il gruppo di risorse dedicato
che hai creato, usando le istruzioni nella sua guida ARM. Controlla Azure Cost Management
dopo la pulizia; i dati di fatturazione possono arrivare più tardi.

## Contributi

Includi sorgente, infrastruttura, configurazione del deployment, passaggi pratici per l'installazione e 
la verifica, limitazioni e istruzioni per la pulizia con ogni esempio di applicazione. Etichetta esplicitamente 
il materiale solo architetturale e gli snippet incompleti. 
Non dichiarare pronti per la produzione senza test di deployment, funzionali e operativi.

[FAQ](../resources/faq.md) · [Guida di studio](../resources/study-guide.md) ·
[Segnala un problema](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->