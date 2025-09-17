<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a82d27b84022e9b7c7a163f99fa1fd25",
  "translation_date": "2025-09-17T21:47:17+00:00",
  "source_file": "resources/faq.md",
  "language_code": "it"
}
-->
# Domande Frequenti (FAQ)

**Ottieni Aiuto per Capitolo**
- **📚 Home del Corso**: [AZD Per Principianti](../README.md)
- **🚆 Problemi di Installazione**: [Capitolo 1: Installazione e Configurazione](../docs/getting-started/installation.md)
- **🤖 Domande sull'AI**: [Capitolo 2: Sviluppo AI-First](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Risoluzione dei Problemi**: [Capitolo 7: Risoluzione dei Problemi e Debug](../docs/troubleshooting/common-issues.md)

## Introduzione

Questa FAQ completa fornisce risposte alle domande più comuni su Azure Developer CLI (azd) e i deployment su Azure. Trova soluzioni rapide ai problemi più frequenti, comprendi le migliori pratiche e chiarisci i concetti e i flussi di lavoro di azd.

## Obiettivi di Apprendimento

Esaminando questa FAQ, potrai:
- Trovare risposte rapide alle domande e ai problemi comuni su Azure Developer CLI
- Comprendere i concetti chiave e la terminologia attraverso un formato pratico di domande e risposte
- Accedere a soluzioni di troubleshooting per problemi frequenti e scenari di errore
- Imparare le migliori pratiche attraverso domande comuni sull'ottimizzazione
- Scoprire funzionalità avanzate e capacità tramite domande di livello esperto
- Consultare in modo efficiente linee guida su costi, sicurezza e strategie di deployment

## Risultati di Apprendimento

Con un riferimento regolare a questa FAQ, sarai in grado di:
- Risolvere autonomamente i problemi comuni di Azure Developer CLI utilizzando le soluzioni fornite
- Prendere decisioni informate sulle strategie e configurazioni di deployment
- Comprendere la relazione tra azd e altri strumenti e servizi di Azure
- Applicare le migliori pratiche basate sull'esperienza della community e sulle raccomandazioni degli esperti
- Risolvere problemi di autenticazione, deployment e configurazione in modo efficace
- Ottimizzare costi e prestazioni utilizzando le intuizioni e le raccomandazioni della FAQ

## Indice

- [Introduzione](../../../resources)
- [Autenticazione e Accesso](../../../resources)
- [Template e Progetti](../../../resources)
- [Deployment e Infrastruttura](../../../resources)
- [Configurazione e Ambienti](../../../resources)
- [Risoluzione dei Problemi](../../../resources)
- [Costi e Fatturazione](../../../resources)
- [Migliori Pratiche](../../../resources)
- [Argomenti Avanzati](../../../resources)

---

## Introduzione

### D: Cos'è Azure Developer CLI (azd)?
**R**: Azure Developer CLI (azd) è uno strumento da riga di comando orientato agli sviluppatori che accelera il tempo necessario per portare la tua applicazione dall'ambiente di sviluppo locale ad Azure. Fornisce migliori pratiche attraverso template e aiuta con l'intero ciclo di vita del deployment.

### D: In cosa si differenzia azd da Azure CLI?
**R**: 
- **Azure CLI**: Strumento generico per la gestione delle risorse Azure
- **azd**: Strumento focalizzato sugli sviluppatori per i flussi di lavoro di deployment delle applicazioni
- azd utilizza Azure CLI internamente ma fornisce astrazioni di livello superiore per scenari di sviluppo comuni
- azd include template, gestione degli ambienti e automazione del deployment

### D: Devo avere Azure CLI installato per usare azd?
**R**: Sì, azd richiede Azure CLI per l'autenticazione e alcune operazioni. Installa prima Azure CLI, poi azd.

### D: Quali linguaggi di programmazione supporta azd?
**R**: azd è indipendente dal linguaggio. Funziona con:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Siti statici
- Applicazioni containerizzate

### D: Posso usare azd con progetti esistenti?
**R**: Sì! Puoi:
1. Usare `azd init` per aggiungere la configurazione azd a progetti esistenti
2. Adattare i progetti esistenti alla struttura dei template azd
3. Creare template personalizzati basati sulla tua architettura esistente

---

## Autenticazione e Accesso

### D: Come mi autentico con Azure usando azd?
**R**: Usa `azd auth login`, che aprirà una finestra del browser per l'autenticazione su Azure. Per scenari CI/CD, utilizza service principal o identità gestite.

### D: Posso usare azd con più sottoscrizioni Azure?
**R**: Sì. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` per specificare quale sottoscrizione utilizzare per ogni ambiente.

### D: Quali permessi sono necessari per il deployment con azd?
**R**: Tipicamente hai bisogno di:
- Ruolo **Contributor** sul gruppo di risorse o sulla sottoscrizione
- **User Access Administrator** se stai distribuendo risorse che richiedono assegnazioni di ruolo
- I permessi specifici variano in base al template e alle risorse distribuite

### D: Posso usare azd nei pipeline CI/CD?
**R**: Assolutamente! azd è progettato per l'integrazione CI/CD. Usa service principal per l'autenticazione e imposta variabili di ambiente per la configurazione.

### D: Come gestisco l'autenticazione in GitHub Actions?
**R**: Usa l'azione Azure Login con le credenziali del service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Template e Progetti

### D: Dove posso trovare i template azd?
**R**: 
- Template ufficiali: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Template della community: Cerca su GitHub "azd-template"
- Usa `azd template list` per sfogliare i template disponibili

### D: Come creo un template personalizzato?
**R**: 
1. Parti dalla struttura di un template esistente
2. Modifica `azure.yaml`, i file di infrastruttura e il codice dell'applicazione
3. Testa accuratamente con `azd up`
4. Pubblica su GitHub con i tag appropriati

### D: Posso usare azd senza un template?
**R**: Sì, usa `azd init` in un progetto esistente per creare i file di configurazione necessari. Dovrai configurare manualmente `azure.yaml` e i file di infrastruttura.

### D: Qual è la differenza tra template ufficiali e della community?
**R**: 
- **Template ufficiali**: Mantenuti da Microsoft, aggiornati regolarmente, documentazione completa
- **Template della community**: Creati da sviluppatori, possono avere casi d'uso specializzati, qualità e manutenzione variabili

### D: Come aggiorno un template nel mio progetto?
**R**: I template non vengono aggiornati automaticamente. Puoi:
1. Confrontare e unire manualmente le modifiche dal template sorgente
2. Iniziare da zero con `azd init` utilizzando il template aggiornato
3. Integrare miglioramenti specifici dai template aggiornati

---

## Deployment e Infrastruttura

### D: Quali servizi Azure può distribuire azd?
**R**: azd può distribuire qualsiasi servizio Azure tramite template Bicep/ARM, inclusi:
- App Services, Container Apps, Functions
- Database (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Risorse di rete, sicurezza e monitoraggio

### D: Posso distribuire in più regioni?
**R**: Sì, configura più regioni nei tuoi template Bicep e imposta il parametro di posizione in modo appropriato per ogni ambiente.

### D: Come gestisco le migrazioni dello schema del database?
**R**: Usa i deployment hook in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### D: Posso distribuire solo l'infrastruttura senza applicazioni?
**R**: Sì, usa `azd provision` per distribuire solo i componenti di infrastruttura definiti nei tuoi template.

### D: Come distribuisco su risorse Azure esistenti?
**R**: Questo è complesso e non direttamente supportato. Puoi:
1. Importare risorse esistenti nei tuoi template Bicep
2. Usare riferimenti a risorse esistenti nei template
3. Modificare i template per creare o fare riferimento alle risorse in modo condizionale

### D: Posso usare Terraform invece di Bicep?
**R**: Attualmente, azd supporta principalmente template Bicep/ARM. Il supporto per Terraform non è ufficialmente disponibile, anche se potrebbero esistere soluzioni della community.

---

## Configurazione e Ambienti

### D: Come gestisco ambienti diversi (dev, staging, prod)?
**R**: Crea ambienti separati con `azd env new <environment-name>` e configura impostazioni diverse per ciascuno:
```bash
azd env new development
azd env new staging  
azd env new production
```

### D: Dove sono memorizzate le configurazioni degli ambienti?
**R**: Nella cartella `.azure` all'interno della directory del tuo progetto. Ogni ambiente ha la propria cartella con file di configurazione.

### D: Come imposto configurazioni specifiche per ambiente?
**R**: Usa `azd env set` per configurare le variabili di ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### D: Posso condividere configurazioni di ambiente tra i membri del team?
**R**: La cartella `.azure` contiene informazioni sensibili e non dovrebbe essere inclusa nel controllo di versione. Invece:
1. Documenta le variabili di ambiente richieste
2. Usa script di deployment per configurare gli ambienti
3. Usa Azure Key Vault per configurazioni sensibili

### D: Come sovrascrivo i valori predefiniti del template?
**R**: Imposta variabili di ambiente che corrispondono ai parametri del template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Risoluzione dei Problemi

### D: Perché `azd up` fallisce?
**R**: Cause comuni:
1. **Problemi di autenticazione**: Esegui `azd auth login`
2. **Permessi insufficienti**: Controlla le assegnazioni di ruolo su Azure
3. **Conflitti nei nomi delle risorse**: Cambia AZURE_ENV_NAME
4. **Problemi di quota/capacità**: Controlla la disponibilità regionale
5. **Errori nei template**: Valida i template Bicep

### D: Come debuggo i fallimenti del deployment?
**R**: 
1. Usa `azd deploy --debug` per output dettagliato
2. Controlla la cronologia dei deployment nel portale Azure
3. Esamina il Log Attività nel portale Azure
4. Usa `azd show` per visualizzare lo stato corrente dell'ambiente

### D: Perché le mie variabili di ambiente non funzionano?
**R**: Controlla:
1. I nomi delle variabili corrispondono esattamente ai parametri del template
2. I valori sono correttamente quotati se contengono spazi
3. L'ambiente è selezionato: `azd env select <environment>`
4. Le variabili sono impostate nell'ambiente corretto

### D: Come pulisco deployment falliti?
**R**: 
```bash
azd down --force --purge
```
Questo rimuove tutte le risorse e la configurazione dell'ambiente.

### D: Perché la mia applicazione non è accessibile dopo il deployment?
**R**: Controlla:
1. Il deployment è stato completato con successo
2. L'applicazione è in esecuzione (controlla i log nel portale Azure)
3. I gruppi di sicurezza di rete consentono il traffico
4. DNS/domini personalizzati sono configurati correttamente

---

## Costi e Fatturazione

### D: Quanto costeranno i deployment azd?
**R**: I costi dipendono da:
- Servizi Azure distribuiti
- Livelli/SKU dei servizi selezionati
- Differenze di prezzo regionali
- Modelli di utilizzo

Usa il [Calcolatore Prezzi di Azure](https://azure.microsoft.com/pricing/calculator/) per stime.

### D: Come controllo i costi nei deployment azd?
**R**: 
1. Usa SKU di livello inferiore per ambienti di sviluppo
2. Configura budget e avvisi su Azure
3. Usa `azd down` per rimuovere le risorse quando non necessarie
4. Scegli regioni appropriate (i costi variano in base alla posizione)
5. Usa gli strumenti di gestione dei costi di Azure

### D: Esistono opzioni gratuite per i template azd?
**R**: Molti servizi Azure offrono livelli gratuiti:
- App Service: Disponibile il livello gratuito
- Azure Functions: 1M esecuzioni gratuite/mese
- Cosmos DB: Livello gratuito con 400 RU/s
- Application Insights: Primi 5GB/mese gratuiti

Configura i template per utilizzare i livelli gratuiti dove disponibili.

### D: Come stimo i costi prima del deployment?
**R**: 
1. Esamina il `main.bicep` del template per vedere quali risorse vengono create
2. Usa il Calcolatore Prezzi di Azure con SKU specifici
3. Distribuisci in un ambiente di sviluppo per monitorare i costi effettivi
4. Usa Azure Cost Management per un'analisi dettagliata dei costi

---

## Migliori Pratiche

### D: Quali sono le migliori pratiche per la struttura dei progetti azd?
**R**: 
1. Mantieni separati il codice dell'applicazione e l'infrastruttura
2. Usa nomi significativi per i servizi in `azure.yaml`
3. Implementa una gestione degli errori adeguata negli script di build
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

### D: Devo includere la cartella `.azure` nel controllo di versione?
**R**: **No!** La cartella `.azure` contiene informazioni sensibili. Aggiungila a `.gitignore`:
```gitignore
.azure/
```

### D: Come gestisco segreti e configurazioni sensibili?
**R**: 
1. Usa Azure Key Vault per i segreti
2. Riferisci i segreti di Key Vault nella configurazione dell'applicazione
3. Non includere mai segreti nel controllo di versione
4. Usa identità gestite per l'autenticazione tra servizi

### D: Qual è l'approccio raccomandato per CI/CD con azd?
**R**: 
1. Usa ambienti separati per ogni fase (dev/staging/prod)
2. Implementa test automatici prima del deployment
3. Usa service principal per l'autenticazione
4. Memorizza configurazioni sensibili nei segreti/variabili del pipeline
5. Implementa gate di approvazione per i deployment in produzione

---

## Argomenti Avanzati

### D: Posso estendere azd con funzionalità personalizzate?
**R**: Sì, tramite deployment hook in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### D: Come integro azd con processi DevOps esistenti?
**R**: 
1. Usa i comandi azd negli script dei pipeline esistenti
2. Standardizza i template azd tra i team
3. Integra con il monitoraggio e gli avvisi esistenti
4. Usa l'output JSON di azd per l'integrazione nei pipeline

### D: Posso usare azd con Azure DevOps?
**R**: Sì, azd funziona con qualsiasi sistema CI/CD. Crea pipeline di Azure DevOps che utilizzano i comandi azd.

### D: Come contribuisco a azd o creo template per la community?
**R**: 
1. **Strumento azd**: Contribuisci a [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modelli**: Crea modelli seguendo le [linee guida sui modelli](https://github.com/Azure-Samples/awesome-azd)  
3. **Documentazione**: Contribuisci alla documentazione su [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### D: Qual è la roadmap per azd?  
**R**: Consulta la [roadmap ufficiale](https://github.com/Azure/azure-dev/projects) per le funzionalità e i miglioramenti pianificati.  

### D: Come posso migrare da altri strumenti di distribuzione ad azd?  
**R**:  
1. Analizza l'architettura di distribuzione attuale  
2. Crea modelli Bicep equivalenti  
3. Configura `azure.yaml` per allinearlo ai servizi attuali  
4. Esegui test approfonditi nell'ambiente di sviluppo  
5. Migra gradualmente gli ambienti  

---

## Hai ancora domande?  

### **Cerca prima**  
- Consulta la [documentazione ufficiale](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Cerca nei [problemi su GitHub](https://github.com/Azure/azure-dev/issues) per problemi simili  

### **Ottieni supporto**  
- [Discussioni su GitHub](https://github.com/Azure/azure-dev/discussions) - Supporto dalla community  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Domande tecniche  
- [Azure Discord](https://discord.gg/azure) - Chat in tempo reale con la community  

### **Segnala problemi**  
- [Problemi su GitHub](https://github.com/Azure/azure-dev/issues/new) - Segnalazioni di bug e richieste di funzionalità  
- Includi log pertinenti, messaggi di errore e passaggi per riprodurre il problema  

### **Scopri di più**  
- [Documentazione di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Questa FAQ viene aggiornata regolarmente. Ultimo aggiornamento: 9 settembre 2025*  

---

**Navigazione**  
- **Lezione precedente**: [Glossario](glossary.md)  
- **Lezione successiva**: [Guida allo studio](study-guide.md)  

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.