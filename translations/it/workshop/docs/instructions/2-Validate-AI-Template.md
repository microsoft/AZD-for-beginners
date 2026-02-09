# 2. Validare un Template

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Analizzare l'architettura della soluzione AI
    - [ ] Comprendere il flusso di distribuzione di AZD
    - [ ] Usare GitHub Copilot per ottenere aiuto sull'uso di AZD
    - [ ] **Lab 2:** Distribuire & Convalidare il template AI Agents

---


## 1. Introduzione

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` è uno strumento da riga di comando open-source che semplifica il flusso di lavoro degli sviluppatori durante la creazione e la distribuzione di applicazioni su Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sono repository standardizzati che includono codice di esempio dell'applicazione, asset di _infrastruttura come codice_, e file di configurazione `azd` per un'architettura di soluzione coerente. Il provisioning dell'infrastruttura diventa semplice come eseguire il comando `azd provision` - mentre usare `azd up` ti permette di provisionare l'infrastruttura **e** distribuire la tua applicazione in un unico passaggio!

Di conseguenza, avviare il processo di sviluppo della tua applicazione può essere semplice come trovare il _template AZD_ di partenza più adatto alle tue esigenze applicative e infrastrutturali - quindi personalizzare il repository per adattarlo al tuo scenario.

Prima di iniziare, assicuriamoci che tu abbia installato l'Azure Developer CLI.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. Dovresti vedere qualcosa del genere!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Ora sei pronto per selezionare e distribuire un template con azd**

---

## 2. Selezione del Template

La piattaforma Microsoft Foundry include un [set di template AZD raccomandati](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) che coprono scenari di soluzione popolari come _automazione di workflow multi-agente_ e _elaborazione di contenuti multimodale_. Puoi anche scoprire questi template visitando il portale Microsoft Foundry.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when prompted - you will see something like this.

![Scegli](../../../../../translated_images/it/01-pick-template.60d2d5fff5ebc374.webp)


Le opzioni **Basic** sono i tuoi template di partenza:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) che distribuisce un'applicazione chat di base _con i tuoi dati_ su Azure Container Apps. Usalo per esplorare uno scenario di chatbot AI di base.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) che distribuisce anche un AI Agent standard (con i Foundry Agents). Usalo per familiarizzare con soluzioni AI agentiche che coinvolgono strumenti e modelli.

Visita il secondo link in una nuova scheda del browser (o clicca `Open in GitHub` per la card correlata). Dovresti vedere il repository per questo Template AZD. Prenditi un minuto per esplorare il README. L'architettura dell'applicazione è così:

![Architettura](../../../../../translated_images/it/architecture.8cec470ec15c65c7.webp)

---

## 3. Attivazione del template

Proviamo a distribuire questo template e assicurarci che sia valido. Seguiremo le linee guida nella sezione [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirm the default action to `Create codespace`
1. This opens a new browser tab - wait for the GitHub Codespaces session to complete loading
1. Open the VS Code terminal in Codespaces - type the following command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. Ti verrà richiesto di effettuare l'accesso ad Azure - segui le istruzioni per autenticarti
1. Inserisci un nome unico per l'ambiente - ad es., ho usato `nitya-mshack-azd`
1. Questo creerà una cartella `.azure/` - vedrai una sottocartella con il nome dell'ambiente
1. Ti verrà richiesto di selezionare un nome di sottoscrizione - seleziona il valore predefinito
1. Ti verrà chiesto di scegliere una località - usa `East US 2`

Ora, attendi il completamento del provisioning. **Ci vogliono 10-15 minuti**

1. Al termine, la tua console mostrerà un messaggio di SUCCESSO come questo:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Il tuo Azure Portal avrà ora un gruppo di risorse provisionato con quel nome di ambiente:

      ![Infrastruttura](../../../../../translated_images/it/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Ora sei pronto per convalidare l'infrastruttura e l'applicazione distribuite**.

---

## 4. Validazione del template

1. Visita la pagina [Resource Groups](https://portal.azure.com/#browse/resourcegroups) del Portale di Azure - effettua il login quando richiesto
1. Clicca sul RG relativo al nome del tuo ambiente - vedrai la pagina sopra

      - clicca sulla risorsa Azure Container Apps
      - clicca su Application Url nella sezione _Essentials_ (in alto a destra)

1. Dovresti vedere un'interfaccia front-end dell'applicazione ospitata come questa:

   ![App](../../../../../translated_images/it/03-test-application.471910da12c3038e.webp)

1. Prova a fare un paio di [domande di esempio](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Chiedi: ```Qual è la capitale della Francia?``` 
      1. Chiedi: ```Qual è la migliore tenda sotto $200 per due persone, e quali caratteristiche include?```

1. Dovresti ottenere risposte simili a quelle mostrate sotto. _Ma come funziona?_ 

      ![App](../../../../../translated_images/it/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Convalida dell'Agent

L'Azure Container App distribuisce un endpoint che si connette all'AI Agent provisionato nel progetto Microsoft Foundry per questo template. Diamo un'occhiata a cosa significa tutto ciò.

1. Torna alla pagina _Overview_ del gruppo di risorse nel Portale di Azure

1. Clicca sulla risorsa `Microsoft Foundry` in quell'elenco

1. Dovresti vedere questo. Clicca il pulsante `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/it/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Dovresti vedere la pagina del progetto Foundry per la tua applicazione AI
   ![Progetto](../../../../../translated_images/it/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Clicca su `Agents` - vedrai l'Agent predefinito provisionato nel tuo progetto
   ![Agenti](../../../../../translated_images/it/06-visit-agents.bccb263f77b00a09.webp)

1. Selezionalo - e vedrai i dettagli dell'Agent. Nota quanto segue:

      - L'agent utilizza File Search per impostazione predefinita (sempre)
      - L'agent `Knowledge` indica che sono stati caricati 32 file (per la ricerca nei file)
      ![Agenti](../../../../../translated_images/it/07-view-agent-details.0e049f37f61eae62.webp)

1. Cerca l'opzione `Data+indexes` nel menu a sinistra e clicca per i dettagli. 

      - Dovresti vedere i 32 file di dati caricati per la conoscenza.
      - Questi corrisponderanno ai 12 file dei clienti e ai 20 file dei prodotti sotto `src/files` 
      ![Dati](../../../../../translated_images/it/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Hai convalidato il funzionamento dell'Agent!** 

1. Le risposte dell'agent sono basate sulla conoscenza contenuta in quei file. 
1. Ora puoi porre domande correlate a quei dati e ottenere risposte fondate.
1. Esempio: `customer_info_10.json` descrive i 3 acquisti effettuati da "Amanda Perez"

Ritorna alla scheda del browser con l'endpoint della Container App e chiedi: `Quali prodotti possiede Amanda Perez?`. Dovresti vedere qualcosa del genere:

![Dati](../../../../../translated_images/it/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground dell'Agent

Costruiamo un po' più di intuizione sulle capacità di Microsoft Foundry, mettendo l'Agent alla prova nel Playground degli Agents. 

1. Torna alla pagina `Agents` in Microsoft Foundry - seleziona l'agent predefinito
1. Clicca sull'opzione `Try in Playground` - otterrai un'interfaccia del Playground come questa
1. Chiedi la stessa domanda: `Quali prodotti possiede Amanda Perez?`

    ![Dati](../../../../../translated_images/it/09-ask-in-playground.a1b93794f78fa676.webp)

Ottieni la stessa (o una risposta simile) - ma ottieni anche informazioni aggiuntive che puoi usare per comprendere la qualità, il costo e le prestazioni della tua app agentica. Per esempio:

1. Nota che la risposta cita i file di dati usati per "basare" la risposta
1. Passa il mouse su una di queste etichette di file - i dati corrispondono alla tua query e alla risposta visualizzata?

Vedi anche una riga di _stats_ sotto la risposta. 

1. Passa il mouse su una metrica - es. Safety. Vedrai qualcosa del genere
1. La valutazione corrisponde alla tua intuizione sul livello di sicurezza della risposta?

      ![Dati](../../../../../translated_images/it/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Osservabilità Integrata

L'osservabilità riguarda l'instrumentazione della tua applicazione per generare dati che possono essere usati per comprendere, debugare e ottimizzare le sue operazioni. Per avere un'idea:

1. Clicca il pulsante `View Run Info` - dovresti vedere questa vista. Questo è un esempio di [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in azione. _Puoi ottenere questa vista anche cliccando Thread Logs nel menu principale_.

   - Fatti un'idea dei passaggi di esecuzione e degli strumenti usati dall'agent
   - Comprendi il conteggio totale dei Token (vs. l'uso di token di output) per la risposta
   - Comprendi la latenza e dove viene speso il tempo nell'esecuzione

      ![Agente](../../../../../translated_images/it/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Clicca la scheda `Metadata` per vedere attributi aggiuntivi per l'esecuzione, che possono fornire contesto utile per il debug di problemi in seguito.   

      ![Agente](../../../../../translated_images/it/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Clicca la scheda `Evaluations` per vedere le autovalutazioni fatte sulla risposta dell'agent. Queste includono valutazioni di safety (es., Self-harm) e valutazioni specifiche dell'agent (es., risoluzione dell'intento, aderenza al compito).

      ![Agente](../../../../../translated_images/it/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Ultimo ma non meno importante, clicca la scheda `Monitoring` nel menu laterale.

      - Seleziona la scheda `Resource usage` nella pagina mostrata - e visualizza le metriche.
      - Monitora l'uso dell'applicazione in termini di costi (token) e carico (richieste).
      - Monitora la latenza dell'applicazione fino al primo byte (elaborazione input) e all'ultimo byte (output).

      ![Agente](../../../../../translated_images/it/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabili d'ambiente

Finora abbiamo seguito la distribuzione nel browser - e convalidato che la nostra infrastruttura è stata provisionata e l'applicazione è operativa. Ma per lavorare con il codice dell'applicazione in modalità _code-first_, dobbiamo configurare il nostro ambiente di sviluppo locale con le variabili rilevanti richieste per lavorare con queste risorse. Usare `azd` lo rende semplice.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) per memorizzare e gestire le impostazioni di configurazione per le distribuzioni delle applicazioni.

1. Le variabili d'ambiente sono memorizzate in `.azure/<env-name>/.env` - questo le associa all'ambiente `env-name` usato durante la distribuzione e ti aiuta a isolare gli ambienti tra diversi target di distribuzione nello stesso repo.

1. Le variabili d'ambiente vengono caricate automaticamente dal comando `azd` ogni volta che esegue un comando specifico (es., `azd up`). Nota che `azd` non legge automaticamente le variabili d'ambiente a livello di OS (es., impostate nella shell) - invece usa `azd set env` e `azd get env` per trasferire informazioni all'interno degli script.


Proviamo alcuni comandi:

1. Get all the environment variables set for `azd` in this environment:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      You see something like:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Get a specific value - e.g., I want to know if we set the `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      You see something like this - it was not set by default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set a new environment variable for `azd`. Here, we update the agent model name. _Note: any changes made will be immediately reflected in the `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Now, we should find the value is set:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Nota che alcune risorse sono persistenti (es., deployment di modelli) e richiederanno più di un semplice `azd up` per forzare il redeployment. Proviamo a smantellare la distribuzione originale e a ridistribuire con variabili d'ambiente modificate.

1. **Refresh** Se hai già distribuito infrastruttura in precedenza usando un template azd - puoi _refreshare_ lo stato delle tue variabili d'ambiente locali in base allo stato corrente della tua distribuzione Azure usando questo comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Questo è un modo potente per _sincronizzare_ le variabili d'ambiente tra due o più ambienti di sviluppo locali (ad es., team con più sviluppatori) - permettendo all'infrastruttura distribuita di fungere da fonte di verità per lo stato delle variabili d'ambiente. I membri del team semplicemente _aggiornano_ le variabili per tornare sincronizzati.

---

## 9. Congratulazioni 🏆

Hai appena completato un flusso di lavoro completo in cui hai:

- [X] Hai selezionato l'AZD Template che desideri utilizzare
- [X] Hai avviato il Template con GitHub Codespaces 
- [X] Hai distribuito il Template e verificato che funzioni

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Dichiarazione di non responsabilità:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->