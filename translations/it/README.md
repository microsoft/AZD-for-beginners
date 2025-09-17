<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T21:33:45+00:00",
  "source_file": "README.md",
  "language_code": "it"
}
-->
# AZD Per Principianti: Un Percorso di Apprendimento Strutturato

![AZD-per-principianti](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.it.png) 

## Introduzione a Questo Corso

Segui questi passaggi per iniziare il tuo percorso di apprendimento su AZD:

1. **Fork del Repository**: Clicca [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clona il Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Unisciti alla Community**: [Comunità Discord di Azure](https://discord.com/invite/ByRwuEEgH4) per supporto esperto
4. **Scegli il Tuo Percorso di Apprendimento**: Seleziona un capitolo qui sotto in base al tuo livello di esperienza

### Supporto Multilingue

#### Traduzioni Automatiche (Sempre Aggiornate)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](./README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Panoramica del Corso

Apprendi l'Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Focus speciale sul deployment di applicazioni AI con l'integrazione di Azure AI Foundry.**

### Perché Questo Corso è Essenziale per gli Sviluppatori Moderni

Basato sugli approfondimenti della community Discord di Azure AI Foundry, **il 45% degli sviluppatori vuole utilizzare AZD per carichi di lavoro AI** ma incontra difficoltà con:
- Architetture AI multi-servizio complesse
- Best practice per il deployment AI in produzione  
- Integrazione e configurazione dei servizi Azure AI
- Ottimizzazione dei costi per carichi di lavoro AI
- Risoluzione di problemi specifici del deployment AI

### Obiettivi di Apprendimento

Completando questo corso strutturato, sarai in grado di:
- **Dominare i Fondamenti di AZD**: Concetti base, installazione e configurazione
- **Deployare Applicazioni AI**: Utilizzare AZD con i servizi di Azure AI Foundry
- **Implementare Infrastructure as Code**: Gestire risorse Azure con template Bicep
- **Risoluzione dei Problemi di Deployment**: Risolvere problemi comuni e debug
- **Ottimizzare per la Produzione**: Sicurezza, scalabilità, monitoraggio e gestione dei costi
- **Costruire Soluzioni Multi-Agent**: Deployare architetture AI complesse

## 📚 Capitoli di Apprendimento

*Scegli il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenti & Avvio Rapido
**Prerequisiti**: Abbonamento Azure, conoscenze di base della riga di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa Imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- Il tuo primo deployment di successo

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Cos'è Azure Developer CLI?](../..)
- **📖 Teoria**: [Fondamenti di AZD](docs/getting-started/azd-basics.md) - Concetti e terminologia principali
- **⚙️ Configurazione**: [Installazione & Configurazione](docs/getting-started/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratica**: [Il Tuo Primo Progetto](docs/getting-started/first-project.md) - Tutorial passo-passo
- **📋 Riferimento Rapido**: [Cheat Sheet dei Comandi](resources/cheat-sheet.md)

#### Esercizi Pratici
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Risultato del Capitolo**: Deployare con successo una semplice applicazione web su Azure utilizzando AZD

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per Sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Integrazione di Azure AI Foundry con AZD
- Deployare applicazioni potenziate dall'AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Integrazione di Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Modelli**: [Deployment di Modelli AI](docs/ai-foundry/ai-model-deployment.md) - Deploy e gestione di modelli AI
- **🛠️ Workshop**: [Laboratorio AI Workshop](docs/ai-foundry/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
- **📋 Template**: [Template di Azure AI Foundry](../..)

#### Esercizi Pratici
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Risultato del Capitolo**: Deployare e configurare un'applicazione chat potenziata dall'AI con capacità RAG

---

### ⚙️ Capitolo 3: Configurazione & Autenticazione
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 45-60 minuti  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Configurazione e gestione degli ambienti
- Best practice per autenticazione e sicurezza
- Nomenclatura e organizzazione delle risorse

#### Risorse di Apprendimento
- **📖 Configurazione**: [Guida alla Configurazione](docs/getting-started/configuration.md) - Setup degli ambienti
- **🔐 Sicurezza**: Pattern di autenticazione e identità gestita
- **📝 Esempi**: [Esempio di App Database](../../examples/database-app) - Pattern di configurazione

#### Esercizi Pratici
- Configurare ambienti multipli (dev, staging, prod)
- Configurare autenticazione con identità gestita
- Implementare configurazioni specifiche per ambiente

**💡 Risultato del Capitolo**: Gestire ambienti multipli con autenticazione e sicurezza adeguate

---

### 🏗️ Capitolo 4: Infrastructure as Code & Deployment
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa Imparerai
- Pattern avanzati di deployment
- Infrastructure as Code con Bicep
- Strategie di provisioning delle risorse

#### Risorse di Apprendimento
- **📖 Deployment**: [Guida al Deployment](docs/deployment/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning delle Risorse](docs/deployment/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Esempio di App Container](../../examples/container-app) - Deployment containerizzato

#### Esercizi Pratici
- Creare template Bicep personalizzati
- Deployare applicazioni multi-servizio
- Implementare strategie di deployment blue-green

**💡 Risultato del Capitolo**: Deployare applicazioni multi-servizio complesse utilizzando template di infrastruttura personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agent (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Pattern di architettura multi-agent
- Orchestrazione e coordinamento degli agenti
- Deployment AI pronto per la produzione

#### Risorse di Apprendimento
- **🤖 Progetto in Evidenza**: [Soluzione Multi-Agent per il Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Template ARM**: [Pacchetto Template ARM](../../examples/retail-multiagent-arm-template) - Deployment con un clic
- **📖 Architettura**: Pattern di coordinamento multi-agent

#### Esercizi Pratici
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del Capitolo**: Deployare e gestire una soluzione AI multi-agent pronta per la produzione con agenti Cliente e Inventario

---

### 🔍 Capitolo 6: Validazione & Pianificazione Pre-Deployment
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione SKU
- Controlli preliminari e automazione

#### Risorse di Apprendimento
- **📊 Pianificazione**: [Pianificazione della Capacità](docs/pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [Selezione SKU](docs/pre-deployment/sku-selection.md) - Scelte economiche
- **✅ Validazione**: [Controlli Preliminari](docs/pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi Pratici
- Eseguire script di validazione della capacità
- Ottimizzare le selezioni SKU per i costi
- Implementare controlli pre-deployment automatizzati

**💡 Risultato del Capitolo**: Validare e ottimizzare i deployment prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei Problemi & Debugging
**Prerequisiti**: Qualsiasi capitolo di deployment completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione di problemi specifici dell'AI

#### Risorse di Apprendimento
- **🔧 Problemi Comuni**: [Problemi Comuni](docs/troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione Problemi AI](docs/troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi Pratici
- Diagnosticare fallimenti di deployment
- Risolvere problemi di autenticazione
- Debuggare la connettività dei servizi AI

**💡 Risultato del Capitolo**: Diagnosticare e risolvere autonomamente problemi comuni di deployment

---

### 🏢 Capitolo 8: Pattern di Produzione & Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Strategie di deployment in produzione
- Pattern di sicurezza per l'enterprise
- Monitoraggio e ottimizzazione dei costi

#### Risorse di Apprendimento
- **🏭 Produzione**: [Best Practice AI per la Produzione](docs/ai-foundry/production-ai-practices.md) - Pattern per l'enterprise
- **📝 Esempi**: [Esempio Microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: Integrazione con Application Insights

#### Esercizi Pratici
- Implementare modelli di sicurezza aziendale
- Configurare un monitoraggio completo
- Distribuire in produzione con una governance adeguata

**💡 Obiettivo del Capitolo**: Distribuire applicazioni pronte per l'azienda con capacità complete di produzione

---

## 📖 Cos'è Azure Developer CLI?

Azure Developer CLI (azd) è un'interfaccia a riga di comando orientata agli sviluppatori che accelera il processo di creazione e distribuzione di applicazioni su Azure. Offre:

- **Distribuzioni basate su template** - Utilizza template predefiniti per modelli di applicazioni comuni
- **Infrastructure as Code** - Gestisci le risorse Azure utilizzando Bicep o Terraform  
- **Workflow integrati** - Provisioning, distribuzione e monitoraggio delle applicazioni senza interruzioni
- **Ottimizzato per gli sviluppatori** - Progettato per massimizzare la produttività e l'esperienza degli sviluppatori

### **AZD + Azure AI Foundry: Perfetto per le Distribuzioni AI**

**Perché AZD per le soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Template pronti per l'AI** - Template preconfigurati per Azure OpenAI, Cognitive Services e carichi di lavoro ML
- **Distribuzioni AI sicure** - Modelli di sicurezza integrati per servizi AI, chiavi API e endpoint dei modelli  
- **Modelli AI per la produzione** - Best practice per distribuzioni di applicazioni AI scalabili ed economiche
- **Workflow AI end-to-end** - Dallo sviluppo del modello alla distribuzione in produzione con monitoraggio adeguato
- **Ottimizzazione dei costi** - Strategie intelligenti di allocazione e scalabilità delle risorse per carichi di lavoro AI
- **Integrazione con Azure AI Foundry** - Connessione fluida al catalogo dei modelli e agli endpoint di AI Foundry

---

## 🎯 Libreria di Template ed Esempi

### In evidenza: Template di Azure AI Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

| Template | Capitolo | Complessità | Servizi |
|----------|---------|------------|----------|
| [**Inizia con AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automazione di workflow multi-agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Genera documenti dai tuoi dati**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Migliora le riunioni con i clienti con agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernizza il tuo codice con agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Crea il tuo agente conversazionale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Sblocca insight dai dati conversazionali**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Elaborazione di contenuti multi-modale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### In evidenza: Scenari di apprendimento completi
**Template di applicazioni pronte per la produzione mappati ai capitoli di apprendimento**

| Template | Capitolo di Apprendimento | Complessità | Apprendimento Chiave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Modelli di distribuzione AI di base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione di Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework per agenti e chiamata di funzioni |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI aziendale |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Cliente e Inventario |

### Apprendimento per tipo di esempio

#### Applicazioni semplici (Capitoli 1-2)
- [Applicazione Web Semplice](../../examples/simple-web-app) - Modelli di distribuzione di base
- [Sito Statico](../../examples/static-site) - Distribuzione di contenuti statici
- [API di base](../../examples/basic-api) - Distribuzione di API REST

#### Integrazione con database (Capitolo 3-4)  
- [Applicazione Database](../../examples/database-app) - Modelli di connettività con database
- [Elaborazione Dati](../../examples/data-processing) - Distribuzione di workflow ETL

#### Modelli avanzati (Capitoli 4-8)
- [Container Apps](../../examples/container-app) - Distribuzioni containerizzate
- [Microservizi](../../examples/microservices) - Architetture multi-servizio  
- [Soluzioni aziendali](../../examples/enterprise) - Modelli pronti per la produzione

### Collezioni di template esterni
- [**Template AZD di Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - Esempi ufficiali di Microsoft
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Template contribuiti dalla comunità
- [**Directory degli esempi**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di Apprendimento e Riferimenti

### Riferimenti Rapidi
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Comandi essenziali di azd organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia di Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida di Studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop Pratici
- [**Laboratorio Workshop AI**](docs/ai-foundry/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD
- [**Workshop AZD per Principianti**](workshop/README.md) - Materiali completi per workshop pratici

### Risorse di Apprendimento Esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato di Azure](https://status.azure.com/)

---

## 🎓 Completamento del Corso e Certificazione

### Tracciamento del Progresso
Traccia il tuo progresso di apprendimento attraverso ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti e Avvio Rapido ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione e Autenticazione ✅
- [ ] **Capitolo 4**: Infrastructure as Code e Distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI Multi-Agente ✅
- [ ] **Capitolo 6**: Validazione e Pianificazione Pre-Distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione dei Problemi e Debugging ✅
- [ ] **Capitolo 8**: Modelli di Produzione e Aziendali ✅

### Verifica dell'Apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze:
1. **Esercizio Pratico**: Completa la distribuzione pratica del capitolo
2. **Controllo delle Conoscenze**: Rivedi la sezione FAQ del capitolo
3. **Discussione Comunitaria**: Condividi la tua esperienza su Discord di Azure
4. **Prossimo Capitolo**: Passa al livello di complessità successivo

### Benefici del Completamento del Corso
Al termine di tutti i capitoli, avrai:
- **Esperienza di Produzione**: Applicazioni AI reali distribuite su Azure
- **Competenze Professionali**: Capacità di distribuzione pronte per l'azienda  
- **Riconoscimento Comunitario**: Membro attivo della comunità degli sviluppatori Azure
- **Avanzamento di Carriera**: Competenze richieste per AZD e distribuzioni AI

---

## 🤝 Comunità e Supporto

### Ottieni Aiuto e Supporto
- **Problemi Tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande di Apprendimento**: [Comunità Discord di Microsoft Azure](https://discord.gg/microsoft-azure)
- **Aiuto Specifico per AI**: Unisciti al [canale #Azure](https://discord.gg/microsoft-azure) per discussioni su AZD + AI Foundry
- **Documentazione**: [Documentazione ufficiale di Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insight dalla Comunità su Discord di Azure AI Foundry

**Risultati recenti del sondaggio nel canale #Azure:**
- **45%** degli sviluppatori vuole utilizzare AZD per carichi di lavoro AI
- **Sfide principali**: Distribuzioni multi-servizio, gestione delle credenziali, prontezza per la produzione  
- **Richieste più frequenti**: Template specifici per AI, guide per la risoluzione dei problemi, best practice

**Unisciti alla nostra comunità per:**
- Condividere le tue esperienze con AZD + AI e ottenere supporto
- Accedere alle anteprime dei nuovi template AI
- Contribuire alle best practice per le distribuzioni AI
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al Corso
Accogliamo con favore i contributi! Leggi la nostra [Guida ai Contributi](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti ai Contenuti**: Migliora i capitoli e gli esempi esistenti
- **Nuovi Esempi**: Aggiungi scenari e template reali  
- **Traduzioni**: Aiuta a mantenere il supporto multilingue
- **Segnalazione di Bug**: Migliora accuratezza e chiarezza
- **Standard Comunitari**: Segui le nostre linee guida inclusive

---

## 📄 Informazioni sul Corso

### Licenza
Questo progetto è concesso sotto licenza MIT - consulta il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse di Apprendimento Microsoft Correlate

Il nostro team produce altri corsi di apprendimento completi:

- [**NUOVO** Protocollo di Contesto del Modello (MCP) per Principianti](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Agenti AI per Principianti](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI per Principianti con .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI per Principianti](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI per Principianti con Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML per Principianti](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science per Principianti](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI per Principianti](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity per Principianti](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev per Principianti](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT per Principianti](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Sviluppo XR per Principianti](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot per Programmazione AI in Coppia](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot per Sviluppatori C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Scegli la tua Avventura con Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Navigazione del Corso

**🚀 Pronto per iniziare a imparare?**

**Principianti**: Inizia con [Capitolo 1: Fondamenti e Avvio Rapido](../..)  
**Sviluppatori AI**: Vai direttamente a [Capitolo 2: Sviluppo AI-First](../..)
**Sviluppatori Esperti**: Inizia con [Capitolo 3: Configurazione e Autenticazione](../..)

**Prossimi Passi**: [Inizia il Capitolo 1 - Fondamenti di AZD](docs/getting-started/azd-basics.md) →

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.