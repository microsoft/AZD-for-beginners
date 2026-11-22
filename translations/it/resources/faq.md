# Domande Frequenti (FAQ)

**Ottieni Aiuto per Capitolo**
- **📚 Home del Corso**: [AZD per Principianti](../README.md)
- **🚆 Problemi di Installazione**: [Capitolo 1: Installazione e Configurazione](../docs/chapter-01-foundation/installation.md)
- **🤖 Domande sull'IA**: [Capitolo 2: Sviluppo AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Risoluzione Problemi**: [Capitolo 7: Debugging e Risoluzione Problemi](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduzione

Questa FAQ completa fornisce risposte alle domande più comuni su Azure Developer CLI (azd) e le distribuzioni Azure. Trova soluzioni rapide ai problemi comuni, comprendi le best practice e ottieni chiarimenti sui concetti e i flussi di lavoro azd.

## Obiettivi di Apprendimento

Rivedendo questa FAQ, potrai:
- Trovare risposte rapide a domande e problemi comuni di Azure Developer CLI
- Comprendere i concetti chiave e la terminologia tramite formato pratico Q&A
- Accedere a soluzioni di risoluzione problemi per scenari ricorrenti ed errori
- Imparare le best practice tramite domande frequenti sull'ottimizzazione
- Scoprire funzionalità avanzate e capacità tramite domande di livello esperto
- Fare riferimento a indicazioni su costi, sicurezza e strategie di deployment in modo efficiente

## Risultati di Apprendimento

Con referenze regolari a questa FAQ, sarai in grado di:
- Risolvere problemi comuni di Azure Developer CLI autonomamente usando soluzioni fornite
- Prendere decisioni informate su strategie e configurazioni di deployment
- Comprendere la relazione tra azd e altri strumenti e servizi Azure
- Applicare best practice basate sull'esperienza della community e raccomandazioni di esperti
- Risolvere problemi di autenticazione, deployment e configurazione in modo efficace
- Ottimizzare costi e prestazioni usando spunti e raccomandazioni dalla FAQ

## Indice

- [Per Iniziare](#getting-started)
- [Autenticazione e Accesso](#authentication--access)
- [Template e Progetti](#templates--projects)
- [Deployment e Infrastruttura](#deployment--infrastructure)
- [Configurazioni e Ambienti](#configuration--environments)
- [Risoluzione Problemi](#troubleshooting)
- [Costi e Fatturazione](#cost--billing)
- [Best Practice](#best-practices)
- [Argomenti Avanzati](#advanced-topics)

---

## Per Iniziare

### D: Cos'è Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) è uno strumento a linea di comando orientato agli sviluppatori che accelera il tempo necessario per portare la tua applicazione dall'ambiente di sviluppo locale ad Azure. Fornisce best practice tramite template e supporta l'intero ciclo di vita del deployment.

### D: In cosa azd è diverso da Azure CLI?
**R**: 
- **Azure CLI**: Strumento generico per la gestione delle risorse Azure
- **azd**: Strumento focalizzato sugli sviluppatori per i flussi di lavoro di deployment applicativo
- azd ha un proprio flusso di autenticazione e deployment; Azure CLI è uno strumento separato e complementare
- azd include template, gestione degli ambienti e automazione del deployment

### D: Ho bisogno di installare Azure CLI per usare azd?
**R**: Non per il flusso di lavoro core AZD. Autenticati con `azd auth login`. Installa Azure CLI separatamente quando un hook del template o un esercizio esegue esplicitamente comandi `az`.

### D: Quali linguaggi di programmazione supporta azd?
**R**: azd è agnostico al linguaggio. Funziona con:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Siti web statici
- Applicazioni containerizzate

### D: Posso usare azd con progetti esistenti?
**R**: Sì! Puoi:
1. Usare `azd init` per aggiungere la configurazione azd a progetti esistenti
2. Adattare progetti esistenti per conformarsi alla struttura del template azd
3. Creare template personalizzati basati sulla tua architettura esistente

### D: Cosa è cambiato con la disponibilità generale dell'estensione Foundry?
**R**: Il pacchetto `microsoft.foundry` ha raggiunto la versione 1.0 e GA il 5 novembre 2026. Con AZD 1.37.0+ usa `azd ext install microsoft.foundry` per installare sette estensioni core per agenti, connessioni, inspector, progetti, routine, competenze e toolkit. Non è un nuovo namespace di comandi, i suoi componenti sono versionati indipendentemente. Valutazioni, dataset, fine-tuning e modelli custom sono installati separatamente; le funzionalità opzionali in anteprima non diventano GA solo perché il bundle è GA.

La [guida per l'agente ospitato](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) utilizza Python 3.13+ e la versione attuale di uv. `azd ai agent run` apre localmente Agent Inspector, ma le chiamate modello usano ancora Azure e comportano costi. La modalità codice `azd deploy` carica il codice sorgente per una build remota senza richiedere build locali in container.

### D: `azd down` rimuove un agente ospitato da un progetto Foundry esistente?
**R**: Non per il percorso del progetto riutilizzato descritto nell’avvio rapido dell’agente ospitato: lascia inalterati il progetto, l’agente ospitato e altre risorse. Rimuovi risorse indesiderate separatamente senza eliminare risorse condivise. Se l’ambiente ha creato un nuovo progetto Foundry, `azd down` elimina il suo gruppo di risorse e tutto ciò che contiene. Controlla le [indicazioni per la pulizia](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) e le richieste di cancellazione prima di confermare.

---

## Autenticazione e Accesso

### D: Come mi autentico con Azure usando azd?
**R**: Usa `azd auth login` che aprirà una finestra del browser per l'autenticazione Azure. Per scenari CI/CD, usa service principal o managed identities.

### D: Posso usare azd con più sottoscrizioni Azure?
**R**: Sì. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` per specificare la sottoscrizione da usare per ogni ambiente.

### D: Quali permessi servono per effettuare il deployment con azd?
**R**: Tipicamente servono:
- ruolo **Contributor** sul gruppo di risorse o sottoscrizione
- ruolo **User Access Administrator** se si distribuiscono risorse che richiedono assegnazioni di ruolo
- permessi specifici variano in base al template e alle risorse distribuite

### D: Posso usare azd in pipeline CI/CD?
**R**: Assolutamente! azd è progettato per l'integrazione CI/CD. Usa service principal per l’autenticazione e imposta variabili d’ambiente per la configurazione.

### D: Come gestisco l'autenticazione in GitHub Actions?
**R**: Preferisci la federazione di identità del carico di lavoro (OIDC), configurata con `azd pipeline config`. Il workflow generato installa AZD e autentica AZD direttamente con identità federata. Un passo `azure/login` da solo non stabilisce un login AZD. Un passo di login all’interno di un job esistente è:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provi o distribuisci dopo il login, con l’ambiente AZD previsto, sottoscrizione e location configurati. La credenziale federata dell’identità deve fidarsi del repository/ref del workflow o dell’ambiente GitHub, e i ruoli Azure devono consentire le operazioni richieste.

---

## Template e Progetti

### D: Dove posso trovare template azd?
**R**: 
- Template ufficiali e della community: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Template della community: ricerca GitHub per "azd-template"
- Usa `azd template list` per navigare i template disponibili

### D: Come creo un template personalizzato?
**R**: 
1. Parti da una struttura di template esistente
2. Modifica `azure.yaml`, file infrastruttura e codice applicativo
3. Testa approfonditamente con `azd up`
4. Pubblica su GitHub con tag appropriati

### D: Posso usare azd senza un template?
**R**: Sì, usa `azd init` in un progetto esistente per creare i file di configurazione necessari. Dovrai configurare manualmente `azure.yaml` e file infrastrutturali.

### D: Qual è la differenza tra template ufficiali e della community?
**R**: 
- **Template ufficiali**: Mantenuti da Microsoft, aggiornati regolarmente, documentazione completa
- **Template della community**: Creati da sviluppatori, possono avere casi d’uso specializzati, qualità e manutenzione variabili

### D: Come aggiorno un template nel mio progetto?
**R**: I template non si aggiornano automaticamente. Puoi:
1. Confrontare e unire manualmente le modifiche dal template sorgente
2. Ricominciare da capo con `azd init` usando il template aggiornato
3. Selezionare miglioramenti specifici da template aggiornati

---

## Deployment e Infrastruttura

### D: Quali servizi Azure può distribuire azd?
**R**: azd può distribuire qualsiasi servizio Azure tramite template Bicep/ARM, inclusi:
- App Services, Container Apps, Functions
- Database (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Risorse di rete, sicurezza e monitoraggio

### D: Posso distribuire in più regioni?
**R**: Sì, configura più regioni nei tuoi template Bicep e imposta correttamente il parametro location per ogni ambiente.

### D: Come gestisco le migrazioni dello schema del database?
**R**: Usa hook di deployment in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### D: Posso distribuire solo infrastruttura senza applicazioni?
**R**: Sì, usa `azd provision` per distribuire solo i componenti infrastrutturali definiti nei tuoi template.

### D: Come distribuisco su risorse Azure esistenti?
**R**: Sì, se il template lo supporta. Riferisci risorse esistenti con dichiarazioni `existing` di Bicep o con i parametri esistenti documentati del template, mappando i servizi applicativi ai loro target previsti. Questo non importa proprietà né crea automaticamente permessi mancanti. Controlla il template prima di distribuire.

### D: Posso usare Terraform invece di Bicep?
**R**: Sì. AZD supporta sia Terraform sia Bicep. Seleziona un template basato su Terraform o configura `infra.provider: terraform` in `azure.yaml`, con file Terraform e configurazione stato/backend appropriati. Vedi il [workflow Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configurazioni e Ambienti

### D: Come gestisco ambienti diversi (dev, staging, prod)?
**R**: Crea ambienti separati con `azd env new <environment-name>` e configura impostazioni diverse per ciascuno:
```bash
azd env new development
azd env new staging  
azd env new production
```

### D: Dove sono memorizzate le configurazioni ambiente?
**R**: Nella cartella `.azure` all’interno della directory del progetto. Ogni ambiente ha la propria cartella con file di configurazione.

### D: Come imposto configurazioni specifiche per ambiente?
**R**: Usa `azd env set` per configurare variabili ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### D: Posso condividere configurazioni ambiente tra membri del team?
**R**: La cartella `.azure` contiene informazioni sensibili e non dovrebbe essere committata nel controllo versione. Invece:
1. Documenta variabili ambiente richieste
2. Usa script di deployment per configurare gli ambienti
3. Usa Azure Key Vault per configurazioni sensibili

### D: Come sovrascrivo i valori di default del template?
**R**: Imposta variabili ambiente che corrispondono ai parametri del template:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Solo le variabili consumate dal template influenzano il deployment. `SKU_NAME` sopra è un esempio di input personalizzato, non un'impostazione universale AZD.

---

## Risoluzione Problemi

### D: Perché `azd up` fallisce?
**R**: Cause comuni:
1. **Problemi di autenticazione**: Esegui `azd auth login`
2. **Permessi insufficienti**: Controlla le assegnazioni di ruolo Azure
3. **Conflitti nei nomi delle risorse**: Controlla la risorsa in conflitto e gli input del template; crea un ambiente separato con `azd env new` se serve isolamento
4. **Problemi di quota/capacità**: Verifica disponibilità regionale
5. **Errori nel template**: Valida i template Bicep

### D: Come debuggo fallimenti di deployment?
**R**: 
1. Usa `azd deploy --debug` per output dettagliati
2. Controlla la cronologia dei deployment nel portale Azure
3. Controlla il Registro Attività nel portale Azure
4. Usa `azd show` per mostrare lo stato corrente dell'ambiente

### D: Perché le mie variabili ambiente non funzionano?
**R**: Controlla:
1. I nomi variabili corrispondono esattamente ai parametri del template
2. I valori sono correttamente quotati se contengono spazi
3. L’ambiente è selezionato: `azd env select <environment>`
4. Le variabili sono impostate nell’ambiente corretto

### D: Come pulisco distribuzioni fallite?
**R**: 
```bash
azd down
```
Rivedi prima l’ambiente selezionato e conferma la cancellazione. Questo elimina risorse Azure provisionate, non la configurazione locale dell'ambiente `.azure`. `--purge` chiede inoltre la cancellazione permanente di risorse soft-delete supportate e può essere bloccata da protezione retention/purge; non è una procedura di recupero standard.

### D: Perché la mia applicazione non è accessibile dopo il deployment?
**R**: Controlla:
1. Il deployment è stato completato con successo
2. L'applicazione è in esecuzione (controlla log nel portale Azure)
3. I gruppi di sicurezza di rete permettono il traffico
4. DNS/domini personalizzati sono configurati correttamente

---

## Costi e Fatturazione

### D: Quanto costeranno i deployment azd?
**R**: I costi dipendono da:
- Servizi Azure distribuiti
- Tier/SKU selezionati
- Differenze di prezzo regionali
- Modelli di utilizzo

Usa il [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/) per stime.

### D: Come controllo i costi nei deployment azd?
**R**: 
1. Usa SKU di livello inferiore per ambienti di sviluppo
2. Configura budget e avvisi Azure
3. Usa `azd down` per rimuovere risorse non necessarie
4. Scegli regioni appropriate (i costi variano per località)
5. Usa strumenti di Azure Cost Management

### D: Esistono opzioni gratuite per i modelli azd?
**R**: Alcuni servizi hanno SKU gratuite o contributi mensili, soggetti a idoneità, piano di hosting, regione e limiti di abbonamento. Questi non rendono gratuito l'intero modello: database, ricerca, rete, registry, telemetria e inferenza del modello possono comportare costi indipendentemente. Controlla la [lista dei servizi gratuiti di Azure](https://azure.microsoft.com/free/) e i prezzi attuali di ogni risorsa prima del deployment.

### D: Come posso stimare i costi prima del deployment?
**R**: 
1. Esamina il `main.bicep` del modello per vedere quali risorse vengono create
2. Usa il Calcolatore dei Prezzi di Azure con SKU specifici
3. Esegui il deployment in un ambiente di sviluppo per monitorare i costi reali
4. Usa Azure Cost Management per un'analisi dettagliata dei costi

---

## Migliori Pratiche

### D: Quali sono le migliori pratiche per la struttura del progetto azd?
**R**: 
1. Mantieni il codice dell'applicazione separato dall'infrastruttura
2. Usa nomi significativi per i servizi in `azure.yaml`
3. Implementa una corretta gestione degli errori negli script di build
4. Usa configurazioni specifiche per ambiente
5. Includi una documentazione completa

### D: Come dovrei organizzare più servizi in azd?
**R**: Usa la struttura raccomandata:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### D: Devo includere la cartella `.azure` nel controllo versione?
**R**: **No!** La cartella `.azure` contiene informazioni sensibili. Aggiungila a `.gitignore`:
```gitignore
.azure/
```

### D: Come gestisco i segreti e la configurazione sensibile?
**R**: 
1. Usa Azure Key Vault per i segreti
2. Fai riferimento ai segreti di Key Vault nella configurazione dell'applicazione
3. Non includere mai i segreti nel controllo versione
4. Usa identità gestite per l'autenticazione tra servizi

### D: Qual è l'approccio raccomandato per CI/CD con azd?
**R**: 
1. Usa ambienti separati per ogni fase (dev/staging/prod)
2. Implementa test automatizzati prima del deployment
3. Usa service principal per l'autenticazione
4. Conserva la configurazione sensibile nei segreti/variabili della pipeline
5. Implementa approvazioni per i deployment in produzione

---

## Argomenti Avanzati

### D: Posso estendere azd con funzionalità personalizzate?
**R**: Sì, tramite hook di deployment in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### D: Come integro azd con processi DevOps esistenti?
**R**: 
1. Usa i comandi azd negli script della pipeline esistenti
2. Standardizza l'uso dei modelli azd fra i team
3. Integra con il monitoraggio e gli alert esistenti
4. Usa l'output JSON di azd per l'integrazione nella pipeline

### D: Posso usare azd con Azure DevOps?
**R**: Sì, azd funziona con qualsiasi sistema CI/CD. Crea pipeline Azure DevOps che usano i comandi azd.

### D: Come posso contribuire ad azd o creare modelli comunitari?
**R**: 
1. **Strumento azd**: Contribuisci a [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modelli**: Segui le [istruzioni per contributi alla galleria Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentazione**: Contribuisci ai documenti su [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### D: Qual è la roadmap di azd?
**R**: Consulta la [roadmap ufficiale](https://github.com/Azure/azure-dev/projects) per funzionalità e miglioramenti pianificati.

### D: Come migro da altri strumenti di deployment ad azd?
**R**: 
1. Analizza l'architettura di deployment attuale
2. Crea modelli Bicep equivalenti
3. Configura `azure.yaml` per corrispondere ai servizi attuali
4. Testa accuratamente in ambiente di sviluppo
5. Migra gradualmente gli ambienti

---

## Hai ancora domande?

### **Cerca prima**
- Consulta la [documentazione ufficiale](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Cerca tra le [issue di GitHub](https://github.com/Azure/azure-dev/issues) problemi simili

### **Ottieni aiuto**
- [Discussioni GitHub](https://github.com/Azure/azure-dev/discussions) - Supporto della comunità
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Domande tecniche
- [Azure Discord](https://discord.gg/azure) - Chat comunitaria in tempo reale

### **Segnala Problemi**
- [Issue di GitHub](https://github.com/Azure/azure-dev/issues/new) - Segnalazioni di bug e richieste di funzionalità
- Includi log rilevanti, messaggi di errore e passaggi per riprodurre il problema

### **Scopri di più**
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Indicazioni tecniche verificate: 4 novembre 2026. Disponibilità e prezzi cloud devono essere verificati in base al tuo abbonamento e regione.*

---

**Navigazione**
- **Lezione precedente**: [Glossario](glossary.md)
- **Lezione successiva**: [Guida allo studio](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->