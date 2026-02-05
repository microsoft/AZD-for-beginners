# AZD Per Principianti: Un Percorso di Apprendimento Strutturato

![AZD-for-beginners](../../translated_images/it/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Iniziare con Questo Corso

Segui questi passaggi per iniziare il tuo percorso di apprendimento su AZD:

1. **Forka il Repository**: Clicca [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clona il Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Unisciti alla Comunità**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) per supporto da esperti
4. **Scegli il Tuo Percorso di Apprendimento**: Seleziona un capitolo qui sotto che corrisponde al tuo livello di esperienza

### Supporto Multilingue

#### Traduzioni Automatiche (Sempre Aggiornate)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](./README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferisci Clonare Localmente?**

> Questo repository include oltre 50 traduzioni linguistiche che aumentano significativamente la dimensione del download. Per clonare senza traduzioni, usa lo sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Questo ti dà tutto ciò che ti serve per completare il corso con un download molto più veloce.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Panoramica del Corso

Diventa un esperto di Azure Developer CLI (azd) attraverso capitoli strutturati progettati per un apprendimento progressivo. **Particolare attenzione al deployment di applicazioni AI con integrazione Microsoft Foundry.**

### Perché Questo Corso è Essenziale per gli Sviluppatori Moderni

Basato sulle informazioni della community Discord di Microsoft Foundry, **il 45% degli sviluppatori vuole usare AZD per carichi di lavoro AI** ma incontra sfide con:
- Architetture AI multi-servizio complesse
- Best practice per il deployment AI in produzione  
- Integrazione e configurazione dei servizi Azure AI
- Ottimizzazione dei costi per carichi di lavoro AI
- Risoluzione dei problemi specifici di deployment AI

### Obiettivi di Apprendimento

Completando questo corso strutturato, potrai:
- **Apprendere le Basi di AZD**: Concetti fondamentali, installazione e configurazione
- **Deployare Applicazioni AI**: Utilizzare AZD con i servizi Microsoft Foundry
- **Implementare Infrastructure as Code**: Gestire risorse Azure con template Bicep
- **Risoluzione Problemi di Deployment**: Risolvere problemi comuni e debug
- **Ottimizzare per la Produzione**: Sicurezza, scaling, monitoraggio e gestione costi
- **Creare Soluzioni Multi-Agente**: Deployare architetture AI complesse

## 📚 Capitoli di Apprendimento

*Seleziona il tuo percorso formativo in base al livello di esperienza e agli obiettivi*

### 🚀 Capitolo 1: Fondamenti & Avvio Rapido
**Prerequisiti**: Abbonamento Azure, conoscenze base da linea di comando  
**Durata**: 30-45 minuti  
**Complessità**: ⭐

#### Cosa Imparerai
- Comprendere i fondamenti di Azure Developer CLI
- Installare AZD sulla tua piattaforma
- Il tuo primo deployment di successo

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Cos’è Azure Developer CLI?](../..)
- **📖 Teoria**: [Nozioni di Base AZD](docs/getting-started/azd-basics.md) - Concetti chiave e terminologia
- **⚙️ Configurazione**: [Installazione & Setup](docs/getting-started/installation.md) - Guide specifiche per piattaforma
- **🛠️ Pratico**: [Il Tuo Primo Progetto](docs/getting-started/first-project.md) - Tutorial passo passo
- **📋 Riferimento Rapido**: [Cheat Sheet Comandi](resources/cheat-sheet.md)

#### Esercizi Pratici
```bash
# Verifica rapida dell'installazione
azd version

# Distribuisci la tua prima applicazione
azd init --template todo-nodejs-mongo
azd up
```

**💡 Risultato Capitolo**: Deployare con successo una semplice applicazione web su Azure usando AZD

**✅ Validazione del Successo:**
```bash
# Dopo aver completato il Capitolo 1, dovresti essere in grado di:
azd version              # Mostra la versione installata
azd init --template todo-nodejs-mongo  # Inizializza il progetto
azd up                  # Distribuisce su Azure
azd show                # Mostra l'URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Pulisce le risorse
```

**📊 Tempo Stimato:** 30-45 minuti  
**📈 Livello dopo:** Può deployare applicazioni base in modo indipendente

**✅ Validazione del Successo:**
```bash
# Dopo aver completato il Capitolo 1, dovresti essere in grado di:
azd version              # Mostra versione installata
azd init --template todo-nodejs-mongo  # Inizializza progetto
azd up                  # Distribuisce su Azure
azd show                # Mostra URL dell'app in esecuzione
# L'applicazione si apre nel browser e funziona
azd down --force --purge  # Pulisce le risorse
```

**📊 Tempo Stimato:** 30-45 minuti  
**📈 Livello dopo:** Può deployare applicazioni base in modo indipendente

---

### 🤖 Capitolo 2: Sviluppo AI-First (Consigliato per Sviluppatori AI)
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 1-2 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Integrazione Microsoft Foundry con AZD
- Deploy di applicazioni AI-powered
- Comprendere configurazioni di servizi AI

#### Risorse di Apprendimento
- **🎯 Inizia Qui**: [Integrazione Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Modelli**: [Deployment Modelli AI](docs/microsoft-foundry/ai-model-deployment.md) - Deploy e gestione modelli AI
- **🛠️ Workshop**: [Laboratorio AI](docs/microsoft-foundry/ai-workshop-lab.md) - Prepara le tue soluzioni AI per AZD
- **🎥 Guida Interattiva**: [Materiali Workshop](workshop/README.md) - Apprendimento basato su browser con MkDocs * Ambiente DevContainer
- **📋 Template**: [Template Microsoft Foundry](../..)
- **📝 Esempi**: [Esempi di Deployment AZD](examples/README.md)

#### Esercizi Pratici
```bash
# Distribuisci la tua prima applicazione AI
azd init --template azure-search-openai-demo
azd up

# Prova altri modelli AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Risultato Capitolo**: Deployare e configurare un’app chat AI-powered con capacità RAG

**✅ Validazione del Successo:**
```bash
# Dopo il Capitolo 2, dovresti essere in grado di:
azd init --template azure-search-openai-demo
azd up
# Testare l'interfaccia di chat AI
# Fare domande e ottenere risposte basate su AI con fonti
# Verificare che l'integrazione della ricerca funzioni
azd monitor  # Controllare che Application Insights mostri la telemetria
azd down --force --purge
```

**📊 Tempo Stimato:** 1-2 ore  
**📈 Livello dopo:** Può deployare e configurare applicazioni AI pronte per la produzione  
**💰 Consapevolezza Costi:** Comprende costi di sviluppo $80-150/mese, costi produzione $300-3500/mese

#### 💰 Considerazioni sui Costi per Deploy AI

**Ambiente di Sviluppo (Stimato $80-150/mese):**
- Azure OpenAI (Pay-as-you-go): $0-50/mese (in base all’uso token)
- AI Search (tier base): $75/mese
- Container Apps (Consumo): $0-20/mese
- Storage (Standard): $1-5/mese

**Ambiente di Produzione (Stimato $300-3,500+/mese):**
- Azure OpenAI (PTU per performance costante): $3,000+/mese OPPURE pay-as-you-go con elevato volume
- AI Search (tier standard): $250/mese
- Container Apps (Dedicato): $50-100/mese
- Application Insights: $5-50/mese
- Storage (Premium): $10-50/mese

**💡 Consigli per Ottimizzare i Costi:**
- Usa il livello gratuito Azure OpenAI per apprendimento (inclusi 50,000 token/mese)
- Esegui `azd down` per deallocare risorse quando non sviluppi attivamente
- Parti con fatturazione a consumo, passa a PTU solo in produzione
- Usa `azd provision --preview` per stimare i costi prima del deployment
- Abilita auto-scaling: paghi solo per l’uso reale

**Monitoraggio dei Costi:**
```bash
# Verifica i costi mensili stimati
azd provision --preview

# Monitora i costi effettivi nel Portale di Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Capitolo 3: Configurazione & Autenticazione
**Prerequisiti**: Capitolo 1 completato  
**Durata**: 45-60 minuti  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Configurazione e gestione degli ambienti
- Autenticazione e best practice di sicurezza
- Naming e organizzazione delle risorse

#### Risorse di Apprendimento
- **📖 Configurazione**: [Guida alla Configurazione](docs/getting-started/configuration.md) - Setup ambiente
- **🔐 Sicurezza**: [Pattern di Autenticazione e managed identity](docs/getting-started/authsecurity.md) - Pattern di autenticazione
- **📝 Esempi**: [Esempio Applicazione Database](examples/database-app/README.md) - Esempi Database AZD

#### Esercizi Pratici
- Configura più ambienti (dev, staging, prod)
- Imposta autenticazione con managed identity
- Implementa configurazioni specifiche per ambiente

**💡 Risultato Capitolo**: Gestire più ambienti con adeguata autenticazione e sicurezza

---

### 🏗️ Capitolo 4: Infrastructure as Code & Deployment
**Prerequisiti**: Capitoli 1-3 completati  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐⭐

#### Cosa Imparerai
- Pattern avanzati di deployment
- Infrastructure as Code con Bicep
- Strategie di provisioning risorse

#### Risorse di Apprendimento
- **📖 Deployment**: [Guida al Deployment](docs/deployment/deployment-guide.md) - Workflow completi
- **🏗️ Provisioning**: [Provisioning Risorse](docs/deployment/provisioning.md) - Gestione risorse Azure
- **📝 Esempi**: [Esempio Container App](../../examples/container-app) - Deployment containerizzati

#### Esercizi Pratici
- Crea template Bicep personalizzati
- Deploya applicazioni multi-servizio
- Implementa strategie di deployment blue-green

**💡 Risultato Capitolo**: Deployare applicazioni multi-servizio complesse usando template infrastrutturali personalizzati

---

### 🎯 Capitolo 5: Soluzioni AI Multi-Agente (Avanzato)
**Prerequisiti**: Capitoli 1-2 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐
#### Cosa Imparerai
- Pattern di architettura multi-agente
- Orchestrazione e coordinamento degli agenti
- Deployment AI pronto per la produzione

#### Risorse di Apprendimento
- **🤖 Progetto in Evidenza**: [Soluzione Multi-Agente per il Retail](examples/retail-scenario.md) - Implementazione completa
- **🛠️ Template ARM**: [Pacchetto Template ARM](../../examples/retail-multiagent-arm-template) - Deployment con un clic
- **📖 Architettura**: [Pattern di coordinamento multi-agente](/docs/pre-deployment/coordination-patterns.md) - Pattern

#### Esercizi Pratici
```bash
# Distribuire la soluzione completa multi-agente per la vendita al dettaglio
cd examples/retail-multiagent-arm-template
./deploy.sh

# Esplorare le configurazioni degli agenti
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Risultato del Capitolo**: Distribuire e gestire una soluzione AI multi-agente pronta per la produzione con agenti Cliente e Inventario

---

### 🔍 Capitolo 6: Validazione e Pianificazione Pre-Deployment
**Prerequisiti**: Capitolo 4 completato  
**Durata**: 1 ora  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Pianificazione della capacità e validazione delle risorse
- Strategie di selezione SKU
- Controlli pre-volo e automazione

#### Risorse di Apprendimento
- **📊 Pianificazione**: [Pianificazione della Capacità](docs/pre-deployment/capacity-planning.md) - Validazione delle risorse
- **💰 Selezione**: [Selezione SKU](docs/pre-deployment/sku-selection.md) - Scelte convenienti
- **✅ Validazione**: [Controlli Pre-Deployment](docs/pre-deployment/preflight-checks.md) - Script automatizzati

#### Esercizi Pratici
- Eseguire script di validazione della capacità
- Ottimizzare la selezione SKU per i costi
- Implementare controlli automatizzati pre-deployment

**💡 Risultato del Capitolo**: Validare e ottimizzare i deployment prima dell’esecuzione

---

### 🚨 Capitolo 7: Risoluzione dei Problemi e Debugging
**Prerequisiti**: Qualsiasi capitolo di deployment completato  
**Durata**: 1-1.5 ore  
**Complessità**: ⭐⭐

#### Cosa Imparerai
- Approcci sistematici al debugging
- Problemi comuni e soluzioni
- Risoluzione problemi specifici AI

#### Risorse di Apprendimento
- **🔧 Problemi Comuni**: [Problemi Comuni](docs/troubleshooting/common-issues.md) - FAQ e soluzioni
- **🕵️ Debugging**: [Guida al Debugging](docs/troubleshooting/debugging.md) - Strategie passo-passo
- **🤖 Problemi AI**: [Risoluzione Problemi AI Specifici](docs/troubleshooting/ai-troubleshooting.md) - Problemi con i servizi AI

#### Esercizi Pratici
- Diagnosticare errori di deployment
- Risolvere problemi di autenticazione
- Debuggare la connettività dei servizi AI

**💡 Risultato del Capitolo**: Diagnosticare e risolvere autonomamente problemi comuni di deployment

---

### 🏢 Capitolo 8: Pattern per Produzione e Enterprise
**Prerequisiti**: Capitoli 1-4 completati  
**Durata**: 2-3 ore  
**Complessità**: ⭐⭐⭐⭐

#### Cosa Imparerai
- Strategie di deployment in produzione
- Pattern di sicurezza enterprise
- Monitoraggio e ottimizzazione dei costi

#### Risorse di Apprendimento
- **🏭 Produzione**: [Best Practice AI in Produzione](docs/microsoft-foundry/production-ai-practices.md) - Pattern enterprise
- **📝 Esempi**: [Esempio Microservizi](../../examples/microservices) - Architetture complesse
- **📊 Monitoraggio**: [Integrazione Application Insights](docs/pre-deployment/application-insights.md) - Monitoraggio

#### Esercizi Pratici
- Implementare pattern di sicurezza enterprise
- Configurare monitoraggio completo
- Distribuire in produzione con governance adeguata

**💡 Risultato del Capitolo**: Distribuire applicazioni pronte per l’enterprise con capacità di produzione complete

---

## 🎓 Panoramica del Workshop: Esperienza di Apprendimento Pratica

> **⚠️ STATO DEL WORKSHOP: Sviluppo Attivo**  
> I materiali del workshop sono in fase di sviluppo e rifinitura. I moduli principali sono funzionanti, ma alcune sezioni avanzate sono incomplete. Stiamo lavorando attivamente per completare tutti i contenuti. [Segui il progresso →](workshop/README.md)

### Materiali Interattivi del Workshop
**Esperienza di apprendimento pratica completa con strumenti browser-based e esercizi guidati**

I materiali del workshop offrono un’esperienza di apprendimento strutturata e interattiva che integra il curriculum basato sui capitoli sopra indicati. Il workshop è progettato per l’apprendimento autodiretto e per sessioni guidate da istruttori.

#### 🛠️ Caratteristiche del Workshop
- **Interfaccia Browser-Based**: Workshop completo MkDocs con funzionalità di ricerca, copia e temi
- **Integrazione GitHub Codespaces**: Configurazione dell’ambiente di sviluppo con un clic
- **Percorso di Apprendimento Strutturato**: Esercizi guidati in 7 passaggi (3.5 ore totali)
- **Scoperta → Deployment → Personalizzazione**: Metodologia progressiva
- **Ambiente DevContainer Interattivo**: Strumenti e dipendenze preconfigurati

#### 📚 Struttura del Workshop
Il workshop segue una metodologia **Scoperta → Deployment → Personalizzazione**:

1. **Fase di Scoperta** (45 min)  
   - Esplorare template e servizi Microsoft Foundry  
   - Comprendere i pattern di architettura multi-agente  
   - Rivedere requisiti e prerequisiti di deployment

2. **Fase di Deployment** (2 ore)  
   - Deployment pratico di applicazioni AI con AZD  
   - Configurare servizi e endpoint Azure AI  
   - Implementare pattern di sicurezza e autenticazione

3. **Fase di Personalizzazione** (45 min)  
   - Modificare applicazioni per casi d’uso specifici  
   - Ottimizzare per il deployment in produzione  
   - Implementare monitoraggio e gestione dei costi

#### 🚀 Iniziare con il Workshop
```bash
# Opzione 1: GitHub Codespaces (Consigliato)
# Clicca su "Code" → "Create codespace on main" nel repository

# Opzione 2: Sviluppo Locale
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Segui le istruzioni di configurazione in workshop/README.md
```

#### 🎯 Obiettivi di Apprendimento del Workshop
Completando il workshop, i partecipanti saranno in grado di:
- **Distribuire applicazioni AI in produzione**: Usare AZD con i servizi Microsoft Foundry
- **Padroneggiare architetture multi-agente**: Implementare soluzioni AI coordinate di agenti
- **Applicare best practice di sicurezza**: Configurare autenticazione e controllo accessi
- **Ottimizzare per la scalabilità**: Progettare deployment performanti e convenienti
- **Risoluzione problemi di deployment**: Risolvere problemi comuni in autonomia

#### 📖 Risorse del Workshop
- **🎥 Guida Interattiva**: [Materiali del Workshop](workshop/README.md) - Ambiente di apprendimento browser-based
- **📋 Istruzioni Passo-Passo**: [Esercizi Guidati](../../workshop/docs/instructions) - Percorsi dettagliati
- **🛠️ Laboratorio AI**: [Laboratorio AI Workshop](docs/microsoft-foundry/ai-workshop-lab.md) - Esercizi focalizzati sull’AI
- **💡 Avvio Veloce**: [Guida all’Installazione del Workshop](workshop/README.md#quick-start) - Configurazione ambiente

**Perfetto per**: Formazione aziendale, corsi universitari, apprendimento autodiretto e bootcamp per sviluppatori.

---

## 📖 Cos’è Azure Developer CLI?

Azure Developer CLI (azd) è un’interfaccia da riga di comando focalizzata sugli sviluppatori che accelera il processo di creazione e distribuzione delle applicazioni su Azure. Offre:

- **Deployment basati su template** - Usa template predefiniti per pattern applicativi comuni  
- **Infrastructure as Code** - Gestisci risorse Azure usando Bicep o Terraform  
- **Workflow integrati** - Provisioning, deployment e monitoraggio senza soluzione di continuità  
- **Orientato allo sviluppatore** - Ottimizzato per produttività ed esperienze di sviluppo

### **AZD + Microsoft Foundry: Perfetto per i Deployment AI**

**Perché AZD per soluzioni AI?** AZD affronta le principali sfide degli sviluppatori AI:

- **Template AI-Ready** - Template pre-configurati per Azure OpenAI, Cognitive Services e carichi ML  
- **Deployment AI Sicuri** - Pattern di sicurezza integrati per servizi AI, chiavi API e endpoint modelli  
- **Pattern AI in Produzione** - Best practice per applicazioni AI scalabili ed economiche  
- **Workflow AI End-to-End** - Dallo sviluppo del modello al deployment in produzione con monitoraggio  
- **Ottimizzazione Costi** - Strategie intelligenti di allocazione e scalabilità per carichi AI  
- **Integrazione Microsoft Foundry** - Connessione fluida con catalogo modelli e endpoint Microsoft Foundry

---

## 🎯 Libreria di Template ed Esempi

### In Evidenza: Template Microsoft Foundry
**Inizia qui se stai distribuendo applicazioni AI!**

> **Nota:** Questi template dimostrano vari pattern AI. Alcuni sono Azure Samples esterni, altri implementazioni locali.

| Template | Capitolo | Complessità | Servizi | Tipo |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Esterno |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Capitolo 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Esterno |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Esterno |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Esterno |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Esterno |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Esterno |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### In Evidenza: Scenari di Apprendimento Completi  
**Template applicativi pronti per la produzione mappati ai capitoli di apprendimento**

| Template | Capitolo di Apprendimento | Complessità | Apprendimento Chiave |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Capitolo 2 | ⭐ | Pattern base di deployment AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Capitolo 2 | ⭐⭐ | Implementazione RAG con Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Capitolo 4 | ⭐⭐ | Integrazione Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Capitolo 5 | ⭐⭐⭐ | Framework agent e chiamate a funzioni |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Capitolo 8 | ⭐⭐⭐ | Orchestrazione AI enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Capitolo 5 | ⭐⭐⭐⭐ | Architettura multi-agente con agenti Cliente e Inventario |

### Apprendimento per Tipo di Esempio

> **📌 Esempi Locali vs. Esterni:**  
> **Esempi Locali** (in questo repository) = Pronti per l’uso immediato  
> **Esempi Esterni** (Azure Samples) = Clone da repository collegati

#### Esempi Locali (Pronti per l’Uso)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implementazione completa pronta per la produzione con template ARM  
  - Architettura multi-agente (agenti Cliente + Inventario)  
  - Monitoraggio e valutazione integrati  
  - Deployment con un clic tramite template ARM

#### Esempi Locali - Applicazioni Container (Capitoli 2-5)  
**Esempi completi di deployment containerizzati in questo repository:**  
- [**Esempi Container App**](examples/container-app/README.md) - Guida completa al deployment containerizzato  
  - [API Flask Semplice](../../examples/container-app/simple-flask-api) - API REST base con scale-to-zero  
  - [Architettura Microservizi](../../examples/container-app/microservices) - Deployment multi-servizio pronto per la produzione  
  - Pattern di deployment Quick Start, Produzione e Avanzato  
  - Linee guida per monitoraggio, sicurezza e ottimizzazione costi

#### Esempi Esterni - Applicazioni Semplici (Capitoli 1-2)  
**Clona questi repository Azure Samples per iniziare:**  
- [Web App semplice - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pattern base di deployment  
- [Sito Statico - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment contenuti statici  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment API REST

#### Esempi Esterni - Integrazione Database (Capitoli 3-4)  
- [App Database - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Pattern di connettività database  
- [Funzioni + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow serverless dati

#### Esempi Esterni - Pattern Avanzati (Capitoli 4-8)  
- [Microservizi Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architetture multi-servizio  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Elaborazione in background  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Pattern ML pronti per la produzione

### Collezioni Template Esterni
- [**Galleria Template AZD Ufficiale**](https://azure.github.io/awesome-azd/) - Collezione curata di template ufficiali e community
- [**Modelli Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentazione dei modelli Microsoft Learn
- [**Directory degli Esempi**](examples/README.md) - Esempi di apprendimento locali con spiegazioni dettagliate

---

## 📚 Risorse di Apprendimento e Riferimenti

### Riferimenti Rapidi
- [**Comandi Essenziali**](resources/cheat-sheet.md) - Comandi azd essenziali organizzati per capitolo
- [**Glossario**](resources/glossary.md) - Terminologia Azure e azd  
- [**FAQ**](resources/faq.md) - Domande comuni organizzate per capitolo di apprendimento
- [**Guida di Studio**](resources/study-guide.md) - Esercizi pratici completi

### Laboratori Pratici
- [**Laboratorio AI Workshop**](docs/microsoft-foundry/ai-workshop-lab.md) - Rendere le soluzioni AI distribuibili con AZD (2-3 ore)
- [**Guida Interattiva del Workshop**](workshop/README.md) - Workshop basato su browser con MkDocs e Ambiente DevContainer
- [**Percorso di Apprendimento Strutturato**](../../workshop/docs/instructions) - Esercizi guidati in 7 fasi (Scoperta → Distribuzione → Personalizzazione)
- [**Workshop AZD per Principianti**](workshop/README.md) - Materiali completi per workshop pratici con integrazione GitHub Codespaces

### Risorse Esterne di Apprendimento
- Documentazione Azure Developer CLI (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Azure Architecture Center (https://learn.microsoft.com/en-us/azure/architecture/)
- Calcolatore Prezzi Azure (https://azure.microsoft.com/pricing/calculator/)
- Stato di Azure (https://status.azure.com/)

---

## 🔧 Guida Rapida per la Risoluzione dei Problemi

**Problemi comuni incontrati dai principianti e soluzioni immediate:**

### ❌ "azd: comando non trovato"

```bash
# Installa prima AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifica l'installazione
azd version
```

### ❌ "Nessuna sottoscrizione trovata" o "Sottoscrizione non impostata"

```bash
# Elenca le sottoscrizioni disponibili
az account list --output table

# Imposta la sottoscrizione predefinita
az account set --subscription "<subscription-id-or-name>"

# Imposta per l'ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifica
az account show
```

### ❌ "Quota insufficiente" o "Quota superata"

```bash
# Prova diverse regioni Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Oppure usa SKU più piccoli in sviluppo
# Modifica infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fallisce a metà esecuzione

```bash
# Opzione 1: Pulire e riprovare
azd down --force --purge
azd up

# Opzione 2: Solo riparare l'infrastruttura
azd provision

# Opzione 3: Controlla i log dettagliati
azd show
azd logs
```

### ❌ "Autenticazione fallita" o "Token scaduto"

```bash
# Riautentica
az logout
az login

azd auth logout
azd auth login

# Verifica l'autenticazione
az account show
```

### ❌ "Risorsa già esistente" o conflitti di denominazione

```bash
# AZD genera nomi unici, ma in caso di conflitto:
azd down --force --purge

# Quindi riprova con un ambiente nuovo
azd env new dev-v2
azd up
```

### ❌ Distribuzione del modello troppo lenta

**Tempi di attesa normali:**
- App web semplice: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (la fornitura di OpenAI è lenta)

```bash
# Controlla il progresso
azd show

# Se bloccato >30 minuti, controlla il Portale Azure:
azd monitor
# Cerca distribuzioni fallite
```

### ❌ "Permesso negato" o "Proibito"

```bash
# Controlla il tuo ruolo Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Hai bisogno almeno del ruolo "Collaboratore"
# Chiedi al tuo amministratore Azure di concedere:
# - Collaboratore (per le risorse)
# - Amministratore Accesso Utenti (per le assegnazioni di ruolo)
```

### ❌ Impossibile trovare l'URL dell'applicazione distribuita

```bash
# Mostra tutti i punti di accesso del servizio
azd show

# Oppure apri il Portale di Azure
azd monitor

# Controlla il servizio specifico
azd env get-values
# Cerca le variabili *_URL
```

### 📚 Risorse Complete per la Risoluzione dei Problemi

- **Guida Problemi Comuni:** [Soluzioni Dettagliate](docs/troubleshooting/common-issues.md)
- **Problemi Specifici AI:** [Risoluzione Problemi AI](docs/troubleshooting/ai-troubleshooting.md)
- **Guida al Debug:** [Debug passo-passo](docs/troubleshooting/debugging.md)
- **Chiedi Aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Guida Rapida per la Risoluzione dei Problemi

**Problemi comuni incontrati dai principianti e soluzioni immediate:**

<details>
<summary><strong>❌ "azd: comando non trovato"</strong></summary>

```bash
# Installa prima AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifica l'installazione
azd version
```
</details>

<details>
<summary><strong>❌ "Nessuna sottoscrizione trovata" o "Sottoscrizione non impostata"</strong></summary>

```bash
# Elenca le sottoscrizioni disponibili
az account list --output table

# Imposta la sottoscrizione predefinita
az account set --subscription "<subscription-id-or-name>"

# Imposta per l'ambiente AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifica
az account show
```
</details>

<details>
<summary><strong>❌ "Quota insufficiente" o "Quota superata"</strong></summary>

```bash
# Prova una diversa regione di Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Oppure usa SKU più piccoli in fase di sviluppo
# Modifica infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fallisce a metà esecuzione</strong></summary>

```bash
# Opzione 1: Pulire e riprovare
azd down --force --purge
azd up

# Opzione 2: Correggere solo l'infrastruttura
azd provision

# Opzione 3: Controllare i log dettagliati
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Autenticazione fallita" o "Token scaduto"</strong></summary>

```bash
# Riautenticare
az logout
az login

azd auth logout
azd auth login

# Verifica dell'autenticazione
az account show
```
</details>

<details>
<summary><strong>❌ "Risorsa già esistente" o conflitti di denominazione</strong></summary>

```bash
# AZD genera nomi unici, ma in caso di conflitto:
azd down --force --purge

# Quindi riprova con un ambiente nuovo
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Distribuzione del modello troppo lenta</strong></summary>

**Tempi di attesa normali:**
- App web semplice: 5-10 minuti
- App con database: 10-15 minuti
- Applicazioni AI: 15-25 minuti (la fornitura di OpenAI è lenta)

```bash
# Controlla lo stato di avanzamento
azd show

# Se bloccato per più di 30 minuti, controlla il Portale Azure:
azd monitor
# Cerca distribuzioni fallite
```
</details>

<details>
<summary><strong>❌ "Permesso negato" o "Proibito"</strong></summary>

```bash
# Controlla il tuo ruolo Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Hai bisogno almeno del ruolo "Collaboratore"
# Chiedi al tuo amministratore Azure di concederti:
# - Collaboratore (per le risorse)
# - Amministratore accesso utente (per l'assegnazione dei ruoli)
```
</details>

<details>
<summary><strong>❌ Impossibile trovare l'URL dell'applicazione distribuita</strong></summary>

```bash
# Mostra tutti i punti di accesso del servizio
azd show

# Oppure apri il Portale di Azure
azd monitor

# Controlla servizio specifico
azd env get-values
# Cerca variabili *_URL
```
</details>

### 📚 Risorse Complete per la Risoluzione dei Problemi

- **Guida Problemi Comuni:** [Soluzioni Dettagliate](docs/troubleshooting/common-issues.md)
- **Problemi Specifici AI:** [Risoluzione Problemi AI](docs/troubleshooting/ai-troubleshooting.md)
- **Guida al Debug:** [Debug passo-passo](docs/troubleshooting/debugging.md)
- **Chiedi Aiuto:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Completamento del Corso e Certificazione

### Monitoraggio del Progresso
Tieni traccia dei tuoi progressi di apprendimento per ogni capitolo:

- [ ] **Capitolo 1**: Fondamenti e Inizio Rapido ✅
- [ ] **Capitolo 2**: Sviluppo AI-First ✅  
- [ ] **Capitolo 3**: Configurazione e Autenticazione ✅
- [ ] **Capitolo 4**: Infrastructure as Code e Distribuzione ✅
- [ ] **Capitolo 5**: Soluzioni AI Multi-Agente ✅
- [ ] **Capitolo 6**: Validazione e Pianificazione Pre-Distribuzione ✅
- [ ] **Capitolo 7**: Risoluzione Problemi e Debugging ✅
- [ ] **Capitolo 8**: Pattern di Produzione e Enterprise ✅

### Verifica dell'Apprendimento
Dopo aver completato ogni capitolo, verifica le tue conoscenze tramite:
1. **Esercizio Pratico**: Completa la distribuzione pratica del capitolo
2. **Verifica delle Conoscenze**: Consulta la sezione FAQ del capitolo
3. **Discussione nella Comunità**: Condividi la tua esperienza su Azure Discord
4. **Capitolo Successivo**: Passa al livello successivo di complessità

### Vantaggi del Completamento del Corso
Alla fine di tutti i capitoli, avrai:
- **Esperienza in Produzione**: Applicazioni AI reali distribuite su Azure
- **Competenze Professionali**: Capacità di distribuzione pronte per l’impresa  
- **Riconoscimento nella Comunità**: Membro attivo della comunità di sviluppatori Azure
- **Avanzamento di Carriera**: Expertise richiesta in AZD e distribuzione AI

---

## 🤝 Comunità e Supporto

### Ottieni Aiuto e Supporto
- **Problemi Tecnici**: [Segnala bug e richiedi funzionalità](https://github.com/microsoft/azd-for-beginners/issues)
- **Domande di Apprendimento**: [Comunità Microsoft Azure Discord](https://discord.gg/microsoft-azure) e [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aiuto Specifico AI**: Unisciti a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentazione**: [Documentazione ufficiale Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Approfondimenti dalla Comunità Microsoft Foundry Discord

**Risultati recenti del sondaggio nel canale #Azure:**
- **45%** degli sviluppatori desidera usare AZD per carichi di lavoro AI
- **Principali sfide**: distribuzione multi-servizio, gestione credenziali, preparazione alla produzione  
- **Richieste più frequenti**: modelli specifici AI, guide alla risoluzione dei problemi, best practice

**Unisciti alla nostra comunità per:**
- Condividere esperienze AZD + AI e ricevere aiuto
- Accedere a anteprime dei nuovi modelli AI
- Contribuire alle best practice di distribuzione AI
- Influenzare lo sviluppo futuro delle funzionalità AI + AZD

### Contribuire al Corso
Accogliamo con piacere i contributi! Leggi la nostra [Guida alla Contribuzione](CONTRIBUTING.md) per:
- **Miglioramenti dei contenuti**: Migliora capitoli ed esempi esistenti
- **Nuovi Esempi**: Aggiungi scenari e modelli reali  
- **Traduzioni**: Aiuta a mantenere il supporto multi-lingua
- **Segnalazioni di Bug**: Migliora accuratezza e chiarezza
- **Standard Comunitari**: Segui le linee guida della nostra comunità inclusiva

---

## 📄 Informazioni sul Corso

### Licenza
Questo progetto è concesso in licenza secondo la licenza MIT - vedi il file [LICENSE](../../LICENSE) per i dettagli.

### Risorse di Apprendimento Microsoft Correlate

Il nostro team produce altri corsi di apprendimento completi:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j per Principianti](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js per Principianti](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain per Principianti](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
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
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serie Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigazione del Corso

**🚀 Pronto per Iniziare a Imparare?**

**Principianti**: Inizia con [Capitolo 1: Fondamenti & Avvio Rapido](../..)  
**Sviluppatori AI**: Passa a [Capitolo 2: Sviluppo AI-First](../..)  
**Sviluppatori Esperti**: Inizia con [Capitolo 3: Configurazione & Autenticazione](../..)

**Passi Successivi**: [Inizia Capitolo 1 - Nozioni di base su AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avvertenza**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per garantire accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua originale deve essere considerato la fonte autorevole. Per informazioni critiche si consiglia una traduzione professionale effettuata da un essere umano. Non ci assumiamo alcuna responsabilità per eventuali incomprensioni o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->