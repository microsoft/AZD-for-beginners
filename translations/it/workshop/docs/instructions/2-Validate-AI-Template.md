# 2. Convalida di un Modello

> Validato con `azd 1.27.1` a luglio 2026.

!!! tip "A FINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Analizzare l'Architettura della Soluzione AI
    - [ ] Comprendere il flusso di lavoro di distribuzione AZD
    - [ ] Usare GitHub Copilot per ottenere aiuto sull'uso di AZD
    - [ ] **Laboratorio 2:** Distribuire e Convalidare il modello AI Agents

---


## 1. Introduzione

L'[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` è uno strumento da linea di comando open-source che semplifica il flusso di lavoro degli sviluppatori nella creazione e distribuzione di applicazioni in Azure.

[I Template AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sono repository standardizzati che includono codice di esempio per applicazioni, asset di _infrastruttura come codice_, e file di configurazione `azd` per un'architettura di soluzione coesa. L'approvvigionamento dell'infrastruttura diventa semplice come il comando `azd provision` - mentre usando `azd up` puoi approvvigionare l'infrastruttura **e** distribuire la tua applicazione in un colpo solo!

Di conseguenza, iniziare il processo di sviluppo della tua applicazione può essere semplice quanto trovare il _template starter AZD_ più vicino alle tue necessità di applicazione e infrastruttura - quindi personalizzare il repository per adattarlo ai requisiti del tuo scenario.

Prima di iniziare, assicuriamoci che tu abbia installato l'Azure Developer CLI.

1. Apri un terminale in VS Code e digita questo comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Dovresti vedere qualcosa di simile!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Ora sei pronto per selezionare e distribuire un template con azd**

---

## 2. Selezione del Template

La piattaforma Microsoft Foundry include un [insieme di template AZD consigliati](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) che coprono scenari di soluzione popolari come l'_automazione del flusso di lavoro multi-agent_ e il _processing di contenuti multimodali_. Puoi anche scoprire questi template visitando il portale Microsoft Foundry.

1. Visita [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Accedi al portale Microsoft Foundry quando richiesto - vedrai qualcosa di simile.

![Pick](../../../../../translated_images/it/01-pick-template.60d2d5fff5ebc374.webp)


Le opzioni **Basic** sono i tuoi template starter:

1. [ ] [Inizia con AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) che distribuisce una semplice applicazione chat _con i tuoi dati_ su Azure Container Apps. Usalo per esplorare uno scenario base di chatbot AI.
1. [X] [Inizia con AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) che distribuisce anche un Agente AI standard (con i Foundry Agents). Usalo per familiarizzare con soluzioni AI agentiche che coinvolgono strumenti e modelli.

Visita il secondo link in una nuova scheda del browser (o clicca `Open in GitHub` per la scheda relativa). Dovresti vedere il repository per questo Template AZD. Prenditi un minuto per esplorare il README. L'architettura dell'applicazione appare così:

![Arch](../../../../../translated_images/it/architecture.8cec470ec15c65c7.webp)

---

## 3. Attivazione del Template

Proviamo a distribuire questo template e a verificarne la validità. Seguiremo le linee guida nella sezione [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Scegli un ambiente di lavoro per il repository del template:

      - **GitHub Codespaces**: Clicca [questo link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) e conferma `Create codespace`
      - **Clonazione locale o contenitore dev**: Clona `Azure-Samples/get-started-with-ai-agents` e aprilo in VS Code

1. Aspetta che il terminale di VS Code sia pronto, quindi digita il comando seguente:

   ```bash title="" linenums="0"
   azd up
   ```

Completa i passi del flusso di lavoro che questo comando attiverà:

1. Ti sarà richiesto di accedere ad Azure - segui le istruzioni per autenticarti
1. Inserisci un nome ambiente unico per te - es. io ho usato `nitya-mshack-azd`
1. Questo creerà una cartella `.azure/` - vedrai una sottocartella con il nome dell'ambiente
1. Ti sarà richiesto di selezionare un nome di sottoscrizione - seleziona quella di default
1. Ti sarà richiesto di scegliere una posizione - usa `East US 2`

Ora, attendi che l'approvvigionamento sia completato. **Ci vogliono 10-15 minuti**

1. Quando finito, la tua console mostrerà un messaggio di SUCCESSO come questo:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Il tuo portale Azure ora avrà un gruppo di risorse approvvigionato con il nome dell'ambiente:

      ![Infra](../../../../../translated_images/it/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Ora sei pronto per convalidare l'infrastruttura e l'applicazione distribuite**.

---

## 4. Convalida del Template

1. Visita la pagina dei [Gruppi di Risorse](https://portal.azure.com/#browse/resourcegroups) del Portale Azure - accedi quando richiesto
1. Clicca sul RG corrispondente al nome del tuo ambiente - vedrai la pagina sopra

      - clicca sulla risorsa Azure Container Apps
      - clicca sull'URL dell'Applicazione nella sezione _Essentials_ (in alto a destra)

1. Dovresti vedere un'interfaccia UI front-end dell'applicazione ospitata come questa:

   ![App](../../../../../translated_images/it/03-test-application.471910da12c3038e.webp)

1. Prova a porre un paio di [domande di esempio](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Chiedi: ```Qual è la capitale della Francia?``` 
      1. Chiedi: ```Qual è la migliore tenda sotto i 200 dollari per due persone, e quali caratteristiche include?```

1. Dovresti ottenere risposte simili a quelle mostrate sotto. _Ma come funziona?_

      ![App](../../../../../translated_images/it/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Convalida dell'Agente

L'Azure Container App distribuisce un endpoint che si collega all'Agente AI approvvigionato nel progetto Microsoft Foundry per questo template. Vediamo cosa significa.

1. Torna alla pagina _Overview_ del gruppo di risorse nel Portale Azure

1. Clicca sulla risorsa `Microsoft Foundry` in quella lista

1. Vedrai questa schermata. Clicca il pulsante `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/it/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Vedrai la pagina del progetto Foundry per la tua applicazione AI
   ![Project](../../../../../translated_images/it/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clicca su `Agents` - vedrai l'agente predefinito approvvigionato nel tuo progetto
   ![Agents](../../../../../translated_images/it/06-visit-agents.bccb263f77b00a09.webp)

1. Selezionalo - e vedrai i dettagli dell'agente. Nota i seguenti aspetti:

      - L'agente usa di default (sempre) la Ricerca tra File
      - Il `Knowledge` dell'agente indica che sono stati caricati 32 file (per la ricerca tra file)
      ![Agents](../../../../../translated_images/it/07-view-agent-details.0e049f37f61eae62.webp)

1. Cerca l'opzione `Data+indexes` nel menu a sinistra e clicca per i dettagli.

      - Dovresti vedere i 32 file di dati caricati per la conoscenza.
      - Questi corrisponderanno ai 12 file clienti e 20 file prodotti sotto `src/files`
      ![Data](../../../../../translated_images/it/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Hai convalidato il funzionamento dell'Agente!** 

1. Le risposte dell'agente si basano sulla conoscenza contenuta in quei file.
1. Ora puoi porre domande relative a quei dati, e ottenere risposte fondate.
1. Esempio: `customer_info_10.json` descrive i 3 acquisti effettuati da "Amanda Perez"

Ritorna alla scheda del browser con l'endpoint dell'Azure Container App e chiedi: `Quali prodotti possiede Amanda Perez?`. Dovresti vedere qualcosa di simile:

![Data](../../../../../translated_images/it/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground dell'Agente

Acquisiamo un po' più di intuizione sulle capacità di Microsoft Foundry, provando l'Agente nel Playground degli Agenti.

1. Torna alla pagina `Agents` in Microsoft Foundry - seleziona l'agente predefinito
1. Clicca l'opzione `Try in Playground` - dovresti ottenere un'interfaccia Playground come questa
1. Poni la stessa domanda: `Quali prodotti possiede Amanda Perez?`

    ![Data](../../../../../translated_images/it/09-ask-in-playground.a1b93794f78fa676.webp)

Otterrai la stessa (o simile) risposta - ma anche informazioni aggiuntive che puoi usare per comprendere qualità, costo e prestazioni della tua app agentica. Per esempio:

1. Nota che la risposta cita i file di dati usati per "fondare" la risposta
1. Passa il cursore su una di queste etichette file - i dati corrispondono alla tua query e alla risposta mostrata?

Vedi anche una riga di _statistiche_ sotto la risposta.

1. Passa il cursore sopra ogni metrica - es. Sicurezza. Vedrai qualcosa del genere
1. La valutazione assegnata corrisponde alla tua intuizione sul livello di sicurezza della risposta?

      ![Data](../../../../../translated_images/it/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Osservabilità Integrata

L'osservabilità consiste nello strumentare la tua applicazione per generare dati che possono essere usati per comprendere, fare debug e ottimizzare le sue operazioni. Per avere un'idea:

1. Clicca il pulsante `View Run Info` - vedrai questa vista. Questo è un esempio di [tracciamento dell'Agente](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in azione. _Puoi anche ottenere questa vista cliccando su Thread Logs nel menu principale_.

   - Comprendi i passi di esecuzione e gli strumenti usati dall'agente
   - Comprendi il numero totale di Token (rispetto all'uso di token di output) per la risposta
   - Comprendi la latenza e dove viene impiegato il tempo durante l'esecuzione

      ![Agent](../../../../../translated_images/it/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clicca la scheda `Metadata` per vedere attributi aggiuntivi della sessione, che possono fornire contesto utile per il debug successivo.

      ![Agent](../../../../../translated_images/it/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clicca la scheda `Evaluations` per vedere le auto-valutazioni effettuate sulla risposta dell'agente. Queste includono valutazioni di sicurezza (es. Autolesionismo) e valutazioni specifiche per l'agente (es. Risoluzione intenti, aderenza al compito).

      ![Agent](../../../../../translated_images/it/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Infine, clicca la scheda `Monitoring` nel menu laterale.

      - Seleziona la scheda `Resource usage` nella pagina mostrata - e visualizza le metriche.
      - Monitora l'uso dell'applicazione in termini di costi (token) e carico (richieste).
      - Monitora la latenza dell'applicazione fino al primo byte (processamento input) e all'ultimo byte (output).

      ![Agent](../../../../../translated_images/it/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabili d'Ambiente

Finora abbiamo seguito la distribuzione nel browser - e convalidato che la nostra infrastruttura è stata approvvigionata e l'applicazione è operativa. Ma per lavorare con il codice dell'applicazione _prima_ (code-first), dobbiamo configurare il nostro ambiente di sviluppo locale con le variabili rilevanti necessarie per interagire con queste risorse. Usare `azd` rende tutto facile.

1. L'Azure Developer CLI [usa variabili d'ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) per memorizzare e gestire le impostazioni di configurazione per le distribuzioni delle applicazioni.

1. Le variabili d'ambiente sono memorizzate in `.azure/<env-name>/.env` - questo le delimita all'ambiente `env-name` usato durante la distribuzione e ti aiuta a isolare gli ambienti tra diversi obiettivi di distribuzione nello stesso repo.

1. Le variabili d'ambiente vengono caricate automaticamente dal comando `azd` ogni volta che esegue un comando specifico (es. `azd up`). Nota che `azd` non legge automaticamente le variabili d'ambiente a livello di sistema operativo (es. impostate nel shell) - usa invece `azd set env` e `azd get env` per trasferire informazioni all'interno di script.


Proviamo qualche comando:

1. Ottieni tutte le variabili d'ambiente impostate per `azd` in questo ambiente:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vedrai qualcosa come:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Ottieni un valore specifico - es. voglio sapere se abbiamo impostato il valore `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vedrai qualcosa di simile - non era impostato di default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Imposta una nuova variabile d'ambiente per `azd`. Qui aggiorniamo il nome del modello dell'agente. _Nota: qualsiasi modifica fatta sarà immediatamente riflessa nel file `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ora dovremmo trovare il valore impostato:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Nota che alcune risorse sono persistenti (es. distribuzioni di modelli) e richiederanno più di un semplice `azd up` per forzare la ridistribuzione. Proviamo a distruggere la distribuzione originale e a ridistribuire con variabili d'ambiente modificate.

1. **Aggiorna** Se avevi precedentemente distribuito un'infrastruttura usando un template azd - puoi _aggiornare_ lo stato delle tue variabili d'ambiente locali basandoti sullo stato corrente della tua distribuzione Azure usando questo comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Questo è un modo potente per _sincronizzare_ le variabili d'ambiente tra due o più ambienti di sviluppo locali (ad esempio, un team con più sviluppatori) - permettendo all'infrastruttura distribuita di servire come verità fondamentale per lo stato delle variabili d'ambiente. I membri del team devono semplicemente _aggiornare_ le variabili per rimettersi in sincronizzazione.

---

## 9. Congratulazioni 🏆

Hai appena completato un flusso di lavoro end-to-end in cui hai:

- [X] Selezionato il modello AZD che vuoi usare
- [X] Aperto il modello in un ambiente di sviluppo supportato
- [X] Distribuito il modello e verificato che funziona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->