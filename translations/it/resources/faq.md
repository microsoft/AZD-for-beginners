# Domande Frequenti (FAQ)

**Ottieni aiuto per capitolo**
- **📚 Home del corso**: [AZD per principianti](../README.md)
- **🚆 Problemi di installazione**: [Capitolo 1: Installazione e configurazione](../docs/getting-started/installation.md)
- **🤖 Domande sull'IA**: [Capitolo 2: Sviluppo incentrato sull'IA](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Risoluzione dei problemi**: [Capitolo 7: Risoluzione dei problemi e debugging](../docs/troubleshooting/common-issues.md)

## Introduzione

Questa FAQ completa fornisce risposte alle domande più comuni relative ad Azure Developer CLI (azd) e alle distribuzioni su Azure. Trova soluzioni rapide ai problemi comuni, comprendi le migliori pratiche e ottieni chiarimenti sui concetti e i flussi di lavoro di azd.

## Obiettivi di apprendimento

Rivedendo questa FAQ, potrai:
- Trovare risposte rapide a domande e problemi comuni relativi ad Azure Developer CLI
- Comprendere i concetti chiave e la terminologia attraverso un formato pratico di domande e risposte
- Accedere a soluzioni di troubleshooting per problemi ed errori frequenti
- Conoscere le migliori pratiche tramite domande comuni sull'ottimizzazione
- Scoprire funzionalità avanzate e capacità tramite domande di livello esperto
- Consultare rapidamente indicazioni su costi, sicurezza e strategie di distribuzione

## Risultati di apprendimento

Consultando regolarmente questa FAQ, sarai in grado di:
- Risolvere in modo autonomo i problemi comuni di Azure Developer CLI utilizzando le soluzioni fornite
- Prendere decisioni informate sulle strategie e configurazioni di distribuzione
- Comprendere la relazione tra azd e altri strumenti e servizi Azure
- Applicare le migliori pratiche basate sull'esperienza della community e sulle raccomandazioni degli esperti
- Effettuare il troubleshooting di autenticazione, distribuzione e problemi di configurazione in modo efficace
- Ottimizzare costi e prestazioni usando gli approfondimenti e i consigli presenti nella FAQ

## Indice

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### Q: What is Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) è uno strumento a riga di comando pensato per gli sviluppatori che accelera il tempo necessario per portare la tua applicazione dall'ambiente di sviluppo locale ad Azure. Fornisce best practice tramite template e aiuta in tutto il ciclo di vita della distribuzione.

### Q: How is azd different from Azure CLI?
**A**: 
- **Azure CLI**: Strumento di uso generale per la gestione delle risorse Azure
- **azd**: Strumento focalizzato sugli sviluppatori per i flussi di lavoro di distribuzione delle applicazioni
- azd utilizza internamente Azure CLI ma fornisce astrazioni di livello superiore per scenari di sviluppo comuni
- azd include template, gestione degli ambienti e automazione della distribuzione

### Q: Do I need Azure CLI installed to use azd?
**A**: Sì, azd richiede Azure CLI per l'autenticazione e alcune operazioni. Installa prima Azure CLI, quindi azd.

### Q: What programming languages does azd support?
**A**: azd è agnostico rispetto al linguaggio. Funziona con:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Siti statici
- Applicazioni containerizzate

### Q: Can I use azd with existing projects?
**A**: Sì! Puoi:
1. Usare `azd init` per aggiungere la configurazione azd a progetti esistenti
2. Adattare progetti esistenti per corrispondere alla struttura dei template azd
3. Creare template personalizzati basati sulla tua architettura esistente

---

## Authentication & Access

### Q: How do I authenticate with Azure using azd?
**A**: Usa `azd auth login` che aprirà una finestra del browser per l'autenticazione Azure. Per scenari CI/CD, usa service principal o managed identities.

### Q: Can I use azd with multiple Azure subscriptions?
**A**: Sì. Usa `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` per specificare quale sottoscrizione utilizzare per ogni ambiente.

### Q: What permissions do I need to deploy with azd?
**A**: Tipicamente hai bisogno di:
- Ruolo **Contributor** sul gruppo di risorse o sulla sottoscrizione
- **User Access Administrator** se distribuisci risorse che richiedono assegnazioni di ruolo
- I permessi specifici variano in base al template e alle risorse distribuite

### Q: Can I use azd in CI/CD pipelines?
**A**: Assolutamente! azd è progettato per l'integrazione CI/CD. Usa service principal per l'autenticazione e imposta variabili d'ambiente per la configurazione.

### Q: How do I handle authentication in GitHub Actions?
**A**: Usa l'azione Azure Login con le credenziali del service principal:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### Q: Where can I find azd templates?
**A**: 
- Template ufficiali: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Template della community: ricerca su GitHub per "azd-template"
- Usa `azd template list` per sfogliare i template disponibili

### Q: How do I create a custom template?
**A**: 
1. Parti da una struttura di template esistente
2. Modifica `azure.yaml`, i file dell'infrastruttura e il codice dell'applicazione
3. Testa accuratamente con `azd up`
4. Pubblica su GitHub con i tag appropriati

### Q: Can I use azd without a template?
**A**: Sì, usa `azd init` in un progetto esistente per creare i file di configurazione necessari. Dovrai configurare manualmente `azure.yaml` e i file dell'infrastruttura.

### Q: What's the difference between official and community templates?
**A**: 
- **Template ufficiali**: Mantenuti da Microsoft, aggiornati regolarmente, documentazione completa
- **Template della community**: Creati da sviluppatori, possono avere casi d'uso specializzati, qualità e manutenzione variabili

### Q: How do I update a template in my project?
**A**: I template non vengono aggiornati automaticamente. Puoi:
1. Confrontare manualmente e unire le modifiche dal template sorgente
2. Ripartire con `azd init` usando il template aggiornato
3. Selezionare specifici miglioramenti dai template aggiornati

---

## Deployment & Infrastructure

### Q: What Azure services can azd deploy?
**A**: azd può distribuire qualsiasi servizio Azure tramite template Bicep/ARM, inclusi:
- App Services, Container Apps, Functions
- Database (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, sicurezza e risorse di monitoraggio

### Q: Can I deploy to multiple regions?
**A**: Sì, configura più regioni nei tuoi template Bicep e imposta opportunamente il parametro location per ogni ambiente.

### Q: How do I handle database schema migrations?
**A**: Usa i deployment hook in `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Can I deploy only infrastructure without applications?
**A**: Sì, usa `azd provision` per distribuire solo i componenti infrastrutturali definiti nei tuoi template.

### Q: How do I deploy to existing Azure resources?
**A**: Questo è complesso e non è supportato direttamente. Puoi:
1. Importare le risorse esistenti nei tuoi template Bicep
2. Usare riferimenti a risorse esistenti nei template
3. Modificare i template per creare condizionalmente o fare riferimento alle risorse

### Q: Can I use Terraform instead of Bicep?
**A**: Attualmente, azd supporta principalmente template Bicep/ARM. Il supporto ufficiale per Terraform non è disponibile, anche se possono esistere soluzioni della community.

---

## Configuration & Environments

### Q: How do I manage different environments (dev, staging, prod)?
**A**: Crea ambienti separati con `azd env new <environment-name>` e configura impostazioni diverse per ciascuno:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Where are environment configurations stored?
**A**: Nella cartella `.azure` all'interno della directory del progetto. Ogni ambiente ha la propria cartella con file di configurazione.

### Q: How do I set environment-specific configuration?
**A**: Usa `azd env set` per configurare variabili d'ambiente:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Can I share environment configurations across team members?
**A**: La cartella `.azure` contiene informazioni sensibili e non dovrebbe essere commessa al controllo di versione. Invece:
1. Documenta le variabili d'ambiente richieste
2. Usa script di deployment per configurare gli ambienti
3. Usa Azure Key Vault per la configurazione sensibile

### Q: How do I override template defaults?
**A**: Imposta variabili d'ambiente che corrispondono ai parametri del template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### Q: Why is `azd up` failing?
**A**: Cause comuni:
1. **Problemi di autenticazione**: Esegui `azd auth login`
2. **Permessi insufficienti**: Controlla le assegnazioni di ruolo in Azure
3. **Conflitti nei nomi delle risorse**: Cambia AZURE_ENV_NAME
4. **Limiti/quota**: Controlla la disponibilità regionale
5. **Errori nei template**: Valida i template Bicep

### Q: How do I debug deployment failures?
**A**: 
1. Usa `azd deploy --debug` per output dettagliato
2. Controlla la cronologia delle distribuzioni nel portale Azure
3. Revisiona il registro attività (Activity Log) nel portale Azure
4. Usa `azd show` per visualizzare lo stato attuale dell'ambiente

### Q: Why are my environment variables not working?
**A**: Controlla:
1. I nomi delle variabili corrispondono esattamente ai parametri del template
2. I valori sono correttamente quotati se contengono spazi
3. L'ambiente è selezionato: `azd env select <environment>`
4. Le variabili sono impostate nell'ambiente corretto

### Q: How do I clean up failed deployments?
**A**: 
```bash
azd down --force --purge
```
This removes all resources and environment configuration.

### Q: Why is my application not accessible after deployment?
**A**: Controlla:
1. La distribuzione è stata completata con successo
2. L'applicazione è in esecuzione (controlla i log nel portale Azure)
3. I network security group consentono il traffico
4. DNS/domini personalizzati sono configurati correttamente

---

## Cost & Billing

### Q: How much will azd deployments cost?
**A**: I costi dipendono da:
- Servizi Azure distribuiti
- Tier/SKU dei servizi selezionati
- Differenze di prezzo regionali
- Pattern di utilizzo

Usa il [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) per le stime.

### Q: How do I control costs in azd deployments?
**A**: 
1. Usa SKU di livello inferiore per gli ambienti di sviluppo
2. Configura budget e avvisi in Azure
3. Usa `azd down` per rimuovere le risorse quando non necessarie
4. Scegli regioni appropriate (i costi variano per località)
5. Usa gli strumenti di Azure Cost Management

### Q: Are there free tier options for azd templates?
**A**: Molti servizi Azure offrono tier gratuiti:
- App Service: tier gratuito disponibile
- Azure Functions: 1M di esecuzioni gratuite al mese
- Cosmos DB: tier gratuito con 400 RU/s
- Application Insights: primi 5GB/mese gratuiti

Configura i template per usare i tier gratuiti dove disponibili.

### Q: How do I estimate costs before deployment?
**A**: 
1. Revisiona il `main.bicep` del template per vedere quali risorse vengono create
2. Usa Azure Pricing Calculator con SKU specifici
3. Distribuisci prima in un ambiente di sviluppo per monitorare i costi reali
4. Usa Azure Cost Management per analisi dettagliate dei costi

---

## Best Practices

### Q: What are the best practices for azd project structure?
**A**: 
1. Mantieni il codice dell'applicazione separato dall'infrastruttura
2. Usa nomi di servizio significativi in `azure.yaml`
3. Implementa una corretta gestione degli errori negli script di build
4. Usa configurazione specifica per ambiente
5. Includi documentazione esaustiva

### Q: How should I organize multiple services in azd?
**A**: Usa la struttura raccomandata:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Should I commit the `.azure` folder to version control?
**A**: **No!** La cartella `.azure` contiene informazioni sensibili. Aggiungila a `.gitignore`:
```gitignore
.azure/
```

### Q: How do I handle secrets and sensitive configuration?
**A**: 
1. Usa Azure Key Vault per i segreti
2. Fai riferimento ai segreti di Key Vault nella configurazione dell'applicazione
3. Non commettere mai segreti nel controllo di versione
4. Usa managed identities per l'autenticazione tra servizi

### Q: What's the recommended approach for CI/CD with azd?
**A**: 
1. Usa ambienti separati per ogni fase (dev/staging/prod)
2. Implementa test automatici prima della distribuzione
3. Usa service principal per l'autenticazione
4. Conserva la configurazione sensibile nei segreti/variabili della pipeline
5. Implementa gate di approvazione per le distribuzioni in produzione

---

## Advanced Topics

### Q: Can I extend azd with custom functionality?
**A**: Sì, attraverso i deployment hook in `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: How do I integrate azd with existing DevOps processes?
**A**: 
1. Usa i comandi azd negli script di pipeline esistenti
2. Standardizza i template azd tra i team
3. Integra con il monitoring e gli alert esistenti
4. Usa l'output JSON di azd per l'integrazione nelle pipeline

### Q: Can I use azd with Azure DevOps?
**A**: Sì, azd funziona con qualsiasi sistema CI/CD. Crea pipeline Azure DevOps che usano i comandi azd.

### Q: How do I contribute to azd or create community templates?
**A**:
1. **strumento azd**: Contribuisci a [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modelli**: Crea modelli seguendo le [template guidelines](https://github.com/Azure-Samples/awesome-azd)
3. **Documentazione**: Contribuisci alla documentazione su [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Qual è la roadmap per azd?
**A**: Consulta la [official roadmap](https://github.com/Azure/azure-dev/projects) per funzionalità e miglioramenti pianificati.

### Q: Come posso migrare da altri deployment tools a azd?
**A**: 
1. Analizza l'architettura di distribuzione corrente
2. Crea modelli Bicep equivalenti
3. Configura `azure.yaml` per corrispondere ai servizi attuali
4. Esegui test approfonditi in ambiente di sviluppo
5. Migra gradualmente gli ambienti

---

## Hai ancora domande?

### **Cerca prima**
- Consulta la [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Cerca nelle [GitHub issues](https://github.com/Azure/azure-dev/issues) per problemi simili

### **Ottieni aiuto**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Supporto della community
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Domande tecniche
- [Azure Discord](https://discord.gg/azure) - Chat comunitaria in tempo reale

### **Segnala problemi**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Segnalazioni di bug e richieste di funzionalità
- Includi i log rilevanti, i messaggi di errore e i passaggi per riprodurre

### **Per saperne di più**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Questa FAQ viene aggiornata regolarmente. Ultimo aggiornamento: 9 settembre 2025*

---

**Navigazione**
- **Lezione precedente**: [Glossary](glossary.md)
- **Lezione successiva**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica con intelligenza artificiale [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci adoperiamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali fraintendimenti o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->