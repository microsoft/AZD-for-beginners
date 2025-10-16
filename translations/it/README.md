<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T15:42:14+00:00",
  "source_file": "README.md",
  "language_code": "it"
}
-->
# AZD Per Principianti: Un Percorso di Apprendimento Strutturato

![AZD-per-principianti](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.it.png) 

## Introduzione a Questo Corso

Segui questi passaggi per iniziare il tuo percorso di apprendimento su AZD:

1. **Fai un Fork del Repository**: Clicca [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clona il Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Unisciti alla Community**: [Comunità Discord di Azure](https://discord.com/invite/ByRwuEEgH4) per supporto esperto
4. **Scegli il Tuo Percorso di Apprendimento**: Seleziona un capitolo qui sotto in base al tuo livello di esperienza

### Supporto Multilingue

#### Traduzioni Automatiche (Sempre Aggiornate)

[Italiano](./README.md) | [Francese](../fr/README.md) | [Spagnolo](../es/README.md) | [Tedesco](../de/README.md) | [Portoghese (Brasile)](../br/README.md) | [Cinese (Semplificato)](../zh/README.md) | [Giapponese](../ja/README.md) | [Coreano](../ko/README.md) | [Russo](../ru/README.md) | [Arabo](../ar/README.md)

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
- **Distribuire Applicazioni AI**: Utilizzare AZD con i servizi di Azure AI Foundry
- **Implementare Infrastructure as Code**: Gestire le risorse Azure con i template Bicep
- **Risoluzione dei Problemi di Deployment**: Risolvere problemi comuni e debug
- **Ottimizzare per la Produzione**: Sicurezza, scalabilità, monitoraggio e gestione dei costi
- **Costruire Soluzioni Multi-Agent**: Distribuire architetture AI complesse

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
- **📋 Riferimento Rapido**: [Scheda di Riferimento Comandi](resources/cheat-sheet.md)

#### Esercizi Pratici
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Risultato del Capitolo**: Distribuire con successo una semplice applicazione web su Azure utilizzando AZD

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per Sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Integrazione di Azure AI Foundry con AZD
- Distribuzione di applicazioni potenziate dall'AI
- Comprendere le configurazioni dei servizi AI

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Integrazione di Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Modelli**: [Deployment di Modelli AI](docs/ai-foundry/ai-model-deployment.md) - Distribuzione e gestione dei modelli AI
- **🛠️ Workshop**: [Laboratorio Workshop AI](docs/ai-foundry/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
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

**💡 Risultato del Capitolo**: Distribuire e configurare un'applicazione chat potenziata dall'AI con capacità RAG

---

### ⚙️ Capitolo 3: Configurazione & Autenticazione
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 45-60 minuti  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Configurazione e gestione dell'ambiente
- Best practice per autenticazione e sicurezza
- Nomenclatura e organizzazione delle risorse

#### Risorse di Apprendimento
- **📖 Configurazione**: [Guida alla Configurazione](docs/getting-started/configuration.md) - Configurazione dell'ambiente
- **🔐 Sicurezza**: Modelli di autenticazione e identità gestita
- **📝 Esempi**: [Esempio di App Database](../../examples/database-app) - Modelli di configurazione

#### Esercizi Pratici
- Configurare più ambienti (sviluppo, staging, produzione)
- Configurare l'autenticazione con identità gestita
- Implementare configurazioni specifiche per ambiente

**💡 Risultato del Capitolo**: Gestire più ambienti con autenticazione e sicurezza adeguate

---

### 🏗️ Capitolo 4: Infrastructure as Code & Deployment
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa Imparerai
- Modelli avanzati di deployment
- Infrastructure as Code con Bicep
- Strategie di provisioning delle risorse

#### Risorse di Apprendimento
- **📖 Deployment**: [Guida al Deployment](docs/deployment/deployment-guide.md) - Flussi di lavoro completi
- **🏗️ Provisioning**: [Provisioning delle Risorse](docs/deployment/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Esempio di App Container](../../examples/container-app) - Deployment containerizzato

#### Esercizi Pratici
- Creare template Bicep personalizzati
- Distribuire applicazioni multi-servizio
- Implementare strategie di deployment blue-green

**💡 Risultato del Capitolo**: Distribuire applicazioni multi-servizio complesse utilizzando template di infrastruttura personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agenti (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Modelli di architettura multi-agente
- Orchestrazione e coordinamento degli agenti
- Deployment AI pronto per la produzione

#### Risorse di Apprendimento
- **🤖 Progetto in Evidenza**: [Soluzione Multi-Agente per il Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Template ARM**: [Pacchetto Template ARM](../../examples/retail-multiagent-arm-template) - Deployment con un clic
- **📖 Architettura**: Modelli di coordinamento multi-agente

#### Esercizi Pratici
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del Capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti per Clienti e Inventario

---

### 🔍 Capitolo 6: Validazione & Pianificazione Pre-Deployment
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione delle SKU
- Controlli preliminari e automazione

#### Risorse di Apprendimento
- **📊 Pianificazione**: [Pianificazione della Capacità](docs/pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [Selezione delle SKU](docs/pre-deployment/sku-selection.md) - Scelte economiche
- **✅ Validazione**: [Controlli Preliminari](docs/pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi Pratici
- Eseguire script di validazione della capacità
- Ottimizzare le selezioni delle SKU per i costi
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
- Risoluzione dei problemi specifici dell'AI

#### Risorse di Apprendimento
- **🔧 Problemi Comuni**: [Problemi Comuni](docs/troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione dei Problemi AI](docs/troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi Pratici
- Diagnosticare i fallimenti di deployment
- Risolvere problemi di autenticazione
- Debug della connettività dei servizi AI

**💡 Risultato del Capitolo**: Diagnosticare e risolvere autonomamente problemi comuni di deployment

---

### 🏢 Capitolo 8: Modelli per la Produzione & Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  

**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Strategie di distribuzione in produzione
- Modelli di sicurezza aziendale
- Monitoraggio e ottimizzazione dei costi

#### Risorse di Apprendimento
- **🏭 Produzione**: [Best Practices per l'AI in Produzione](docs/ai-foundry/production-ai-practices.md) - Modelli aziendali
- **📝 Esempi**: [Esempio di Microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: Integrazione con Application Insights

#### Esercizi Pratici
- Implementare modelli di sicurezza aziendale
- Configurare un monitoraggio completo
- Distribuire in produzione con una governance adeguata

**💡 Risultato del Capitolo**: Distribuire applicazioni aziendali pronte per la produzione con tutte le funzionalità necessarie

---

## 🎓 Panoramica del Workshop: Esperienza di Apprendimento Pratica

### Materiali Interattivi del Workshop
**Apprendimento pratico completo con strumenti basati su browser ed esercizi guidati**

I materiali del workshop offrono un'esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra descritti. Il workshop è progettato sia per l'apprendimento autonomo che per sessioni guidate da istruttori.

#### 🛠️ Caratteristiche del Workshop
- **Interfaccia Basata su Browser**: Workshop completo alimentato da MkDocs con funzioni di ricerca, copia e temi
- **Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di Apprendimento Strutturato**: 7 esercizi guidati (3,5 ore totali)
- **Scoperta → Distribuzione → Personalizzazione**: Metodologia progressiva
- **Ambiente Interattivo DevContainer**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura del Workshop
Il workshop segue una metodologia **Scoperta → Distribuzione → Personalizzazione**:

1. **Fase di Scoperta** (45 minuti)
   - Esplora i modelli e i servizi di Azure AI Foundry
   - Comprendi i modelli di architettura multi-agente
   - Rivedi i requisiti e le precondizioni per la distribuzione

2. **Fase di Distribuzione** (2 ore)
   - Distribuzione pratica di applicazioni AI con AZD
   - Configura i servizi e gli endpoint di Azure AI
   - Implementa modelli di sicurezza e autenticazione

3. **Fase di Personalizzazione** (45 minuti)
   - Modifica le applicazioni per casi d'uso specifici
   - Ottimizza per la distribuzione in produzione
   - Implementa monitoraggio e gestione dei costi

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
- **Risolvere Problemi di Distribuzione**: Gestire autonomamente problemi comuni

#### 📖 Risorse del Workshop
- **🎥 Guida Interattiva**: [Materiali del Workshop](workshop/README.md) - Ambiente di apprendimento basato su browser
- **📋 Istruzioni Passo-Passo**: [Esercizi Guidati](../../workshop/docs/instructions) - Procedure dettagliate
- **🛠️ Laboratorio AI Workshop**: [Laboratorio AI Workshop](docs/ai-foundry/ai-workshop-lab.md) - Esercizi focalizzati sull'AI
- **💡 Guida Rapida**: [Guida alla Configurazione del Workshop](workshop/README.md#quick-start) - Configurazione dell'ambiente

**Ideale per**: Formazione aziendale, corsi universitari, apprendimento autonomo e bootcamp per sviluppatori.

---

## 📖 Cos'è Azure Developer CLI?

Azure Developer CLI (azd) è un'interfaccia a riga di comando orientata agli sviluppatori che accelera il processo di creazione e distribuzione di applicazioni su Azure. Offre:

- **Distribuzioni basate su modelli** - Utilizzo di modelli predefiniti per modelli di applicazione comuni
- **Infrastruttura come Codice** - Gestione delle risorse Azure con Bicep o Terraform  
- **Flussi di lavoro integrati** - Provisioning, distribuzione e monitoraggio delle applicazioni senza interruzioni
- **Ottimizzato per gli sviluppatori** - Progettato per la produttività e l'esperienza degli sviluppatori

### **AZD + Azure AI Foundry: Perfetto per le Distribuzioni AI**

**Perché AZD per le Soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Modelli Pronti per l'AI** - Modelli preconfigurati per Azure OpenAI, Cognitive Services e carichi di lavoro ML
- **Distribuzioni AI Sicure** - Modelli di sicurezza integrati per servizi AI, chiavi API e endpoint dei modelli  
- **Modelli AI per la Produzione** - Migliori pratiche per distribuzioni di applicazioni AI scalabili e convenienti
- **Flussi di Lavoro AI End-to-End** - Dallo sviluppo del modello alla distribuzione in produzione con monitoraggio adeguato
- **Ottimizzazione dei Costi** - Strategie intelligenti di allocazione e scalabilità delle risorse per i carichi di lavoro AI
- **Integrazione con Azure AI Foundry** - Connessione senza interruzioni al catalogo dei modelli e agli endpoint di AI Foundry

---

## 🎯 Libreria di Modelli ed Esempi

### In Evidenza: Modelli di Azure AI Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

| Modello | Capitolo | Complessità | Servizi |
|---------|----------|-------------|---------|
| [**Inizia con AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automazione del flusso di lavoro multi-agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Genera documenti dai tuoi dati**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Migliora le riunioni con i clienti con gli agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernizza il tuo codice con gli agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Crea il tuo agente conversazionale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Scopri informazioni dai dati conversazionali**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Elaborazione di contenuti multi-modale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### In Evidenza: Scenari di Apprendimento Completi
**Modelli di applicazioni pronti per la produzione mappati ai capitoli di apprendimento**

| Modello | Capitolo di Apprendimento | Complessità | Apprendimento Chiave |
|---------|---------------------------|-------------|-----------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Modelli di distribuzione AI di base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione con Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework per agenti e chiamate di funzione |
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
- [**Galleria Ufficiale dei Modelli AZD**](https://azure.github.io/awesome-azd/) - Collezione curata di modelli ufficiali e della community
- [**Modelli Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione sui modelli di Microsoft Learn
- [**Directory degli Esempi**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di Apprendimento e Riferimenti

### Riferimenti Rapidi
- [**Foglio di Comandi**](resources/cheat-sheet.md) - Comandi essenziali di azd organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia di Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida allo Studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop Pratici
- [**Laboratorio AI Workshop**](docs/ai-foundry/ai-workshop-lab.md) - Rendi le tue soluzioni AI pronte per la distribuzione con AZD (2-3 ore)
- [**Guida Interattiva al Workshop**](workshop/README.md) - Workshop basato su browser con MkDocs e ambiente DevContainer
- [**Percorso di Apprendimento Strutturato**](../../workshop/docs/instructions) - 7 esercizi guidati (Scoperta → Distribuzione → Personalizzazione)
- [**Workshop AZD per Principianti**](workshop/README.md) - Materiali completi per workshop pratici con integrazione GitHub Codespaces

### Risorse di Apprendimento Esterne
- [Documentazione Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centro Architettura Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calcolatore Prezzi Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stato di Azure](https://status.azure.com/)

---

## 🎓 Completamento del Corso e Certificazione

### Monitoraggio del Progresso
Monitora i tuoi progressi di apprendimento attraverso ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti & Guida Rapida ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione & Autenticazione ✅
- [ ] **Capitolo 4**: Infrastruttura come Codice & Distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI Multi-Agente ✅
- [ ] **Capitolo 6**: Validazione & Pianificazione Pre-Distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione dei Problemi & Debugging ✅
- [ ] **Capitolo 8**: Modelli di Produzione & Aziendali ✅

### Verifica dell'Apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze:
1. **Esercizio Pratico**: Completa la distribuzione pratica del capitolo
2. **Verifica delle Conoscenze**: Rivedi la sezione FAQ del capitolo
3. **Discussione Comunitaria**: Condividi la tua esperienza su Discord di Azure
4. **Prossimo Capitolo**: Passa al livello di complessità successivo

### Benefici del Completamento del Corso
Completando tutti i capitoli, otterrai:
- **Esperienza in Produzione**: Distribuzione di vere applicazioni AI su Azure
- **Competenze Professionali**: Capacità di distribuzione pronte per il mondo aziendale  
- **Riconoscimento nella Comunità**: Membro attivo della community di sviluppatori Azure
- **Avanzamento di Carriera**: Competenze richieste per AZD e distribuzioni AI

---

## 🤝 Community & Supporto

### Ottieni Aiuto & Supporto
- **Problemi Tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande di Apprendimento**: [Community Microsoft Azure su Discord](https://discord.gg/microsoft-azure)
- **Aiuto Specifico per l'AI**: Unisciti al [canale #Azure](https://discord.gg/microsoft-azure) per discussioni su AZD + AI Foundry
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti dalla Community di Azure AI Foundry su Discord

**Risultati Recenti del Sondaggio nel Canale #Azure:**
- **45%** degli sviluppatori desidera utilizzare AZD per carichi di lavoro AI
- **Principali sfide**: Distribuzioni multi-servizio, gestione delle credenziali, prontezza per la produzione  
- **Richieste più frequenti**: Modelli specifici per l'AI, guide per la risoluzione dei problemi, migliori pratiche

**Unisciti alla nostra community per:**
- Condividere le tue esperienze con AZD + AI e ottenere supporto
- Accedere alle anteprime dei nuovi modelli AI
- Contribuire alle migliori pratiche di distribuzione AI
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al Corso
Accogliamo con favore i contributi! Leggi la nostra [Guida per i Contributi](CONTRIBUTING.md) per i dettagli su:
- **Miglioramenti ai Contenuti**: Migliora i capitoli e gli esempi esistenti
- **Nuovi Esempi**: Aggiungi scenari reali e modelli  
- **Traduzione**: Aiuta a mantenere il supporto multilingue  
- **Segnalazioni di Bug**: Migliora precisione e chiarezza  
- **Standard della Comunità**: Segui le nostre linee guida inclusive per la comunità  

---

## 📄 Informazioni sul Corso

### Licenza
Questo progetto è concesso in licenza sotto la Licenza MIT - consulta il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse di Apprendimento Microsoft Correlate

Il nostro team produce altri corsi di apprendimento completi:

- [Protocollo di Contesto del Modello (MCP) per Principianti](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
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
**Sviluppatori AI**: Vai direttamente a [Capitolo 2: Sviluppo AI-First](../..)  
**Sviluppatori Esperti**: Inizia con [Capitolo 3: Configurazione & Autenticazione](../..)

**Prossimi Passi**: [Inizia il Capitolo 1 - Fondamenti di AZD](docs/getting-started/azd-basics.md) →

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.