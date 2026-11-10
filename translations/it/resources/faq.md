# Domande Frequenti (FAQ)

**Ottieni Aiuto per Capitolo**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **🚆 Problemi di Installazione**: [Capitolo 1: Installazione & Configurazione](../docs/chapter-01-foundation/installation.md)
- **🤖 Domande sull'IA**: [Capitolo 2: Sviluppo AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Risoluzione Problemi**: [Capitolo 7: Risoluzione Problemi & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduzione

Questa completa FAQ fornisce risposte alle domande più comuni su Azure Developer CLI (azd) e sulle distribuzioni Azure. Trova soluzioni rapide ai problemi comuni, comprendi le migliori pratiche e ottieni chiarimenti sui concetti e flussi di lavoro azd.

## Obiettivi di apprendimento

Esaminando questa FAQ, potrai:
- Trovare risposte rapide alle domande e problemi comuni di Azure Developer CLI
- Comprendere concetti chiave e terminologia tramite domande e risposte pratiche
- Accedere a soluzioni di troubleshooting per problemi e scenari di errore frequenti
- Apprendere le migliori pratiche attraverso domande frequenti sull'ottimizzazione
- Scoprire funzionalità avanzate e capacità tramite domande di livello esperto
- Fare riferimento in modo efficiente a linee guida su costi, sicurezza e strategie di distribuzione

## Risultati di apprendimento

Con riferimenti regolari a questa FAQ, sarai in grado di:
- Risolvere autonomamente problemi comuni di Azure Developer CLI usando le soluzioni fornite
- Prendere decisioni informate su strategie e configurazioni di distribuzione
- Comprendere la relazione tra azd e altri strumenti e servizi Azure
- Applicare le migliori pratiche basate sull'esperienza della community e raccomandazioni di esperti
- Risolvere efficacemente problemi di autenticazione, distribuzione e configurazione
- Ottimizzare costi e prestazioni usando intuizioni e raccomandazioni dalle FAQ

## Indice

- [Prima di Iniziare](#getting-started)
- [Autenticazione & Accesso](#authentication--access)
- [Template & Progetti](#templates--projects)
- [Distribuzione & Infrastruttura](#deployment--infrastructure)
- [Configurazione & Ambiente](#configuration--environments)
- [Risoluzione Problemi](#troubleshooting)
- [Costi & Fatturazione](#cost--billing)
- [Best Practices](#best-practices)
- [Argomenti Avanzati](#advanced-topics)

---

## Prima di Iniziare

### D: Cos’è Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) è uno strumento da riga di comando incentrato sullo sviluppatore che accelera il tempo necessario per portare un'applicazione dall'ambiente di sviluppo locale ad Azure. Fornisce best practice tramite template e aiuta con l'intero ciclo di vita di distribuzione.

### D: In cosa si differenzia azd da Azure CLI?
**R**: 
- **Azure CLI**: Strumento generico per la gestione delle risorse Azure
- **azd**: Strumento focalizzato sullo sviluppatore per i flussi di lavoro di distribuzione applicativa
- azd ha un proprio flusso di autenticazione e distribuzione; Azure CLI è uno strumento separato e complementare
- azd include template, gestione ambienti e automazione della distribuzione

### D: Devo avere Azure CLI installato per usare azd?
**R**: Non per il flusso principale di AZD. Autenticati con `azd auth login`. Installa Azure CLI separatamente quando un hook di un template o un esercizio eseguono esplicitamente comandi `az`.

### D: Quali linguaggi di programmazione supporta azd?
**R**: azd è agnostico rispetto al linguaggio. Funziona con:
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
1. Usare `azd init` per aggiungere configurazione azd a progetti esistenti
2. Adattare progetti esistenti per corrispondere alla struttura del template azd
3. Creare template personalizzati basati sulla tua architettura esistente

---

## Autenticazione & Accesso

### D: Come mi autentico con Azure usando azd?
**R**: Usa `azd auth login` che aprirà una finestra del browser per l'autenticazione Azure. Per scenari CI/CD, usa service principal o managed identity.

### D: Posso usare azd con più sottoscrizioni Azure?
**R**: Sì. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` per specificare quale sottoscrizione usare per ogni ambiente.

### D: Quali permessi servono per distribuire con azd?
**R**: Tipicamente servono:
- ruolo **Contributor** sul gruppo risorse o sottoscrizione
- ruolo **User Access Administrator** se si distribuiscono risorse che richiedono assegnazioni di ruolo
- Permessi specifici variano in base al template e alle risorse distribuite

### D: Posso usare azd nelle pipeline CI/CD?
**R**: Assolutamente! azd è progettato per integrazione CI/CD. Usa service principal per l'autenticazione e imposta variabili d'ambiente per la configurazione.

### D: Come gestisco l'autenticazione in GitHub Actions?
**R**: Preferisci workload identity federation (OIDC), configurata con `azd pipeline config`. Il workflow generato installa AZD e autentica AZD direttamente con un'identità federata. Un solo step `azure/login` non stabilisce un login AZD. Uno step di login in un job esistente è:
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

Procedi a provisionare o distribuire dopo il login, con ambiente AZD, sottoscrizione e località configurati correttamente. La credenziale federata dell'identità deve affidare il repository/ref del workflow o l'ambiente GitHub, e i ruoli Azure devono consentire le operazioni richieste.

---

## Template & Progetti

### D: Dove trovo i template azd?
**R**: 
- Template ufficiali e della community: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Template community: ricerca GitHub per "azd-template"
- Usa `azd template list` per sfogliare i template disponibili

### D: Come creo un template personalizzato?
**R**: 
1. Parti da una struttura template esistente
2. Modifica `azure.yaml`, file infrastruttura e codice applicazione
3. Testa a fondo con `azd up`
4. Pubblica su GitHub con tag appropriati

### D: Posso usare azd senza un template?
**R**: Sì, usa `azd init` in un progetto esistente per creare i file configurazione necessari. Sarà necessario configurare manualmente `azure.yaml` e file infrastruttura.

### D: Qual è la differenza tra template ufficiali e community?
**R**: 
- **Template ufficiali**: mantenuti da Microsoft, aggiornati regolarmente, documentazione completa
- **Template community**: creati da sviluppatori, possono avere casi d’uso specializzati, qualità e manutenzione variabili

### D: Come aggiorno un template nel mio progetto?
**R**: I template non si aggiornano automaticamente. Puoi:
1. Confrontare e unire manualmente cambiamenti dal template di origine
2. Partire da zero con `azd init` usando il template aggiornato
3. Selezionare specifici miglioramenti dai template aggiornati

---

## Distribuzione & Infrastruttura

### D: Quali servizi Azure può distribuire azd?
**R**: azd può distribuire qualsiasi servizio Azure tramite template Bicep/ARM, includendo:
- App Services, Container Apps, Functions
- Database (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Rete, sicurezza e risorse di monitoraggio

### D: Posso distribuire in più regioni?
**R**: Sì, configura più regioni nei tuoi template Bicep e imposta il parametro location opportunamente per ogni ambiente.

### D: Come gestisco le migrazioni dello schema del database?
**R**: Usa hook di deploy in `azure.yaml`:
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
**R**: Sì, quando il template lo supporta. Fai riferimento a risorse esistenti con dichiarazioni `existing` di Bicep o con i parametri template per risorse esistenti documentati e mappa i servizi applicativi ai loro target previsti. Questo non importa ownership né crea automaticamente permessi mancanti. Rivedi il template prima di distribuire.

### D: Posso usare Terraform invece di Bicep?
**R**: Sì. AZD supporta sia Terraform che Bicep. Seleziona un template basato su Terraform o configura `infra.provider: terraform` in `azure.yaml`, con file e configurazione state/backend Terraform appropriata. Vedi il [flusso di lavoro Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configurazione & Ambiente

### D: Come gestisco ambienti differenti (dev, staging, prod)?
**R**: Crea ambienti separati con `azd env new <environment-name>` e configura impostazioni diverse per ciascuno:
```bash
azd env new development
azd env new staging  
azd env new production
```

### D: Dove sono memorizzate le configurazioni ambiente?
**R**: Nella cartella `.azure` all’interno della directory progetto. Ogni ambiente ha la propria cartella con file di configurazione.

### D: Come imposto configurazioni specifiche per ambiente?
**R**: Usa `azd env set` per configurare variabili d’ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### D: Posso condividere configurazioni ambiente tra membri del team?
**R**: La cartella `.azure` contiene informazioni sensibili e non dovrebbe essere sottoposta a controllo versione. Invece:
1. Documenta le variabili ambiente richieste
2. Usa script di distribuzione per configurare gli ambienti
3. Usa Azure Key Vault per configurazioni sensibili

### D: Come sovrascrivo i valori di default del template?
**R**: Imposta variabili ambiente corrispondenti ai parametri del template:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Solo le variabili utilizzate dal template influenzano la distribuzione. `SKU_NAME` sopra è un esempio di input personalizzato, non una configurazione AZD universale.

---

## Risoluzione Problemi

### D: Perché `azd up` fallisce?
**R**: Cause comuni:
1. **Problemi di autenticazione**: Esegui `azd auth login`
2. **Permessi insufficienti**: Controlla le assegnazioni di ruolo Azure
3. **Conflitti nome risorsa**: Rivedi la risorsa in conflitto e gli input del template; crea un ambiente separato con `azd env new` quando serve isolamento
4. **Problemi di quota/capacità**: Controlla la disponibilità regionale
5. **Errori nel template**: Valida i template Bicep

### D: Come debuggo fallimenti di distribuzione?
**R**: 
1. Usa `azd deploy --debug` per output dettagliato
2. Controlla la cronologia distribuzioni nel portale Azure
3. Rivedi il Log Attività nel portale Azure
4. Usa `azd show` per visualizzare lo stato ambiente corrente

### D: Perché le mie variabili d’ambiente non funzionano?
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
Rivedi prima la selezione dell’ambiente e conferma l'eliminazione. Questo cancella risorse Azure provisionate, non la configurazione dell’ambiente `.azure` locale. `--purge` richiede anche la cancellazione permanente di risorse supp. soft-eliminate e può essere bloccato da protezione retention/purge; non è una routine di recupero.

### D: Perché la mia applicazione non è accessibile dopo la distribuzione?
**R**: Controlla:
1. Distribuzione completata con successo
2. Applicazione in esecuzione (controlla i log nel portale Azure)
3. I gruppi di sicurezza di rete permettono il traffico
4. DNS/domini personalizzati configurati correttamente

---

## Costi & Fatturazione

### D: Quanto costeranno le distribuzioni azd?
**R**: I costi dipendono da:
- Servizi Azure distribuiti
- Tier/SKU dei servizi scelti
- Differenze di prezzo regionali
- Modelli di utilizzo

Usa il [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/) per stime.

### D: Come controllo i costi nelle distribuzioni azd?
**R**: 
1. Usa SKU di livello inferiore per ambienti di sviluppo
2. Imposta budget e avvisi Azure
3. Usa `azd down` per rimuovere risorse quando non servono
4. Scegli regioni appropriate (i costi variano per località)
5. Usa strumenti Azure Cost Management

### D: Ci sono opzioni gratuite per i template azd?
**R**: Alcuni servizi hanno SKU gratuiti o concessioni mensili, soggette a idoneità, piano hosting, regione e limiti di sottoscrizione. Questi non rendono gratuito un intero template: database, ricerca, rete, registro, telemetria e inferenza modelli possono generare costi indipendenti. Verifica la [lista servizi gratuiti Azure](https://azure.microsoft.com/free/) e i prezzi correnti per ogni risorsa prima della distribuzione.

### D: Come stimo i costi prima della distribuzione?
**R**: 
1. Rivedi `main.bicep` del template per vedere quali risorse si creano
2. Usa il Calcolatore Prezzi Azure con SKU specifici
3. Distribuisci prima in ambiente di sviluppo per monitorare i costi reali
4. Usa Azure Cost Management per analisi dettagliate dei costi

---

## Best Practices

### D: Quali sono le best practice per la struttura del progetto azd?
**R**: 
1. Mantieni il codice applicativo separato dall’infrastruttura
2. Usa nomi di servizio significativi in `azure.yaml`
3. Implementa gestione errori appropriata negli script di build
4. Usa configurazioni specifiche per ambiente
5. Includi documentazione completa

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

### D: Devo committare la cartella `.azure` nel controllo versione?
**R**: **No!** La cartella `.azure` contiene informazioni sensibili. Aggiungila a `.gitignore`:
```gitignore
.azure/
```

### D: Come gestisco segreti e configurazioni sensibili?
**R**: 
1. Usa Azure Key Vault per i segreti
2. Fai riferimento ai segreti di Key Vault nella configurazione dell'applicazione
3. Non inserire mai segreti nel controllo versione
4. Usa identità gestite per l'autenticazione tra servizi

### D: Qual è l'approccio consigliato per CI/CD con azd?
**R**: 
1. Usa ambienti separati per ogni fase (dev/staging/prod)
2. Implementa test automatizzati prima del deployment
3. Usa service principal per l'autenticazione
4. Conserva la configurazione sensibile nei segreti/variabili della pipeline
5. Implementa gate di approvazione per i deployment in produzione

---

## Argomenti avanzati

### D: Posso estendere azd con funzionalità personalizzate?
**R**: Sì, tramite deployment hook in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### D: Come integro azd con i processi DevOps esistenti?
**R**: 
1. Usa i comandi azd negli script delle pipeline esistenti
2. Standardizza i template azd tra i team
3. Integra con il monitoraggio e gli allarmi esistenti
4. Usa l'output JSON di azd per l'integrazione nelle pipeline

### D: Posso usare azd con Azure DevOps?
**R**: Sì, azd funziona con qualsiasi sistema CI/CD. Crea pipeline Azure DevOps che usano comandi azd.

### D: Come posso contribuire ad azd o creare template comunitari?
**R**: 
1. **Strumento azd**: Contribuisci a [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Template**: Segui le [istruzioni per contribuire alla galleria Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentazione**: Contribuisci alla documentazione in [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### D: Qual è la roadmap di azd?
**R**: Consulta la [roadmap ufficiale](https://github.com/Azure/azure-dev/projects) per funzionalità e migliorie pianificate.

### D: Come migro da altri tool di deployment ad azd?
**R**: 
1. Analizza l'architettura di deployment attuale
2. Crea template Bicep equivalenti
3. Configura `azure.yaml` per corrispondere ai servizi attuali
4. Testa approfonditamente in ambiente di sviluppo
5. Migra gradualmente gli ambienti

---

## Hai ancora domande?

### **Cerca prima**
- Consulta la [documentazione ufficiale](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Cerca tra le [issue GitHub](https://github.com/Azure/azure-dev/issues) problemi simili

### **Chiedi aiuto**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Supporto comunitario
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Domande tecniche
- [Azure Discord](https://discord.gg/azure) - Chat comunitaria in tempo reale

### **Segnala problemi**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Segnalazioni bug e richieste funzionalità
- Includi log rilevanti, messaggi di errore e passi per riprodurre

### **Per saperne di più**
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Guida tecnica revisionata: 4 novembre 2026. La disponibilità cloud e i prezzi devono essere verificati per il tuo abbonamento e la tua area.*

---

**Navigazione**
- **Lezione precedente**: [Glossario](glossary.md)
- **Prossima lezione**: [Guida di studio](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->