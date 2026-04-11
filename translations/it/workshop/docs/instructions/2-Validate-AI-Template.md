# 2. Convalidare un Template

> Validato con `azd 1.23.12` a marzo 2026.

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Analizzare l'architettura della soluzione AI
    - [ ] Comprendere il flusso di lavoro di distribuzione di AZD
    - [ ] Usare GitHub Copilot per ottenere aiuto sull'uso di AZD
    - [ ] **Lab 2:** Distribuire e convalidare il template AI Agents

---


## 1. Introduzione

La [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` è uno strumento da riga di comando open-source che semplifica il flusso di lavoro degli sviluppatori durante la creazione e la distribuzione di applicazioni su Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sono repository standardizzati che includono codice di esempio per l'applicazione, risorse di _infrastructure-as-code_ e file di configurazione `azd` per un'architettura di soluzione coerente. Provisionare l'infrastruttura diventa semplice come un comando `azd provision` - mentre usare `azd up` ti permette di provisionare l'infrastruttura **e** distribuire la tua applicazione in un solo passaggio!

Di conseguenza, avviare rapidamente il processo di sviluppo della tua applicazione può essere semplice come trovare il giusto _AZD Starter template_ che si avvicina maggiormente alle esigenze della tua applicazione e infrastruttura - quindi personalizzare il repository per adattarlo ai requisiti del tuo scenario.

Prima di iniziare, assicuriamoci che tu abbia installato l'Azure Developer CLI.

1. Apri un terminale in VS Code e digita questo comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. Dovresti vedere qualcosa del genere!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Ora sei pronto per selezionare e distribuire un template con azd**

---

## 2. Selezione del template

La piattaforma Microsoft Foundry include un [set di template AZD raccomandati](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) che coprono scenari di soluzione popolari come _automazione di workflow multi-agente_ e _elaborazione di contenuti multimodale_. Puoi anche scoprire questi template visitando il portale Microsoft Foundry.

1. Visita [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Accedi al portale Microsoft Foundry quando richiesto - vedrai qualcosa del genere.

![Seleziona](../../../../../translated_images/it/01-pick-template.60d2d5fff5ebc374.webp)


Le opzioni **Basic** sono i template di partenza:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) che distribuisce una semplice applicazione chat _con i tuoi dati_ su Azure Container Apps. Usalo per esplorare uno scenario base di chatbot AI.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) che distribuisce anche un Agente AI standard (con i Foundry Agents). Usalo per familiarizzare con soluzioni agentiche AI che coinvolgono strumenti e modelli.

Visita il secondo link in una nuova scheda del browser (o clicca `Open in GitHub` per la scheda correlata). Dovresti vedere il repository per questo AZD Template. Prenditi un minuto per esplorare il README. L'architettura dell'applicazione appare così:

![Architettura](../../../../../translated_images/it/architecture.8cec470ec15c65c7.webp)

---

## 3. Attivazione del template

Proviamo a distribuire questo template e a verificare che sia valido. Seguiremo le linee guida nella sezione [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Scegli un ambiente di lavoro per il repository del template:

      - **GitHub Codespaces**: Clicca [questo link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) e conferma `Create codespace`
      - **Local clone or dev container**: Clona `Azure-Samples/get-started-with-ai-agents` e aprilo in VS Code

1. Attendi che il terminale di VS Code sia pronto, poi digita il seguente comando:

   ```bash title="" linenums="0"
   azd up
   ```

Completa i passaggi del workflow che questo comando attiverà:

1. Ti verrà chiesto di accedere ad Azure - segui le istruzioni per autenticarti
1. Inserisci un nome unico per l'ambiente - ad esempio, ho usato `nitya-mshack-azd`
1. Questo creerà una cartella `.azure/` - vedrai una sottocartella con il nome dell'ambiente
1. Ti verrà chiesto di selezionare un nome di sottoscrizione - seleziona quella predefinita
1. Ti verrà chiesto di scegliere una località - usa `East US 2`

Ora, attendi che il provisioning sia completato. **Questo richiede 10-15 minuti**

1. Quando termina, la tua console mostrerà un messaggio SUCCESS simile a questo:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ora il tuo Azure Portal avrà un gruppo di risorse predisposto con quel nome di ambiente:

      ![Infrastruttura](../../../../../translated_images/it/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Ora sei pronto per convalidare l'infrastruttura distribuita e l'applicazione**.

---

## 4. Convalida del template

1. Vai alla pagina del Portale di Azure [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - accedi quando richiesto
1. Clicca sul RG corrispondente al nome del tuo ambiente - vedrai la pagina sopra

      - clicca sulla risorsa Azure Container Apps
      - clicca sull'Application Url nella sezione _Essentials_ (in alto a destra)

1. Dovresti vedere un'interfaccia front-end dell'applicazione ospitata come questa:

   ![Applicazione](../../../../../translated_images/it/03-test-application.471910da12c3038e.webp)

1. Prova a porre un paio di [domande di esempio](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Chiedi: ```Qual è la capitale della Francia?``` 
      1. Chiedi: ```Qual è la migliore tenda sotto i $200 per due persone, e quali caratteristiche include?```

1. Dovresti ottenere risposte simili a quelle mostrate di seguito. _Ma come funziona questo?_ 

      ![Applicazione](../../../../../translated_images/it/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Validazione dell'agente

L'Azure Container App distribuisce un endpoint che si collega all'AI Agent provisionato nel progetto Microsoft Foundry per questo template. Vediamo cosa significa.

1. Torna alla pagina _Overview_ del tuo gruppo di risorse nel Portale di Azure

1. Clicca sulla risorsa `Microsoft Foundry` nella lista

1. Dovresti vedere questo. Clicca sul pulsante `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/it/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Dovresti vedere la pagina del progetto Foundry per la tua applicazione AI
   ![Progetto](../../../../../translated_images/it/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clicca su `Agents` - vedrai l'Agente predefinito provisionato nel tuo progetto
   ![Agenti](../../../../../translated_images/it/06-visit-agents.bccb263f77b00a09.webp)

1. Selezionalo - e vedrai i dettagli dell'Agente. Nota quanto segue:

      - L'agente utilizza File Search per impostazione predefinita (sempre)
      - Il campo `Knowledge` dell'agente indica che sono stati caricati 32 file (per la ricerca nei file)
      ![Agenti](../../../../../translated_images/it/07-view-agent-details.0e049f37f61eae62.webp)

1. Cerca l'opzione `Data+indexes` nel menu a sinistra e clicca per i dettagli. 

      - Dovresti vedere i 32 file di dati caricati per la knowledge.
      - Questi corrisponderanno ai 12 file dei clienti e ai 20 file dei prodotti sotto `src/files` 
      ![Dati](../../../../../translated_images/it/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Hai convalidato il funzionamento dell'Agente!** 

1. Le risposte dell'agente sono basate sulla knowledge contenuta in quei file. 
1. Ora puoi porre domande relative a quei dati e ottenere risposte fondate.
1. Esempio: `customer_info_10.json` descrive i 3 acquisti effettuati da "Amanda Perez"

Torna alla scheda del browser con l'endpoint della Container App e chiedi: `Quali prodotti possiede Amanda Perez?`. Dovresti vedere qualcosa del genere:

![Dati](../../../../../translated_images/it/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground degli agenti

Costruiamo un po' più di intuizione sulle capacità di Microsoft Foundry, mettendo l'Agente alla prova nel Playground degli Agents. 

1. Torna alla pagina `Agents` in Microsoft Foundry - seleziona l'agente predefinito
1. Clicca sull'opzione `Try in Playground` - dovresti ottenere un'interfaccia Playground come questa
1. Poni la stessa domanda: `Quali prodotti possiede Amanda Perez?`

    ![Dati](../../../../../translated_images/it/09-ask-in-playground.a1b93794f78fa676.webp)

Ottieni la stessa (o simile) risposta - ma ottieni anche informazioni aggiuntive che puoi usare per capire qualità, costo e prestazioni della tua app agentica. Per esempio:

1. Nota che la risposta cita i file di dati utilizzati per "ancorare" la risposta
1. Passa il mouse sopra una di queste etichette di file - i dati corrispondono alla tua query e alla risposta mostrata?

Vedi anche una riga di _statistiche_ sotto la risposta. 

1. Passa il mouse su una qualsiasi metrica - ad esempio, Safety. Vedrai qualcosa di simile
1. La valutazione mostrata corrisponde alla tua intuizione sul livello di sicurezza della risposta?

      ![Dati](../../../../../translated_images/it/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Osservabilità integrata

L'osservabilità riguarda l'inserimento di strumenti nella tua applicazione per generare dati che possono essere usati per comprendere, debuggare e ottimizzare il suo funzionamento. Per avere un'idea di questo:

1. Clicca sul pulsante `View Run Info` - dovresti vedere questa vista. Questo è un esempio di [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in azione. _Puoi ottenere questa vista anche cliccando su Thread Logs nel menu di primo livello_.

   - Comprendi i passaggi di esecuzione e gli strumenti coinvolti dall'agente
   - Comprendi il conteggio totale dei Token (vs. l'uso dei token di output) per la risposta
   - Comprendi la latenza e dove viene speso il tempo nell'esecuzione

      ![Agente](../../../../../translated_images/it/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clicca sulla scheda `Metadata` per vedere attributi aggiuntivi per l'esecuzione, che possono fornire contesto utile per il debug di problemi successivi.   

      ![Agente](../../../../../translated_images/it/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clicca sulla scheda `Evaluations` per vedere le auto-valutazioni effettuate sulla risposta dell'agente. Queste includono valutazioni di sicurezza (es., Autolesionismo) e valutazioni specifiche dell'agente (es., risoluzione dell'intento, aderenza al compito).

      ![Agente](../../../../../translated_images/it/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Infine, clicca sulla scheda `Monitoring` nel menu laterale.

      - Seleziona la scheda `Resource usage` nella pagina mostrata - e visualizza le metriche.
      - Monitora l'utilizzo dell'applicazione in termini di costi (token) e carico (richieste).
      - Monitora la latenza dell'applicazione fino al primo byte (elaborazione dell'input) e all'ultimo byte (output).

      ![Agente](../../../../../translated_images/it/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabili d'ambiente

Finora abbiamo eseguito la distribuzione nel browser e convalidato che la nostra infrastruttura è stata provisionata e che l'applicazione è operativa. Ma per lavorare con il codice dell'applicazione in modalità _code-first_, dobbiamo configurare il nostro ambiente di sviluppo locale con le variabili rilevanti necessarie per lavorare con queste risorse. Usare `azd` lo rende semplice.

1. L'Azure Developer CLI [usa variabili d'ambiente](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) per memorizzare e gestire le impostazioni di configurazione per le distribuzioni dell'applicazione.

1. Le variabili d'ambiente sono memorizzate in `.azure/<env-name>/.env` - questo le vincola all'ambiente `env-name` usato durante la distribuzione e ti aiuta a isolare gli ambienti tra diversi target di distribuzione nello stesso repository.

1. Le variabili d'ambiente vengono caricate automaticamente dal comando `azd` ogni volta che esegue un comando specifico (es., `azd up`). Nota che `azd` non legge automaticamente le variabili d'ambiente a livello di sistema operativo (es., impostate nella shell) - invece usa `azd set env` e `azd get env` per trasferire informazioni all'interno degli script.


Proviamo alcuni comandi:

1. Ottieni tutte le variabili d'ambiente impostate per `azd` in questo ambiente:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vedi qualcosa del genere:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Ottieni un valore specifico - ad es., voglio sapere se abbiamo impostato il valore `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vedi qualcosa del genere - non era impostato di default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Imposta una nuova variabile d'ambiente per `azd`. Qui, aggiorniamo il nome del modello dell'agente. _Nota: qualsiasi modifica apportata sarà immediatamente riflessa nel file `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ora dovremmo vedere che il valore è impostato:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Nota che alcune risorse sono persistenti (es., deployment di modelli) e richiederanno più di un semplice `azd up` per forzare la ridistribuzione. Proviamo a demolire la distribuzione originale e ridistribuire con le variabili d'ambiente modificate.

1. **Refresh** Se in precedenza hai distribuito l'infrastruttura utilizzando un template azd - puoi _refresh_ lo stato delle variabili d'ambiente locali basandoti sullo stato corrente della tua distribuzione Azure usando questo comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Questo è un modo potente per _sincronizzare_ le variabili d'ambiente tra due o più ambienti di sviluppo locali (ad es., team con più sviluppatori) - permettendo all'infrastruttura distribuita di fungere da fonte di verità per lo stato delle variabili d'ambiente. I membri del team semplicemente _aggiornano_ le variabili per tornare sincronizzati.

---

## 9. Congratulazioni 🏆

Hai appena completato un flusso di lavoro end-to-end in cui:

- [X] Hai selezionato il modello AZD che desideri utilizzare
- [X] Hai aperto il modello in un ambiente di sviluppo supportato
- [X] Hai distribuito il modello e verificato che funzioni

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Dichiarazione di non responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per la massima accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua madre deve essere considerato la fonte autorevole. Per informazioni critiche, si consiglia una traduzione professionale effettuata da un traduttore umano. Non ci assumiamo alcuna responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->