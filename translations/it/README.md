<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6dbd1fe0dee10a4def58fdc663c59e1d",
  "translation_date": "2025-11-18T17:33:01+00:00",
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

[Italiano](./README.md) | [Francese](../fr/README.md) | [Spagnolo](../es/README.md) | [Tedesco](../de/README.md) | [Portoghese (Brasile)](../br/README.md) | [Portoghese (Portogallo)](../pt/README.md) | [Cinese (Semplificato)](../zh/README.md) | [Giapponese](../ja/README.md) | [Coreano](../ko/README.md)

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

*Seleziona il tuo percorso di apprendimento in base al livello di esperienza e agli obiettivi*

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
- **📖 Modelli**: [Deployment di Modelli AI](docs/ai-foundry/ai-model-deployment.md) - Distribuire e gestire modelli AI
- **🛠️ Workshop**: [Laboratorio AI](docs/ai-foundry/ai-workshop-lab.md) - Rendere le tue soluzioni AI pronte per AZD
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
- Configurazione e gestione degli ambienti
- Best practice per autenticazione e sicurezza
- Nomenclatura e organizzazione delle risorse

#### Risorse di Apprendimento
- **📖 Configurazione**: [Guida alla Configurazione](docs/getting-started/configuration.md) - Configurazione degli ambienti
- **🔐 Sicurezza**: Modelli di autenticazione e identità gestita
- **📝 Esempi**: [Esempio di App Database](../../examples/database-app) - Modelli di configurazione

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
- Modelli avanzati di deployment
- Infrastructure as Code con Bicep
- Strategie di provisioning delle risorse

#### Risorse di Apprendimento
- **📖 Deployment**: [Guida al Deployment](docs/deployment/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning delle Risorse](docs/deployment/provisioning.md) - Gestione delle risorse Azure
- **📝 Esempi**: [Esempio di App Container](../../examples/container-app) - Deployment containerizzati

#### Esercizi Pratici
- Creare template Bicep personalizzati
- Distribuire applicazioni multi-servizio
- Implementare strategie di deployment blue-green

**💡 Risultato del Capitolo**: Distribuire applicazioni multi-servizio complesse utilizzando template di infrastruttura personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agent (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Modelli di architettura multi-agent
- Orchestrazione e coordinamento degli agenti
- Deployment AI pronto per la produzione

#### Risorse di Apprendimento
- **🤖 Progetto in Evidenza**: [Soluzione Multi-Agent per il Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Template ARM**: [Pacchetto Template ARM](../../examples/retail-multiagent-arm-template) - Deployment con un clic
- **📖 Architettura**: Modelli di coordinamento multi-agent

#### Esercizi Pratici
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del Capitolo**: Distribuire e gestire una soluzione AI multi-agent pronta per la produzione con agenti Cliente e Inventario

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
- Risoluzione dei problemi specifici dell'AI

#### Risorse di Apprendimento
- **🔧 Problemi Comuni**: [Problemi Comuni](docs/troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione dei Problemi AI](docs/troubleshooting/ai-troubleshooting.md) - Problemi dei servizi AI

#### Esercizi Pratici
- Diagnosticare fallimenti di deployment
- Risolvere problemi di autenticazione
- Debug della connettività dei servizi AI

**💡 Risultato del Capitolo**: Diagnosticare e risolvere autonomamente problemi comuni di deployment

---

### 🏢 Capitolo 8: Modelli di Produzione & Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Strategie di distribuzione in produzione
- Modelli di sicurezza aziendale
- Monitoraggio e ottimizzazione dei costi

#### Risorse di Apprendimento
- **🏭 Produzione**: [Best Practices AI in Produzione](docs/ai-foundry/production-ai-practices.md) - Modelli aziendali
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
- **Interfaccia Basata su Browser**: Workshop completo con MkDocs, funzioni di ricerca, copia e temi
- **Integrazione con GitHub Codespaces**: Configurazione dell'ambiente di sviluppo con un clic
- **Percorso di Apprendimento Strutturato**: 7 esercizi guidati (totale 3,5 ore)
- **Scoperta → Distribuzione → Personalizzazione**: Metodologia progressiva
- **Ambiente DevContainer Interattivo**: Strumenti e dipendenze preconfigurati

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
- **Padroneggiare Architetture Multi-Agente**: Implementare soluzioni AI coordinate
- **Implementare Best Practices di Sicurezza**: Configurare autenticazione e controllo degli accessi
- **Ottimizzare per la Scalabilità**: Progettare distribuzioni performanti e convenienti
- **Risoluzione dei Problemi di Distribuzione**: Risolvere autonomamente problemi comuni

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
- **Infrastruttura come Codice** - Gestisci le risorse Azure con Bicep o Terraform  
- **Flussi di lavoro integrati** - Provisioning, distribuzione e monitoraggio delle applicazioni senza interruzioni
- **Ottimizzato per gli sviluppatori** - Progettato per la produttività e l'esperienza degli sviluppatori

### **AZD + Azure AI Foundry: Perfetto per le Distribuzioni AI**

**Perché AZD per le Soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Modelli Pronti per l'AI** - Modelli preconfigurati per Azure OpenAI, Cognitive Services e carichi di lavoro ML
- **Distribuzioni AI Sicure** - Modelli di sicurezza integrati per servizi AI, chiavi API e endpoint dei modelli  
- **Modelli AI in Produzione** - Best practices per distribuzioni di applicazioni AI scalabili e convenienti
- **Flussi di Lavoro AI End-to-End** - Dallo sviluppo del modello alla distribuzione in produzione con monitoraggio adeguato
- **Ottimizzazione dei Costi** - Strategie intelligenti di allocazione e scalabilità delle risorse per carichi di lavoro AI
- **Integrazione con Azure AI Foundry** - Connessione senza interruzioni al catalogo dei modelli e agli endpoint di AI Foundry

---

## 🎯 Libreria di Modelli ed Esempi

### In Evidenza: Modelli Azure AI Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

| Modello | Capitolo | Complessità | Servizi |
|---------|----------|-------------|---------|
| [**Inizia con AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + API di Inferenza Modelli Azure AI + Ricerca AI Azure + Azure Container Apps + Application Insights |
| [**Inizia con agenti AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Servizio Agenti AI Azure + AzureOpenAI + Ricerca AI Azure + Azure Container Apps + Application Insights|
| [**Automazione del flusso di lavoro multi-agente**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Servizio Agenti AI Azure + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Genera documenti dai tuoi dati**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐  | AzureOpenAI + Ricerca AI Azure + Servizi AI Azure + Azure CosmosDB|
| [**Migliora le riunioni con i clienti con agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐| AzureOpenAI + Ricerca AI Azure + Azure CosmosDB + Database SQL Azure |
| [**Modernizza il tuo codice con agenti**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Servizio Agenti Azure + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Crea il tuo agente conversazionale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 4 | ⭐⭐⭐ | Linguaggio AI + AzureOpenAI + Ricerca AI + Archiviazione Azure + Registro Container Azure|
| [**Sblocca approfondimenti dai dati conversazionali**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐ | AzureOpenAI + Ricerca AI + Semantic Kernel + Servizio Agenti Azure + Comprensione Contenuti AI|
| [**Elaborazione di contenuti multi-modale**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + Comprensione Contenuti Azure + Azure CosmosDB + Azure Container Apps|

### In Evidenza: Scenari di Apprendimento Completi
**Modelli di applicazioni pronte per la produzione mappati ai capitoli di apprendimento**

| Modello | Capitolo di Apprendimento | Complessità | Apprendimento Chiave |
|---------|---------------------------|-------------|-----------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Modelli di distribuzione AI di base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Ricerca AI Azure |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework per agenti e chiamata di funzioni |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI aziendale |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Cliente e Inventario |

### Apprendimento per Tipo di Esempio

#### Applicazioni Semplici (Capitoli 1-2)
- [Applicazione Web Semplice](../../examples/simple-web-app) - Modelli di distribuzione di base
- [Sito Statico](../../examples/static-site) - Distribuzione di contenuti statici
- [API Base](../../examples/basic-api) - Distribuzione di API REST

#### Integrazione con Database (Capitoli 3-4)  
- [Applicazione Database](../../examples/database-app) - Modelli di connettività con database
- [Elaborazione Dati](../../examples/data-processing) - Distribuzione di flussi di lavoro ETL

#### Modelli Avanzati (Capitoli 4-8)
- [Applicazioni Container](../../examples/container-app) - Distribuzioni containerizzate
- [Microservizi](../../examples/microservices) - Architetture multi-servizio  
- [Soluzioni Aziendali](../../examples/enterprise) - Modelli pronti per la produzione

### Collezioni di Modelli Esterni
- [**Galleria Modelli AZD Ufficiale**](https://azure.github.io/awesome-azd/) - Collezione curata di modelli ufficiali e della community
- [**Modelli Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei modelli su Microsoft Learn
- [**Directory Esempi**](examples/README.md) - Esempi locali di apprendimento con spiegazioni dettagliate

---

## 📚 Risorse di Apprendimento e Riferimenti

### Riferimenti Rapidi
- [**Foglio di Comandi**](resources/cheat-sheet.md) - Comandi essenziali azd organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida di Studio**](resources/study-guide.md) - Esercizi pratici completi

### Workshop Pratici
- [**Laboratorio AI Workshop**](docs/ai-foundry/ai-workshop-lab.md) - Rendi le tue soluzioni AI distribuibili con AZD (2-3 ore)
- [**Guida Interattiva al Workshop**](workshop/README.md) - Workshop basato su browser con MkDocs e DevContainer Environment
- [**Percorso di Apprendimento Strutturato**](../../workshop/docs/instructions) - 7 esercizi guidati (Scoperta → Distribuzione → Personalizzazione)
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

- [ ] **Capitolo 1**: Fondamenti & Guida Rapida ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione & Autenticazione ✅
- [ ] **Capitolo 4**: Infrastruttura come Codice & Distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI Multi-Agente ✅
- [ ] **Capitolo 6**: Validazione & Pianificazione Pre-Distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione Problemi & Debugging ✅
- [ ] **Capitolo 8**: Modelli di Produzione & Aziendali ✅

### Verifica dell'Apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio Pratico**: Completa la distribuzione pratica del capitolo
2. **Controllo delle Conoscenze**: Rivedi la sezione FAQ del capitolo
3. **Discussione Comunitaria**: Condividi la tua esperienza su Discord Azure
4. **Capitolo Successivo**: Passa al livello di complessità successivo

### Benefici del Completamento del Corso
Completando tutti i capitoli, avrai:
- **Esperienza in Produzione**: Distribuito applicazioni AI reali su Azure
- **Competenze Professionali**: Capacità di distribuzione pronte per l'azienda  
- **Riconoscimento Comunitario**: Membro attivo della community degli sviluppatori Azure
- **Avanzamento di Carriera**: Competenze richieste per AZD e distribuzioni AI

---

## 🤝 Comunità & Supporto

### Ottenere Aiuto & Supporto
- **Problemi Tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande di Apprendimento**: [Community Discord Microsoft Azure](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aiuto Specifico per AI**: Unisciti a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti dalla Comunità Discord Azure AI Foundry

**Risultati Recenti del Sondaggio nel Canale #Azure:**
- **45%** degli sviluppatori vuole utilizzare AZD per carichi di lavoro AI
- **Sfide principali**: Distribuzioni multi-servizio, gestione delle credenziali, prontezza per la produzione  
- **Richieste più frequenti**: Modelli specifici per AI, guide per la risoluzione dei problemi, best practices

**Unisciti alla nostra comunità per:**
- Condividere le tue esperienze con AZD + AI e ottenere supporto
- Accedere alle anteprime dei nuovi modelli AI
- Contribuire alle migliori pratiche per il deployment dell'AI  
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD  

### Contribuire al Corso  
Accogliamo con piacere i contributi! Si prega di leggere la nostra [Guida ai Contributi](CONTRIBUTING.md) per dettagli su:  
- **Miglioramenti ai Contenuti**: Migliorare i capitoli e gli esempi esistenti  
- **Nuovi Esempi**: Aggiungere scenari reali e modelli  
- **Traduzione**: Aiutare a mantenere il supporto multilingue  
- **Segnalazione di Bug**: Migliorare accuratezza e chiarezza  
- **Standard della Comunità**: Seguire le nostre linee guida per una comunità inclusiva  

---

## 📄 Informazioni sul Corso  

### Licenza  
Questo progetto è concesso in licenza sotto la Licenza MIT - vedere il file [LICENSE](../../LICENSE) per i dettagli.  

### Risorse di Apprendimento Microsoft Correlate  

Il nostro team produce altri corsi di apprendimento completi:  

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Agenti  
[![AZD per Principianti](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Edge AI per Principianti](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![MCP per Principianti](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Agenti AI per Principianti](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  

---

### Serie Generative AI  
[![Generative AI per Principianti](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)  

---

### Apprendimento Core  
[![ML per Principianti](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
[![Data Science per Principianti](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
[![AI per Principianti](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
[![Cybersecurity per Principianti](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)  
[![Web Dev per Principianti](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
[![IoT per Principianti](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![Sviluppo XR per Principianti](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  

---

### Serie Copilot  
[![Copilot per Programmazione AI in Coppia](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot per C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Avventura Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del Corso  

**🚀 Pronto per Iniziare a Imparare?**  

**Principianti**: Inizia con [Capitolo 1: Fondamenti & Avvio Rapido](../..)  
**Sviluppatori AI**: Vai al [Capitolo 2: Sviluppo AI-First](../..)  
**Sviluppatori Esperti**: Inizia con [Capitolo 3: Configurazione & Autenticazione](../..)  

**Prossimi Passi**: [Inizia il Capitolo 1 - Fondamenti di AZD](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer (Avvertenza)**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->