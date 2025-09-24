<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3df05e83c2307e92452bd7c3307ae849",
  "translation_date": "2025-09-24T14:38:52+00:00",
  "source_file": "README.md",
  "language_code": "it"
}
-->
# AZD Per Principianti: Un Percorso di Apprendimento Strutturato

![AZD-per-principianti](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.it.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## Iniziare con Questo Corso

Segui questi passaggi per iniziare il tuo percorso di apprendimento AZD:

1. **Fork del Repository**: Clicca [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clona il Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Unisciti alla Community**: [Comunità Discord di Azure](https://discord.com/invite/ByRwuEEgH4) per supporto da esperti
4. **Scegli il Tuo Percorso di Apprendimento**: Seleziona un capitolo qui sotto in base al tuo livello di esperienza

### Supporto Multilingue

#### Traduzioni Automatiche (Sempre Aggiornate)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](./README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Panoramica del Corso

Impara a padroneggiare Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Focus speciale sul deployment di applicazioni AI con integrazione di Azure AI Foundry.**

### Perché Questo Corso è Essenziale per gli Sviluppatori Moderni

Basato sugli approfondimenti della community Discord di Azure AI Foundry, **il 45% degli sviluppatori vuole utilizzare AZD per carichi di lavoro AI** ma incontra difficoltà con:
- Architetture AI multi-servizio complesse
- Best practice per il deployment AI in produzione  
- Integrazione e configurazione dei servizi Azure AI
- Ottimizzazione dei costi per carichi di lavoro AI
- Risoluzione dei problemi specifici del deployment AI

### Obiettivi di Apprendimento

Completando questo corso strutturato, sarai in grado di:
- **Padroneggiare i Fondamenti di AZD**: Concetti di base, installazione e configurazione
- **Deployare Applicazioni AI**: Utilizzare AZD con i servizi di Azure AI Foundry
- **Implementare Infrastructure as Code**: Gestire le risorse Azure con template Bicep
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
- **📖 Teoria**: [Fondamenti di AZD](docs/getting-started/azd-basics.md) - Concetti e terminologia di base
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
- Deployare applicazioni basate su AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Integrazione di Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Modelli**: [Deployment di Modelli AI](docs/ai-foundry/ai-model-deployment.md) - Deploy e gestione di modelli AI
- **🛠️ Workshop**: [Laboratorio AI Workshop](docs/ai-foundry/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
- **🎥 Guida Interattiva**: [Materiali del Workshop](workshop/README.md) - Apprendimento basato su browser con MkDocs * DevContainer Environment
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

**💡 Risultato del Capitolo**: Deployare e configurare un'applicazione chat basata su AI con capacità RAG

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
- **📝 Esempi**: [Esempio di App Container](../../examples/container-app) - Deployment containerizzati

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
- Implementare controlli preliminari automatizzati

**💡 Risultato del Capitolo**: Validare e ottimizzare i deployment prima dell'esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei Problemi & Debugging
**Prerequisiti**: Qualsiasi capitolo di deployment completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione dei problemi specifici per AI

#### Risorse di Apprendimento
- **🔧 Problemi Comuni**: [Problemi Comuni](docs/troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione dei Problemi AI](docs/troubleshooting/ai-troubleshooting.md) - Problemi con i servizi AI

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

**💡 Risultato del Capitolo**: Distribuire applicazioni pronte per l'azienda con capacità complete di produzione

---

## 🎓 Panoramica del Workshop: Esperienza di Apprendimento Pratica

### Materiali Interattivi del Workshop
**Apprendimento pratico completo con strumenti basati su browser ed esercizi guidati**

I materiali del workshop offrono un'esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra. Il workshop è progettato sia per l'apprendimento autonomo che per sessioni guidate da istruttori.

#### 🛠️ Caratteristiche del Workshop
- **Interfaccia Basata su Browser**: Workshop completo alimentato da MkDocs con funzionalità di ricerca, copia e temi
- **Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di Apprendimento Strutturato**: Esercizi guidati in 7 fasi (3,5 ore totali)
- **Scoperta → Distribuzione → Personalizzazione**: Metodologia progressiva
- **Ambiente DevContainer Interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura del Workshop
Il workshop segue una metodologia **Scoperta → Distribuzione → Personalizzazione**:

1. **Fase di Scoperta** (45 minuti)
   - Esplorare i modelli e i servizi di Azure AI Foundry
   - Comprendere i modelli di architettura multi-agente
   - Esaminare i requisiti e le precondizioni per la distribuzione

2. **Fase di Distribuzione** (2 ore)
   - Distribuzione pratica di applicazioni AI con AZD
   - Configurare i servizi e gli endpoint di Azure AI
   - Implementare modelli di sicurezza e autenticazione

3. **Fase di Personalizzazione** (45 minuti)
   - Modificare le applicazioni per casi d'uso specifici
   - Ottimizzare per la distribuzione in produzione
   - Implementare monitoraggio e gestione dei costi

#### 🚀 Iniziare con il Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Risultati di Apprendimento del Workshop
Completando il workshop, i partecipanti saranno in grado di:
- **Distribuire Applicazioni AI in Produzione**: Utilizzare AZD con i servizi di Azure AI Foundry
- **Padroneggiare Architetture Multi-Agente**: Implementare soluzioni coordinate con agenti AI
- **Implementare le Migliori Pratiche di Sicurezza**: Configurare autenticazione e controllo degli accessi
- **Ottimizzare per la Scalabilità**: Progettare distribuzioni performanti e convenienti
- **Risoluzione dei Problemi**: Risolvere autonomamente problemi comuni di distribuzione

#### 📖 Risorse del Workshop
- **🎥 Guida Interattiva**: [Materiali del Workshop](workshop/README.md) - Ambiente di apprendimento basato su browser
- **📋 Istruzioni Passo-Passo**: [Esercizi Guidati](../../workshop/docs/instructions) - Procedure dettagliate
- **🛠️ Laboratorio AI Workshop**: [Laboratorio AI Workshop](docs/ai-foundry/ai-workshop-lab.md) - Esercizi focalizzati sull'AI
- **💡 Guida Rapida**: [Guida alla Configurazione del Workshop](workshop/README.md#quick-start) - Configurazione dell'ambiente

**Ideale per**: Formazione aziendale, corsi universitari, apprendimento autonomo e bootcamp per sviluppatori.

---

## 📖 Cos'è Azure Developer CLI?

Azure Developer CLI (azd) è un'interfaccia a riga di comando orientata agli sviluppatori che accelera il processo di creazione e distribuzione di applicazioni su Azure. Offre:

- **Distribuzioni basate su modelli** - Utilizza modelli predefiniti per modelli di applicazione comuni
- **Infrastruttura come Codice** - Gestisci le risorse Azure utilizzando Bicep o Terraform  
- **Flussi di lavoro integrati** - Provisioning, distribuzione e monitoraggio delle applicazioni senza interruzioni
- **Ottimizzato per gli sviluppatori** - Progettato per la produttività e l'esperienza degli sviluppatori

### **AZD + Azure AI Foundry: Perfetto per le Distribuzioni AI**

**Perché AZD per le Soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Modelli Pronti per l'AI** - Modelli preconfigurati per Azure OpenAI, Cognitive Services e carichi di lavoro ML
- **Distribuzioni AI Sicure** - Modelli di sicurezza integrati per servizi AI, chiavi API e endpoint dei modelli  
- **Modelli AI per la Produzione** - Migliori pratiche per distribuzioni di applicazioni AI scalabili e convenienti
- **Flussi di Lavoro AI End-to-End** - Dallo sviluppo del modello alla distribuzione in produzione con monitoraggio adeguato
- **Ottimizzazione dei Costi** - Strategie intelligenti di allocazione delle risorse e scalabilità per carichi di lavoro AI
- **Integrazione con Azure AI Foundry** - Connessione senza interruzioni al catalogo dei modelli e agli endpoint di AI Foundry

---

## 🎯 Libreria di Modelli ed Esempi

### In Evidenza: Modelli di Azure AI Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

| Modello | Capitolo | Complessità | Servizi |
|---------|----------|-------------|---------|
| [**Inizia con AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + API di Inferenza Modelli Azure AI + Azure AI Search + Azure Container Apps + Application Insights |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Servizio Agenti Azure AI + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automazione del flusso di lavoro multi-agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Servizio Agenti Azure AI + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Genera documenti dai tuoi dati**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Servizi Azure AI + Azure CosmosDB|
| [**Migliora le riunioni con i clienti con agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Database SQL Azure |
| [**Modernizza il tuo codice con agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Servizio Agenti Azure + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Crea il tuo agente conversazionale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Sblocca informazioni dai dati conversazionali**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Servizio Agenti Azure + Comprensione Contenuti AI|
| [**Elaborazione di contenuti multi-modale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + Comprensione Contenuti Azure + Azure CosmosDB + Azure Container Apps|

### In Evidenza: Scenari di Apprendimento Completi
**Modelli di applicazioni pronte per la produzione mappati ai capitoli di apprendimento**

| Modello | Capitolo di Apprendimento | Complessità | Apprendimento Chiave |
|---------|---------------------------|-------------|-----------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Modelli di distribuzione AI di base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework per agenti e chiamata di funzioni |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI aziendale |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Cliente e Inventario |

### Apprendimento per Tipo di Esempio

#### Applicazioni Semplici (Capitoli 1-2)
- [Applicazione Web Semplice](../../examples/simple-web-app) - Modelli di distribuzione di base
- [Sito Statico](../../examples/static-site) - Distribuzione di contenuti statici
- [API di Base](../../examples/basic-api) - Distribuzione di API REST

#### Integrazione con Database (Capitoli 3-4)  
- [Applicazione Database](../../examples/database-app) - Modelli di connettività con database
- [Elaborazione Dati](../../examples/data-processing) - Distribuzione di flussi di lavoro ETL

#### Modelli Avanzati (Capitoli 4-8)
- [Applicazioni Container](../../examples/container-app) - Distribuzioni containerizzate
- [Microservizi](../../examples/microservices) - Architetture multi-servizio  
- [Soluzioni Aziendali](../../examples/enterprise) - Modelli pronti per la produzione

### Collezioni di Modelli Esterni
- [**Modelli AZD di Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - Esempi ufficiali di Microsoft
- [**Galleria Awesome AZD**](https://azure.github.io/awesome-azd/) - Modelli contribuiti dalla comunità
- [**Directory degli Esempi**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di Apprendimento e Riferimenti

### Riferimenti Rapidi
- [**Foglio di Comando**](resources/cheat-sheet.md) - Comandi essenziali azd organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia di Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida allo Studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop Pratici
- [**Laboratorio AI Workshop**](docs/ai-foundry/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Guida Interattiva al Workshop**](workshop/README.md) - Workshop basato su browser con MkDocs e Ambiente DevContainer
- [**Percorso di Apprendimento Strutturato**](../../workshop/docs/instructions) - Esercizi guidati in 7 fasi (Scoperta → Distribuzione → Personalizzazione)
- [**Workshop AZD per Principianti**](workshop/README.md) - Materiali completi per workshop pratici con integrazione GitHub Codespaces

### Risorse di Apprendimento Esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato Azure](https://status.azure.com/)

---

## 🎓 Completamento del Corso e Certificazione

### Monitoraggio del Progresso
Monitora il tuo progresso di apprendimento attraverso ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti e Guida Rapida ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione e Autenticazione ✅
- [ ] **Capitolo 4**: Infrastruttura come Codice e Distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI Multi-Agente ✅
- [ ] **Capitolo 6**: Validazione e Pianificazione Pre-Distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione dei Problemi e Debugging ✅
- [ ] **Capitolo 8**: Modelli di Produzione e Aziendali ✅

### Verifica dell'Apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio Pratico**: Completa la distribuzione pratica del capitolo
2. **Verifica delle Conoscenze**: Rivedi la sezione FAQ del capitolo
3. **Discussione Comunitaria**: Condividi la tua esperienza su Discord Azure
4. **Capitolo Successivo**: Passa al livello di complessità successivo

### Benefici del Completamento del Corso
Completando tutti i capitoli, otterrai:
- **Esperienza di Produzione**: Applicazioni AI reali distribuite su Azure
- **Competenze Professionali**: Capacità di distribuzione pronte per l'azienda  
- **Riconoscimento Comunitario**: Membro attivo della comunità degli sviluppatori Azure
- **Avanzamento di Carriera**: Competenze richieste per AZD e distribuzione AI

---

## 🤝 Comunità e Supporto

### Ottenere Aiuto e Supporto
- **Problemi Tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande di Apprendimento**: [Comunità Discord Microsoft Azure](https://discord.gg/microsoft-azure)
- **Aiuto Specifico per AI**: Unisciti al [canale #Azure](https://discord.gg/microsoft-azure) per discussioni su AZD + AI Foundry
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti dalla Comunità Discord di Azure AI Foundry

**Risultati Recenti del Sondaggio nel Canale #Azure:**
- **45%** degli sviluppatori vuole utilizzare AZD per carichi di lavoro AI
- **Sfide principali**: Distribuzioni multi-servizio, gestione delle credenziali, prontezza per la produzione  
- **Richieste più frequenti**: Modelli specifici per AI, guide per la risoluzione dei problemi, migliori pratiche

**Unisciti alla nostra comunità per:**
- Condividere le tue esperienze con AZD + AI e ottenere aiuto
- Accedere alle anteprime dei nuovi modelli AI
- Contribuire alle migliori pratiche di distribuzione AI
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al Corso
Accogliamo con favore i contributi! Leggi la nostra [Guida ai Contributi](CONTRIBUTING.md) per dettagli su:
- **Miglioramenti ai Contenuti**: Migliora i capitoli e gli esempi esistenti
- **Nuovi Esempi**: Aggiungi scenari e modelli reali  
- **Traduzioni**: Aiuta a mantenere il supporto multilingue
- **Segnalazione di Bug**: Migliora accuratezza e chiarezza
- **Standard Comunitari**: Segui le nostre linee guida per una comunità inclusiva

---

## 📄 Informazioni sul Corso

### Licenza
Questo progetto è concesso sotto licenza MIT - consulta il file [LICENSE](../../LICENSE) per i dettagli.
### Risorse Microsoft Learning Correlate

Il nostro team produce altri corsi di apprendimento completi:

- [Model Context Protocol (MCP) Per Principianti](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Agenti AI per Principianti](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Generativa per Principianti con .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [AI Generativa per Principianti](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Generativa per Principianti con Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML per Principianti](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science per Principianti](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI per Principianti](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity per Principianti](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Sviluppo Web per Principianti](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT per Principianti](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Sviluppo XR per Principianti](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Padroneggiare GitHub Copilot per la Programmazione Assistita da AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Padroneggiare GitHub Copilot per Sviluppatori C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Scegli la Tua Avventura con Copilot](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Navigazione del Corso

**🚀 Pronto per Iniziare a Imparare?**

**Principianti**: Inizia con [Capitolo 1: Fondamenti & Avvio Rapido](../..)  
**Sviluppatori AI**: Vai direttamente al [Capitolo 2: Sviluppo AI-First](../..)  
**Sviluppatori Esperti**: Inizia con [Capitolo 3: Configurazione & Autenticazione](../..)

**Prossimi Passi**: [Inizia il Capitolo 1 - Nozioni di Base su AZD](docs/getting-started/azd-basics.md) →

---

